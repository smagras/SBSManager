package com.sbsmanager.generic;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

import org.apache.commons.beanutils.BeanUtilsBean;

@MappedSuperclass
public class GenericEntity extends BeanUtilsBean implements Serializable {

    private static final long serialVersionUID = 6084331548356324351L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "IDENTIFIANT")
    private Long identifiant;

    public Long getIdentifiant() {
	return identifiant;

    }

    public void setIdentifiant(Long identifiant) {
	this.identifiant = identifiant;
    }

    @Override
    public void copyProperty(Object dest, String name, Object value)
	    throws IllegalAccessException, InvocationTargetException {
	if (value == null)
	    return;
	super.copyProperty(dest, name, value);
    }

    public void copyNotNullField(GenericEntity objetToCopy) {
	try {
	    this.copyProperties(this, objetToCopy);
	} catch (IllegalAccessException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	} catch (InvocationTargetException e) {
	    // TODO Auto-generated catch block
	    e.printStackTrace();
	}
    }

}
