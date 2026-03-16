package com.bysj.fintech.service;

import com.bysj.fintech.dto.AuthResponse;
import com.bysj.fintech.dto.LoginRequest;
import com.bysj.fintech.dto.RegisterRequest;

public interface AuthService {

    AuthResponse register(RegisterRequest request);

    AuthResponse login(LoginRequest request);
}
