package com.framework.innodale.component;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component(value = "pagging")
public class Pagging {

    private int totalCount	= 0;

    @Value("${page.currpage}")
    private int currPage;

    @Value("${page.blocksize}")
    private int maxPage;

    public int getCurrPage() {
        return currPage;
    }
    public void setCurrPage(int currPage) {
        this.currPage = currPage;
    }
    public int getMaxPage() {
        return maxPage;
    }
    public void setMaxPage(int maxPage) {
        this.maxPage = maxPage;
    }
    public int getTotalCount() {
        return totalCount;
    }
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    /** 시작 카운트 구하기  **/
    public int getStartCount(){
        return (currPage - 1) * maxPage;
    }

    public int getTotalPageSize() {
        return ((totalCount%(long)maxPage)== 0)?(int)(totalCount/(long)maxPage) :(int)(totalCount/(long)maxPage) + 1;
    }

}
