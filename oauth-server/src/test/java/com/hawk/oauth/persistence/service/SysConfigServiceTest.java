package com.hawk.oauth.persistence.service;

import com.alibaba.fastjson.JSON;
import com.hawk.oauth.Application;
import com.hawk.oauth.persistence.entity.SysDict;
import com.hawk.oauth.persistence.entity.SysUser;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

@Slf4j
@RunWith(SpringRunner.class)
@SpringBootTest(classes = {Application.class})

public class SysConfigServiceTest {

    @Resource
    private SysDictService sysDictService;

    @Resource
    private SysUserService sysUserService;

    @Test
    public void listByConditions() {
//        SysUser sysUser = new SysUser();
//        sysUser.setName("machao");
//        sysUser.setStatus(1);
//        List<SysUser> list = sysUserService.listByConditions(sysUser);
//        System.out.println(list.size());
//        System.out.println(sysUserService.selectByName("machao"));

        Set<String> permissions = sysUserService.findPermissions(147634648799907840L);
        System.out.println(permissions);
    }
}