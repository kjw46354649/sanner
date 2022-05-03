package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.DrawingBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DrawingBoardServiceImpl implements DrawingBoardService {

    @Autowired
    public InnodaleDao innodaleDao;

    /**
     * DBS010 : 임시중지, DBS020 : 진행중, DBS030 : 완료, DBS040 : 취소
     * @param hashMap
     * @throws Exception
     */
    @Override
    public void managerDrawingBoardStart(HashMap<String, Object> hashMap) throws Exception {
        HashMap<String, Object> machineInfo = (HashMap<String, Object>)hashMap.get("machineInfo");

        /** 예상 작업시간 조회 **/
        hashMap.put("queryId", "drawingMapper.selectWorkingTime");
        Map<String, Object> tempMap =  innodaleDao.getInfo(hashMap);
        if(tempMap != null && !tempMap.get("PLAN_WORKING_TIME").equals("")) {
            hashMap.put("PLAN_WORKING_TIME",tempMap.get("PLAN_WORKING_TIME"));
        }

        /** 신규 MCT 작업을 추가 한다. **/
        hashMap.put("queryId", "drawingMapper.insertMctWorkStart");
        innodaleDao.create(hashMap);

        if(machineInfo.containsKey("IF_USE_YN") && !machineInfo.get("IF_USE_YN").equals("Y")) {
            /** MCT WORKING LOG INSERT 처리 한다. **/
            hashMap.put("EXECUTION","DB_ACTIVE");
            hashMap.put("ACTIVE_TYPE","PGM_ACTIVE");
            hashMap.put("CYCLE_FINISH_YN","N");
            hashMap.put("queryId", "drawingMapper.insertWorkingLogNonIf");
            innodaleDao.create(hashMap);
        }


        /** MCT PLAN 에서 우선순위가 높은 생산계획을 삭제 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.deleteFirstMctPlan");
        innodaleDao.create(hashMap);

        /**
         * Part 상태를 변경한다.
         * Progress 상태를 먼저 변경하고 Part Status 상태를 매칭 하여 맞춘다.
         **/
        hashMap.put("queryId", "drawingMapper.createDrawingBoardControlPartProgress");
        hashMap.put("PART_STATUS", "PRO007");
        innodaleDao.create(hashMap);

        hashMap.put("queryId", "drawingMapper.updateDrawingBoardControlPartStatusMapping");
        innodaleDao.create(hashMap);

    }

    /**
     * DBS010 : 임시중지, DBS020 : 진행중, DBS030 : 완료, DBS040 : 취소
     * @param hashMap
     * @throws Exception
     */
    // 22.04.01 장비 IF 기능이 추가되면서, 해당 기능은 IF를 사용하지 않는 장비에서만 사용.

    @Override
    public void managerDrawingBoardPause(HashMap<String, Object> hashMap) throws Exception {

        /** MCT WORKING LOG INSERT 처리 한다.
         * stop에 대한 기록을 임의로 생성해준다.
         * **/
        hashMap.put("EXECUTION","DB_STOP");
        hashMap.put("ACTIVE_TYPE","PGM_STOP");
        hashMap.put("CYCLE_FINISH_YN","N");
        hashMap.put("queryId", "drawingMapper.insertWorkingLogNonIf");
        innodaleDao.create(hashMap);

        /** MCT WORK 임시 중지 상태 업데이트 처리 한다. **/
        hashMap.put("WORK_STATUS","DBS010");
        hashMap.put("queryId", "drawingMapper.updateMctWorkStatusNonIf");
        innodaleDao.create(hashMap);
    }

    /**
     * DBS010 : 임시중지, DBS020 : 진행중, DBS030 : 완료, DBS040 : 취소
     * @param hashMap
     * @throws Exception
     */
    // 22.04.01 장비 IF 기능이 추가되면서, 해당 기능은 IF를 사용하지 않는 장비에서만 사용.
    @Override
    public void managerDrawingBoardRestart(HashMap<String, Object> hashMap) throws Exception {

        /** MCT WORKING LOG INSERT 처리 한다.
         * active에 대한 기록을 임의로 생성해준다.
         * **/
        hashMap.put("EXECUTION","DB_ACTIVE");
        hashMap.put("ACTIVE_TYPE","PGM_ACTIVE");
        hashMap.put("CYCLE_FINISH_YN","N");
        hashMap.put("queryId", "drawingMapper.insertWorkingLogNonIf");
        innodaleDao.create(hashMap);

        /** MCT WORK 임시 중지 상태 업데이트 처리 한다. **/
        hashMap.put("WORK_STATUS","DBS020");
        hashMap.put("queryId", "drawingMapper.updateMctWorkStatusNonIf");
        innodaleDao.create(hashMap);

    }

    @Override
    public void managerDrawingBoardComplete(HashMap<String, Object> hashMap) throws Exception {

        HashMap<String, Object> machineInfo = (HashMap<String, Object>)hashMap.get("machineInfo");

        /** MCT WORKING LOG INSERT 처리 한다.
         *
         * **/
        if(machineInfo.containsKey("IF_USE_YN") && machineInfo.get("IF_USE_YN").equals("Y")) {
            /** MCT WORK 완료 상태 업데이트 처리 한다. **/
            hashMap.put("queryId", "drawingMapper.updateCompleteMctWork");
            innodaleDao.create(hashMap);
        }else {
            hashMap.put("EXECUTION","DB_STOP");
            hashMap.put("ACTIVE_TYPE","PGM_STOP");
            hashMap.put("CYCLE_FINISH_YN","Y");
            hashMap.put("queryId", "drawingMapper.insertWorkingLogNonIf");
            innodaleDao.create(hashMap);

            hashMap.put("queryId", "drawingMapper.updateCompleteMctWorkNonIf");
            innodaleDao.create(hashMap);

        }


        /**
         * Part 상태를 변경한다.
         * Progress 상태를 먼저 변경하고 Part Status 상태를 매칭 하여 맞춘다.
         **/
        hashMap.put("queryId", "drawingMapper.createDrawingBoardControlPartProgress");
        hashMap.put("PART_STATUS", "PRO008");
        innodaleDao.create(hashMap);

        hashMap.put("queryId", "drawingMapper.updateDrawingBoardControlPartStatusMapping");
        innodaleDao.create(hashMap);
    }

    @Override
    public void managerDrawingBoardCancel(HashMap<String, Object> hashMap) throws Exception {

        /** MCT WORK 취소 업데이트 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.updateMctCancelWork");
        innodaleDao.create(hashMap);


        hashMap.put("queryId", "drawingMapper.updateMctCancelWorkingLog");
        innodaleDao.update(hashMap);
        /**
         * Part 상태가 가공 중 인 경우 현재 상태를 이전 상태로 되 돌린다.
         * Progress 상태를 먼저 변경하고 Part Status 상태를 매칭 하여 맞춘다.
         * 2021.03 협의 된 내용으로 삭제 처리된 PART 상태에서는 관리 할 필요 없다는 강대표 확인 으로 이전 상태 삭제 하고 맞추는 방법으로 처리 함
         **/
        hashMap.put("queryId", "drawingMapper.updateCancelMctControlPartWork");
        innodaleDao.create(hashMap);

        hashMap.put("queryId", "drawingMapper.updateDrawingBoardControlPartStatusMapping");
        innodaleDao.create(hashMap);

    }

    @Override
    public void managerDrawingBoardErrorRegist(HashMap<String, Object> hashMap) throws Exception {
        hashMap.put("queryId", "drawingMapper.insertErrorQty");
        innodaleDao.create(hashMap);
    }
}
