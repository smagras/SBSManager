package com.sbsmanager.generic;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;

@MappedSuperclass
public class GenericEntity implements Serializable {

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

}
