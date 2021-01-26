package com.hawk.manage.intercepter;

import feign.RequestInterceptor;
import feign.RequestTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.provider.authentication.OAuth2AuthenticationDetails;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;

/**
 * @Title: SecuringRequestInterceptor
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/26 11:10
 */
public class SecuringRequestInterceptor implements RequestInterceptor {

    private static final String AUTHORIZATION = "Authorization";
    private static final String BEARER = "bearer";
    @Override
    public void apply(RequestTemplate requestTemplate) {
        SecurityContext securityContext = SecurityContextHolder.getContext();
        Authentication authentication = securityContext.getAuthentication();
        if (authentication != null && authentication.getDetails() instanceof OAuth2AuthenticationDetails) {
            OAuth2AuthenticationDetails details =
                    (OAuth2AuthenticationDetails)authentication.getDetails();
            requestTemplate.header(AUTHORIZATION,String.format("%s %s",BEARER, details.getTokenValue()));
        }
    }
}
