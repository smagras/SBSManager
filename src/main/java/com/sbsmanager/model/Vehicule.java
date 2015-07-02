package com.sbsmanager.model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
public class Vehicule extends Element implements Serializable {

    private static final long serialVersionUID = -719107461658755921L;

    @OneToMany(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JoinColumn(name = "VEHICULE_ID")
    private List<Transaction> facturesList;

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

    @Column(name = "VEHICULE_DATEACHAT")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    @NotNull
    private Date dateAchat;

    @Column(name = "VEHICULE_DATEREVISION")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dateRevision;

    @Column(name = "VEHICULE_DATEASSURANCE")
    @DateTimeFormat(pattern = "dd/MM/yyyy")
    private Date dateAssurance;

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

    public Date getDateAchat() {
	return dateAchat;
    }

    public void setDateAchat(Date dateAchat) {
	this.dateAchat = dateAchat;
    }

    public Date getDateRevision() {
	return dateRevision;
    }

    public void setDateRevision(Date dateRevision) {
	this.dateRevision = dateRevision;
    }

    public Date getDateAssurance() {
	return dateAssurance;
    }

    public void setDateAssurance(Date dateAssurance) {
	this.dateAssurance = dateAssurance;
    }

    public String getModele() {
	return modele;
    }

    public void setModele(String modele) {
	this.modele = modele;
    }

}
