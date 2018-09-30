package com.common;

import java.util.List;

public class Pager {
	//存放数据 List集合
    private List rows;
    //总条数
    private Integer total;


    public List getRows() {
        return rows;
    }

    public void setRows(List rows) {
        this.rows = rows;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }
}
