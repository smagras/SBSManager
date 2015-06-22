package com.sbsmanager.gestion.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sbsmanager.gestion.service.GestionService;
import com.sbsmanager.model.Transaction;
import com.sbsmanager.model.Vehicule;

@Controller
public class ParcAutomobileController {

    @Autowired
    private GestionService gestionService;

    @RequestMapping(value = "/gestion/parcautomobile", method = RequestMethod.GET)
    public ModelAndView vehiculeList() {
	ModelAndView model = new ModelAndView(
		"gestion/parcautomobile/vehiculeList");
	model.addObject("listVehicules", gestionService.getVehiculesList());

	return model;
    }

    @RequestMapping(value = "/gestion/parcautomobile/vehicule", method = RequestMethod.GET)
    public ModelAndView factureList(@RequestParam Long id) {
	ModelAndView model = new ModelAndView(
		"gestion/parcautomobile/factureList");
	model.addObject("vehicule", gestionService.getVehicule(id));

	return model;
    }

    @RequestMapping(value = "/gestion/parcautomobile/saveFacture", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveFacture(
	    @ModelAttribute(value = "transaction") Transaction transaction,
	    @RequestParam(value = "idVehicule", required = false) Long idVehicule) {
	ModelAndView model = null;

	Vehicule vehicule = gestionService.getVehicule(idVehicule);

	transaction.setSource(vehicule);
	gestionService.saveTransaction(transaction);

	return model;
    }

    @RequestMapping(value = "/gestion/parcautomobile/vehiculeForm", method = RequestMethod.POST)
    public ModelAndView vehiculeForm(
	    @RequestParam(value = "vehicule", required = false) Vehicule vehicule,
	    @RequestParam(required = false) Long id) {
	ModelAndView model = new ModelAndView(
		"gestion/parcautomobile/vehiculeForm");

	if (vehicule == null) {
	    vehicule = new Vehicule();
	}
	if (id != null) {
	    vehicule = gestionService.getVehicule(id);
	}
	model.addObject("vehicule", vehicule);

	return model;
    }

    @RequestMapping(value = "/gestion/parcautomobile/saveVehicule", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveVehicule(
	    @Valid @ModelAttribute("vehicule") Vehicule vehicule,
	    BindingResult bindingResult) {

	ModelAndView modelAndView = null;
	if (!bindingResult.hasErrors()) {
	    gestionService.saveVehicule(vehicule);
	} else {
	    modelAndView = vehiculeForm(vehicule, null);
	}
	return modelAndView;

    }

}
