package com.sbsmanager.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

@Entity
public class Employe extends Personne implements Serializable {

    private static final long serialVersionUID = 596203818886563479L;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "EMPLOYE_ID")
    private List<Transaction> salaire;

    @Column(name = "EMPLOYE_COMPTEBANCAIRE")
    private String compteBancaire;

    public List<Transaction> getSalaire() {
	return salaire;
    }

    public void setSalaire(List<Transaction> salaire) {
	this.salaire = salaire;
    }

    public String getCompteBancaire() {
	return compteBancaire;
    }

    public void setCompteBancaire(String compteBancaire) {
	this.compteBancaire = compteBancaire;
    }

}
