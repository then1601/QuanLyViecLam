package com.qlyc.model;

import java.util.Date;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import org.springframework.format.annotation.DateTimeFormat;

public class TotNghiep {
    // soCMND sẽ được set từ form (k cần validate riêng ở đây)
    @NotBlank(message = "Mã trường không được để trống")
    private String maTruong;
    @NotBlank(message = "Mã ngành không được để trống")
    private String maNganh;
    private String heTN;          // VD: Chính quy, Liên thông
    @NotNull(message = "Ngày tốt nghiệp không được để trống")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date ngayTN;
    private String loaiTN;        // VD: Xuất sắc, Giỏi, Khá

    public String getMaTruong() {
        return maTruong;
    }

    public void setMaTruong(String maTruong) {
        this.maTruong = maTruong;
    }

    public String getMaNganh() {
        return maNganh;
    }

    public void setMaNganh(String maNganh) {
        this.maNganh = maNganh;
    }

    public String getHeTN() {
        return heTN;
    }

    public void setHeTN(String heTN) {
        this.heTN = heTN;
    }

    public Date getNgayTN() {
        return ngayTN;
    }

    public void setNgayTN(Date ngayTN) {
        this.ngayTN = ngayTN;
    }

    public String getLoaiTN() {
        return loaiTN;
    }

    public void setLoaiTN(String loaiTN) {
        this.loaiTN = loaiTN;
    }
}