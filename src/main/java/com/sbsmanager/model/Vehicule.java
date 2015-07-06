package com.sbsmanager.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;

import com.sbsmanager.generic.GenericEntity;

@Entity
public class Vehicule extends GenericEntity implements Serializable {

    private static final long serialVersionUID = -719107461658755921L;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "VEHICULE_ID")
    private List<Transaction> facturesList;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "VEHICULE_ID")
    private List<FicheVehicule> fichesVehiculeList;

    @Column(name = "VEHICULE_IMMATRCIULATION")
    @NotBlank
    private String immatriculation;

    @Column(name = "VEHICULE_CAPACITE")
    @NotNull
    private Integer capacite;

    @Column(name = "VEHICULE_MODELE")
    @NotBlank
    private String modele;

    @Column(name = "VEHICULE_MARQUE")
    @NotBlank
    private String marque;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "TRANSACTION_ID")
    private Transaction achat;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "VEHICULE_ID")
    private List<Transaction> emprunt;

    public List<Transaction> getFacturesList() {
	return facturesList;
    }

    public void setFacturesList(List<Transaction> facturesList) {
	this.facturesList = facturesList;
    }

    public String getImmatriculation() {
	return immatriculation;
    }

    public void setImmatriculation(String immatriculation) {
	this.immatriculation = immatriculation;
    }

    public Integer getCapacite() {
	return capacite;
    }

    public void setCapacite(Integer capacite) {
	this.capacite = capacite;
    }

    public String getMarque() {
	return marque;
    }

    public void setMarque(String marque) {
	this.marque = marque;
    }

    public String getModele() {
	return modele;
    }

    public void setModele(String modele) {
	this.modele = modele;
    }

    public List<FicheVehicule> getFichesVehiculeList() {
	return fichesVehiculeList;
    }

    public void setFichesVehiculeList(List<FicheVehicule> fichesVehiculeList) {
	this.fichesVehiculeList = fichesVehiculeList;
    }

    public Transaction getAchat() {
	return achat;
    }

    public void setAchat(Transaction achat) {
	this.achat = achat;
    }

    public List<Transaction> getEmprunt() {
	return emprunt;
    }

    public void setEmprunt(List<Transaction> emprunt) {
	this.emprunt = emprunt;
    }

}
