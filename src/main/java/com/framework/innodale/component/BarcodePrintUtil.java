package com.framework.innodale.component;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.core.env.PropertyResolver;
import org.springframework.stereotype.Component;
import org.springframework.core.env.Environment;

import java.io.BufferedWriter;
import java.io.File;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Component(value = "barcodePrintUtil")
public class BarcodePrintUtil {

    public static String  barcodePrint(Map<String, Object> barcodeInfo, String barcodeIp, int barcodePort, String barcodeType) throws Exception {

        String message = "OK";
        Socket socket = null;
        BufferedWriter bufWriter = null;
        try {
            socket = new Socket(barcodeIp, barcodePort);
             bufWriter = new BufferedWriter( new OutputStreamWriter( socket.getOutputStream(),"euc-kr"));
            // bufWriter = new BufferedWriter(new OutputStreamWriter(System.out,"utf-8"));
            if("L".equals(barcodeType)){//라벨
                getBOut(bufWriter, barcodeInfo);
            }else if("C".equals(barcodeType)) {//도면
                getBControl(bufWriter, barcodeInfo);
            }
            // System.out.println("barcodePrint bufWriter=" + bufWriter.toString());
            bufWriter.newLine();
            bufWriter.flush();
            socket.close();
            bufWriter.close();

        }catch(Exception e){
            message = e.getMessage();
            e.printStackTrace();
        }finally {
            if(socket != null){
                socket.close();
            }
            if(bufWriter != null){
                bufWriter.close();
            }

        }

        return message;
    }

    public static void getBControl(BufferedWriter bufWriter, Map<String, Object> barcodeInfo) throws IOException{
        //도면
            bufWriter.write("^XA");//시작
            bufWriter.write("^SEE:UHANGUL.DAT^FS");//한글폰트 셋팅
            bufWriter.write("^CW1,E:KFONT3.FNT^CI26^FS");//한글폰트 셋팅
            bufWriter.write("^CFJ,30");//글자 크기
            bufWriter.write("^FX Box Line");//주석
            bufWriter.write("^FO4,4^GB711,390,2^FS");
            bufWriter.write("^FO630,4^GB85,108,1^FS");
            bufWriter.write("^FO4,60^GB709,1,1^FS");
            bufWriter.write("^FO110,20^FD" + doNull((String)barcodeInfo.get("CONTROL_NUM_INFO"))+ "^FS");//타이틀
            bufWriter.write("^FO660,20^FD" + barcodeInfo.get("CONTROL_VER")+ "^FS");
            bufWriter.write("^FO660,75^FD" + barcodeInfo.get("DRAWING_VER")+ "^FS");
            bufWriter.write("^CFJ,20");
            bufWriter.write("^FO10,78^A1N^FD도면 번호^FS");
            bufWriter.write("^CFJ,25");
            bufWriter.write("^FO105,78^A1N^FD" + doNull((String)barcodeInfo.get("DRAWING_NUM"))+ "^FS");
            bufWriter.write("^CFJ,20");
            bufWriter.write("^FO4,111^A1N^GB709,1,1^FS");
            bufWriter.write("^FO10,148^A1N^FD수        량^FS");
            bufWriter.write("^CFJ,35");
            bufWriter.write("^FO105,148^A1N^FD" + barcodeInfo.get("ORDER_QTY")+ "^FS");
//            bufWriter.write("^FO280,148^A1N^FDEA^FS");
            bufWriter.write("^CFJ,20");
            bufWriter.write("^FO350,118^A1N^FD원칭^FS");
            bufWriter.write("^FO430,118^A1N^FD대칭^FS");
            bufWriter.write("^CFJ,35");
            bufWriter.write("^FO361,165^A1N^FD" + barcodeInfo.get("ORIGINAL_SIDE_QTY")+ "^FS");
            bufWriter.write("^FO440,165^A1N^FD" + barcodeInfo.get("OTHER_SIDE_QTY")+ "^FS");
            bufWriter.write("^CFJ,20");
            bufWriter.write("^FO500,130^A1N^FD가공^FS");
            bufWriter.write("^FO500,160^A1N^FD납기^FS");
            bufWriter.write("^FO550,148^A1N^FD" + doNull((String)barcodeInfo.get("INNER_DUE_DT"))+ "^FS");
            bufWriter.write("^FO4,200^GB709,1,1^FS");
            bufWriter.write("^FO10,218^A1N^FD규        격^FS");
            bufWriter.write("^CFJ,35");
            bufWriter.write("^FO105,218^A1N^FD" + doNull((String)barcodeInfo.get("SIZE_TXT"))+ "^FS");
            bufWriter.write("^CFJ,20");
            bufWriter.write("^FO440,218^A1N^FD" + doNull((String)barcodeInfo.get("MATERIAL_TYPE_NM"))+ "^FS");
            bufWriter.write("^FO500,210^FB55,2,1,L,0^A1N^FD" + doNull((String)barcodeInfo.get("WORK_TYPE_NM"))+ "^FS");
            bufWriter.write("^FO550,218^A1N^FD" + doNull((String)barcodeInfo.get("SURFACE_TREAT_NM"))+ "^FS");
            bufWriter.write("^FO4,255^GB709,1,1^FS");
            bufWriter.write("^FO11,278^A1N^FD발  주  사^FS");
            if(doNull((String)barcodeInfo.get("ORDER_COMP_NM")).length() < 5){
                bufWriter.write("^CFJ,35");
            }
            bufWriter.write("^FO105,278^A1N^FD" + doNull((String)barcodeInfo.get("ORDER_COMP_NM"))+ "^FS");
            bufWriter.write("^CFJ,20");
            bufWriter.write("^FO435,278^A1N^FD" + doNull((String)barcodeInfo.get("EMERGENCY_NM"))+ "^FS");
            bufWriter.write("^FO500,270^FB50,2,1,L,0^A1N^FD" + doNull((String)barcodeInfo.get("MATERIAL_FINISH_HEAT_NM"))+ "^FS");

            bufWriter.write("^FO550,278^A1N^FD" + doNull((String)barcodeInfo.get("MAIN_INSPECTION_NM"))+ "^FS");
            bufWriter.write("^FO4,60^GB96,261,1^FS");
            bufWriter.write("^FO331,111^GB161,35,1^FS");
            bufWriter.write("^FO331,145^GB161,56,1^FS");
            bufWriter.write("^FO411,111^GB81,210,1^FS");
            bufWriter.write("^FO545,111^GB1,210,1^FS");
            bufWriter.write("^FO4,320^GB709,1,1^FS");
            bufWriter.write("^FO491,321^GB1,71,1^FS");
            bufWriter.write("^FX Third section with barcode.");
            bufWriter.write("^BY3,2.5,100");
            bufWriter.write("^FO10,335^BCN,45,N,N,N^FD" + doNull((String)barcodeInfo.get("BARCODE_NUM"))+ "^FS");
            if(doNull((String)barcodeInfo.get("COMP_NM")).length() < 5){
                bufWriter.write("^CFJ,35");
            }
            bufWriter.write("^FO530,340^A1N^FD" + doNull((String)barcodeInfo.get("COMP_NM"))+ "^FS");
            bufWriter.write("^XZ");

    }

