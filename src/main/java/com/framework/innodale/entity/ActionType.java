package com.framework.innodale.entity;

public enum ActionType {

    /** AUTHORIZE ACTION **/
    A_LOG_IN,
    A_LOG_OUT,

    /** DRAWING BOARD ACTION **/
    DB_START,
    DB_PAUSE,
    DB_RESTART,
    DB_COMPLETE,
    DB_CANCEL,

    /** D/B WORKER ACTION **/
    WK_LOGIN,
    WK_LOGOUT,

    NC_IF
}
