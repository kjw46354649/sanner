package com.jmes.service;

import java.util.List;
import java.util.Map;

public interface OrderService {

    void registerNewOrder(Map<String, Object> map) throws Exception;

    void registerNewOrderConfirm(Map<String, Object> map) throws Exception;

    List<Map<String, Object>> selectControlCloseRightList(Map<String, Object> map) throws Exception;

    void insertMonthFinishClose(Map<String, Object> map) throws Exception;

    void insertInvoice(Map<String, Object> map) throws Exception;

    void deleteInvoice(Map<String, Object> map) throws Exception;
}
