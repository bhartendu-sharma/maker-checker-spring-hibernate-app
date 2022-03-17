package com.BRDApp.service;

import com.BRDApp.dto.CustomerDto;
import com.BRDApp.entity.Customer;
import com.BRDApp.entity.CustomerMaster;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class CustomerDtoService {

    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerMasterService customerMasterService;


    public List<CustomerDto> getAllCustomers(){
        List<Customer> customerTmpLst=customerService.getAllCustomers();
        List<CustomerMaster> customerMasterLst=customerMasterService.getAllCustomers();
        HashMap<String, CustomerDto> map = new HashMap<>();
        for (Customer customer:customerTmpLst){
            map.put(customer.getCustomerCode(),convertEntityToDto(customer));
        }
        for (CustomerMaster customerMaster:customerMasterLst){
            CustomerDto customerDto = map.get(customerMaster.getCustomerCode());
//            if present
            if (customerDto!=null)
                customerDto.setAuthorization(customerMaster.getRecordStatus());
//            if absent
            map.putIfAbsent(customerMaster.getCustomerCode(),convertEntityToDto(customerMaster));
        }
        List<CustomerDto> customerDtoLst=new ArrayList<>();
        for (CustomerDto customerDto:map.values()){
          customerDtoLst.add(customerDto);
        }
        return customerDtoLst;
    }
//    private CustomerDto convertEntityToDto(Object o){
//
//        return null;
//    }

    private CustomerDto convertEntityToDto(Customer customer){
        CustomerDto customerDto=new CustomerDto();
        customerDto.setCustomerID(customer.getCustomerID());
        customerDto.setCustomerCode(customer.getCustomerCode());
        customerDto.setCustomerName(customer.getCustomerName());
        customerDto.setCustomerAddress1(customer.getCustomerAddress1());
        customerDto.setCustomerAddress2(customer.getCustomerAddress2());
        customerDto.setCustomerPinCode(customer.getCustomerPinCode());
        customerDto.setEmailAddress(customer.getEmailAddress());
        customerDto.setContactNumber(customer.getContactNumber());
        customerDto.setPrimaryContactPerson(customer.getPrimaryContactPerson());
        customerDto.setRecordStatus(customer.getRecordStatus());
        if (customer.getIsActive().equals("1")){
            customerDto.setIsActive("Active");
        } else{
            customerDto.setIsActive("InActive");

        }

        return customerDto;
    }

    private CustomerDto convertEntityToDto(CustomerMaster customerMaster){
        CustomerDto customerDto=new CustomerDto();
        customerDto.setCustomerID(customerMaster.getCustomerID());
        customerDto.setCustomerCode(customerMaster.getCustomerCode());
        customerDto.setCustomerName(customerMaster.getCustomerName());
        customerDto.setCustomerAddress1(customerMaster.getCustomerAddress1());
        customerDto.setCustomerAddress2(customerMaster.getCustomerAddress2());
        customerDto.setCustomerPinCode(customerMaster.getCustomerPinCode());
        customerDto.setEmailAddress(customerMaster.getEmailAddress());
        customerDto.setContactNumber(customerMaster.getContactNumber());
        customerDto.setPrimaryContactPerson(customerMaster.getPrimaryContactPerson());
        customerDto.setRecordStatus(customerMaster.getRecordStatus());
        if (customerMaster.getIsActive().equals("1"))
            customerDto.setIsActive("Active");
        else
            customerDto.setIsActive("InActive");
        return customerDto;
    }

}