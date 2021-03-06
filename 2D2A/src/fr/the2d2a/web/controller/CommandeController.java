package fr.the2d2a.web.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

import fr.the2d2a.bean.Commande;
import fr.the2d2a.bean.CommandeOuvrage;
import fr.the2d2a.bean.CommandeProduit;
import fr.the2d2a.bean.Membre;
import fr.the2d2a.bean.Ouvrage;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.service.CommandeService;
import fr.the2d2a.service.OuvrageService;
import fr.the2d2a.service.ProduitService;
import fr.the2d2a.web.constants.WebConstants;

public class CommandeController implements Controller {
	
	protected static Logger logger = Logger.getLogger(CommandeController.class);
	
	private CommandeService commandeService;
	private ProduitService produitService;
	private OuvrageService ouvrageService;

	public ModelAndView handleRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.debug("In handleRequest CommandeController...");
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		String idCommande = request.getParameter("idCommande");
		
		logger.debug("IdCommande : " + idCommande);
		
		Membre membre = (Membre) request.getSession().getAttribute(WebConstants.AUTHENTICATED_MEMBER);
		model.put("membre", membre);
		String lang = (String) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.LANGUE);
		
		Commande maCommande = commandeService.getCommandeById(idCommande);
		model.put("maCommande", maCommande);
		
		for (CommandeProduit cmd : maCommande.getProduits()) {
			int proId = cmd.getProId();
			logger.debug("Récupéation du produit : " + proId + " en " + lang);
			Produit prod = produitService.getProduitById(lang, String.valueOf(proId));
			cmd.setProduit(prod);
		}
		
		for (CommandeOuvrage cmd : maCommande.getOuvrages()) {
			int ouvId = cmd.getOuvId();
			logger.debug("Récupéation du ouvrage : " + ouvId + " en " + lang);
			Ouvrage ouv = ouvrageService.getOuvrageById(String.valueOf(ouvId), lang);
			cmd.setOuvrage(ouv);
		}
		
		logger.debug("Visu de la commande : " + ToStringBuilder.reflectionToString(maCommande));
		
		return new ModelAndView("detailCommande", model);
	}


	public void setCommandeService(CommandeService commandeService) {
		this.commandeService = commandeService;
	}


	public void setProduitService(ProduitService produitService) {
		this.produitService = produitService;
	}


	public void setOuvrageService(OuvrageService presseService) {
		this.ouvrageService = presseService;
	}

}
