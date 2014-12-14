<%@ include file="../../head/include.jsp" %>
<script type="text/javascript" src="/${ROOT}/resources/js/imageSwap.js"></script> 
<script type="text/javascript" src="/${ROOT}/resources/js/print.js"></script> 


<!-- startEnteteFiche -->
<div id="enteteFiche">
    <!-- startTitleFiche -->
    <p class="b brown fs13 mt5"><c:out value="${rubrique.nom}" /></p>
    <p class="b brown fs13 mt5"><c:out value="${rubrique.description}" /></p>
    <!-- endTitleFiche -->
	
	<c:if test="${empty param['imprimer']}">
	    <!-- startObjects -->
	    <div id="objects">
	    	<a href="#" class="decoration" title="decoration"></a>
	        <a href="#" class="design" title="design"></a>
	        <a href="#" class="architecture" title="architecture"></a>
	        <a href="#" class="art_on" title="art"></a>
	        <a href="#" class="photo" title="photo"></a>
	        
	        <!--
	         Pour mettre � l'�tat "ON" un objet, il suffit de rajouter "_on" derri�re la classe employ�e.
	         Exemple "art" -> "art_on"
	         
	         Autres objets : 
	        
	        <a href="#" class="sculture" title="sculture"></a>
	        <a href="#" class="parfum" title="parfum"></a>
	        <a href="#" class="livre" title="livre"></a>
	        <a href="#" class="peinture" title="peinture"></a>
	        <a href="#" class="jouet" title="jouet"></a>
	        <a href="#" class="lithographie" title="lithographie"></a>
	        <a href="#" class="jardin" title="jardin"></a>
	        <a href="#" class="bijou" title="bijou"></a>
	        <a href="#" class="rangement" title="rangement"></a>
	        <a href="#" class="bureau" title="bureau"></a>
	        <a href="#" class="bureautravail" title="bureautravail"></a>
	        <a href="#" class="maison" title="maison"></a>
	        <a href="#" class="boutique" title="boutique"></a>
	        <a href="#" class="assise" title="assise"></a>
	        <a href="#" class="deco" title="deco"></a>
	        -->
	    </div>
	    <!-- endObjects -->
	    
	    <div id="actionPage">
	    	<a href="#" onclick="javascript:imprime_zone('Imprimer', 'ficheCorps', window.location);" class="imprimer" title="Imprimer"></a>
		</div>
		
	    <!-- startActionPage -->
	    <!--            
	    <div id="actionPage">
	    	<a href="lienModeFiche" class="modefiche" title="Affichage mode Fiche"></a>
	        <a href="lienPageSuivante" class="pagesuivante_on" title="Page suivante"></a>
	        <a href="lienimprimer" class="imprimer" title="Imprimer"></a>
	    </div>
	    -->
	    <!-- endActionPage -->
	
		<!-- startLexique -->
		<div id="lexique" class="brown">
	   		<jsp:include page="../lexique.jsp" />
	   	</div>
	   <!-- endLexique -->
	</c:if>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<!-- startCorpsFiche -->
