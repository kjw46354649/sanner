package com.jmes.service;

import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

public interface MaterialService {

    void itemOrderRegisterPopSave(Model model, Map<String, Object> map) throws Exception;

    void itemOrderSubmit(Model model, Map<String, Object> map) throws Exception;

    void managerInsideStock(Model model, Map<String, Object> map) throws Exception;

    void managerInsideStockPop(Model model, Map<String, Object> map) throws Exception;

    void outGoingProcessForBarcodeIn(Model model, Map<String, Object> map) throws Exception;

    void inWarehouseManageSave(Model model, HashMap<String, Object> hashMap) throws Exception;

    void providePossessionMaterialSave(Model model, HashMap<String, Object> hashMap) throws Exception;

    void cancelInsideStock(Model model, Map<String, Object> map) throws Exception;
}
