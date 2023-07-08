package com.fpoly.vn.model;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class AccountModel {
    @NotBlank(message = "Không được để trống họ và tên")
    private String hoVaTen;

    @NotBlank(message = "Không được để trống email")
    @Email(message = "Không đúng định dạnh email")
    private String emailRegis;

    @NotBlank(message = "Không được để trống mật khẩu")
    private String matKhauRegis;

    @NotBlank(message = "Không được để trống số điện thoại")
    private String sdt;

    private String hinhAnh;

    private int admin;
}
