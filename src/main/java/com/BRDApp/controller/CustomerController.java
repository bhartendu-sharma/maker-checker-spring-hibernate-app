package com.BRDApp.controller;

import com.BRDApp.dto.CustomerDto;
import com.BRDApp.entity.Customer;
import com.BRDApp.entity.CustomerMaster;
import com.BRDApp.entity.User;
import com.BRDApp.service.CustomerDtoService;
import com.BRDApp.service.CustomerService;
import com.BRDApp.service.CustomerMasterService;
import com.BRDApp.service.UserService;
import com.BRDApp.util.ControllerUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@CrossOrigin
@Controller
@RequestMapping
public class CustomerController {

    @Autowired
    private UserService userService;

    @Autowired
    private CustomerService customerService;

    @Autowired
    private CustomerMasterService customerMasterService;

    @Autowired
    private CustomerDtoService customerDtoService;

    @Autowired
    private ControllerUtil controllerUtil;
//    CurrUser currUser=new CurrUser();
//    String modify=null;
//    String customerCodeForModify=null;
//    String updateFromMaster=null;
    public CustomerDtoService getCustomerDtoService() {
        return customerDtoService;
    }

    public void setCustomerDtoService(CustomerDtoService customerDtoService) {
        this.customerDtoService = customerDtoService;
    }

    @RequestMapping("/home")
    public String homeFun(Model model) {
        if (controllerUtil.getUser()==null){
            return "redirect:/loginForm";
        }

        model.addAttribute("viewAllCustomerCalled", "viewAllCustomerCalled");
        List<CustomerDto> customerDtoList=customerDtoService.getAllCustomers();
        System.out.println("customerDtoList : "+customerDtoList);
        model.addAttribute("customerDtoList",customerDtoList);
        List<Customer> customerTempLst= customerService.getAllCustomers();
        model.addAttribute("customerTempLst",customerTempLst);
        if (controllerUtil.getUser()!=null){
            String role=controllerUtil.getUser().getRoleType();
            String maker=null;
            String checker=null;
            model.addAttribute("currUser",controllerUtil.getUser());
            if (role.equals("M")){
                maker=controllerUtil.getUser().getUsername();
                model.addAttribute("maker",maker);
            }else if (role.equals("C")){
                checker=controllerUtil.getUser().getUsername();
                model.addAttribute("checker",checker);
            }
        }
        System.out.println("customerCodeForModify : "+controllerUtil.getCustomerCodeForModify());
        if (controllerUtil.getModify()!=null && controllerUtil.getCustomerCodeForModify()!=null){
            model.addAttribute("modify",controllerUtil.getModify());
            if (customerService.getCustomerByCode(controllerUtil.getCustomerCodeForModify()).getCustomerCode()!=null){
                model.addAttribute("customerToModify",customerService.getCustomerByCode(controllerUtil.getCustomerCodeForModify()));
            }else{
                model.addAttribute("customerToModify",customerMasterService.getCustomerByCode(controllerUtil.getCustomerCodeForModify()));
                 controllerUtil.setUpdateFromMaster("yes");
            }
            System.out.println("customerToModify .... "+customerService.getCustomerByCode(controllerUtil.getCustomerCodeForModify()));
//            model.addAttribute("customerToModify",customerService.getCustomerByCode(customerCodeForModify));
        }
        return "homePage";
    }

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String loginUser(@ModelAttribute("user") User user,Model model, HttpServletRequest req){
//        System.out.println("enter into loginUser method");
//        System.out.println("inside user loginUser method : " + user);
        HttpSession httpSession=  req.getSession();

        Boolean isLogin = userService.loginUser(user);
        controllerUtil.setUser(user);
        System.out.println("isLogin : " + isLogin);
        if (isLogin) {
            String role=user.getRoleType();
            String maker=null;
            String checker=null;
            httpSession.setAttribute("currUser",user);
            List<CustomerDto> customerDtoList=customerDtoService.getAllCustomers();
            model.addAttribute("customerDtoList",customerDtoList);
            model.addAttribute("currUser",user);
//            if (role.equals("M")){
//                maker=user.getUsername();
//                model.addAttribute("maker",maker);
//            }else if (role.equals("C")){
//                checker=user.getUsername();
//                List<Customer> customerTempLst= customerService.getAllCustomers();
//                model.addAttribute("customerTempLst",customerTempLst);
//                model.addAttribute("checker",checker);
//            }
//                session.setAttribute("loggedUser", loggedUser);
            return "redirect:/home";
        }
        else{
            System.out.println("invalid credentionls : " + user);
            model.addAttribute("loginErr","invalid credentials!");
            return "loginForm";
        }
    }





