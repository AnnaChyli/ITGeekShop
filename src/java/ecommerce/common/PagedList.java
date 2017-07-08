/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

import java.util.ArrayList;

/**
 * Helper class that implements paging over a collection.
 *
 */
public class PagedList<T> {

    /**
     * the default page size
     */
    public static final int DEFAULT_PAGE_SIZE = 6;

    /**
     * the list over which this class is paging
     */
    private ArrayList<T> list;

    /**
     * the page size
     */
    private int pageSize = DEFAULT_PAGE_SIZE;

    private int pageNum;

    private long total;

    public PagedList() {
        this.pageNum = 1;
    }

    public ArrayList<T> getList() {
        return list;
    }

    public void setList(ArrayList<T> list) {
        this.list = list;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getPageNum() {
        return pageNum;
    }

    /**
     * @param pageNum the pageNum to set
     */
    public void setPageNum(int pageNum) {
        this.pageNum = pageNum;
    }

    public long getTotal() {
        return total;
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public long getTotalPages() {
        if (total % pageSize == 0) {
            return (total / pageSize);
        } else {
            return (total / pageSize + 1);
        }
    }

}
