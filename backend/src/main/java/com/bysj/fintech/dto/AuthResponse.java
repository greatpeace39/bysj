package com.bysj.fintech.dto;

public class AuthResponse {

    private Long userId;
    private String username;
    private String nickname;
    private String token;

    public AuthResponse(Long userId, String username, String nickname, String token) {
        this.userId = userId;
        this.username = username;
        this.nickname = nickname;
        this.token = token;
    }

    public Long getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }

    public String getNickname() {
        return nickname;
    }

    public String getToken() {
        return token;
    }
}
