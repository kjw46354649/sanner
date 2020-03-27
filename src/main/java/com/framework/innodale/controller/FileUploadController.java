package com.framework.innodale.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class FileUploadController {

    @Autowired
    private Environment environment;

    @Autowired
    private InnodaleService innodaleService;

    /**
     *
     * @param model
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadNormalFile")
    public String uploadNormalFiles(Model model, MultipartHttpServletRequest request) throws Exception {

        ArrayList<HashMap<String, Object>> resultList = new ArrayList<HashMap<String, Object>>();
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmssSSS", new Locale("ko", "KR"));

        String serverFileName = "file-" + CommonUtility.getUUIDString();
        String uploadFilePath = environment.getRequiredProperty("base.upload.main.path") + File.separator + formatter.format(new Date()).substring(0, 8);

        model.addAttribute("result", "false");
        model.addAttribute("message", "처리 할수 없는 파일 형식 입니다.");

        Iterator<String> itr = request.getFileNames();

        if(itr.hasNext()) {

            File filePath = new File(uploadFilePath);
            if (!filePath.exists()) {
                if (!filePath.mkdirs()) {
                    throw new Exception(
                            "Fail to create a directory for attached file [" + filePath + "]");
                }
            }

            HashMap<String, Object> fileMap = new HashMap<String, Object>();

            MultipartFile multipartFile = request.getFile(itr.next());
            multipartFile.transferTo(new File(uploadFilePath + File.separator + serverFileName));

            String fileName = new String(multipartFile.getOriginalFilename().getBytes("8859_1"),"utf-8");
            String extName = fileName.substring(fileName.lastIndexOf(".") + 1).toUpperCase();

            System.out.println(fileName +" uploaded!");

            fileMap.put("FILE_NM", 		    serverFileName);
            fileMap.put("FILE_PATH", 		uploadFilePath + File.separator + serverFileName);
            fileMap.put("ORGINAL_FILE_NM", 	fileName);
            fileMap.put("FILE_TYPE", 		multipartFile.getContentType());
            fileMap.put("FILE_EXT", 		extName);
            fileMap.put("FILE_SIZE", 		multipartFile.getSize());

            if(!hashMap.containsKey("GFILE_SEQ") || "".equals(String.valueOf(hashMap.get("GFILE_SEQ")))){

                // GFILE 신규 등록
                fileMap.put("GFILE_SEQ", "");
                fileMap.put("queryId", "common.insertFileGroup");
                innodaleService.update(fileMap);

            } else {

                // 기존 파일 삭제
                fileMap.put("GFILE_SEQ", hashMap.get("GFILE_SEQ"));
                fileMap.put("queryId", "common.deleteGFileKey");
                innodaleService.create(fileMap);
            }

            // 신규 파일 등록
            fileMap.put("queryId", "common.insertFile");
            innodaleService.create(fileMap);

            model.addAttribute("result",       "success");
            model.addAttribute("message",      "업로드를 완료 하였습니다.");

            resultList.add(fileMap);

        }

        model.addAttribute("fileUploadList",       resultList);

        return "jsonView";
    }
}
