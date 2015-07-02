package com.sbsmanager.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToOne;

import com.sbsmanager.generic.GenericEntity;

@Entity
public class FicheVehicule extends GenericEntity implements Serializable {

    private static final long serialVersionUID = -6936890454780420569L;

    @OneToOne(fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    private Vehicule vehicule;

}
