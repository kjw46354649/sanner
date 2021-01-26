package com.tomes.exception;

public class CompanyDisabledException extends RuntimeException {

    public CompanyDisabledException(String msg, Throwable t) {
        super(msg, t);
    }

    public CompanyDisabledException(String msg) {
        super(msg);
    }

    public CompanyDisabledException() {
        super();
    }
}
