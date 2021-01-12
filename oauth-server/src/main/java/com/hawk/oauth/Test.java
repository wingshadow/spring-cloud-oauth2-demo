package com.hawk.oauth;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @Title: Test
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/8 14:36
 */
public class Test {
    public static void main(String[] args) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

        System.out.println(encoder.encode("123456"));
    }
}
