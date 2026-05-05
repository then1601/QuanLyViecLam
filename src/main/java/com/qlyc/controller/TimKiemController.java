package com.qlyc.controller;

import com.qlyc.dao.CongViecDAO;
import com.qlyc.dao.SinhVienDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class TimKiemController {

    @Autowired
    private SinhVienDAO sinhVienDAO;
    @Autowired
    private CongViecDAO congViecDAO;

    // Form 1: tìm kiếm cơ bản
    @GetMapping("/timKiemCoBan")
    public String showCoBan() {
        return "timKiemCoBan";
    }

    @GetMapping("/timKiemCoBan/search")
    public String searchCoBan(@RequestParam(required = false) String soCMND,
                              @RequestParam(required = false) String hoTen,
                              Model model) {
        model.addAttribute("ketQua", sinhVienDAO.searchCoBan(soCMND, hoTen));
        return "ketQuaTimKiemCoBan";
    }

    // Form 2: tìm kiếm tốt nghiệp & việc làm
    @GetMapping("/timKiemTotNghiep")
    public String showTotNghiep() {
        return "timKiemTotNghiep";
    }

    @GetMapping("/timKiemTotNghiep/search")
    public String searchTotNghiep(@RequestParam(required = false) String soCMND,
                                  @RequestParam(required = false) String hoTen,
                                  Model model) {
        model.addAttribute("ketQua", congViecDAO.searchTotNghiepVaLamViec(soCMND, hoTen));
        return "ketQuaTimKiemTotNghiep";
    }
}