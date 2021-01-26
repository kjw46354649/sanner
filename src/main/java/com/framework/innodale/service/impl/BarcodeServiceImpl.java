package com.framework.innodale.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.BarcodePrintUtil;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.BarcodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.*;

@Service
public class BarcodeServiceImpl implements BarcodeService {

    @Autowired
    public InnodaleDao innodaleDao;

    @Autowired
    public BarcodePrintUtil barcodePrintUtil;

    @Value("${bcode.ip}")
    private String barcodeIp;

    @Value("${bcode.port}")
    private int barcodePort;

    @Override
    public void print(Map<String, Object> map, Model model) throws Exception {

        String jsonObject = (String) map.get("data");
        ObjectMapper objectMapper = new ObjectMapper();
        ArrayList<String> list = null;

        if (jsonObject != null)
            list = objectMapper.readValue(jsonObject, ArrayList.class);

        int cnt = 0;
        int failCnt = 0;

        if (list != null && list.size() > 0) {
            for (String number : list) {

                System.out.println("Barcode=["+number+"]");
                if(!"".equals(number) && number != null) {

                    char barcodeTypeC = number.charAt(0);
                    String barcodeType = String.valueOf(barcodeTypeC);

                    Map<String, Object> barcodeMap = new HashMap<String, Object>();

                    barcodeMap.put("BARCODE_NUM", number);
                    barcodeMap.put("BARCODE_TYPE", barcodeType);
                    if ("L".equals(barcodeType)) {//라벨
                        barcodeMap.put("queryId", "common.selectBarcodePrintInfoOut");
                        barcodeMap = this.innodaleDao.getInfo(barcodeMap);
                    } else if ("C".equals(barcodeType)) {//도면
                        barcodeMap.put("queryId", "common.selectBarcodePrintInfoControl");
                        barcodeMap = this.innodaleDao.getInfo(barcodeMap);
                    } else {
                        barcodeMap = null;
                    }

                    if (barcodeMap != null) {
                        String rtn = barcodePrintUtil.barcodePrint(barcodeMap, barcodeIp, barcodePort, barcodeType);
                        if ("OK".equals(rtn)) {
                            cnt++;
                        }
                    }
                }else{
                    failCnt++;
                }
            }
        }

        model.addAttribute("result",       "success");
        model.addAttribute("message",      "프린트를 전송을 완료 하였습니다.[성공 : " + cnt +"건, 실패 : " + failCnt + "건]");

    }

}