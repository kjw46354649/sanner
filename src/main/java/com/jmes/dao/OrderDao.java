package com.jmes.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface OrderDao {
    void insertControlMaster(Map<String, Object> hashMap) throws SQLException;

    void insertControlPart(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartOrder(Map<String, Object> hashMap) throws SQLException;

    void insertControlProgress(HashMap<String, Object> hashMap) throws SQLException;

    void insertControlProgressList(Map<String, Object> hashMap) throws SQLException;

    void insertControlPartProgressList(Map<String, Object> hashMap) throws SQLException;

    List<Map<String, Object>> selectControlCloseRightList(Map<String, Object> map) throws SQLException;

    void insertMonthFinishClose(HashMap<String, Object> hashMap) throws SQLException;

    void insertMonthFinishCloseHistory(HashMap<String, Object> hashMap) throws SQLException;

    void updateControlStatus(HashMap<String, Object> hashMap) throws SQLException;

    void updateControlPartStatus(HashMap<String, Object> hashMap) throws SQLException;

    void insertControlBarcode(Map<String, Object> hashMap) throws SQLException;

    void insertInvoice(HashMap<String, Object> hashMap) throws SQLException;

    void insertInvoiceDetail(HashMap<String, Object> hashMap) throws SQLException;
}
