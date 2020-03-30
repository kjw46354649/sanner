package com.jmes.service;

import java.util.HashMap;
import java.util.Map;

public interface OrderService {
    void registerNewOrder(Map<String, Object> map) throws Exception;

    void registerNewOrderConfirm(Map<String, Object> map) throws Exception;
}
