package com.jmes.service;

import org.springframework.ui.Model;

import java.util.HashMap;

public interface PopService {

    public void createScanningBarcodePop(Model model, HashMap<String, Object> hashMap) throws Exception;
}
