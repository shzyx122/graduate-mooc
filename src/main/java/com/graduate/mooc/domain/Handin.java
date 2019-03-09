package com.graduate.mooc.domain;

public class Handin {
    private String hno;
    private String mno;
    private String choice;
    private int state;
    private String sta;

    public String getHno() {
        return hno;
    }

    public void setHno(String hno) {
        this.hno = hno;
    }

    public String getMno() {
        return mno;
    }

    public void setMno(String mno) {
        this.mno = mno;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getSta() {
        if(state==1)
            return "正确";
        return "错误";
    }


}
