package com.qlyc.dao;

import com.qlyc.model.TotNghiep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class TotNghiepDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public void insertTotNghiep(TotNghiep tn, String soCMND) {
        String sql = "INSERT INTO TOT_NGHIEP (SoCMND, MaTruong, MaNganh, HeTN, NgayTN, LoaiTN) " +
                "VALUES (?, ?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, soCMND, tn.getMaTruong(), tn.getMaNganh(),
                tn.getHeTN(), new java.sql.Date(tn.getNgayTN().getTime()), tn.getLoaiTN());
    }
}