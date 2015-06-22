package com.sbsmanager.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class Transaction implements Serializable {

    private static final long serialVersionUID = 3823290827355050544L;

    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "SOURCE_ID")
    private Element source;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TRANSACTION_ID")
    private Long identifiant;

    @Column(name = "TRANSACTION_VALEUR")
    private Float valeur;

    @Column(name = "TRANSACTION_DESCRIPTION")
    private String description;

    @Column(name = "TRANSACTION_DATE")
    private Date date;

    @Column(name = "TRANSACTION_NBDEPAIMENT")
    private Integer nombreDePaiment;

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

    public Element getSource() {
	return source;
    }

    public void setSource(Element source) {
	this.source = source;
    }

    public Long getIdentifiant() {
	return identifiant;
    }

    public void setIdentifiant(Long identifiant) {
	this.identifiant = identifiant;
    }

}
