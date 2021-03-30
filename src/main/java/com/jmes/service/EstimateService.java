package com.jmes.service;

import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

public interface EstimateService {

    void registerEstimateSave(HashMap<String, Object> hashMap) throws Exception;;

    void saveFromControlToEstimate(HashMap<String, Object> hashMap) throws Exception;

    void registerEstimateOrder(HashMap<String, Object> hashMap) throws Exception;

    void insertMaterialCost(Map<String, Object> map) throws Exception;

    void deleteMaterialCost(Map<String, Object> map) throws Exception;

    void processingRequirementsEstimateSave(Model model, Map<String, Object> map) throws Exception;
}
