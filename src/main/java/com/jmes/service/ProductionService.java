package com.jmes.service;

import org.springframework.ui.Model;

import java.util.Map;

public interface ProductionService {

    public void managerStartCamWork(Model model, Map<String, Object> map) throws Exception;

    public void managerCancelCamWork(Model model, Map<String, Object> map) throws Exception;

    public void managerCamWork(Model model, Map<String, Object> map) throws Exception;

    void modifyMctPlan(Model model, Map<String, Object> map) throws Exception;
}
