package com.sxs.ditu.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.sxs.common.annotation.Excel;
import com.sxs.common.core.domain.BaseEntity;

/**
 * 坐标数据对象 yb_zuobiao
 * 
 * @author sxs
 * @date 2025-03-23
 */
public class YbZuobiao extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 编号 */
    private Long id;

    /** 坐标数据 */
    @Excel(name = "坐标数据")
    private String zuobiao;

    /** 类别 */
    @Excel(name = "类别")
    private String leibie;

    /** 客控总人数 */
    @Excel(name = "客控总人数")
    private String zrenshu;

    /** 负责人 */
    @Excel(name = "负责人")
    private String fuzeren;

    /** 汇泉广场站支援人数 */
    @Excel(name = "汇泉广场站支援人数")
    private String hzhiyuan;

    /** 中山公园站支援人数 */
    @Excel(name = "中山公园站支援人数")
    private String zzhiyuan;

    /** 显示状态 */
    @Excel(name = "显示状态")
    private String status;

    /** 创建时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Excel(name = "创建时间", width = 30, dateFormat = "yyyy-MM-dd HH:mm:ss")
    private Date createdtime;

    /** 添加人id */
    @Excel(name = "添加人id")
    private Long userId;

    /** 添加者 */
    @Excel(name = "添加者")
    private String nickName;

    /** 扩展1 */
    private String kz1;

    /** 扩展2 */
    private String kz2;

    /** 扩展3 */
    private String kz3;

    public void setId(Long id) 
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setZuobiao(String zuobiao) 
    {
        this.zuobiao = zuobiao;
    }

    public String getZuobiao() 
    {
        return zuobiao;
    }
    public void setLeibie(String leibie) 
    {
        this.leibie = leibie;
    }

    public String getLeibie() 
    {
        return leibie;
    }
    public void setZrenshu(String zrenshu) 
    {
        this.zrenshu = zrenshu;
    }

    public String getZrenshu() 
    {
        return zrenshu;
    }
    public void setFuzeren(String fuzeren) 
    {
        this.fuzeren = fuzeren;
    }

    public String getFuzeren() 
    {
        return fuzeren;
    }
    public void setHzhiyuan(String hzhiyuan) 
    {
        this.hzhiyuan = hzhiyuan;
    }

    public String getHzhiyuan() 
    {
        return hzhiyuan;
    }
    public void setZzhiyuan(String zzhiyuan) 
    {
        this.zzhiyuan = zzhiyuan;
    }

    public String getZzhiyuan() 
    {
        return zzhiyuan;
    }
    public void setStatus(String status) 
    {
        this.status = status;
    }

    public String getStatus() 
    {
        return status;
    }
    public void setCreatedtime(Date createdtime) 
    {
        this.createdtime = createdtime;
    }

    public Date getCreatedtime() 
    {
        return createdtime;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setNickName(String nickName) 
    {
        this.nickName = nickName;
    }

    public String getNickName() 
    {
        return nickName;
    }
    public void setKz1(String kz1) 
    {
        this.kz1 = kz1;
    }

    public String getKz1() 
    {
        return kz1;
    }
    public void setKz2(String kz2) 
    {
        this.kz2 = kz2;
    }

    public String getKz2() 
    {
        return kz2;
    }
    public void setKz3(String kz3) 
    {
        this.kz3 = kz3;
    }

    public String getKz3() 
    {
        return kz3;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("zuobiao", getZuobiao())
            .append("leibie", getLeibie())
            .append("zrenshu", getZrenshu())
            .append("fuzeren", getFuzeren())
            .append("hzhiyuan", getHzhiyuan())
            .append("zzhiyuan", getZzhiyuan())
            .append("status", getStatus())
            .append("createdtime", getCreatedtime())
            .append("userId", getUserId())
            .append("nickName", getNickName())
            .append("kz1", getKz1())
            .append("kz2", getKz2())
            .append("kz3", getKz3())
            .toString();
    }
}
