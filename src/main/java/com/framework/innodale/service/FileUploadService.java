package com.framework.innodale.service;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FileUploadService {

    public void createFileUpload(MultipartHttpServletRequest request, Model model) throws Exception;

    public void uploadDxfAndPdfCadFiles(MultipartHttpServletRequest request, Model model) throws Exception;

    public void uploadDxfAndPdfCadFilesControlOrder(MultipartHttpServletRequest request, Model model) throws Exception;

}
