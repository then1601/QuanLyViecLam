package com.qlyc.controller;

import com.qlyc.dao.SinhVienDAO;
import com.qlyc.dao.TotNghiepDAO;
import com.qlyc.form.KhaiBaoForm;
import com.qlyc.model.TotNghiep;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;
import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequestMapping("/khaiBao")
public class KhaiBaoController {

    @Autowired
    private SinhVienDAO sinhVienDAO;
    @Autowired
    private TotNghiepDAO totNghiepDAO;

    @GetMapping
    public String showForm(Model model) {
        model.addAttribute("khaiBaoForm", new KhaiBaoForm());
        model.addAttribute("dsTruong", sinhVienDAO.getAllTruong());
        model.addAttribute("dsNganh", sinhVienDAO.getAllNganh());
        // Danh sách cho combobox hệ TN, loại TN (cố định)
        String[] heTN = {"Chính quy", "Liên thông", "Văn bằng 2", "Từ xa"};
        String[] loaiTN = {"Xuất sắc", "Giỏi", "Khá", "Trung bình"};
        model.addAttribute("heTNList", heTN);
        model.addAttribute("loaiTNList", loaiTN);
        return "khaiBao";
    }

    @PostMapping
    public String submitForm(@Valid @ModelAttribute("khaiBaoForm") KhaiBaoForm form,
                             BindingResult result, Model model) {
        // Kiểm tra thêm ngày tốt nghiệp (không được là tương lai)
        TotNghiep tn = form.getTotNghiep();
        if (tn.getNgayTN() != null && tn.getNgayTN().after(new Date())) {
            result.rejectValue("totNghiep.ngayTN", "invalid.ngayTN", "Ngày tốt nghiệp không được ở tương lai");
        }

        if (result.hasErrors()) {
            model.addAttribute("dsTruong", sinhVienDAO.getAllTruong());
            model.addAttribute("dsNganh", sinhVienDAO.getAllNganh());
            model.addAttribute("heTNList", new String[]{"Chính quy", "Liên thông", "Văn bằng 2", "Từ xa"});
            model.addAttribute("loaiTNList", new String[]{"Xuất sắc", "Giỏi", "Khá", "Trung bình"});
            return "khaiBao";
        }

        // Lưu sinh viên (nếu chưa tồn tại)
        sinhVienDAO.insertSinhVien(form.getSinhVien());
        // Lưu tốt nghiệp
        totNghiepDAO.insertTotNghiep(tn, form.getSinhVien().getSoCMND());
        return "redirect:/khaiBao?success";
    }

    // Để binding ngày tháng theo định dạng dd/MM/yyyy, dùng InitBinder
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(Date.class, new PropertyEditorSupport() {
            @Override
            public void setAsText(String text) throws IllegalArgumentException {
                try {
                    setValue(new SimpleDateFormat("dd/MM/yyyy").parse(text));
                } catch (Exception e) {
                    setValue(null);
                }
            }
        });
    }
}