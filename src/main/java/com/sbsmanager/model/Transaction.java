package com.sbsmanager.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;

import com.sbsmanager.generic.GenericEntity;

@Entity
public class Transaction extends GenericEntity implements Serializable {

    private static final long serialVersionUID = 3823290827355050544L;

    @Column(name = "TRANSACTION_VALEUR")
    private Float valeur;

    @Column(name = "TRANSACTION_DESCRIPTION")
    private String description;

    @Column(name = "TRANSACTION_DATE")
    private Date date;

    @Column(name = "TRANSACTION_NBDEPAIMENT")
    private Integer nombreDePaiment;

    @Column(name = "TRANSACTION_TAUX")
    private Float taux;

    public Date getDate() {
	return date;
    }

    public void setDate(Date date) {
	this.date = date;
    }

    public Float getValeur() {
	return valeur;
    }

    public void setValeur(Float valeur) {
	this.valeur = valeur;
    }

    public Integer getNombreDePaiment() {
	return nombreDePaiment;
    }

    public void setNombreDePaiment(Integer nombreDePayment) {
	this.nombreDePaiment = nombreDePayment;
    }

    public String getDescription() {
	return description;
    }

    public void setDescription(String description) {
	this.description = description;
    }

    public Float getTaux() {
	return taux;
    }

    public void setTaux(Float taux) {
	this.taux = taux;
    }

}
