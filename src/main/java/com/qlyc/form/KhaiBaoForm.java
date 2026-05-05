package com.qlyc.form;

import com.qlyc.model.SinhVien;
import com.qlyc.model.TotNghiep;

import javax.validation.Valid;

public class KhaiBaoForm {
    @Valid
    private SinhVien sinhVien = new SinhVien();
    @Valid
    private TotNghiep totNghiep = new TotNghiep();

    public KhaiBaoForm() {
    }

    public SinhVien getSinhVien() {
        return sinhVien;
    }

    public void setSinhVien(SinhVien sinhVien) {
        this.sinhVien = sinhVien;
    }

    public TotNghiep getTotNghiep() {
        return totNghiep;
    }

    public void setTotNghiep(TotNghiep totNghiep) {
        this.totNghiep = totNghiep;
    }
}