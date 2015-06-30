package com.sbsmanager.gestion.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sbsmanager.gestion.service.GestionService;

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

}
