package com.sxs.system.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sxs.common.annotation.Excel;
import com.sxs.common.core.domain.BaseEntity;

/**
 * 背景图片对象 yb_tupian
 * 
 * @author sxs
 * @date 2025-03-28
 */
public class YbTupian extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** id */
    private Long id;

    /** 图片 */
    @Excel(name = "图片")
    private String src;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setSrc(String src) 
    {
        this.src = src;
    }

    public String getSrc() 
    {
        return src;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("src", getSrc())
            .toString();
    }
}
