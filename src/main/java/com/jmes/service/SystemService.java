package com.jmes.service;

import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

public interface SystemService {
    List<Map<String, Object>> getCommonCodeList(Map<String, Object> hashMap) throws Exception;

    void commonCodeModifyGrid(Map<String, Object> map) throws Exception;

    void managerSystemCompany(Model model, Map<String, Object> map) throws Exception;

    void updateWorkingTime(Map<String, Object> map) throws Exception;

    void updateWorkingDayTime(Map<String, Object> map) throws Exception;
}
