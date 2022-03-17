package com.BRDApp.dao;

import com.BRDApp.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;


@Repository
public class CustomerDaoImpl  implements CustomerDao{
    @Autowired
    public SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }


//   ~~~~~~~~~~~~~~************* Add or Register new Customer Details *****************~~~~~~~~~~~~~~
    @Override
    public Customer addCustomer(Customer customer)  {

           if (customer==null){
               return null;
           }
//        System.out.println("customer comes in addCustomer method :"+customer);
        Date createdDate=new Date();
         customer.setCreatedDate(createdDate);
         customer.setRecordStatus("N");
         sessionFactory.getCurrentSession().saveOrUpdate(customer);
//        System.out.println("successfully added in database!");
         return customer;
    }

    @Override
    public Customer addCustomer(Customer customer, String recordStatus) {
        if (customer==null || recordStatus==null){
            return null;
        }
        customer.setRecordStatus(recordStatus);
        sessionFactory.getCurrentSession().saveOrUpdate(customer);

        return customer;
    }


    //   ~~~~~~~~~~~~~~************* Fetch All Customer Details From Temporary Table *****************~~~~~~~~~~~~~~

    @Override
    @SuppressWarnings("unchecked")
    public List<Customer> getAllCustomers() {
        System.out.println("~~~~enter in getAllCustomers method in dao~~~~~");
        List<Customer> customerLst=sessionFactory.getCurrentSession().createQuery("from Customer").list();

        if (customerLst==null){
            return null;
        }
//        Session session = sessionFactory.getCurrentSession();
//        CriteriaBuilder cb = session.getCriteriaBuilder();
//        CriteriaQuery<Customer> cq = cb.createQuery(Customer.class);
//        Root<Customer> root = cq.from(Customer.class);
//        cq.select(root);
//        Query query = session.createQuery(cq);
//        return query.getResultList();
        System.out.println("customerLst in dao from database : "+customerLst);
        return customerLst;
    }


    //   ~~~~~~~~~~~~~~************* Modify Existing Particular Customer Details *****************~~~~~~~~~~~~~~

    @Override
    public Customer modifyCustomer(Customer customer) {
        if (customer==null){
            return null;
        }
        Customer customer2 = getCustomerByCode(customer.getCustomerCode());

        customer2.setCustomerName(customer.getCustomerName());
        customer2.setCustomerPinCode(customer.getCustomerPinCode());
        customer2.setEmailAddress(customer.getEmailAddress());
        customer2.setContactNumber(customer.getContactNumber());
        customer2.setPrimaryContactPerson(customer.getPrimaryContactPerson());
        customer2.setModifiedBy(customer.getModifiedBy());
                Date modifiedDate=new Date();
        customer2.setModifiedDate(modifiedDate);
        if (customer2.getRecordStatus().equals("MR")){
            customer2.setRecordStatus("N");
        }
        else{
            customer2.setRecordStatus("M");

        }
        customer2.setAuthorizedBy(customer.getAuthorizedBy());
        customer2.setAuthorizedDate(customer.getAuthorizedDate());
        sessionFactory.getCurrentSession().merge(customer2);
//        System.out.println("customer comes in modifyCustomer method :"+customer);
//        Date modifiedDate=new Date();
//        customer.setModifiedDate(modifiedDate);
//        customer.setRecordStatus("M");
//        System.out.println("customer to update in database : "+customer);
//        sessionFactory.getCurrentSession().merge(customer);
//        return customer;
        return customer2;

    }

    @Override
    public Customer modifyCustomer(Customer customer, String recordStatus) {
        Customer customer2 = getCustomerByCode(customer.getCustomerCode());

        customer2.setCustomerName(customer.getCustomerName());
        customer2.setCustomerPinCode(customer.getCustomerPinCode());
        customer2.setEmailAddress(customer.getEmailAddress());
        customer2.setContactNumber(customer.getContactNumber());
        customer2.setPrimaryContactPerson(customer.getPrimaryContactPerson());
        customer2.setModifiedBy(customer.getModifiedBy());
        Date modifiedDate=new Date();
        customer2.setModifiedDate(modifiedDate);
        customer2.setRecordStatus(recordStatus);

        sessionFactory.getCurrentSession().merge(customer2);
//        System.out.println("customer comes in modifyCustomer method :"+customer);
//        Date modifiedDate=new Date();
//        customer.setModifiedDate(modifiedDate);
//        customer.setRecordStatus("M");
//        System.out.println("customer to update in database : "+customer);
//        sessionFactory.getCurrentSession().merge(customer);
//        return customer;
        return customer2;
    }

//   ~~~~~~~~~~~~~~************* Fetch Particular Customer Details via Unique Customer Code *****************~~~~~~~~~~~~~~

    @Override
    public Customer getCustomerByCode(String customerCode) {
        Customer customer = new Customer();

        Query query = sessionFactory.getCurrentSession().createQuery("select c from Customer c where c.customerCode=:customerCodeParam");

        query.setParameter("customerCodeParam", customerCode);

        @SuppressWarnings("unchecked")
        List<Customer> customers = query.getResultList();

        if (customers.size() > 0) {

            customer = customers.get(0);

        }
        System.out.println("customer to modify obtained in dao : "+customer);
        return customer;
    }

    @Override
    public Customer searchCustomerById(int customerId) {
        return null;
    }


    //   ~~~~~~~~~~~~~~************* Delete Particular Customer Details *****************~~~~~~~~~~~~~~
    @Override
    public void deleteCustomer(String customerCode) {
        Customer customer = getCustomerByCode(customerCode);
        sessionFactory.getCurrentSession().delete(customer);

    }


}
