package com.jmes.service.impl;

import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.jmes.dao.PopDao;
import com.jmes.service.PopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
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

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

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
     *         // PRO005	소재입고        -- 자동 추가(조건은 소재 주문 이후에 자재 입고 없이 모든 POP 에서 스캔 된 경우 상태 추가)
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
     *         // PRO018	조립전환        -- 조립 & part 에서 조립이 POP 에 스캔 된 경우 Part 상태를 조림전환으로 분리함
     *         // PRO020    폐기
     *         // PRO021    소재입고(보)     -- 소재 입고 * 보유 소재 사용, 가공확정 이후
     *         // PRO022    소재입고(사)     -- 소재 입고 * 사급 처리 , 가공확정 이후
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

        /** 도면 바코드 코드를 이용하여 도면의 작업지시번호 정보를 조회한다. **/
        hashMap.put("queryId", "popMapper.selectInsertPopPartStatus");
        Map<String, Object> controlPartInfo = innodaleDao.getInfo(hashMap);

        if(controlPartInfo == null){
            model.addAttribute("returnCode", "RET98");
            model.addAttribute("message", "도면에 문제가 있습니다. 도면 확인 바랍니다."); // 정보가 없는 경우
        }else{
            controlPartInfo.put("LOGIN_USER_ID",hashMap.get("LOGIN_USER_ID"));

            /** 추가 되어야 할 데이터 **/
            String prevPopLocation = (String) controlPartInfo.get("POP_PREV_POSITION"); // 이전 pop 위치 이름
            String createPRO005 = (String) controlPartInfo.get("PRO005"); // 소재 입고 상태 처리
            String createPRO019 = (String) controlPartInfo.get("PRO019"); // 외주 가공 입고 상태 처리
            String createPRO009 = (String) controlPartInfo.get("PRO009"); // 가공완료 상태 처리
            String createPRO013 = (String) controlPartInfo.get("PRO013"); // 후가공 완료 상태 처리
            String createPRO015 = (String) controlPartInfo.get("PRO015"); // 표면처리 완료 상태 처리
            String createPRO018 = (String) controlPartInfo.get("PRO018"); // 모도면 상태 처리
            String createPRO021 = (String) controlPartInfo.get("PRO021"); // 소재입고(보), 소재입고(사) 처리
            String innerWorkFinishDt = (String) controlPartInfo.get("INNER_WORK_FINISH_DT"); // 가공완료 일시 처리 여부
            String context01 = (String) controlPartInfo.get("CONTEXT01"); // 일자
            String context02 = (String) controlPartInfo.get("CONTEXT02"); // CONTROL_NUM INFO
            String context03 = (String) controlPartInfo.get("CONTEXT03"); // 현재 pop 위치명
            String workType = (String) controlPartInfo.get("WORK_TYPE"); // work Type

            if("X".equals(controlPartInfo.get("CHE_DEL_YN"))){
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", context02.replaceAll("DEL_", "") + " 삭제된 주문입니다. (Order Deleted.)"); // 삭제 처리 주문
            }else if("X".equals(controlPartInfo.get("CHE_CANCEL_YN"))){
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", context02 + " 취소 주문입니다. (Order Canceled.)"); // 주문 취소 상태
            }else if("X".equals(controlPartInfo.get("CHE_VER"))){
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", context02 + " Error, Check the Drawing Please."); // 도면 번호가 다른 경우 처리
            }else if("X".equals(controlPartInfo.get("CHE_OUT001"))){
                model.addAttribute("returnCode", "RET99");
                model.addAttribute("message", context02 + " 가공 미확정 상태, 사무실에 확인 바랍니다. (Contact Admin Please)"); // 외주 이면서 확정 상태가 아닌 경우
            }else if("X".equals(controlPartInfo.get("CHE_PRO002"))){
                model.addAttribute("returnCode", "RET98");
                model.addAttribute("message", context02 + " 가공 미확정 상태, 사무실에 확인 바랍니다. (Contact Admin Please)"); // 외주 가공 이외의 경우는 가공 확정 상태가 없는 경우 처리
            }else if (popLocation.equals(prevPopLocation)) {
                model.addAttribute("returnCode", "RET01");
                model.addAttribute("message", context02 + " " + context03 + " Already Existed."); // 현재와 같은 Location 스캔 처리
            }else if(controlPartInfo.get("CHE_OST002").equals("X")) {
                model.addAttribute("returnCode","RET99");
                model.addAttribute("message","외주주문 입니다. 진행상태를 확인해 주세요.");
            }else {

                // 가공중의 충당요청건이 있는 경우 pop 스캔시 입출고 처리
                controlPartInfo.put("popBarcode",hashMap.get("popBarcode"));

                controlPartInfo.put("queryId","popMapper.insertProcessingStockIn");
                innodaleDao.create(controlPartInfo);

                controlPartInfo.put("queryId","popMapper.insertProcessingStockOut");
                innodaleDao.create(controlPartInfo);

                controlPartInfo.put("queryId","popMapper.updateProcessingStock");
                innodaleDao.update(controlPartInfo);

                controlPartInfo.put("queryId","popMapper.updateProcessingStockQty");
                innodaleDao.update(controlPartInfo);


                NotificationMessage notificationMessage = new NotificationMessage();

                notificationMessage.setType(MessageType.POP);
                notificationMessage.setPopPosition(popLocation);
                notificationMessage.setPrePopPosition(prevPopLocation);
                notificationMessage.setContent01(context01);
                notificationMessage.setContent02(context02);
                notificationMessage.setContent03(context03);

                // 가공확정 이후에 POP 스캔되면 소재사급(보), 사급인 경우 소재사급(사) 처리 한다.
                if (createPRO021 != null && !"".equals(createPRO021)) {
                    // 소재사급(보), 사급인 경우 소재사급(사)
                    controlPartInfo.put("PART_STATUS", createPRO021);
                    controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                    innodaleDao.create(controlPartInfo);

                    // Part 상태를 Progress 상태와 맞춤
                    controlPartInfo.put("queryId", "popMapper.updateControlPartProgressMappingStatus");
                    innodaleDao.update(controlPartInfo);
                }

                // 모도면이 POP 바코드 스캔 되면 조립전환 상태를 추가 한다.
                if ("WTP020".equals(workType)) {
                    controlPartInfo.put("PART_STATUS", "PRO018");
                    if (createPRO018 != null && !"".equals(createPRO018)) {
                        controlPartInfo.put("queryId", "popMapper.insertControlPartProgressStatus");
                        innodaleDao.create(controlPartInfo);
                    }
                    // TODO  Part 가 있는 경우 Part 상태를 조립전환으로 변경해야 한다.
                    //      -- PART 에서 가공 이력이 있는 경우 PART 가공 완료 일시를 업데이트 한다.
                    controlPartInfo.put("queryId", "popMapper.insertControlPartChildProgressStatus");
                    innodaleDao.create(controlPartInfo);

                    controlPartInfo.put("queryId", "popMapper.updateControlPartChildProgressMappingStatus");
                    innodaleDao.create(controlPartInfo);
                }

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

                    notificationMessage.setContent04("소재입고");
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

                    notificationMessage.setContent04("외주입고");
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

                // 가공 완료 일시 처리
                if (innerWorkFinishDt != null && "Y".equals(innerWorkFinishDt)) {
                    controlPartInfo.put("queryId", "popMapper.updateControlPartInnerWorkFinishDtStatus");
                    innodaleDao.create(controlPartInfo);

                    notificationMessage.setContent04("가공완료");
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

                        notificationMessage.setContent04("후 가공 입고");

                    } else if ("POP160".equals(popLocation)) {
                        // 표면 처리 스캔시 표면처리 입고
                        controlPartInfo.put("PART_STATUS", "PRO014");

                        notificationMessage.setContent04("표면 처리 입고");
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

                model.addAttribute("returnCode", "RET00");
                model.addAttribute("controlInfo", context02);
                model.addAttribute("locationInfo", context03);

                simpMessagingTemplate.convertAndSend("/topic/pop", notificationMessage);
            }
        }
    }
}
