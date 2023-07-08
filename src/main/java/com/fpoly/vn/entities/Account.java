package com.fpoly.vn.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "account")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Account {
    @Id
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", nullable = false, columnDefinition = "uniqueidentifier")
    private UUID id;

    @Column(name = "hovaten", length = 200, nullable = false)
    private String hoVaTen;

    @Column(name = "matkhau", length = 200, nullable = false)
    private String matKhau;

    @Column(name = "anhdaidien", length = 200)
    private String anhDaiDien;

    @Column(name = "email", length = 200, nullable = false, unique = true)
    private String email;

    @Column(name = "admin", nullable = false)
    private int admin;

    @Column(name = "sdt", length = 50, nullable = false)
    private String sdt;

    @Column(name = "trangthai", columnDefinition = "bit default 1", nullable = false)
    private boolean trangThai;

    @OneToMany(mappedBy = "account")
    private Set<Payment> payment;

    @OneToMany(mappedBy = "account")
    private Set<Order> order;
}