<div id="ficheCorps">
	<!-- startLeftColumn -->
    <div class="leftColumn">
   		<h1><c:out value="${produit.nom}"/></h1>
		<c:forEach var="image" items="${produit.images}" varStatus="i">
			<c:choose>
				<c:when test="${i.first}">
			        <div class="zoomProduit">
			       		<img id="imgProdFull" style="border:1px; border-style:solid;border-color:#5a2041;" src="/${ROOT}/<c:out value="${image.photo}"/>" width="400" height="400" alt="${produit.nom}" />
			        </div>
			        <c:if test="${not i.last}">
			        	<div class="littleProduit">
			        </c:if>
			    </c:when>
			    <c:when test="${not i.first}">
			        	<a href="#" id="lienp1" onclick="swapImage(document.getElementById('imgProdSmall<c:out value="${image.imgId}"/>_<c:out value='${i.count}'/>'), document.getElementById('imgProdFull'))">
			        		<img id="imgProdSmall<c:out value='${image.imgId}'/>_<c:out value='${i.count}'/>" src="/${ROOT}/<c:out value='${image.vignette}'/>" width="68" height="68" />
			        	</a>
			        <c:if test="${i.last}">
			         	</div>
			    	</c:if>
			    </c:when>
			</c:choose>
        </c:forEach>
        
        <table border="0" cellpadding="0" class="description">
        	<tr>
		        <td class="lib"><spring:message code="designerLabel"/></td>
        		<td class="description"><a href="/${ROOT}<the2D2A:link artiste="${produit.designer}" />" class="lien"><c:out value="${produit.designer.prenom}" />&nbsp;<c:out value="${produit.designer.nom}" /></a></td>
	        </tr>
     	   <tr>
        		<td class="lib"><spring:message code="editeurLabel"/></td>
		        <td class="description"><a href="/${ROOT}<the2D2A:link artiste="${produit.editeur}" />" class="lien"><c:out value="${produit.editeur.prenom}" />&nbsp;<c:out value="${produit.editeur.nom}" /></a></td>
        	</tr>
	        <tr>
		        <td class="lib"><spring:message code="bibliographieLabel"/></td>
		        <td class="description"></td>
	        </tr>
	        <tr>
		        <td class="lib lastLine"><spring:message code="informationLabel"/></td>
		        <td class="description lastLine"><c:out value="${produit.information}" /></td>
	        </tr>
        </table>
    </div>
    <!-- endLeftColumn -->

    <!-- startRightColumn -->
    <div class="rightColumn">
        <table border="0" cellpadding="0" class="description rightcolumnSize" width="420px;">
	        <tr>
		        <td class="lib"><spring:message code="produit.reference"/></td>
		        <td class="description">
			        <c:out value="${produit.reference}" />
			        <c:forEach var="spec" items="${produit.specs}" varStatus="i">
			   			&nbsp;&nbsp;<c:out value="${spec.nom}"/>
			   		</c:forEach>
		        </td>
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.denomination"/></td>
		        <td class="description"><c:out value="${produit.nom}" /></td>
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.description"/></td>
		        <td class="description"><c:out value="${produit.description}" /></td>
	
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.materiaux"/></td>
		        <td class="description"><c:out value="${produit.materiaux}" /></td>
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.dimension"/></td>
		
		        <td class="description"><spring:message code="produit.hauteur"/>&nbsp;<c:out value="${produit.hauteur}" />&nbsp;-&nbsp;<spring:message code="produit.largeur"/>&nbsp;<c:out value="${produit.largeur}" />&nbsp;-&nbsp;<spring:message code="produit.profondeur"/>&nbsp;<c:out value="${produit.profondeur}" />&nbsp;-&nbsp;<spring:message code="produit.diametre"/>&nbsp;<c:out value="${produit.diametre}" /></td>
	        </tr>
	        <tr>
	        <td class="lib"><spring:message code="produit.poids"/></td>
	        <td class="description"><c:out value="${produit.poids}" /></td>
	        </tr>
	
	        <tr>
	        <td class="lib"><spring:message code="produit.coloris"/></td>
	        
	        <td class="description">
		        <c:forEach var="coloris" items="${produit.coloris}" varStatus="i">
		        	<div class="coloris" style="background-image: url('/${ROOT}/<c:out value="${coloris.picto}"/>');" onclick="document.getElementById('idColoris').value=<c:out value="${coloris.colId}"/>;document.getElementById('idColorisLoc').value=<c:out value="${coloris.colId}"/>">
		        	</div>	        
		   		</c:forEach>
		   		<!-- 
	        	<div class="coloris" style="background-color:#ba3c3d;"></div>
	            <div class="coloris" style="background-color:#e89644;"></div>
	            <div class="coloris" style="background-color:#dddddf;"></div>
	             -->
	            </td>
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.annee"/></td>
		        <td class="description"><c:out value="${produit.descAnnee}" /></td>
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.origine"/></td>
		        <td class="description"><c:out value="${produit.pays.nom}" /></td>
	        </tr>
	        <tr>
		        <td class="lib"><spring:message code="produit.signe"/></td>
		        <td class="description"><c:out value="${produit.signeApp}" /></td>
	        </tr>
	        <c:if test="${produit.dispoLoc == 1 || produit.dispoLoc == 3}">
		        <tr>
			        <td class="lib lastLine"><spring:message code="produit.prix"/></td>
			        <td>
			        	<span class="prix"><c:out value="${produit.prixFormate}" /></span>
			        	<c:if test="${produit.dispoLoc == 1 || produit.dispoLoc == 3}">
						    <form name="ajoutPanier" id="ajoutPanier" action="" method="POST" style="display: inline; float:right;">
						   		<%--<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />--%>
						   		<input type="hidden" name="action" value="1" />
						   		<input type="hidden" id="idColoris" name="idColoris" value="" />
						   	</form>
				        	<a class="bouton" style="float:right;" href="#" onclick="document.getElementById('ajoutPanier').submit();" title="<spring:message code="produit.ajoutPanier"/>"><span><span><spring:message code="produit.ajoutPanier"/></span></span></a>
			        	</c:if>
			        </td>
		        </tr>
		    </c:if>
		    <c:if test="${produit.dispoLoc == 2 || produit.dispoLoc == 3}">
		        <tr>
			        <td class="lib lastLine"><spring:message code="produit.prixLoc"/></td>
			        <td>
			        	<span class="prix"><c:out value="${produit.prixLocFormate}" /></span>
			        	<c:if test="${produit.dispoLoc == 2 || produit.dispoLoc == 3}">
			        		&nbsp;&nbsp;
				            <form name="ajoutPanierLocation" id="ajoutPanierLocation" action="" method="POST" style="display: inline;">
					   			<%--<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />--%>
					   			<input type="hidden" name="action" value="2" />
					   			<input type="hidden" id="idColorisLoc" name="idColoris" value="" />
					   		</form>
				        	<a class="bouton" style="float:right;" href="#" onclick="document.getElementById('ajoutPanierLocation').submit();" title="<spring:message code="produit.ajoutPanierLocation"/>"><span><span><spring:message code="produit.ajoutPanierLocation"/></span></span></a>	        
			        	</c:if>
			        </td>
		        </tr>
		    </c:if>
        </table>
        
        <c:if test="${empty param['imprimer']}">
            <!-- startCommentForm -->
	    	<form id="commentaireForm" method="post" action="../sendComment.htm">
	       		<div class="b brown"><spring:message code="produit.formComment"/>
		        	<textarea name="commentaireTxt" id="commentaireTxt" cols="80" rows="4"></textarea>
		            <div class="commentaireEnvoyer">
		            	<a class="bouton" href="#" title="Envoyer" onclick="document.getElementById('commentaireForm').submit();"><span><span><spring:message code="produit.envoyerComment"/></span></span></a>
		            </div>
		            <input type="hidden" name="sendComment" value="sendComment" />
		            <input type="hidden" name="sendCommentReference" value="<c:out value="${produit.reference}"/>" />
		            <input id="commentaireEmail" name="commentaireEmail" value="<c:choose><c:when test="${not empty sessionScope.AUTHENTICATED_MEMBER.login}"><c:out value="${sessionScope.AUTHENTICATED_MEMBER.login}"/></c:when><c:otherwise><spring:message code="produit.insererEmail"/></c:otherwise></c:choose>" type="text"/>
	            </div>
	        </form>
		</c:if>
        
        <div>
        	<c:if test="${not empty commentaireSent}">
				<br /><br /><br /><p class="b magenta fs13 mt5"><spring:message code="produit.commentaire.envoyer"/></p>
			</c:if>
        </div>
        <!-- endCommentForm -->
        
    </div>
	<!-- endRightColumn -->
	
	<c:if test="${empty param['imprimer']}">
	     <p class="XP"></p>
	     <!-- startObjetRapporte -->
	     <div id="objetRapporte">
	     	<h1><spring:message code="produit.objetRapporte"/><span class="brown">[<c:out value="${nbProduit}" />]</span></h1>
		     	<!-- startPager -->
		     	<c:if test="${not empty pager}">
		    		&lt;&nbsp;
		    		<c:if test="${currentPage != 1}">
		    			<form style="display: inline;" name="precedent" action="" method="post">
		    				<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
		    				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
		    				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex-1}"/>" />
		    				<a href="#" onclick="document.precedent.submit();"><spring:message code="previous"/></a>
		    			</form>
		    			<c:if test="${currentPage != nbPages}">&nbsp;&nbsp;</c:if>
		    		</c:if>
		    		<c:if test="${currentPage != nbPages}">
		    			<form style="display: inline;" name="suivant" action="" method="post">
		    				<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
		    				<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
		    				<input type="hidden" name="pageIndex" value="<c:out value="${pageIndex+1}"/>" />
		    				<a href="#" onclick="document.suivant.submit();"><spring:message code="next"/></a>
		    			</form>
		    		</c:if>
		    		&nbsp;&gt;
		    		<spring:message code="page"/>&nbsp;
			    	<c:forEach begin="1" end="${nbPages}" varStatus="v">
			    		<c:choose>
				    		<c:when test="${v.count == currentPage}">
				    			<span style="font-size: 12px;"><c:out value="${v.count}"/></span>
				    		</c:when>
				    		<c:otherwise>
				    			<form style="display: inline;" name="page<c:out value="${v.count}"/>" action="" method="post">
				    			<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
			    					<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
			    					<input type="hidden" name="pageIndex" value="<c:out value="${v.count-1}"/>" />
			    					<a href="#" onclick="document.page<c:out value="${v.count}"/>.submit();"><c:out value="${v.count}"/></a>
			    				</form>
				    		</c:otherwise>
			    		</c:choose>
			    		<c:if test="${not v.last}">-</c:if>
			    	</c:forEach>
		    	</c:if>
		     	<!-- endPager -->
		     	
	        	<div id="slideObjetRapporte">
					<!-- startItemObjetRapporte -->
							
							
					<c:forEach var="produit" items="${produitAssociated}" varStatus="v">    	
				    	<div class="blocObjetRapporte">
			                 <span>
				             	<c:out value="${produit.nom}"/> : <c:out value="${produit.reference}"/>
				                <c:forEach var="spec" items="${produit.specs}" varStatus="i">
						    			<c:if test="${not i.first}">/</c:if>
						    			<c:out value="${spec.abbr}"/>
	 				    		</c:forEach>
			                 </span>
			                 <c:forEach var="image" items="${produit.images}" varStatus="i">
					    			<c:if test="${i.first}">
					    				<a href="/${ROOT}<the2D2A:link produit="${produit}" />">
			                    			<img src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" width="223" height="223" alt="${produit.nom}" />
			                    		</a>
					    			</c:if>
					    	 </c:forEach>
			                 <div class="info">
			                    <img src="/${ROOT}/resources/pic/lexique/designer.png" width="14" height="14" alt="designer" />
			                    <span><a href="/${ROOT}<the2D2A:link artiste="${produit.designer}" />" class="lien"><c:out value="${produit.designer.prenom}" />&nbsp;<c:out value="${produit.designer.nom}" /></a></span>
			             	 </div>
			                  <div class="info">
			                    <img src="/${ROOT}/resources/pic/lexique/editeur.png" width="14" height="14" alt="editeur" />
			                    <span><a href="/${ROOT}<the2D2A:link artiste="${produit.editeur}" />" class="lien"><c:out value="${produit.editeur.prenom}" />&nbsp;<c:out value="${produit.editeur.nom}" /></a></span>
			                 </div>
			                  <div class="info">
			                    <img src="/${ROOT}/resources/pic/lexique/prix.png" width="14" height="14" alt="prix" />
			                    <span><spring:message code="produit.prix"/> :<c:out value="${produit.prixFormate}" /></span>
			                 </div>
			                 <form name="ajoutPanier<c:out value="${produit.proId}"/>" id="ajoutPanier<c:out value="${produit.proId}"/>" action="/${ROOT}/monPanier.htm" method="post">
						   		<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
						   		<input type="hidden" name="action" value="1" />
						   	 </form>
			                 <div class="ficheArticle"><a href="/${ROOT}<the2D2A:link produit="${produit}" />"  class="L"><spring:message code="boutique.ficheArticle"/></a></div>
							 <div class="achatExpress"><a href="#" class="L" onclick="document.getElementById('ajoutPanier<c:out value="${produit.proId}"/>').submit();"><spring:message code="boutique.achatExpress"/></a></div>
			                 <!-- <div class="ajouterAuFavoris"><a href="lienFiche" class="L">Ajouter au favoris</a></div> -->
			   			</div>
				   			
				    	<c:if test="${v.count%4 == 0 || v.last}">
					    	</br>
					    </c:if>
				    </c:forEach>
	    	     	<!-- endItemObjetRapporte -->         	
	         	</div>
		 </div>
	     <!-- endObjetRapporte -->
	</c:if>
     
    <p class="XP"></p>
<!-- endCorpsFiche -->
</div>
