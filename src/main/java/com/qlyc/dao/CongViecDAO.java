package com.qlyc.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class CongViecDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> searchTotNghiepVaLamViec(String soCMND, String hoTen) {
        StringBuilder sql = new StringBuilder(
                "SELECT sv.SoCMND as soCMND, sv.HoTen as hoTen, tn.MaNganh AS maNganhTN, tn.MaTruong as maTruong, " +
                        "cv.MaNganh AS maNganhCV, cv.TenCongTy as tenCongTy, cv.ThoiGianLamViec as thoiGianLamViec " +
                        "FROM SINHVIEN sv " +
                        "LEFT JOIN TOT_NGHIEP tn ON sv.SoCMND = tn.SoCMND " +
                        "LEFT JOIN CONG_VIEC cv ON sv.SoCMND = cv.SoCMND " +
                        "WHERE 1=1 "
        );
        java.util.List<Object> params = new java.util.ArrayList<>();
        if (soCMND != null && !soCMND.isEmpty()) {
            sql.append(" AND sv.SoCMND LIKE ?");
            params.add("%" + soCMND + "%");
        }
        if (hoTen != null && !hoTen.isEmpty()) {
            sql.append(" AND sv.HoTen LIKE ?");
            params.add("%" + hoTen + "%");
        }
        return jdbcTemplate.queryForList(sql.toString(), params.toArray());
    }
}