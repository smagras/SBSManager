
package com.sbsmanager.gestion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sbsmanager.gestion.dao.ClientDAOImpl;
import com.sbsmanager.gestion.dao.DevisDAOImpl;
import com.sbsmanager.gestion.dao.EmployeDAOImpl;
import com.sbsmanager.gestion.dao.TransactionDAOImpl;
import com.sbsmanager.gestion.dao.VehiculeDAOImpl;
import com.sbsmanager.model.Client;
import com.sbsmanager.model.Devis;
import com.sbsmanager.model.Employe;
import com.sbsmanager.model.Transaction;
import com.sbsmanager.model.Vehicule;

@Service
@Transactional
public class GestionServiceImpl implements GestionService {

    @Autowired
    private VehiculeDAOImpl vehiculeDAOImpl;

    @Autowired
    private TransactionDAOImpl transactionDAOImpl;

    @Autowired
    private ClientDAOImpl clientDAOImpl;

    @Autowired
    private EmployeDAOImpl employeDAOImpl;

    @Autowired
    private DevisDAOImpl devisDAOImpl;

    @Override
    public List<Vehicule> getVehiculesList() {
	return vehiculeDAOImpl.findAll();
    }

    @Override
    public void saveVehicule(Vehicule vehicule) {
	vehiculeDAOImpl.save(vehicule);
    }

    @Override
    public Vehicule getVehicule(Long id) {
	return vehiculeDAOImpl.find(id);
    }

    @Override
    public Transaction saveTransaction(Transaction transaction) {
	return transactionDAOImpl.save(transaction);
    }

    @Override
    public Transaction getTransaction(Long idTransaction) {
	return transactionDAOImpl.find(idTransaction);
    }

    @Override
    public List<Client> getClients() {
	return clientDAOImpl.findAll();
    }
    
    @Override
    public void saveClient(Client client) {
	clientDAOImpl.save(client);
    }
    
    @Override
    public Client getClient(Long id) {
	return clientDAOImpl.find(id);
    }

    @Override
    public List<Employe> getEmployeList() {
	return employeDAOImpl.findAll();
    }

    @Override
    public Employe getEmploye(Long id) {
	return employeDAOImpl.find(id);
    }

    @Override
    public Employe saveEmploye(Employe employe) {
	return employeDAOImpl.save(employe);
    }

    @Override
    public void removeEmploye(Long id) {
	Employe employe = employeDAOImpl.find(id);
	employe.setSalaire(null);
	employeDAOImpl.save(employe);
	employeDAOImpl.remove(id);
    }

    @Override
    public List<Devis> getDevisList() {
	return devisDAOImpl.findAll();
    }

    @Override
    public Devis getDevis(Long id) {
	return devisDAOImpl.find(id);
    }

    @Override
    public Devis saveDevis(Devis employe) {
	return devisDAOImpl.save(employe);
    }

    @Override
    public void removeDevis(Long id) {
	devisDAOImpl.remove(id);

    }

}
