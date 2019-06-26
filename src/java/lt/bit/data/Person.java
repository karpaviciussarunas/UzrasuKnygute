/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Objects;

/**
 *
 * @author Sars
 */
public class Person {
// nextId turi buti 1
    private static Integer nextId = 1;
    private Integer id;
    private String firstName;
    private String lastName;
    private Date birthDate;
    private BigDecimal salary;
    private List<Address> addresses;
    private List<Contact> contacts;

    public Person() {
        synchronized (nextId) {
            this.id = nextId++;
        }
        this.addresses = new ArrayList();
        this.contacts = new ArrayList();
    }

    public Person(String firstName, String lastName, Date birthDate, BigDecimal salary) {
        synchronized (nextId) {
            this.id = nextId++;
        }
        this.addresses = new ArrayList();
        this.contacts = new ArrayList();
           this.firstName = firstName;
           this.lastName = lastName;
           this.birthDate = birthDate;
           this.salary = salary;
    }
//test
     public Person(String firstName, String lastName) {
        synchronized (nextId) {
            this.id = nextId++;
        }
        this.addresses = new ArrayList();
        this.contacts = new ArrayList();
           this.firstName = firstName;
           this.lastName = lastName;

    }
    
    
    Person(String tomas, String tomilinas, double d) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    
    @Override
    public String toString() {
        return "Person{" + "id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", birthDate=" + birthDate + ", salary=" + salary + '}';
    }

    
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Person other = (Person) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    public List<Address> getAddress() {
        return addresses;
    }

    public static Integer getNextId() {
        return nextId;
    }

    public static void setNextId(Integer nextId) {
        Person.nextId = nextId;
    }

    public void setAddress(List<Address> address) {
        this.addresses = address;
    }

    public List<Contact> getContacts() {
        return contacts;
    }

    public void setContacts(List<Contact> contacts) {
        this.contacts = contacts;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public void setBirthDate(Date birthDate) {
        this.birthDate = birthDate;
    }

    public void setSalary(BigDecimal salary) {
        this.salary = salary;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public Date getBirthDate() {
        return birthDate;
    }

    public BigDecimal getSalary() {
        return salary;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<Address> getAddresses() {
        return addresses;
    }

    public void setAddresses(List<Address> addresses) {
        this.addresses = addresses;
    }

    private void Synchronized(Integer nextId) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
