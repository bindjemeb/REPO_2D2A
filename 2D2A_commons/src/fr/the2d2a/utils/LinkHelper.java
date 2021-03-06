package fr.the2d2a.utils;

import java.util.Map;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.web.constants.WebConstants;

public class LinkHelper {

	//private static Logger logger = Logger.getLogger(LinkHelper.class);
	
	public static String createLinkFromRubrique(Map<Integer, Rubrique> AllRubriques, int rubId, String rootContext, String typeRubrique) {
		
		if (typeRubrique.equals("1")) {
			StringBuffer link = new StringBuffer(WebConstants.LINK_BOUTIQUE);
			Integer tmpId = rubId;
			Rubrique tmpRub = null;
			while (tmpId >= 0) {
				tmpRub = AllRubriques.get(tmpId);
				link.insert(0, tmpRub.getFriendlyName()).insert(0, "/");
				tmpId = tmpRub.getRub_rubId();
			}
			
			link.insert(0, rootContext).insert(0, "/");
			
			return link.toString();
		} else if (typeRubrique.equals("3")) {
			StringBuffer link = new StringBuffer();
			Integer tmpId = rubId;
			Rubrique tmpRub = null;
			String firstFriendlyName = null;
			while (tmpId >= 0) {
				tmpRub = AllRubriques.get(tmpId);
				link.insert(0, tmpRub.getFriendlyName()).insert(0, "/");
				tmpId = tmpRub.getRub_rubId();
				firstFriendlyName = tmpRub.getFriendlyName();
			}
			link.insert(0, rootContext).insert(0, "/");
			
			link.append("/");
			
			if (firstFriendlyName.equals(WebConstants.CALENDRIER_EN) || firstFriendlyName.equals(WebConstants.CALENDRIER_FR)) {
				link.append(WebConstants.CALENDRIER_URL);
			} else if (firstFriendlyName.equals(WebConstants.AGENDA_EN) || firstFriendlyName.equals(WebConstants.AGENDA_FR)) {
				link.append(WebConstants.AGENDA_URL);
			} else if (firstFriendlyName.equals(WebConstants.COIN_PRESSE_EN) || firstFriendlyName.equals(WebConstants.COIN_PRESSE_FR)) {
				link.append(WebConstants.COIN_PRESSE_URL);
			} else if (firstFriendlyName.equals(WebConstants.BIBLIOTHEQUE_EN) || firstFriendlyName.equals(WebConstants.BIBLIOTHEQUE_FR)) {
				link.append(WebConstants.BIBLIOTHEQUE_URL);
			} else if (firstFriendlyName.equals(WebConstants.BIBLIOTHEQUE_EN) || firstFriendlyName.equals(WebConstants.BIBLIOTHEQUE_FR)) {
				link.append(WebConstants.BIBLIOTHEQUE_URL);
			} else if (firstFriendlyName.equals(WebConstants.ARCHIVES_EN) || firstFriendlyName.equals(WebConstants.ARCHIVES_FR)) {
				link.append(WebConstants.ARCHIVES_URL);
			}
			
			link.append(WebConstants.LINK_ACTUALITE);
			
			return link.toString();
		} else {
			//TODO : Liens vers services
			return null;
		}
	}
	
	public static String createLinkFromProduit(Map<Integer, Rubrique> AllRubriques, Produit produit, int rubId) {
		
		StringBuffer link = new StringBuffer("/").append(produit.getFriendlyName()).append(WebConstants.LINK_PRODUIT);
		Integer tmpId = rubId;
		Rubrique tmpRub = null;
		while (tmpId >= 0) {
			tmpRub = AllRubriques.get(tmpId);
			if(tmpRub != null) {
				link.insert(0, tmpRub.getFriendlyName()).insert(0, "/");
				tmpId = tmpRub.getRub_rubId();
			}
		}
		
		//logger.debug("Visu link : " + link.toString());
		
		return link.toString();
		
	}
	
	public static String createLinkFromArtiste(Map<Integer, Rubrique> AllRubriques, Artiste artiste, int rubId) {
		
		StringBuffer link = new StringBuffer("/").append(artiste.getPrenom()).append("_").append(artiste.getNom()).append(WebConstants.LINK_ARTISTE);
		Integer tmpId = rubId;
		Rubrique tmpRub = null;
		while (tmpId >= 0) {
			tmpRub = AllRubriques.get(tmpId);
			link.insert(0, tmpRub.getFriendlyName()).insert(0, "/");
			tmpId = tmpRub.getRub_rubId();
		}
		
		//logger.debug("Visu link : " + link.toString());
		
		return link.toString();
		
	}
	
	public static String createLinkFromArtiste(Map<Integer, Rubrique> AllRubriques, Artiste artiste) {
		
		StringBuffer link = new StringBuffer("/"+ WebConstants.ARCHIVES_URL + "/").append(artiste.getPrenom()).append("_").append(artiste.getNom()).append(WebConstants.LINK_ARTISTE);
		
		//logger.debug("Visu link : " + link.toString());
		
		return link.toString();
		
	}
	
}
