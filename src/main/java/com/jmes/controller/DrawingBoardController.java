package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.DrawingBoardService;
import org.omg.PortableInterceptor.SYSTEM_EXCEPTION;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Locale;

@Controller
public class DrawingBoardController {

    private static final Logger logger = LoggerFactory.getLogger(DrawingBoardController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    public DrawingBoardService drawingBoardService;

    @RequestMapping(value="/drawing")
    public String drawingLogin(Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info("pop page submit");

        return "board/login";
    }

    @RequestMapping(value="/drawing-worker")
    public String drawingWorker(Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info("pop page submit");
        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        hashMap.put("queryId", "drawingMapper.selectDrawingUser");
        model.addAttribute("user",innodaleService.getList(hashMap));

        model.addAttribute("FACTORY_AREA",  hashMap.get("FACTORY_AREA"));
        model.addAttribute("EQUIP_SEQ" ,  hashMap.get("EQUIP_SEQ"));

        return "board/drawing-worker";
    }

    @RequestMapping(value="/drawing-board")
    public String drawingBoard(Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info("pop page submit");

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);

        hashMap.put("queryId", "drawingMapper.selectDrawingBoardLastWork");
        model.addAttribute("list",innodaleService.getList(hashMap));

        return "board/drawing-board";
    }

    @RequestMapping(value="/drawing-board-save")
    public String drawingBoardSave(Model model, HttpServletRequest request, Locale locale) throws Exception {
        logger.info("pop page submit");

        HashMap<String, Object> hashMap = CommonUtility.getParameterMap(request);
        drawingBoardService.drawingBoardSave(hashMap);

        return "jsonView";
    }
}
