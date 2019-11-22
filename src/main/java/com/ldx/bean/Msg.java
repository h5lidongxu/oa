package com.ldx.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
	
	private Integer code;
	
	private String msg;
	
	private Map<String, Object> extend = new HashMap<>();
	
	public static Msg success() {
		Msg result = new Msg();
		result.setCode(100);
		result.setMsg("处理成功!");
		return result;
	}

	public Map<String, Object> getExtend() {
		return extend;
	}

	public void setExtend(Map<String, Object> extend) {
		this.extend = extend;
	}

	public static Msg fail() {
		Msg result = new Msg();
		result.setCode(200);
		result.setMsg("处理失败!");
		return result;
	}
	
	/**
	 * 链式操作添加元素的方法
	 * 
	 * @param key
	 * @param value
	 * @return
	 */
	public Msg add(String key, Object value) {
		extend.put(key, value);
		return this;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	
	
}
