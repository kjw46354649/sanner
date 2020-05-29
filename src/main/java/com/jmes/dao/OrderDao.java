package com.jmes.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrderDao {
    void insertControlMaster(Map<String, Object> hashMap) throws SQLException;

    void insertControlPart(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartOrder(Map<String, Object> hashMap) throws SQLException;

    void createControlProgress(HashMap<String, Object> hashMap) throws SQLException;

    void createControlProgressList(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartProgressList(Map<String, Object> hashMap) throws SQLException;

    List<Map<String, Object>> selectControlCloseRightList(Map<String, Object> map) throws SQLException;

    void createMonthFinishClose(HashMap<String, Object> hashMap) throws SQLException;

    void createMonthFinishCloseHistory(HashMap<String, Object> hashMap) throws SQLException;

    void updateControlStatus(HashMap<String, Object> hashMap) throws SQLException;

    void updateControlPartStatus(HashMap<String, Object> hashMap) throws SQLException;

    void insertControlBarcode(Map<String, Object> hashMap) throws SQLException;

    void createInvoice(HashMap<String, Object> hashMap) throws SQLException;

    void createInvoiceDetail(HashMap<String, Object> hashMap) throws SQLException;

    void removeInvoice(Map<String, Object> hashMap) throws SQLException;

    void removeInvoiceDetail(Map<String, Object> hashMap) throws SQLException;

    void createControlExcel(Map<String, Object> hashMap) throws SQLException;

    void createControlExcelBatch(Map<String, Object> hashMap) throws SQLException;
}
