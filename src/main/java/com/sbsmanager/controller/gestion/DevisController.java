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

import com.sbsmanager.model.Devis;
import com.sbsmanager.service.gestion.GestionService;

// Employe
@Controller
public class DevisController {

    @Autowired
    private GestionService gestionService;

    @RequestMapping(value = "/gestion/devis", method = RequestMethod.GET)
    public ModelAndView deivsList() {
	ModelAndView model = new ModelAndView("gestion/devis/devisList");
	model.addObject("listDevis", gestionService.getDevisList());

	return model;
    }

    @RequestMapping(value = "/gestion/devis/detail", method = RequestMethod.GET)
    public ModelAndView devisDetailForm(
	    @RequestParam(value = "devis", required = false) Devis devis,
	    @RequestParam(required = false) Long id) {
	ModelAndView model = new ModelAndView("gestion/devis/devisDetailForm");

	if (id != null) {
	    devis = gestionService.getDevis(id);
	}
	model.addObject("devis", devis);

	return model;
    }

    @RequestMapping(value = "/gestion/devis/devisForm", method = RequestMethod.POST)
    public ModelAndView devisForm(
	    @RequestParam(value = "devis", required = false) Devis devis,
	    @RequestParam(required = false) Long id) {
	ModelAndView model = new ModelAndView("gestion/devis/devisForm");

	if (devis == null) {
	    devis = new Devis();
	}
	if (id != null) {
	    devis = gestionService.getDevis(id);
	}
	model.addObject("devis", devis);

	return model;
    }

    @RequestMapping(value = "/gestion/devis/saveDevis", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveEmploye(
	    @Valid @ModelAttribute("employe") Devis devis,
	    BindingResult bindingResult) {

	ModelAndView modelAndView = null;
	if (!bindingResult.hasErrors()) {
	    gestionService.saveDevis(devis);
	} else {
	    modelAndView = devisForm(devis, null);
	}
	return modelAndView;

    }

    @RequestMapping(value = "/gestion/devis/removeDevis", method = RequestMethod.POST)
    @ResponseBody
    public void removeDevis(@RequestParam Long id) {

	gestionService.removeDevis(id);

    }

}
