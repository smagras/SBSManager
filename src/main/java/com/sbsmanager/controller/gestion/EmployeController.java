package com.sbsmanager.controller.gestion;

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

import com.sbsmanager.model.Employe;
import com.sbsmanager.model.Transaction;
import com.sbsmanager.service.gestion.GestionService;

// Employe
@Controller
public class EmployeController {

    @Autowired
    private GestionService gestionService;

    @RequestMapping(value = "/gestion/employe", method = RequestMethod.GET)
    public ModelAndView vehiculeList() {
	ModelAndView model = new ModelAndView("gestion/employe/employeList");
	model.addObject("listEmployes", gestionService.getEmployeList());

	return model;
    }

    @RequestMapping(value = "/gestion/employe/salaire", method = RequestMethod.GET)
    public ModelAndView salaireList(@RequestParam Long id) {
	ModelAndView model = new ModelAndView("gestion/employe/salaireList");
	model.addObject("employe", gestionService.getEmploye(id));

	return model;
    }

    @RequestMapping(value = "/gestion/employe/saveSalaire", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveFacture(
	    @ModelAttribute(value = "transaction") Transaction transaction,
	    @RequestParam(value = "idEmploye", required = false) Long idEmploye) {
	ModelAndView model = null;

	Employe employe = gestionService.getEmploye(idEmploye);

	employe.getSalaire().add(transaction);

	gestionService.saveEmploye(employe);

	return model;
    }

    @RequestMapping(value = "/gestion/employe/employeForm", method = RequestMethod.POST)
    public ModelAndView employeForm(
	    @RequestParam(value = "employe", required = false) Employe employe,
	    @RequestParam(required = false) Long id) {
	ModelAndView model = new ModelAndView("gestion/employe/employeForm");

	if (employe == null) {
	    employe = new Employe();
	}
	if (id != null) {
	    employe = gestionService.getEmploye(id);
	}
	model.addObject("employe", employe);

	return model;
    }

    @RequestMapping(value = "/gestion/employe/saveEmploye", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveEmploye(
	    @Valid @ModelAttribute("employe") Employe employe,
	    BindingResult bindingResult) {

	ModelAndView modelAndView = null;
	if (!bindingResult.hasErrors()) {
	    gestionService.saveEmploye(employe);
	} else {
	    modelAndView = employeForm(employe, null);
	}
	return modelAndView;

    }

    @RequestMapping(value = "/gestion/employe/removeEmploye", method = RequestMethod.POST)
    @ResponseBody
    public void removeVehicule(@RequestParam Long id) {

	gestionService.removeEmploye(id);

    }

}
