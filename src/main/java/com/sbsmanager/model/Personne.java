package com.sbsmanager.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import com.sbsmanager.generic.GenericEntity;

@MappedSuperclass
public class Personne extends GenericEntity implements Serializable {

    private static final long serialVersionUID = 9052021788522223174L;

    @Column(name = "PERSONNE_NOM")
    private String nom;

    @Column(name = "PERSONNE_PRENOM")
    private String prenom;

    @Column(name = "PERSONNE_ADRESSE")
    private String adresse;

    @Column(name = "PERSONNE_TELEPHONE")
    private String telephone;

    @Column(name = "PERSONNE_EMAIL")
    private String email;

    public String getNom() {
	return nom;
    }

    public void setNom(String nom) {
	this.nom = nom;
    }

    public String getPrenom() {
	return prenom;
    }

    public void setPrenom(String prenom) {
	this.prenom = prenom;
    }

    public String getAdresse() {
	return adresse;
    }

    public void setAdresse(String adresse) {
	this.adresse = adresse;
    }

    public String getTelephone() {
	return telephone;
    }

    public void setTelephone(String telephone) {
	this.telephone = telephone;
    }

    public String getEmail() {
	return email;
    }

    public void setEmail(String email) {
	this.email = email;
    }

}
