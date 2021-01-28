package com.hawk.oauth.bean;

import lombok.Data;

import java.io.Serializable;

/**
 * @Title: UserInfo
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/28 11:12
 */
@Data
public class UserInfo implements Serializable {
    private String id;
    private String username;
    private String name;
    private String mobile;
    private String avatar;
    private String jti;
}
