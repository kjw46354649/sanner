package com.tomes.exception;

public class AuthenticationFailException extends RuntimeException{

    public AuthenticationFailException(String msg, Throwable t) {
        super(msg, t);
    }

    public AuthenticationFailException(String msg) {
        super(msg);
    }

    public AuthenticationFailException() {
        super();
    }
}
