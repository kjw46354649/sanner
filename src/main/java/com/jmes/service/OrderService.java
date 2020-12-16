package com.jmes.service;

import org.springframework.ui.Model;

import java.util.Map;

public interface OrderService {

    void createNewOrder(Model model, Map<String, Object> map) throws Exception;

    void removeControl(Map<String, Object> map) throws Exception;

    void managerControlStatus(Map<String, Object> map) throws Exception;

    void createMonthClose(Map<String, Object> map) throws Exception;

    void removeMonthClose(Map<String, Object> map) throws Exception;

    String createInvoice(Map<String, Object> map) throws Exception;

    void removeInvoice(Map<String, Object> map) throws Exception;

    void processConfirmBarcodeInfo(Model model, Map<String, Object> map) throws Exception;

    void updateControlConfirmProcess(Map<String, Object> map) throws Exception;

    void mergeControl(Model model, Map<String, Object> map) throws Exception;

    void validationCheckBeforeSaveFromControl(Model model, Map<String, Object> map) throws Exception;
}
