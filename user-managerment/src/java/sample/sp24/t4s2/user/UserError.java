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
public class UserError {
    private String userIDError;
    private String fullNameError;
    private String passwordError;
    private String confirmError;
    private String error;

    public UserError() {
        this.userIDError = "";
        this.fullNameError = "";
        this.passwordError = "";
        this.confirmError = "";
        this.error = "";
    }
    
    

    public UserError(String userIDError, String fullNameError, String passwordError, String confirmError, String error) {
        this.userIDError = userIDError;
        this.fullNameError = fullNameError;
        this.passwordError = passwordError;
        this.confirmError = confirmError;
        this.error = error;
    }

    public String getConfirmError() {
        return confirmError;
    }

    public String getError() {
        return error;
    }

    public String getFullNameError() {
        return fullNameError;
    }

    public String getPasswordError() {
        return passwordError;
    }

    public String getUserIDError() {
        return userIDError;
    }

    public void setConfirmError(String confirmError) {
        this.confirmError = confirmError;
    }

    public void setError(String error) {
        this.error = error;
    }

    public void setFullNameError(String fullNameError) {
        this.fullNameError = fullNameError;
    }

    public void setPasswordError(String passwordError) {
        this.passwordError = passwordError;
    }

    public void setUserIDError(String userIDError) {
        this.userIDError = userIDError;
    }
    
    
    
}
