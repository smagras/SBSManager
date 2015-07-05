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

import com.sbsmanager.model.Client;
import com.sbsmanager.service.gestion.GestionService;

@Controller
public class PortefeuilleClientController {

    @Autowired
    private GestionService gestionService;

    @RequestMapping(value = "/gestion/portefeuilleclient", method = RequestMethod.GET)
    public ModelAndView vehiculeList() {
	ModelAndView model = new ModelAndView(
		"gestion/portefeuilleclient/clientList");
	model.addObject("clientList", gestionService.getClients());

	return model;
    }

    @RequestMapping(value = "/gestion/portefeuilleclient/client", method = RequestMethod.GET)
    public ModelAndView clientDetail(@RequestParam Long id) {
	ModelAndView model = new ModelAndView(
		"gestion/portefeuilleclient/clientDetail");
	model.addObject("client", gestionService.getClient(id));

	return model;
    }

    @RequestMapping(value = "/gestion/portefeuilleclient/clientgeneralform", method = RequestMethod.POST)
    public ModelAndView clientDetailGeneralForm(@RequestParam Long id) {
	ModelAndView model = new ModelAndView(
		"gestion/portefeuilleclient/clientDetailGeneralForm");
	model.addObject("client", gestionService.getClient(id));

	return model;
    }

    @RequestMapping(value = "/gestion/portefeuilleclient/clientForm", method = RequestMethod.POST)
    public ModelAndView clientForm(
	    @RequestParam(value = "client", required = false) Client client,
	    @RequestParam(required = false) Long id) {
	ModelAndView model = new ModelAndView(
		"gestion/portefeuilleclient/clientForm");

	if (client == null) {
	    client = new Client();
	}
	if (id != null) {
	    client = gestionService.getClient(id);
	}
	model.addObject("client", client);

	return model;
    }

    @RequestMapping(value = "/gestion/portefeuilleclient/saveClient", method = RequestMethod.POST)
    @ResponseBody
    public ModelAndView saveClient(
	    @Valid @ModelAttribute("client") Client client,
	    BindingResult bindingResult) {

	ModelAndView modelAndView = null;
	if (!bindingResult.hasErrors()) {
	    gestionService.saveClient(client);
	} else {
	    modelAndView = clientForm(client, null);
	}
	return modelAndView;

    }

}
