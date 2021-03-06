package com.hawk.gateway.bean;

import lombok.Data;

/**
 * @Title: AuthToken
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/8 15:06
 */
@Data
public class AuthToken {
    private String jti;
    private String refreshToken;
    private String accessToken;
}