    @RequestMapping("/loginForm")
    public String showLoginForm(Model model){
        model.addAttribute("user", new User());
        Map<String, String> roleTypeItems = new LinkedHashMap<String, String>();
        roleTypeItems.put("M", "Maker");
        roleTypeItems.put("C", "Checker");
        model.addAttribute("roleTypeItems",roleTypeItems);
        return "loginForm";
    }


    @RequestMapping("/viewAllCustomer")
    public String viewAllCustomerFun(Model model) {
//        model.addAttribute("viewAllCustomerCalled", "viewAllCustomerCalled");
        model.addAttribute("customerLst",customerDtoService.getAllCustomers());

//            model.addAttribute("username",username);

        return "redirect:/home";

    }


//    Add New Customer

//
//    @RequestMapping(value = "/addCustomer",method = RequestMethod.POST)
//    public String addCustomer(Model model,HttpServletRequest req){
//        int customerId=Integer.parseInt(req.getParameter("customerID"));
//        Customer customerToAdd=new Customer(customerId,req.getParameter("customerCode"),
//                req.getParameter("customerName"),
//                req.getParameter("customerAddress1"),
//                req.getParameter("customerAddress2"),
//                req.getParameter("customerPinCode"),
//                req.getParameter("emailAddress"),
//                req.getParameter("contactNumber"),
//                req.getParameter("primaryContactPerson"),
//                req.getParameter("flagStatus"),
//                req.getParameter("createdBy"));
//        Customer addedCustomer= customerService.addCustomer(customerToAdd);
//        if (addedCustomer!=null){
//            return "redirect:/home";
//        }else{
//            model.addAttribute("errMsg","something went wrong!");
//            return "errPage";
//        }
//    }
//


    @CrossOrigin
    @GetMapping ("/addCustomer")
    public String addCustomer(Model model,@Valid  @RequestBody Customer customerToAdd){

        System.out.println("customerToAdd from ajax : "+customerToAdd);
//        Customer addedCustomer= customerService.addCustomer(customerToAdd);
        Customer addedCustomer=null;
        if (addedCustomer!=null){
            return "redirect:/home";
        }else{
            model.addAttribute("errMsg","something went wrong!");
            return "errPage";
        }
    }




    @RequestMapping(value="/deleteCustomer/{customerCode}/{recordStatus}")
    public String deleteCustomer(@PathVariable String customerCode,@PathVariable String recordStatus,@PathVariable(required = false) String username){

        if(recordStatus.equals("N")){
            customerService.deleteCustomer(customerCode);
        }
        if (recordStatus.equals("M")){
            Customer customer=customerService.getCustomerByCode(customerCode);
            CustomerMaster customerMaster=new CustomerMaster(customer);
            customerMasterService.addCustomer(customerMaster,"A",true);
            customerService.deleteCustomer(customerCode);

        }
        if (recordStatus.equals("NR")){
            customerService.deleteCustomer(customerCode);
//          customerMasterService.deleteCustomer(customerCode);
        }
        if (recordStatus.equals("MR")){
            customerService.deleteCustomer(customerCode);
        }
        if (recordStatus.equals("A")){
//          Customer customer=customerService.getCustomerByCode(customerCode);
            Customer customer=new Customer(customerMasterService.getCustomerByCode(customerCode));
            System.out.println("to make status D");
            customerService.addCustomer(customer,"D");
            customerService.modifyCustomer(customer,"D");
        }

//        String tmp="maker1";
        return "redirect:/home";
    }