    public static void getBOut(BufferedWriter bufWriter, Map<String, Object> barcodeInfo) throws IOException{
        //라벨
        bufWriter.write("^XA");
        bufWriter.write("^CI28");
        bufWriter.write("^SEE:UHANGUL.DAT^FS");
        bufWriter.write("^CW1,E:KFONT3.FNT^CI26^FS");
        bufWriter.write("^FO410,20^GFA,231,231,7,,::3PFE,3PFE4,1PFE4,1PFC8,0PFC8,0PF9,J01F87E0F9,J03F8FE1F2,J03F1FC002,J07F1FC004,J07E3IFC4,J0FE3IFC8,I01FC7IF88,I01FC7IF9,0043F8JF1,0063F0JF2,003FFI0FE2,003FEI0FE4,001FE781FC4,001FC7C1F88,I0FCJF88,I0F8JF1,I071JF1,I071IFE2,I023IFE2,J03IFC4,O04,O08,OF,,^FS");
        bufWriter.write("^FO4,4^GB711,390,2^FS");
        bufWriter.write("^FO10,10^BY2^BCN,45,N,N,N^FD" + doNull((String)barcodeInfo.get("BARCODE_NUM"))+ "^FS");
        bufWriter.write("^FO350,4^GB45,57,1^FS");
        bufWriter.write("^CFJ,23");
        bufWriter.write("^FO365,12^A1N^FD" + barcodeInfo.get("PACKING_NUM")+ "^FS");
        bufWriter.write("^FO365,37^A1N^FD" + barcodeInfo.get("PACKING_CNT")+ "^FS");
        bufWriter.write("^FO470,25^A1N^FD" + doNull((String)barcodeInfo.get("COMP_NM"))+ "^FS");
        bufWriter.write("^CFJ,20");
        bufWriter.write("^FO4,60^GB710,55,1^FS");
        bufWriter.write("^FO4,166^GB710,55,1^FS");
        bufWriter.write("^FO4,266^GB710,55,1^FS");
        bufWriter.write("^FO87,60^GB1,332,1^FS");
        bufWriter.write("^FO394,60^GB85,261,1^FS");
        bufWriter.write("^FO10,80^A1N^FD품명^FS");
        bufWriter.write("^FO90,70^FB300,2,1,L,0^A1N^FD" + doNull((String)barcodeInfo.get("ITEM_NM"))+ "^FS");
        bufWriter.write("^FO399,80^A1N^FD발주업체^FS");
        bufWriter.write("^FO485,80^A1N^FD" + doNull((String)barcodeInfo.get("ORDER_COMP_NM"))+ "^FS");
        bufWriter.write("^FO10,130^A1N^FD도면번호^FS");
        bufWriter.write("^FO90,130^A1N^FD" + doNull((String)barcodeInfo.get("DRAWING_NUM"))+ "^FS");
        bufWriter.write("^FO399,130^A1N^FD발주번호^FS");
        bufWriter.write("^FO485,130^A1N^FD" + doNull((String)barcodeInfo.get("ORDER_NUM"))+ "^FS");
        bufWriter.write("^FO10,185^A1N^FD모듈^FS");
        bufWriter.write("^FO90,175^FB300,2,1,L,0^A1N^FD" + doNull((String)barcodeInfo.get("MODULE_NM"))+ "^FS");
        bufWriter.write("^FO399,185^A1N^FD납품일자^FS");
        bufWriter.write("^FO485,185^A1N^FD" + doNull((String)barcodeInfo.get("ORDER_DUE_DT"))+ "^FS");
        bufWriter.write("^FO10,235^A1N^FD관리번호^FS");
        bufWriter.write("^FO90,235^A1N^FD" + doNull((String)barcodeInfo.get("CONTROL_NUM"))+ "^FS");
        bufWriter.write("^FO399,235^A1N^FD납 품 처^FS");
        bufWriter.write("^FO485,235^A1N^FD" + doNull((String)barcodeInfo.get("DELIVERY_COMP_NM"))+ "^FS");

        bufWriter.write("^FO10,285^A1N^FD프로젝트^FS");

        String projectNm = (String)barcodeInfo.get("PROJECT_NM");
        String projectNm_line1 = doNull(getNoteArr(projectNm,1, 37));
        if(!"".equals(projectNm_line1)){
            bufWriter.write("^FO90,270^A1N^FD"+projectNm_line1+"^FS");
        }
        String projectNm_line2 = doNull(getNoteArr(projectNm,2, 37));
        if(!"".equals(projectNm_line2)){
            bufWriter.write("^FO90,295^A1N^FD"+projectNm_line2+"^FS");
        }
        bufWriter.write("^CFJ,18");
        bufWriter.write("^FO397,285^A1N^FD규격/수량^FS");
        bufWriter.write("^CFJ,20");
        bufWriter.write("^FO485,285^A1N^FD" + doNull((String)barcodeInfo.get("SIZE_QTY_INFO"))+ "^FS");
        bufWriter.write("^FO10,345^A1N^FDRemark^FS");

        String remark = (String)barcodeInfo.get("LABEL_NOTE");
        String line1 = doNull(getNoteArr(remark,1, 68));
        if(!"".equals(line1)){
            bufWriter.write("^FO90,325^A1N^FD"+line1+"^FS");
        }
        String line2 = doNull(getNoteArr(remark,2, 68));
        if(!"".equals(line2)){
            bufWriter.write("^FO90,350^A1N^FD"+line2+"^FS");
        }
        String line3 = doNull(getNoteArr(remark,3, 68));
        if(!"".equals(line3)){
            bufWriter.write("^FO90,375^A1N^FD"+line3+"^FS");
        }



        bufWriter.write("^XZ");


    }

