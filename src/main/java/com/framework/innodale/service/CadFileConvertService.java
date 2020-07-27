package com.framework.innodale.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.Map;

public interface CadFileConvertService {

    public void createCadFileUpload(Map<String, Object> map) throws Exception;
}
