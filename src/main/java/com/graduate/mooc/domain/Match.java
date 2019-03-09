package com.graduate.mooc.domain;

public class Match {
    private String mno;
    private String sno;
    private String subno;

    @Override
    public String toString() {
        return "Match{" +
                "mno='" + mno + '\'' +
                ", sno='" + sno + '\'' +
                ", subno='" + subno + '\'' +
                '}';
    }

    public String getMno() {
        return mno;
    }

    public void setMno(String mno) {
        this.mno = mno;
    }

    public String getSno() {
        return sno;
    }

    public void setSno(String sno) {
        this.sno = sno;
    }

    public String getSubno() {
        return subno;
    }

    public void setSubno(String subno) {
        this.subno = subno;
    }
}
