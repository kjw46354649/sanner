package com.tomes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.framework.innodale.service.InnodaleService;
import com.tomes.domain.CommonResult;
import com.tomes.domain.SingleResult;
import com.tomes.exception.ParameterException;
import com.tomes.service.ResponseService;
import io.swagger.annotations.Api;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Api
@Controller
@RestController
@RequiredArgsConstructor
@RequestMapping("/tomes")
@CrossOrigin
public class TomesDrawingController {

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;

    private final ResponseService responseService;

//    @Autowired
//    SqlSessionTemplate batchSqlSessionTemplate;

    @Autowired
    SqlSessionTemplate sqlSessionTemplate;

    @Autowired
    private InnodaleDao innodaleDao;


    @PostMapping("/drawing")
    public CommonResult mctWork(HttpServletRequest request, @RequestBody Map<String,Object> parameters) {
        CommonResult result = responseService.getSingleResult("200");

        try {
            if(parameters.containsKey("dataList")) {
                List<Map<String,Object>> dataList = (List<Map<String, Object>>) parameters.get("dataList");
                System.out.println("dataList >>>>>>>>>>>>>>>>>>>> " + dataList);
                if(dataList.size() > 0) {
                    HashMap<String,Object> dataMap = new HashMap<>();
                    for(Map<String,Object> map : dataList) {
                        if(!map.containsKey("seq") || !map.containsKey("equip_name") || !map.containsKey("part_cnt") || !map.containsKey("event_time") || !map.containsKey("execution")) {
                            throw new ParameterException();
                        }else {
                            map.put("queryId","tomesMapper.selectCurrentMctInfo");
                            Map<String,Object> mctInfo = innodaleDao.getInfo(map);
                            System.out.println("map >>>>>>>>>>>>>>>>>>>> " + map);
                            if(mctInfo != null) {
                                map.put("MCT_WORK_SEQ", mctInfo.get("MCT_WORK_SEQ"));
                                map.put("EQUIP_SEQ", mctInfo.get("EQUIP_SEQ"));
                                map.put("CONTROL_SEQ", mctInfo.get("CONTROL_SEQ"));
                                map.put("CONTROL_DETAIL_SEQ", mctInfo.get("CONTROL_DETAIL_SEQ"));

                            }
                            sqlSessionTemplate.insert("tomesMapper.insertNcIfWorkData", map);

                            if(mctInfo != null) { // cycle 완료 데이터
                                map.put("queryId", "tomesMapper.selectCycleTimeTotal");
                                Map<String,Object> cycleInfo = innodaleDao.getInfo(map);
                                cycleInfo.put("active_type", map.get("active_type"));
                                cycleInfo.put("cycleCheck", map.get("cycleCheck"));
                                cycleInfo.put("event_time", map.get("event_time"));

                                System.out.println("cycleInfo >>>>>>>>>>>>>>>>>>>> " + cycleInfo);

                                cycleInfo.put("queryId", "tomesMapper.updateIfWorkingTime");
                                innodaleDao.update(cycleInfo);

                                String equipName = (String) map.get("equip_name");
                                dataMap.put(equipName, map);
                            }
                        }
                    }

                    Iterator<String> keys = dataMap.keySet().iterator();
                    while (keys.hasNext()) {
                        String key = keys.next();


                        Map<String,Object> leadMap = (Map<String, Object>) dataMap.get(key);
                        leadMap.put("queryId","tomesMapper.selectCurrentMctInfo");
                        Map<String,Object> noticeMap = innodaleDao.getInfo(leadMap);

                        if(noticeMap != null) {
                            leadMap.putAll(noticeMap);
                            dataMap.put(key, leadMap);
                        }
                        System.out.println("leadMap >>>>>>>>>>>>>>>>>>>> " + leadMap);
                    }
                    if(!dataMap.isEmpty()) {
                        simpMessagingTemplate.convertAndSend("/topic/notice", dataMap);
                    }

                }
            }else {
                throw new ParameterException();
            }

        }catch (ParameterException pe) {
            result =  responseService.getFailResult(400, "파라미터를 확인해주세요.");
        }catch (Exception e) {
            result =  responseService.getFailResult(500, "알수없는 오류가 발생하였습니다.");
            e.printStackTrace();
        }
        return result;
    }

    // 1.

}
