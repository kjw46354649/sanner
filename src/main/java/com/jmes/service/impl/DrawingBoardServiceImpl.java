package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.jmes.service.DrawingBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

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

        /** 신규 MCT 작업을 추가 한다. **/
        hashMap.put("queryId", "drawingMapper.insertMctWorkStart");
        hashMap.put("WORK_STATUS", "DBS020");
        innodaleDao.create(hashMap);

        /** MCT PLAN 에서 우선순위가 높은 생산계획을 삭제 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.deleteFristMctPlan");
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
    @Override
    public void managerDrawingBoardPause(HashMap<String, Object> hashMap) throws Exception {

        /** MCT WORK TIME INSERT 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.insertMctWorkTime");
        innodaleDao.create(hashMap);

        /** MCT WORK 임시 중지 상태 업데이트 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.updateStopMctWork");
        hashMap.put("WORK_STATUS", "DBS010");
        innodaleDao.create(hashMap);

    }

    /**
     * DBS010 : 임시중지, DBS020 : 진행중, DBS030 : 완료, DBS040 : 취소
     * @param hashMap
     * @throws Exception
     */
    @Override
    public void managerDrawingBoardRestart(HashMap<String, Object> hashMap) throws Exception {

        /** MCT WORK 임시 중지 상태 업데이트 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.updateRestartMctWork");
        hashMap.put("WORK_STATUS", "DBS020");
        innodaleDao.create(hashMap);

    }

    @Override
    public void managerDrawingBoardComplete(HashMap<String, Object> hashMap) throws Exception {
        /** MCT WORK TIME INSERT 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.insertMctWorkTime");
        innodaleDao.create(hashMap);

        /** MCT WORK 완료 상태 업데이트 처리 한다. **/
        hashMap.put("queryId", "drawingMapper.updateCompleteMctWork");
        hashMap.put("WORK_STATUS", "DBS030");
        innodaleDao.create(hashMap);

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
        hashMap.put("queryId", "drawingMapper.updateMctWork");
        hashMap.put("WORK_STATUS", "DBS040");
        hashMap.put("DEL_YN", "Y");
        innodaleDao.create(hashMap);

        /**
         * Part 상태가 가공 중 인 경우 현재 상태를 이전 상태로 되 돌린다.
         * Progress 상태를 먼저 변경하고 Part Status 상태를 매칭 하여 맞춘다.
         * 임시로 막고.. WORK 쪽만 삭제 처리 한다.
         **/
//        hashMap.put("queryId", "drawingMapper.createDrawingBoardControlPartProgress");
//        hashMap.put("PART_STATUS", "PRO008");
//        innodaleDao.create(hashMap);
//
//        hashMap.put("queryId", "drawingMapper.updateDrawingBoardControlPartStatusMapping");
//        innodaleDao.create(hashMap);

    }
}
