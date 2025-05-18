package com.sxs;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

/**
 * 启动程序
 * 
 * @author sxs
 */
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class   SxSApplication
{
    public static void main(String[] args)
    {
        // System.setProperty("spring.devtools.restart.enabled", "false");
        SpringApplication.run(SxSApplication.class, args);
        System.out.println("  后端启动成功  ");
    }
}
