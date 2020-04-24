package com.framework.innodale.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileUploadService {

    public void createFileUpload(MultipartHttpServletRequest request, Model model) throws Exception;

    public void uploadDxfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception;

    public void uploadControlCadFilesTesting(MultipartHttpServletRequest request, Model model) throws Exception;

}
