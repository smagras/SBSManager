package com.sbsmanager.gestion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sbsmanager.gestion.service.GestionService;
import com.sbsmanager.model.Transaction;

@Controller
public class TransactionController {

    @Autowired
    private GestionService gestionService;

    @RequestMapping(value = "gestion/transaction/transactionForm", method = RequestMethod.POST)
    public ModelAndView getGestionTransactionDialog() {
	ModelAndView model = new ModelAndView(
		"gestion/transaction/transactionForm");

	Transaction transaction = new Transaction();
	model.addObject("transaction", transaction);

	return model;
    }

}
