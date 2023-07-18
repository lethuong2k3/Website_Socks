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
public class LoginModel {
    @NotBlank(message = "Không được để trống email")
    @Email(message = "Không đúng định dạng email")
    private String email;

    @NotBlank(message = "Không được để trống mật khẩu")
    private String matKhau;
}
