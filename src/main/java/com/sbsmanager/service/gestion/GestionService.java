
package com.sbsmanager.service.gestion;

import java.util.List;

import com.sbsmanager.model.Client;
import com.sbsmanager.model.Devis;
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
    public void saveClient(Client client);
    
    public List<Client> getClients();
    
    public Client getClient(Long id);

    /** Employe */
    public List<Employe> getEmployeList();

    public Employe getEmploye(Long id);

    public Employe saveEmploye(Employe employe);

    public void removeEmploye(Long id);

    /** Devis */
    public List<Devis> getDevisList();

    public Devis getDevis(Long id);

    public Devis saveDevis(Devis employe);

    public void removeDevis(Long id);

}


