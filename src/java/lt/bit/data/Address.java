/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lt.bit.data;

import java.util.Objects;

/**
 *
 * @author Sars
 */
public class Address {
   private static Integer nextId =1;
   private Integer id;
   private String address;
   private String city;
   private String postcode;
   
   Address(){
       synchronized(nextId){
            this.id = nextId++;
        }
   }
   Address(String address, String city, String postcode){
       synchronized(nextId){
            this.id = nextId++;
        }
       this.address = address;
       this.city = city;
       this.postcode = postcode;
       
   }

    @Override
    public String toString() {
        return "Address{" + "address=" + address + ", city=" + city + ", postcode=" + postcode + '}';
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
        final Address other = (Address) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getAddress() {
        return address;
    }

    public String getCity() {
        return city;
    }

    public String getPostcode() {
        return postcode;
    }
}
