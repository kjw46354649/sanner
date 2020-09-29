package com.jmes.controller;

import com.sun.org.apache.xerces.internal.impl.dv.util.Base64;
import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Arrays;

@Controller
public class ExportDataController {
    @RequestMapping(value = "/exportData", method = RequestMethod.POST)
    public @ResponseBody
    String exportData(String pq_data, String pq_ext, Boolean pq_decode, String pq_filename, HttpServletRequest request, HttpServletResponse response) throws IOException {

        String[] arr = new String[] {"csv", "xlsx", "htm", "zip", "json"};
        String filename = pq_filename + "." + pq_ext;

        if(Arrays.asList(arr).contains(pq_ext)){
            HttpSession ses = request.getSession(true);
            ses.setAttribute("pq_data", pq_data);
            ses.setAttribute("pq_decode", pq_decode);
            ses.setAttribute("pq_filename", filename);
        }

        filename = URLEncoder.encode(filename, "UTF-8");

        return filename;
    }

    @RequestMapping(value = "/exportData", method = RequestMethod.GET)
    public void exportData(String pq_filename, HttpServletRequest request, HttpServletResponse response) throws IOException, Base64DecodingException {
        HttpSession ses = request.getSession(true);
        System.out.println((String)ses.getAttribute("pq_filename"));
        if ( ((String)ses.getAttribute("pq_filename")).equals(pq_filename) ) {

            String contents = (String) ses.getAttribute("pq_data");
            Boolean pq_decode = (Boolean) ses.getAttribute("pq_decode");

            byte[] bytes = pq_decode?  Base64.decode(contents): contents.getBytes(Charset.forName("UTF-8"));

            response.setContentType("application/octet-stream");
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-Disposition",
                    "attachment;filename=" + pq_filename);
            response.setContentLength(bytes.length);
            ServletOutputStream out = response.getOutputStream();
            out.write(bytes);

            out.flush();
            out.close();
        }
    }
}