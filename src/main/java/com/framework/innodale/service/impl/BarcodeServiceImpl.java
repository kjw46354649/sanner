package com.framework.innodale.service.impl;

import aj.org.objectweb.asm.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.framework.innodale.component.BarcodePrintUtil;
import com.framework.innodale.component.CadFileConverter;
import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.dao.InnodaleDao;
import com.framework.innodale.service.BarcodeService;
import com.framework.innodale.service.FileUploadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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

        if (list != null && list.size() > 0) {
            for (String number : list) {
                System.out.println("number+"+number);
                char barcodeTypeC = number.charAt(0);
                String barcodeType = String.valueOf(barcodeTypeC);

                Map<String, Object> barcodeMap = new HashMap<String, Object>();

                barcodeMap.put("BARCODE_NUM",number);
                barcodeMap.put("BARCODE_TYPE",barcodeType);
                if("L".equals(barcodeType)){//라벨
                    barcodeMap.put("queryId","common.selectBarcodePrintInfoOut");
                    barcodeMap = this.innodaleDao.getInfo(barcodeMap);
                }else if("C".equals(barcodeType)) {//도면
                    barcodeMap.put("queryId","common.selectBarcodePrintInfoControl");
                    barcodeMap = this.innodaleDao.getInfo(barcodeMap);
                }else{
                    barcodeMap = null;
                }

                if(barcodeMap != null){
                    String rtn = barcodePrintUtil.barcodePrint(barcodeMap, barcodeIp, barcodePort, barcodeType);
                    if("OK".equals(rtn)){
                        cnt++;
                    }
                }
            }
        }

        model.addAttribute("result",       "success");
        model.addAttribute("message",      "프린트를 완료 하였습니다.[" + cnt +"건]");

    }

}