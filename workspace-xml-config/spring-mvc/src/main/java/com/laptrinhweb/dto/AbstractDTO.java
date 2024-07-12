package com.laptrinhweb.dto;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class AbstractDTO<T> {
    private Long id;

    private Timestamp createdDate;
    private Timestamp modifiedDate;

    private String createdBy;
    private String modifiedBy;

    // Mảng long id này dùng để tối ưu hóa khi thực hiện xóa dữ liệu số nhiều
    private long[] ids;

    // Mỗi model sẽ có một list để có thể lấy ra quản lý: Để generic cho các model kế thừa
    private List<T> listResult = new ArrayList<>();

    // Trang đang đứng
    private Integer page;

    // Tống số item trong 1 page
    private Integer limit;

    public Integer getLimit() {
        return limit;
    }

    public void setLimit(Integer limit) {
        this.limit = limit;
    }

    // Tổng số trang có được
    private Integer totalPage;

    // Tổng số item
    private Integer totalItem;


    private String sortName;
    private String sortBy;

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(Integer totalPage) {
        this.totalPage = totalPage;
    }

    public Integer getTotalItem() {
        return totalItem;
    }

    public void setTotalItem(Integer totalItem) {
        this.totalItem = totalItem;
    }

    public String getSortName() {
        return sortName;
    }

    public void setSortName(String sortName) {
        this.sortName = sortName;
    }

    public String getSortBy() {
        return sortBy;
    }

    public void setSortBy(String sortBy) {
        this.sortBy = sortBy;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    public Timestamp getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Timestamp modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public String getModifiedBy() {
        return modifiedBy;
    }

    public void setModifiedBy(String modifiedBy) {
        this.modifiedBy = modifiedBy;
    }

    public long[] getIds() {
        return ids;
    }

    public void setIds(long[] ids) {
        this.ids = ids;
    }

    public List<T> getListResult() {
        return listResult;
    }
    public void setListResult(List<T> listResult) {
        this.listResult = listResult;
    }
}
