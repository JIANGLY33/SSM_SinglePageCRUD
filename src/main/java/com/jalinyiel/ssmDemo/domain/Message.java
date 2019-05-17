package com.jalinyiel.ssmDemo.domain;

import java.util.HashMap;
import java.util.Map;

public class Message {

    private int code; //状态码：200表示成功，400表示失败
    private String msg; //提示信息
    private Map<String,Object> pageMsg = new HashMap<>();

    public static Message success() {
        Message result = new Message();
        result.setCode(200);
        result.setMsg("成功！");
        return result;
    }

    public static Message fail() {
        Message result = new Message();
        result.setCode(400);
        result.setMsg("失败！");
        return result;
    }

    public Message add(String key, Object value) {
        this.pageMsg.put(key,value);
        return this;
    }
    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getPageMsg() {
        return pageMsg;
    }

    public void setPageMsg(Map<String, Object> pageMsg) {
        this.pageMsg = pageMsg;
    }
}
