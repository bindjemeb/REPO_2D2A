package fr.the2d2a.web.taglibs;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

import fr.the2d2a.bean.Artiste;
import fr.the2d2a.bean.Produit;
import fr.the2d2a.bean.Rubrique;
import fr.the2d2a.utils.LinkHelper;
import fr.the2d2a.web.constants.WebConstants;


public class LinkTag extends BodyTagSupport {
	
	private static final long serialVersionUID = -8574066415954605261L;

	//private static Logger logger = Logger.getLogger(LeftMenuTag.class);

	private Artiste artiste = null;
	
	private Produit produit = null;
	
	@SuppressWarnings("unchecked")
	@Override
	public int doStartTag() throws JspException {
		
		//logger.debug("In linkTag");
		
		HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
		String lang = (String)request.getSession().getAttribute(WebConstants.LANGUE);
		Map<Integer, Rubrique> mapRubriques = (Map<Integer, Rubrique>) ((HttpServletRequest)request).getSession().getAttribute(WebConstants.MENU_ + WebConstants.MAP_ + lang);
		
		if (artiste != null) {
			String link = LinkHelper.createLinkFromArtiste(mapRubriques, artiste);
			PrintWriter out = new PrintWriter(pageContext.getOut());
			out.print(link);
			out.flush();
			
		} else if (produit != null) {
			String link = LinkHelper.createLinkFromProduit(mapRubriques, produit, Integer.parseInt(produit.getRubId()));
			PrintWriter out = new PrintWriter(pageContext.getOut());
			out.print(link);
			out.flush();
			
			
			
		}
		
		return SKIP_BODY;
	}

	public void setArtiste(Artiste artiste) {
		this.artiste = artiste;
	}

	public void setProduit(Produit produit) {
		this.produit = produit;
	}
	
	
}