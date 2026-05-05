package com.qlyc.dao;

import com.qlyc.model.SinhVien;
import com.qlyc.model.Truong;
import com.qlyc.model.Nganh;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class SinhVienDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // Thêm mới sinh viên, bỏ qua nếu đã tồn tại
    public void insertSinhVien(SinhVien sv) {
        String sql = "INSERT IGNORE INTO SINHVIEN (SoCMND, HoTen, Email, SoDT, DiaChi) VALUES (?, ?, ?, ?, ?)";
        jdbcTemplate.update(sql, sv.getSoCMND(), sv.getHoTen(), sv.getEmail(), sv.getSoDT(), sv.getDiaChi());
    }

    public List<SinhVien> searchCoBan(String soCMND, String hoTen) {
        StringBuilder sql = new StringBuilder("SELECT SoCMND, HoTen, Email, SoDT, DiaChi FROM SINHVIEN WHERE 1=1");
        java.util.List<Object> params = new java.util.ArrayList<>();
        if (soCMND != null && !soCMND.isEmpty()) {
            sql.append(" AND SoCMND LIKE ?");
            params.add("%" + soCMND + "%");
        }
        if (hoTen != null && !hoTen.isEmpty()) {
            sql.append(" AND HoTen LIKE ?");
            params.add("%" + hoTen + "%");
        }
        return jdbcTemplate.query(sql.toString(), params.toArray(), (rs, rowNum) -> {
            SinhVien sv = new SinhVien();
            sv.setSoCMND(rs.getString("SoCMND"));
            sv.setHoTen(rs.getString("HoTen"));
            sv.setEmail(rs.getString("Email"));
            sv.setSoDT(rs.getString("SoDT"));
            sv.setDiaChi(rs.getString("DiaChi"));
            return sv;
        });
    }

    public List<Truong> getAllTruong() {
        return jdbcTemplate.query("SELECT MaTruong, TenTruong FROM TRUONG", (rs, rowNum) -> {
            Truong t = new Truong();
            t.setMaTruong(rs.getString("MaTruong"));
            t.setTenTruong(rs.getString("TenTruong"));
            return t;
        });
    }

    public List<Nganh> getAllNganh() {
        return jdbcTemplate.query("SELECT MaNganh, TenNganh FROM NGANH", (rs, rowNum) -> {
            Nganh n = new Nganh();
            n.setMaNganh(rs.getString("MaNganh"));
            n.setTenNganh(rs.getString("TenNganh"));
            return n;
        });
    }
}