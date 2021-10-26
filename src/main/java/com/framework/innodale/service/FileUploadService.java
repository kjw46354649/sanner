package com.framework.innodale.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.Map;

public interface FileUploadService {

    public void createFileUpload(MultipartHttpServletRequest request, Model model) throws Exception;

    public void uploadDxfAndPdfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception;

    public void uploadDxfAndPdfCadFilesControlOrder(MultipartHttpServletRequest request, Model model) throws Exception;

    public String controlCadRevPrev(Map<String, Object> map) throws Exception;

    public String controlCadPartPrev(Map<String, Object> map) throws Exception;

}
