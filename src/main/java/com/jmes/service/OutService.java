package com.jmes.service;

import org.springframework.ui.Model;

import java.util.Map;

public interface OutService {
    void removeOutsideOrder(Map<String, Object> map) throws Exception;

    void createOutsideClose(Map<String, Object> map) throws Exception;

    void managerRequestOutside(Model model, Map<String, Object> map) throws Exception;

    void removeOutsideClose(Map<String, Object> map)  throws Exception;
}
