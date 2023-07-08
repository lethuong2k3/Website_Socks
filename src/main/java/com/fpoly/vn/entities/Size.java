package com.fpoly.vn.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.Set;
import java.util.UUID;

@Entity
@Table(name = "size")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Size {
    @Id
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", nullable = false, columnDefinition = "uniqueidentifier")
    private UUID id;
    
    @Column(name = "tensize", length = 100, nullable = false)
    private String tenSize;

    @Column(name = "trangthai", columnDefinition = "bit default 1", nullable = false)
    private boolean trangThai;

    @OneToMany(mappedBy = "size")
    private Set<Product_Size> productSize;
}
