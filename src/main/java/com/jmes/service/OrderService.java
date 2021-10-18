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

    void saveFromControlManage(Model model, Map<String, Object> map) throws Exception;

    void processingRequirementsControlSave(Model model, Map<String, Object> map)  throws Exception;

    void matchStockSave(Model model, Map<String, Object> map) throws Exception;

    void validationCheckBeforeSaveFromOrder(Model model, Map<String, Object> map) throws Exception;

    void saveFromOrderManage(Model model, Map<String, Object> map) throws Exception;

    void removeOrder(Map<String, Object> map) throws Exception;

    void managerOrderStatus(Map<String, Object> map) throws Exception;

    void validationCheckBeforeCreateControl(Model model, Map<String, Object> map) throws Exception;

    void createNewControl(Model model, Map<String, Object> map) throws Exception;

    void createNewStockControl(Model model, Map<String, Object> map) throws Exception;
}
