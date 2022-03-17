package com.BRDApp.util;

import com.BRDApp.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

@Service
public class ControllerUtil {
    private User user;
    String modify;
    String customerCodeForModify;
    String updateFromMaster;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getModify() {
        return modify;
    }

    public void setModify(String modify) {
        this.modify = modify;
    }

    public String getCustomerCodeForModify() {
        return customerCodeForModify;
    }

    public void setCustomerCodeForModify(String customerCodeForModify) {
        this.customerCodeForModify = customerCodeForModify;
    }

    public String getUpdateFromMaster() {
        return updateFromMaster;
    }

    public void setUpdateFromMaster(String updateFromMaster) {
        this.updateFromMaster = updateFromMaster;
    }
}

