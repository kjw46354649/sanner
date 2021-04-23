package com.jmes.service;

import org.springframework.ui.Model;

import java.util.HashMap;
import java.util.Map;

public interface BoardService {

    public void registNewBoard(Map<String, Object> map) throws Exception;

}
