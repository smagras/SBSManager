package com.sbsmanager.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

import com.sbsmanager.generic.GenericEntity;

@Entity
public class Planification extends GenericEntity implements Serializable {

    private static final long serialVersionUID = 3610922743542024963L;

    @Column(name = "PLANIFICATION_DATEDEBUT")
    private Date dateDebut;

    @Column(name = "PLANIFICATION_DATEFIN")
    private Date dateFin;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Vehicule vehicule;

    @Column(name = "PLANIFICATION_NOMBREDEPASSAGER")
    private Integer nombreDePassagers;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Employe chauffeur;

    @Column(name = "PLANIFICATION_COUTHORAIRE")
    private Float coutHoraire;

    public Date getDateDebut() {
	return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
	this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
	return dateFin;
    }

    public void setDateFin(Date dateFin) {
	this.dateFin = dateFin;
    }

    public Vehicule getVehicule() {
	return vehicule;
    }

    public void setVehicule(Vehicule vehicule) {
	this.vehicule = vehicule;
    }

    public Integer getNombreDePassagers() {
	return nombreDePassagers;
    }

    public void setNombreDePassagers(Integer nombreDePassagers) {
	this.nombreDePassagers = nombreDePassagers;
    }

    public Employe getChauffeur() {
	return chauffeur;
    }

    public void setChauffeur(Employe chauffeur) {
	this.chauffeur = chauffeur;
    }

    public Float getCoutHoraire() {
	return coutHoraire;
    }

    public void setCoutHoraire(Float coutHoraire) {
	this.coutHoraire = coutHoraire;
    }

}
