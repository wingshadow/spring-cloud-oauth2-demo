package com.hawk.manage.controller;

import com.hawk.manage.feign.OrderFeignService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

/**
 * @Title: TestController
 * @ProjectName spring-cloud-oauth2-demo
 * @Author Hawk
 * @Date 2021/1/8 20:02
 */
@RestController
public class TestController {

    @Resource
    private OrderFeignService orderFeinService;

    @PreAuthorize("hasAuthority('sys:user:view')")
//    @PreAuthorize("hasAuthority('admin')")
    @GetMapping("/test/oauth")
    public String test() {
        return "success";
    }

    @GetMapping("/test/no_need_token")
    public String test2(){
        return "sss";
    }

    @GetMapping(value = "/getOrder")
    public String getOrder(){
        return orderFeinService.listOrder();
    }

}