    //    authorizecustomer
    @RequestMapping(value="/authorizeCustomer/{customerCode}/{recordStatus}")
    public String authorizeCustomer(@PathVariable String customerCode,@PathVariable String recordStatus){
        if (recordStatus.equals("N") || recordStatus.equals("M")){
            Customer customer=customerService.getCustomerByCode(customerCode);
            CustomerMaster customerMaster=new CustomerMaster(customer);
            customerMaster.setAuthorizedBy(controllerUtil.getUser().getUsername());
            customerMaster.setRecordStatus("A");
            customerMasterService.addCustomer(customerMaster);
            customerService.deleteCustomer(customerCode);
        }



//        String tmp="maker1";
        return "redirect:/home";
    }
    @RequestMapping(value="/rejectCustomer/{customerCode}/{recordStatus}")
    public String rejectCustomer(@PathVariable String customerCode,@PathVariable String recordStatus){
        if (recordStatus.equals("N")){
            Customer customer=customerService.getCustomerByCode(customerCode);
            Customer modifiedCustomer= customerService.modifyCustomer(customer,"NR");
        }
        if (recordStatus.equals("M")){
            Customer customer=customerService.getCustomerByCode(customerCode);
            Customer modifiedCustomer= customerService.modifyCustomer(customer,"MR");
            CustomerMaster customerMaster=new CustomerMaster(modifiedCustomer);
//           CustomerMaster customerMaster2= customerMasterService.addCustomer(customerMaster,"R");
            CustomerMaster customerMaster2= customerMasterService.addCustomer(customerMaster,"R",false);
        }
        if (recordStatus.equals("D")){
            Customer customer=customerService.getCustomerByCode(customerCode);
            Customer modifiedCustomer= customerService.modifyCustomer(customer,"DR");
            CustomerMaster customerMaster=new CustomerMaster(modifiedCustomer);
//           CustomerMaster customerMaster2= customerMasterService.addCustomer(customerMaster,"R");
            customerMaster.setRecordStatus("A");
            CustomerMaster customerMaster2= customerMasterService.modifyCustomer(customerMaster);
        }
//        String tmp="maker1";
        return "redirect:/home";
    }



    @RequestMapping(value="/modifyCustomerForm/{customerCode}")
    public String modifyCustomerFormFun(@PathVariable String customerCode){
        controllerUtil.setCustomerCodeForModify(customerCode);
        controllerUtil.setModify("modifyTrue");
        return "redirect:/home";
    }

    @RequestMapping(value = "/modifyCustomer",method = RequestMethod.POST)
    public String modifyCustomer( Model model,HttpServletRequest req){
        int customerId=Integer.parseInt(req.getParameter("customerID"));
        Customer cusToModify=new Customer(customerId,req.getParameter("customerCode"),
                req.getParameter("customerName"),
                req.getParameter("customerAddress1"),
                req.getParameter("customerAddress2"),
                req.getParameter("customerPinCode"),
                req.getParameter("emailAddress"),
                req.getParameter("contactNumber"),
                req.getParameter("primaryContactPerson"),
                req.getParameter("flagStatus"),
                req.getParameter("createdBy"));
        Customer modifiedCustomer= null;
        if (controllerUtil.getUpdateFromMaster()==null){
             modifiedCustomer= customerService.modifyCustomer(cusToModify);
        }else {
            modifiedCustomer=customerService.addCustomer(cusToModify);
            controllerUtil.setUpdateFromMaster(null);
        }
        if (modifiedCustomer!=null){
            controllerUtil.setModify(null);
            controllerUtil.setCustomerCodeForModify(null);
            return "redirect:/home";
        }else{
            model.addAttribute("errMsg","something went wrong!");
            return "errPage";
        }
    }

@RequestMapping("/logout")
public String logoutFun()
{
    controllerUtil.setUser(null);
    controllerUtil.setModify(null);
    controllerUtil.setUpdateFromMaster(null);
    controllerUtil.setCustomerCodeForModify(null);

       return "redirect:/loginForm";
}


















//    @RequestMapping("/viewAllCustomer")
//    public String viewAllCustomerFun(Model model){
//        model.addAttribute("viewAllCustomerCalled","viewAllCustomerCalled");
//        model.addAttribute("customerLst",customerDtoService.getAllCustomers());
//
////            model.addAttribute("username",username);
//
//        return "homePage";
////            return "redirect:/home";
//    }
}


