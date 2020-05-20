package com.jmes.service;

import java.util.HashMap;

public interface EstimateService {

    void registerEstimateSave(HashMap<String, Object> hashMap) throws Exception;;

    void registerEstimateOrder(HashMap<String, Object> hashMap) throws Exception;


}
