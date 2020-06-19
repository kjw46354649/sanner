package com.jmes.service;

import java.util.Map;

public interface OutService {
    void modifyOutsideOrder(Map<String, Object> map) throws Exception;

    void createOutsideClose(Map<String, Object> map) throws Exception;

    void managerRequestOutside(Map<String, Object> map) throws Exception;

    void removeOutsideClose(Map<String, Object> map)  throws Exception;
}
