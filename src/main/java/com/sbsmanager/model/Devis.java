package com.sbsmanager.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.sbsmanager.generic.GenericEntity;

@Entity
public class Devis extends GenericEntity implements Serializable {

    private static final long serialVersionUID = 909408253914718578L;

    @Column(name = "DEVIS_TITRE")
    private String titre;

    @Column(name = "DEVIS_DESCRIPTION")
    private String description;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "CLIENT_ID")
    private Client client;

    @Enumerated(EnumType.STRING)
    @Column(name = "DEVIS_STATUT")
    private final EnumDevisStatut statut;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "DEVIS_ID")
    private List<Planification> planificationList;

    public Devis() {
	statut = EnumDevisStatut.EN_COURS;
    }

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

    public Client getClient() {
	return client;
    }

    public void setClient(Client client) {
	this.client = client;
    }

    public EnumDevisStatut getStatut() {
	return statut;
    }

    public List<Planification> getPlanificationList() {
	return planificationList;
    }

    public void setPlanificationList(List<Planification> planificationList) {
	this.planificationList = planificationList;
    }

}
