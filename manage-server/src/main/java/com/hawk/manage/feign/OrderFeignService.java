package com.hawk.manage.feign;

import com.hawk.manage.intercepter.SecuringRequestInterceptor;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;

@FeignClient(contextId = "order-api",value = "order-server",configuration = SecuringRequestInterceptor.class)
public interface OrderFeignService {

    @GetMapping(value = "/listOrder",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    public String listOrder();
}
