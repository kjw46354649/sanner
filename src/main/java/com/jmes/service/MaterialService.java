package com.jmes.service;

import org.springframework.ui.Model;

import java.util.Map;

public interface MaterialService {

    public void managerInsideStock(Model model, Map<String, Object> map) throws Exception;
}
