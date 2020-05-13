package com.jmes.service.impl;

import com.jmes.dao.PopDao;
import com.jmes.service.PopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class PopServiceImpl implements PopService {

    @Autowired
    public PopDao popDao;

    @Override
    public void scanningBarcodePop(HashMap<String, Object> hashMap) throws Exception {
        String partStatus = (String) hashMap.get("PART_STATUS");
        String receiveYn = (String) hashMap.get("RECEIVE_YN");
        String popLocation = (String) hashMap.get("popLocation");

        // 최초 입고
        if(receiveYn == "Y") {
            hashMap.put("PART_STATUS","PRO005");
            popDao.updatePopControlPartStatus(hashMap);
            popDao.updatePopMaterialOrderStatus(hashMap);
        }else {
            /* POP 위치정보 (코드, 위치)
               POP010 : MCT 소형 대기장, POP020 : MCT 대형 대기장, POP030 밀링/사상반 대기장, POP040 : 연마 대기장, POP050 : 출하대기장
               POP060 : 후처리(표면처리),
               POP070 : 후가공
               POP080 : 2공장 MCT,
               POP090 : 검사실
             */

            if(popLocation == "POP090") {
                // 검사실 스캔시 검사대기
                hashMap.put("PART_STATUS","PRO009");

            }else if(popLocation == "POP060"){
                // 후가공 스캔시 후가공 입고
                hashMap.put("PART_STATUS","PRO014");
                if(partStatus == "PRO012"){
                    // 후가공 입고 스캔시 후가공 완료
                    hashMap.put("PART_STATUS","PRO015");
                }

            }else if(popLocation == "POP070"){
                // 후가공 스캔시 후가공 입고
                hashMap.put("PART_STATUS","PRO012");
                if(partStatus == "PRO012"){
                    // 후가공
                    hashMap.put("PART_STATUS","PRO013");
                }
            }

            popDao.updatePopControlPartStatus(hashMap);
        }

        // POP 입력
        popDao.insertPopBarcode(hashMap);


    }
}
