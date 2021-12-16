package com.jmes.service;

import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

public interface InspectionService {

    void saveLayer(Map<String, Object> map, Model model) throws Exception;

    void modifyInspectResult(Map<String, Object> map, Model model) throws Exception;

    void selectInspectResult(Map<String, Object> hashMap, Model model) throws Exception;
}
