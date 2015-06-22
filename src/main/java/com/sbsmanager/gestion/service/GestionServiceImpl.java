package com.sbsmanager.gestion.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sbsmanager.gestion.dao.ClientDAOImpl;
import com.sbsmanager.gestion.dao.TransactionDAOImpl;
import com.sbsmanager.gestion.dao.VehiculeDAOImpl;
import com.sbsmanager.model.Client;
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

}
