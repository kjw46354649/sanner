package com.jmes.controller;

import com.framework.innodale.component.CommonUtility;
import com.framework.innodale.entity.ActionType;
import com.framework.innodale.entity.MessageType;
import com.framework.innodale.entity.NotificationMessage;
import com.framework.innodale.service.FileUploadService;
import com.framework.innodale.service.InnodaleService;
import com.jmes.service.BoardService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Array;
import java.util.*;

@Controller
public class BoardController {

    private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

    @Autowired
    private InnodaleService innodaleService;

    @Autowired
    private MessageSource messageSource;

    @Autowired
    public BoardService boardService;

    @Autowired
    public FileUploadService fileUploadService;

    @Autowired
    private SimpMessagingTemplate simpMessagingTemplate;


    @RequestMapping(value = "/dashBoard")
    public String dashBoard(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        map.put("queryId", "main.getTotalBoardCount");
        Map<String, Object> list = innodaleService.getInfo(map);
        model.addAttribute("TotalCount", list);

        return "/common/dash_board";
    }

    @RequestMapping(value = "/dashBoard/{boardSeq}")
    public String dashBoard(@PathVariable("boardSeq") String boardSeq, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        map.put("queryId", "main.selectBoardDetail");
        map.put("BOARD_SEQ", boardSeq);
        Map<String, Object> list = innodaleService.getInfo(map);
        model.addAttribute("boardInfo", list);

        return "/common/dash_board_detail";
    }

    @RequestMapping(value = "/newDashBoard")
    public String newDashBoard(@RequestParam(value = "boardSeq", required = false) String boardSeq, @RequestParam(value = "groupSeq", required = false) String groupSeq,
                               @RequestParam(value = "depth", required = false) String depth, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        if(groupSeq != null && boardSeq != null && depth != null) {
            Map<String, Object> map = new HashMap<>();
            map.put("BOARD_SEQ",boardSeq);
            map.put("GROUP_SEQ",groupSeq);
            map.put("DEPTH",depth);
            model.addAttribute("parentBoard",map);
        }

        return "/common/dash_board_new";
    }

    @RequestMapping(value = "/modifyBoard/{boardSeq}")
    public String modifyBoard(@PathVariable("boardSeq") String boardSeq, Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {

        Map<String, Object> map = CommonUtility.getParameterMap(request);
        map.put("queryId", "main.selectBoardDetail");
        map.put("BOARD_SEQ", boardSeq);
        Map<String, Object> list = innodaleService.getInfo(map);
        model.addAttribute("boardInfo", list);

        return "/common/dash_board_new";
    }

    @RequestMapping(value = "/registBoard", method = RequestMethod.POST)
    public String registBoard_(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        Map<String, Object> map = CommonUtility.getParameterMap(request);
        this.boardService.registNewBoard(map);

        return "jsonView";
    }

}
