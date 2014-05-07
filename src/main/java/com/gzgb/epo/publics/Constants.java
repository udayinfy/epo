package com.gzgb.epo.publics;

import java.util.Date;

import com.gzgb.epo.util.DateUtil;

/**
 * <pre>
 * 常量定义
 * </pre>
 * 
 * @author XiaoJian
 * @version 1.0, 2013-12-17
 */
public interface Constants {

	/**
	 * 广州广报项目数据库SCHEMA引用
	 */
	final static String GZGB_SCH = "public_opinion";
	
	/**
	 * 用户session ID
	 */
	final static String USER_SESSION_KEY = "USER_SESSION_ID";
	
	/**
	 * 角色停用状态
	 */
	final static int ROLE_STOP_STATUS = -1;
	
	/**
	 * 角色启用状态
	 */
	final static int ROLE_START_STATUS = 1;
	
	/**
	 * 设置日期
	 */
	final static Date date = DateUtil.parseDateTime("2013-5-05 23:23:23");
//	final static Date date = new Date();

}
