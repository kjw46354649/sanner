package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.jmes.dao.PopDao;
import com.jmes.service.PopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

@Service
public class PopServiceImpl implements PopService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Autowired
    public PopDao popDao;

    /**
     *         // 첫번째 바코드 인식
     *         // 필수 바코드 입력
     *         //      1. 소재 요청 이후에 첫 POP 에 바코드 스캔 되면 소재 입고(PRO005) 상태 변경도 함께 변경
     *         //      2. 가공 완료(검사실)
     *         //      3. 모도면 찍힌경우 - 조립전환 상태 추가 되어야 함
     *         // 프로세스
     *         // PRO002	가공확정
     *         // PRO001	외주발송
     *         // PRO003	가공확정취소
     *         // PRO004	소재주문
     *         // PRO005	소재입고        -- 자동 추가(조건은 소재 주문 이후에 조재 입고 없이 모든 POP 에서 스캔 된 경우 상태 추가)
     *         // PRO006	CAM 설계
     *         // PRO007	가공중
     *         // PRO008	공정완료
     *         // PRO009	가공완료        -- 검사실 POP 스캔 되었을 경우 POP 추가 및 상태 추가
     *         // PRO010	검사합격
     *         // PRO011	검사불량
     *         // PRO012	후가공 입고     -- 후가공 POP 스캔 되었을 경우 POP 추가 및 상태 추가
     *         // PRO013	후가공 완료
     *         // PRO014	표면처리 입고    -- 표면처리 POP 스캔 되었을 경우 POP 추가 및 상태 추가
     *         // PRO015	표면처리 완료
     *         // PRO016	출하완료
     *         // PRO017	반품
     *         // PRO018	조립전환        --
     *
     *          // POP010  소형MCT1
     *          // POP020  소형MCT2
     *          // POP030  대형MCT
     *          // POP040  밀링
     *          // POP050  사상
     *          // POP060  선반/연마
     *          // POP070  정밀MCT
     *          // POP080  2공장MCT
     *          // POP090  3공장MCT
     *          // POP100  검사실
     *          // POP110  출하대기장1
     *          // POP120  출하대기장2
     *          // POP130  교정/마감실
     *          // POP140  표면교정장
     *          // POP150  후가공
     *          // POP160  표면처리
     *
     * @param hashMap
     * @throws Exception
     */
    @Override
    public void createScanningBarcodePop(Model model, HashMap<String, Object> hashMap) throws Exception {

        /** 화면에서 받은 데이터 **/
        String popLocation = (String) hashMap.get("popLocation");

        /** 도면 바코드 코드를 이용하여 도면의 관리번호 정보를 조회한다. **/
        hashMap.put("queryId", "popMapper.selectInsertPopPartStatus");
        Map<String, Object> controlPartInfo = innodaleDao.getInfo(hashMap);

        if(controlPartInfo == null){
            model.addAttribute("returnCode", "RET98");
            model.addAttribute("message", "도면에 문제가 있습니다. 도면 확인 바랍니다."); // 현재와 같은 Location 스캔 처리
        }else {

            /** 추가 되어야 할 데이터 **/
            String currentPopLocation = (String) controlPartInfo.get("POP_PREV_POSITION"); // 현재 위치
            String createPRO005 = (String) controlPartInfo.get("PRO005"); // 소재 입고 상태 처리
            String createPRO019 = (String) controlPartInfo.get("PRO019"); // 외주 가공 입고 상태 처리
            String createPRO009 = (String) controlPartInfo.get("PRO009"); // 가공완료 상태 처리
            String createPRO013 = (String) controlPartInfo.get("PRO013"); // 후가공 완료 상태 처리
            String createPRO015 = (String) controlPartInfo.get("PRO015"); // 표면처리 완료 상태 처리
            String createPRO018 = (String) controlPartInfo.get("PRO018"); // 모도면 상태 처리
            String innerWorkFinishDt = (String) controlPartInfo.get("INNER_WORK_FINISH_DT"); // 가공완료 일시 처리 여부

            if (currentPopLocation.equals(popLocation)) {
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", "이미 등록된 도면 입니다. 확인 바랍니다."); // 현재와 같은 Location 스캔 처리
            } else {
                // 소재 주문 이후에 POP 바코드 스캔 되면 소재 입고 처리를 완료 한다.
                if (createPRO005 != null && !"".equals(createPRO005)) {
                    // PART 소재 입고 처리
                    controlPartInfo.put("PART_STATUS", createPRO005);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);

                    // 소재 주문의 정보 상태 변경
                    controlPartInfo.put("ORDER_STATUS", "MST004");
                    controlPartInfo.put("queryId", "popMapper.updatePopMaterialOrderStatus");
                    innodaleDao.update(controlPartInfo);
                }

                // 외주 가공 요청 이후에 POP 스캔시에 외주 입고 처리
                if (createPRO019 != null && !"".equals(createPRO019)) {
                    // PART 소재 입고 처리
                    controlPartInfo.put("PART_STATUS", createPRO019);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);

                    // Part 외주 입고, 상태 업데이트
                    controlPartInfo.put("queryId", "popMapper.updateControlPartOutsideInDate");
                    innodaleDao.update(controlPartInfo);
                }

                // 가공완료 상태 업데이트
                if (createPRO009 != null && !"".equals(createPRO009)) {
                    controlPartInfo.put("PART_STATUS", createPRO009);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);
                }

                // 후가공 상태 업데이트
                if (createPRO013 != null && !"".equals(createPRO013)) {
                    controlPartInfo.put("PART_STATUS", createPRO013);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);
                }

                // 표면처리 상태 업데이트
                if (createPRO015 != null && !"".equals(createPRO015)) {
                    controlPartInfo.put("PART_STATUS", createPRO015);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);
                }

                // 모도면이 POP 바코드 스캔 되면 조립전환 상태를 추가 한다.
                if (createPRO018 != null && !"".equals(createPRO018)) {
                    controlPartInfo.put("PART_STATUS", createPRO018);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);
                }

                // 가공 완료 일시 처리
                if (innerWorkFinishDt != null && "Y".equals(innerWorkFinishDt)) {
                    controlPartInfo.put("queryId", "popMapper.updateControlPartInnerWorkFinishDtStatus");
                    innodaleDao.create(controlPartInfo);
                }

                // 검사실 스캔, 후가공 스캔, 표면 처리 스캔시 PART 상태도 변경 처리 한다.
                if ("POP150".equals(popLocation) || "POP160".equals(popLocation)) {
//                if ("POP100".equals(popLocation) || "POP150".equals(popLocation) || "POP160".equals(popLocation)) {
//                    if ("POP100".equals(popLocation)) {
//                        // 검사실 스캔시 작업 완료대기
//                        controlPartInfo.put("PART_STATUS", "PRO009");
//                    } else
                    if ("POP150".equals(popLocation)) {
                        // 후가공 스캔시 후가공 입고
                        controlPartInfo.put("PART_STATUS", "PRO012");
                    } else if ("POP160".equals(popLocation)) {
                        // 표면 처리 스캔시 표면처리 입고
                        controlPartInfo.put("PART_STATUS", "PRO014");
                    }
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);
                }

                // Part 상태 업데이트 현재 상태와 Part Process 상태가 맞지 않을 경우 Part Process 상태로 Part 상태를 업데이트 한다.
                controlPartInfo.put("queryId", "popMapper.updateControlPartProgressMappingStatus");
                innodaleDao.update(controlPartInfo);

                // 스캔된 Barcode 입력
                controlPartInfo.put("POP_POSITION", popLocation);
                controlPartInfo.put("queryId", "popMapper.insertPopBarcode");
                innodaleDao.create(controlPartInfo);


                hashMap.put("queryId", "popMapper.selectScanBarcodeInfo");
                Map<String, Object> scanBarcodeInfo = innodaleDao.getInfo(hashMap);

                String controlInfo = (String) scanBarcodeInfo.get("CONTROL_NUM_NM"); // 관리번호 정보
                String locationInfo = (String) scanBarcodeInfo.get("CHECK_POSITION_NM");   // POP 정보

                model.addAttribute("returnCode", "RET00");
                model.addAttribute("controlInfo", controlInfo);
                model.addAttribute("locationInfo", locationInfo);
            }
        }
    }
}
