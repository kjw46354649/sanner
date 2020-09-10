package com.framework.innodale.entity;

/**
 * 메시지 타입을 설정
 * AUTH : 사용자 권한(로그인 / 로그아웃)
 * DRAWING : D/B 작업 ACTION
 * POP : POP 작업
 * WORKER : 작업자
 */
public enum MessageType {
    AUTH,
    DRAWING,
    POP,
    WORKER
}
