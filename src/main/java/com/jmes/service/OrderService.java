package com.jmes.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

    void createNewOrder(Map<String, Object> map) throws Exception;

    void createNewOrderConfirm(Map<String, Object> map) throws Exception;

    void createMonthClose(Map<String, Object> map) throws Exception;

    void removeMonthClose(Map<String, Object> map) throws Exception;

    void createInvoice(Map<String, Object> map) throws Exception;

    void removeInvoice(Map<String, Object> map) throws Exception;

}
