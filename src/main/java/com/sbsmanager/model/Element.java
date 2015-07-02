package com.sbsmanager.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;

@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Element implements Serializable {

    private static final long serialVersionUID = 6084331548356324351L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ELEMENT_ID")
    private Long identifiant;

    public Long getIdentifiant() {
	return identifiant;
    }

    public void setIdentifiant(Long identifiant) {
	this.identifiant = identifiant;
    }

}
