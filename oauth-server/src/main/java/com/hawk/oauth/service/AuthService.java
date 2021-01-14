package com.hawk.oauth.service;

import cn.hutool.core.collection.CollUtil;
import com.alibaba.fastjson.JSON;
import com.hawk.oauth.bean.AuthToken;
import com.hawk.oauth.exception.GlobalException;
import com.hawk.oauth.redis.RedisKeys;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.loadbalancer.LoadBalancerClient;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.stereotype.Service;
import org.springframework.util.Base64Utils;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.DefaultResponseErrorHandler;
import org.springframework.web.client.RestTemplate;

import java.io.IOException;
import java.net.URI;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 * @Title: AuthService
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/8 19:25
 */
@Slf4j
@Service
public class AuthService {

    @Value("${auth.tokenValiditySeconds}")
    private int tokenValiditySeconds;
    @Autowired
    private LoadBalancerClient loadBalancerClient;

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    @Autowired
    private RestTemplate restTemplate;

    /**
     * 登陆验证并返回token
     *
     * @param username
     * @param password
     * @param clientId
     * @param clientSecret
     * @return
     */
    public AuthToken login(String username, String password, String type, String clientId, String clientSecret) {
        //定义body
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", type);
        body.add("username", username);
        body.add("password", password);

        //请求spring security申请令牌
        AuthToken authToken = this.applyToken(body, clientId, clientSecret);
        // 缓存token
        if (!cacheToken(authToken)) {
            return null;
        }
        return authToken;

    }

    public AuthToken loginByMobile(String mobile, String code, String type, String clientId, String clientSecret) {
        //定义body
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", type);
        body.add("mobile", mobile);
        body.add("code", code);

        //请求spring security申请令牌
        AuthToken authToken = this.applyToken(body, clientId, clientSecret);
        // 缓存token
        if (!cacheToken(authToken)) {
            return null;
        }
        return authToken;

    }

    /**
     * 刷新token并返回token
     *
     * @param refreshToken
     * @param clientId
     * @param clientSecret
     * @return
     */
    public AuthToken refreshToken(String refreshToken, String clientId, String clientSecret) {
        //定义body
        MultiValueMap<String, String> body = new LinkedMultiValueMap<>();
        body.add("grant_type", "refresh_token");
        body.add("refresh_token", refreshToken);
        // 缓存token
        AuthToken authToken = this.applyToken(body, clientId, clientSecret);
        if (!cacheToken(authToken)) {
            return null;
        }
        return authToken;
    }

    /**
     * 缓存token
     *
     * @param token
     * @return
     */
    private boolean cacheToken(AuthToken token) {
        //用户身份令牌
        String jti = token.getJti();
        //存储到redis中的内容
        String jsonString = JSON.toJSONString(token);
        //将令牌存储到redis
        return this.saveToken(jti, jsonString, tokenValiditySeconds);
    }

    public boolean delToken(String jti) {
        String key = RedisKeys.LOGIN_TOKEN_PREFIX + jti;
        stringRedisTemplate.delete(key);
        return true;
    }

    public AuthToken getUserToken(String jti) {
        String key = RedisKeys.LOGIN_TOKEN_PREFIX + jti;
        //从redis中取到令牌信息
        String value = stringRedisTemplate.opsForValue().get(key);
        //转成对象
        try {
            AuthToken authToken = JSON.parseObject(value, AuthToken.class);
            return authToken;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * @param body
     * @param clientId
     * @param clientSecret
     * @return
     */
    private AuthToken applyToken(MultiValueMap<String, String> body, String clientId, String clientSecret) {
        ServiceInstance serviceInstance = loadBalancerClient.choose("OAUTH-SERVER");
        URI uri = serviceInstance.getUri();
        String authUrl = uri + "/oauth/token";

        LinkedMultiValueMap<String, String> header = new LinkedMultiValueMap<>();
        String httpBasic = getHttpBasic(clientId, clientSecret);
        header.add("Authorization", httpBasic);

        HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<>(body, header);
        restTemplate.setErrorHandler(new DefaultResponseErrorHandler() {
            @Override
            public void handleError(ClientHttpResponse response) throws IOException {
                if (response.getRawStatusCode() != 400 && response.getRawStatusCode() != 401) {
                    super.handleError(response);
                }
            }
        });

        ResponseEntity<Map> exchange = restTemplate.exchange(authUrl, HttpMethod.POST, httpEntity, Map.class);
        if (exchange.getStatusCode().value() != 200) {
            throw new GlobalException(40001,"系统内部错误");
        }
        Map bodyMap = exchange.getBody();
        if (CollUtil.isEmpty(bodyMap)) {
            throw new GlobalException(40001,"系统内部错误");
        }

        AuthToken authToken = new AuthToken();
        authToken.setJti((String) bodyMap.get("jti"));
        authToken.setAccessToken((String) bodyMap.get("access_token"));
        authToken.setRefreshToken((String) bodyMap.get("refresh_token"));
        return authToken;
    }

    private boolean saveToken(String jti, String content, long ttl) {
        String key = RedisKeys.LOGIN_TOKEN_PREFIX + jti;
        stringRedisTemplate.boundValueOps(key).set(content, ttl, TimeUnit.SECONDS);
        Long expire = stringRedisTemplate.getExpire(key, TimeUnit.SECONDS);
        return expire > 0;
    }


    private String getHttpBasic(String clientId, String clientSecret) {
        String string = clientId + ":" + clientSecret;
        //将串进行base64编码
        byte[] encode = Base64Utils.encode(string.getBytes());
        return "Basic " + new String(encode);
    }
}
