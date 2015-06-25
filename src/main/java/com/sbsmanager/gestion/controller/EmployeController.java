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
import com.sbsmanager.model.Employe;

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
