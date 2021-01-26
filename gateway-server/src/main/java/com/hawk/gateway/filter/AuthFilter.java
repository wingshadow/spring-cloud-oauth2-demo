package com.hawk.gateway.filter;

import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.hawk.gateway.bean.AuthToken;
import com.hawk.gateway.redis.RedisKeys;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.cloud.gateway.filter.GatewayFilterChain;
import org.springframework.cloud.gateway.filter.GlobalFilter;
import org.springframework.core.io.buffer.DataBuffer;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.server.reactive.ServerHttpRequest;
import org.springframework.http.server.reactive.ServerHttpResponse;
import org.springframework.stereotype.Component;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import javax.annotation.Resource;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;
import java.util.function.Consumer;

/**
 * @Title: AuthFilter
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/11 16:01
 */
@Component
public class AuthFilter implements GlobalFilter {

    public static final String TOKEN_PREFIX = "bearer";

    @Value("${permit.url}")
    private String permUrl;

    @Resource
    private StringRedisTemplate stringRedisTemplate;

    @Override
    public Mono<Void> filter(ServerWebExchange exchange, GatewayFilterChain chain) {
        ServerHttpRequest request = (ServerHttpRequest) exchange.getRequest();
        // 判断当前URL是允许非登陆状态访问
        if (!handler(request)) {
            HttpHeaders headers = exchange.getRequest().getHeaders();
            String jti = headers.getFirst("jti");
            if (StrUtil.isBlank(jti)) {
                warning(exchange);
            }

            String  accessToken = getUserToken(jti);
            if(accessToken == null){
                warning(exchange);
            }

            //在header添加Authorization数据
            Consumer<HttpHeaders> httpHeaders = httpHeader -> {
                httpHeader.set("Authorization", TOKEN_PREFIX + " " + accessToken);
            };
            ServerHttpRequest serverHttpRequest = exchange.getRequest().mutate().headers(httpHeaders).build();
            exchange.mutate().request(serverHttpRequest).build();
        }
        return chain.filter(exchange);
    }

    private String getUserToken(String jti) {
        String key = RedisKeys.LOGIN_TOKEN_PREFIX + jti;
        //从redis中取到令牌信息
        String value = stringRedisTemplate.opsForValue().get(key);
        //转成对象
        return value;
    }

    private boolean handler(ServerHttpRequest request) {
        String url = request.getURI().getPath();
        return isPermitUrl(url);
    }

    private boolean isPermitUrl(String path) {
        String[] urlArray = StringUtils.split(permUrl, ",");
        if (urlArray != null && urlArray.length > 0) {
            List<String> urlList = Arrays.asList(urlArray);
            for (String url : urlList) {
                if (StringUtils.equals(url, path)) {
                    return true;
                }
            }
        }
        return false;
    }

    private Mono<Void> warning(ServerWebExchange exchange){
        ServerHttpResponse response = exchange.getResponse();
        JSONObject message = new JSONObject();
        message.put("code", 70005);
        message.put("msg", "用户令牌不存在");
        byte[] bits = message.toJSONString().getBytes(StandardCharsets.UTF_8);
        DataBuffer buffer = response.bufferFactory().wrap(bits);
        response.setStatusCode(HttpStatus.UNAUTHORIZED);
        //指定编码，否则在浏览器中会中文乱码
        response.getHeaders().add("Content-Type", "application/json;charset=UTF-8");
        return response.writeWith(Mono.just(buffer));
    }
}
