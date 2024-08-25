/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.sp24.t4s2.user;

/**
 *
 * @author ADMIN
 */
public class UserDTO {
    private String userID;
    private String fullName;
    private String roleID;
    private String password;

    public UserDTO() {
        this.userID="";
        this.fullName="";
        this.roleID="";
        this.password="";   
        
    }

    public UserDTO(String userID, String fullName, String roleID, String password) {
        this.userID = userID;
        this.fullName = fullName;
        this.roleID = roleID;
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public String getPassword() {
        return password;
    }

    public String getRoleID() {
        return roleID;
    }

    public String getUserID() {
        return userID;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setRoleID(String roleID) {
        this.roleID = roleID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    
    
}
