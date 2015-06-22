package com.sbsmanager.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Contrat extends Element implements Serializable {

    private static final long serialVersionUID = 909408253914718578L;

    @Column(name = "CONTRAT_TITRE")
    private String titre;

    @Column(name = "CONTRAT_DESCRIPTION")
    private String description;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CLIENT_ID")
    private Client client;

    public String getTitre() {
	return titre;
    }

    public void setTitre(String titre) {
	this.titre = titre;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

}
