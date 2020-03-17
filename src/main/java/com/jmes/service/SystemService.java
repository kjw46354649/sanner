package com.jmes.service;

import java.util.List;
import java.util.Map;

public interface SystemService {
    List<Map<String, Object>> getCommonCodeList(Map<String, Object> hashMap) throws Exception;
}
