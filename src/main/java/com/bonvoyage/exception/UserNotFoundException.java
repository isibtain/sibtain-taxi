package com.bonvoyage.exception;

public class UserNotFoundException extends RuntimeException {

    private static final long serialVersionUID = 9060751397339719682L;
    private String userId;
    private String message = "User Not Found for this ID ";

    public UserNotFoundException() {
    }

    public UserNotFoundException(String userId, String message) {
        this.userId = userId;

        if (message != null) this.message = message;

    }

    public String getFullMessage() {
        return (message + userId);
    }

    public String getProductId() {
        return userId;
    }

}
