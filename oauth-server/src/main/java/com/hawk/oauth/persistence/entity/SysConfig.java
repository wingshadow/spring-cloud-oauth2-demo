package com.hawk.oauth.persistence.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hawk.oauth.bean.BaseBean;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * SysConfig Bean定义类，对应表sys_config
 * 
 * @author fy
 * @version 1.0.0 2019-10-22 08:48:13 初始创建
 */
@Getter
@Setter
public class SysConfig extends BaseBean {

    /**
     * 编号
     */
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private Long id;
    
    /**
     * 数据值
     */
    private String value;
    
    /**
     * 标签名
     */
    private String label;
    
    /**
     * 类型
     */
    private String type;
    
    /**
     * 描述
     */
    private String description;
    
    /**
     * 排序（升序）
     */
    private Long sort;
    
    /**
     * 创建人
     */
    private String createBy;
    
    /**
     * 创建时间
     */
    private Date createTime;
    
    /**
     * 更新人
     */
    private String lastUpdateBy;
    
    /**
     * 更新时间
     */
    private Date lastUpdateTime;
    
    /**
     * 备注信息
     */
    private String remarks;
    
    /**
     * 是否删除  -1：已删除  0：正常
     */
    private String delFlag;
    

}