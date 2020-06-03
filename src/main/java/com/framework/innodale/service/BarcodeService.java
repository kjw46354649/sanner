package com.framework.innodale.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.Map;

public interface BarcodeService {

    public void print(Map<String, Object> map, Model model) throws Exception;

}