    public static String doNull(String val) {
        String rtnVal = "";
        if (val != null && !"null".equals(val)) {
            rtnVal = val;
        }
        return rtnVal;
    }

    public static String getNoteArr(String note, int line, int maxLen ) {

        StringBuffer newMunja = new StringBuffer();
        String rtn = "";
        try {

            //한글 30자 3.3  |  영어 대 46자 2.2  | 영어 소 56자ㅕㅕㅔ 1.8
            String type1 = " Ifijl`!*^|{[}]:;\"',.";// 3.3
            String type1_2 = "abcdefghkmnopqrstuvwxyz234567890()-_+=\\<>?/";
            String type1_5 = "ABCDEFGHJKLMNOPQRSTUVWXYZ";

            double totalLen = 0;
            List returnStr = new ArrayList();
            // System.out.println("note="+note);
            if (note != null && !"".equals(note) && !"NULL".equals(note)) {
                int munjaLen = note.length();
                //int totcnt = (munjaLen/maxLen)+1;

                for (int i = 0; i < munjaLen; i++) {
                    char munjaEach = note.charAt(i);
                    //System.out.println("munjaEach="+munjaEach);
                    if (type1.indexOf(munjaEach) > 0) {
                        totalLen = totalLen + 1;
                    } else if (type1_2.indexOf(munjaEach) > 0) {
                        totalLen = totalLen + 1.2;
                    } else if (type1_5.indexOf(munjaEach) > 0) {
                        totalLen = totalLen + 1.6;
                    } else {
                        totalLen = totalLen + 2;
                    }

                    newMunja.append(munjaEach);
                    if (totalLen > maxLen) {
                        returnStr.add(newMunja.toString());
                        //System.out.println(newMunja.toString());
                        newMunja = new StringBuffer();
                        totalLen=0;
                        //System.out.println(String.format("%1$,.0f", totalLen));
                    }else if (munjaLen == i+1) {
                        returnStr.add(newMunja.toString());
                        //System.out.println(newMunja.toString());
                        newMunja = new StringBuffer();
                        totalLen=0;
                    }
                }
                if(returnStr.size() >= line){
                    rtn = (String)returnStr.get(line-1);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rtn;
    }

}
