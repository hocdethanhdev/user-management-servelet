/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t4s2.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import sample.sp24.t4s2.utils.DBUtils;

/**
 *
 * @author ADMIN
 */
public class ProductDTO {

    private String productID;
    private String name;
    private int quantity;
    private int price;

    public ProductDTO() {
        this.productID = "";
        this.name = "";
        this.quantity = 0;
        this.price = 0;
    }

    public ProductDTO(String productID, String name, int quantity, int price) {
        this.productID = productID;
        this.name = name;
        this.quantity = quantity;
        this.price = price;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public String getProductID() {
        return productID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public void setProductID(String productID) {
        this.productID = productID;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

}
