package com.fpoly.vn.entities;

import jakarta.persistence.*;

import java.util.UUID;

@Entity(name = "sale_off")
public class SaleOff {
    @Version
    @Column(name = "lockflag")
    private Integer lockFlag;

    public Integer getLockFlag() {
        return lockFlag;
    }

    public void setLockFlag(Integer lockFlag) {
        this.lockFlag = lockFlag;
    }

    @Id
    @GeneratedValue(generator = "uuid2")
    @Column(name = "id", nullable = false, columnDefinition = "uniqueidentifier")
    private UUID id;

    @Column(name = "mota", length = 1000, nullable = true)
    private String moTa;

    @ManyToOne(optional = false)
    @JoinColumn(name = "product_id", nullable = false)
    private Product product;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    /**
     * Compares the key for this instance with another SaleOff.
     *
     * @param other The object to compare to
     * @return True if other object is instance of class SaleOff and the key objects
     *         are equal
     */
    private boolean equalKeys(Object other){
        if (this == other){
            return true;
        }
        if (!(other instanceof SaleOff)) {
            return false;
        }
        SaleOff that = (SaleOff) other;
        if (this.getId() != that.getId()) {
            return false;
        }
        return true;
    }

    /**
     * Compares this instance with another SaleOff.
     *
     * @param other The object to compare to
     * @return True if the objects are the same
     */
    @Override
    public boolean equals(Object other) {
        if (!(other instanceof SaleOff))
            return false;
        return this.equalKeys(other) && ((SaleOff) other).equalKeys(this);
    }


}
