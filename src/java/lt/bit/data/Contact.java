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
public class Contact {
    private static Integer nextId =1;
    private Integer id;
    private String contact;
    private String type;

    public static Integer getNextId() {
        return nextId;
    }

    public static void setNextId(Integer nextId) {
        Contact.nextId = nextId;
    }
    Contact(){
        synchronized(nextId){
            this.id = nextId++;
        }
    }
    Contact(String contact, String type){
        synchronized(nextId){
            this.id = nextId++;
        }
        this.contact = contact;
        this.type = type;
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
        final Contact other = (Contact) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Contact{" + "id=" + id + ", contact=" + contact + ", type=" + type + '}';
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getContact() {
        return contact;
    }

    public String getType() {
        return type;
    }
}
