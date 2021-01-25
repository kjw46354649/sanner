package com.framework.innodale.entity;

import javax.annotation.PostConstruct;

public class NotificationMessage {

    public NotificationMessage() { }

    /** clinet id **/
    private String clientId;

    /** 메시지 타입 **/
    private MessageType type;

    /** 메시지 ACTION 타입 **/
    private ActionType actionType;

    /** 메시지 **/
    private String content01;
    private String content02;
    private String content03;
    private String content04;
    private String content05;

    private int imageSeq;   // 도면 파일 처리

    /** 사용자 관련 정보 **/
    private String userId;
    private String userNm;
    private int userImageSeq;

    /**  장비 Position 관련 정보 **/
    private int equipSeq;
    private String equipId;
    private String equipNm;
    private int equipPosition;
    private int equipRow;
    private int equipCol;
    private String factoryArea;

    /** pop 정보 **/
    private String popPosition;
    private String prePopPostion;

    /** 장비 가공 작업 시간 (분) **/
    private int sMinute;

    /** 기타 정보 **/
    private int totalCount;

    public String getPrePopPosition() { return prePopPostion; }

    public void setPrePopPosition(String prePopPostion) { this.prePopPostion = prePopPostion; }

    public int getsMinute() { return sMinute; }

    public void setsMinute(int sMinute) { this.sMinute = sMinute; }

    public String getPopPosition() { return popPosition; }

    public void setPopPosition(String popPosition) { this.popPosition = popPosition; }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getFactoryArea() {
        return factoryArea;
    }

    public void setFactoryArea(String factoryArea) {
        this.factoryArea = factoryArea;
    }

    public String getEquipId() {
        return equipId;
    }

    public void setEquipId(String equipId) {
        this.equipId = equipId;
    }

    public String getEquipNm() {
        return equipNm;
    }

    public void setEquipNm(String equipNm) {
        this.equipNm = equipNm;
    }

    public String getUserNm() {
        return userNm;
    }

    public void setUserNm(String userNm) {
        this.userNm = userNm;
    }

    public int getUserImageSeq() {
        return userImageSeq;
    }

    public void setUserImageSeq(int userImageSeq) {
        this.userImageSeq = userImageSeq;
    }

    public int getEquipSeq() {
        return equipSeq;
    }

    public void setEquipSeq(int equipSeq) {
        this.equipSeq = equipSeq;
    }

    public int getEquipPosition() {
        return equipPosition;
    }

    public void setEquipPosition(int equipPosition) {
        this.equipPosition = equipPosition;
    }

    public int getEquipRow() {
        return equipRow;
    }

    public void setEquipRow(int equipRow) {
        this.equipRow = equipRow;
    }

    public int getEquipCol() {
        return equipCol;
    }

    public void setEquipCol(int equipCol) {
        this.equipCol = equipCol;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public MessageType getType() { return type; }
    public void setType(MessageType type) { this.type = type; }

    public ActionType getActionType() { return actionType; }
    public void setActionType(ActionType actionType) { this.actionType = actionType; }

    public String getContent01() { return content01; }
    public void setContent01(String content01) { this.content01 = content01; }

    public String getContent02() { return content02; }
    public void setContent02(String content02) { this.content02 = content02; }

    public String getContent03() { return content03; }
    public void setContent03(String content03) { this.content03 = content03; }

    public String getContent04() { return content04; }
    public void setContent04(String content04) { this.content04 = content04; }

    public String getContent05() { return content05; }
    public void setContent05(String content05) { this.content05 = content05; }

    public String getClientId() {
        return clientId;
    }

    public void setClientId(String clientId) {
        this.clientId = clientId;
    }

    public int getImageSeq() {
            return imageSeq;
        }

    public void setImageSeq(int imageSeq) {
            this.imageSeq = imageSeq;
        }

}
