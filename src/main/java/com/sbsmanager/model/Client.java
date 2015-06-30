
package com.sbsmanager.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;

@Entity
public class Client extends Personne implements Serializable {

    private static final long serialVersionUID = 513134381285995165L;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL, mappedBy = "client")
    private List<Devis> contratsList;

    @Column(name = "CLIENT_ENTREPRISE")
    private String entreprise;

    public String getEntreprise() {
	return entreprise;
    }

    public void setEntreprise(String entreprise) {
	this.entreprise = entreprise;
    }

    public List<Devis> getContratsList() {
	return contratsList;
    }

    public void setContratsList(List<Devis> contratsList) {
	this.contratsList = contratsList;
    }

}
