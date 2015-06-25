package com.sbsmanager.gestion.service;

import java.util.List;

import com.sbsmanager.model.Client;
import com.sbsmanager.model.Employe;
import com.sbsmanager.model.Transaction;
import com.sbsmanager.model.Vehicule;

public interface GestionService {

    /** Vehicules */
    public void saveVehicule(Vehicule vehicule);

    public List<Vehicule> getVehiculesList();

    public Vehicule getVehicule(Long id);

    /** Transactions */
    public Transaction saveTransaction(Transaction transaction);

    public Transaction getTransaction(Long idTransaction);

    /** Clients */
    public List<Client> getClients();

    /** Employe */
    public List<Employe> getEmployeList();

    public Employe getEmploye(Long id);

    public Employe saveEmploye(Employe employe);

    public void removeEmploye(Long id);

}
