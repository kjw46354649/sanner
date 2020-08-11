package com.jmes.dao;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public interface OrderDao {
    String createInvoiceNum(HashMap<String, Object> hashMap) throws SQLException;

    boolean getFlag(Map<String, Object> map) throws SQLException;
}
