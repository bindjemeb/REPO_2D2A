<%@ include file="../../head/include.jsp" %>

<c:set var="accueil" value="${ACCUEIL}"/>

<!-- startEnteteFiche -->
<div id="enteteFiche">

   	<!-- startTitleFiche -->
	<p class="brown fs13 mt5"><strong><c:out value="${DATE_TODAY}"/></strong> - <c:out value="${accueil.titreAccueil}"/></p>
	<!-- endTitleFiche -->
	
	<div id="objects">
		<c:forEach var="acc" items="${accueils}">
			<a href="/${ROOT}/${acc.friendlyName}/accueil.htm" class="<c:out value='${acc.logoAccueil}'/><c:if test='${acc.accId == accueil.accId}'>_on</c:if>" title="<c:out value='${acc.logoAccueil}'/>"></a>
		</c:forEach>
   </div>
               
	<!-- startLexique -->
   <div id="lexique" class="brown">
   		<jsp:include page="../lexique.jsp" />
   </div>
</div>
<!-- endLexique -->
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->
   
<!-- startCorpsFiche -->
<div id="ficheCorps">
	<h1><c:out value="${accueil.titreAccueil}"/></h1>
	<div class="blockAccueil">
		<div>
			<img src="/${ROOT}/<c:out value="${accueil.imageAccueil}"/>"  alt="accueil" />
		</div>
		<p>
			<c:out value="${accueil.texteAccueil}" escapeXml="false"/>
		</p>
	</div>
	<p class="XP"></p>

	<!-- startObjetRapporte -->

	<div id="objetRapporte">
		<form id="accueil_formNouveaute" method="post" action="" style="display: inline;">	
			<a href="#" class="accueil nouveaute" <c:if test="${nouveaute == '1'}">onclick="document.getElementById('accueil_formNouveaute').submit();" </c:if> >
				<spring:message code="accueil.nouveautes"/>
			</a>
			<span class="brown mr20">[<c:out value="${nbNouveaute}"/>]</span>
			<input type="hidden" name="accId" value="<c:out value='${accueil.accId}'/>" />
			<input type="hidden" name="nouveaute" value="0"/>
		</form>
        <form id="accueil_formCoupCoeur" method="post" action="" style="display: inline;">
			<a href="#" class="accueil coupDeCoeur" <c:if test="${nouveaute == '0'}">onclick="document.getElementById('accueil_formCoupCoeur').submit();" </c:if> > 
				<spring:message code="accueil.coupDeCoeur"/>
			</a>
			<span class="brown">[<c:out value="${nbCoupCoeur}"/>]</span>
			<input type="hidden" name="accId" value="<c:out value='${accueil.accId}'/>" />
			<input type="hidden" name="nouveaute" value="1"/>
		</form>
         
		<!-- startItemObjetRapporte -->
		<c:choose>
			<c:when test="${nouveaute == '0'}">
				<c:forEach var="produit" items="${nouveautes}" varStatus="i">
					<c:if test="${i.index%4 == 0}">
						<div id="slideObjetRapporte">
					</c:if>
						<div class="blocObjetRapporte">
		                    <span><c:out value="${produit.nom}"/></span>
		
		                    <a href="/${ROOT}<the2D2A:link produit="${produit}" />">
		                    	<img src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" width="223" height="223" alt="<c:out value="${produit.nom}"/>"/>
		                    </a>
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
		                       <span><spring:message code="produit.prix"/> : <c:out value="${produit.prixFormate}"/></span>
		                    </div>
							<div class="descriptionBouton">
						        <form id="ajoutPanier<c:out value="${produit.proId}"/>" action="/${ROOT}/monPanier.htm" method="post">
						   			<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
						   			<input type="hidden" name="action" value="1" />
						   		</form>
				        	</div>
							<div class="ficheArticle"><a href="/${ROOT}<the2D2A:link produit="${produit}" />" class="L"><spring:message code="boutique.ficheArticle"/></a></div>
							<div class="achatExpress"><a href="#" class="L" onclick="document.getElementById('ajoutPanier<c:out value="${produit.proId}"/>').submit();"><spring:message code="boutique.achatExpress"/></a></div>
		      			</div>
		      		<c:if test="${i.index%4 == 3}">
		      			</div>
		      		</c:if>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<c:forEach var="produit" items="${coupCoeurs}" varStatus="i">
					<c:if test="${i.index%4 == 0}">
						<div id="slideObjetRapporte">
					</c:if>
						<div class="blocObjetRapporte">
		                    <span><c:out value="${produit.nom}"/></span>
		
		                    <a href="lienProduit"><img src="/${ROOT}/<c:out value="${produit.images[0].vignette}"/>" width="223" height="223" /></a>
		                    <div class="info">
		                       <img src="/${ROOT}/resources/pic/lexique/designer.png" width="14" height="14" alt="designer" />
		                       <span><a href="/${ROOT}<the2D2A:link artiste="${produit.designer}" />" class="lien"><c:out value="${produit.designer.nom}" />&nbsp;<c:out value="${produit.designer.prenom}" /></a></span>
		                	 </div>
		
		                    <div class="info">
		                       <img src="/${ROOT}/resources/pic/lexique/editeur.png" width="14" height="14" alt="editeur" />
		                       <span><a href="/${ROOT}<the2D2A:link artiste="${produit.editeur}" />" class="lien"><c:out value="${produit.editeur.nom}" />&nbsp;<c:out value="${produit.editeur.prenom}" /></a></span>
		                    </div>
		
		                    <div class="info">
		                       <img src="/${ROOT}/resources/pic/lexique/prix.png" width="14" height="14" alt="prix" />
		                       <span><spring:message code="produit.prix"/> : <c:out value="${produit.prixFormate}"/></span>
		                    </div>
		                    <div class="descriptionBouton">
						        <form id="ajoutPanier<c:out value="${produit.proId}"/>" action="/${ROOT}/monPanier.htm" method="post">
						   			<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
						   			<input type="hidden" name="action" value="1" />
						   		</form>
						   		<form id="produit<c:out value="${produit.proId}"/>" action="./produit.htm" method="post">
			    					<input type="hidden" name="rubrique" value="<c:out value="${rubrique.rubId}"/>" />
			    					<input type="hidden" name="idProduit" value="<c:out value="${produit.proId}"/>" />
			    					<input type="hidden" name="pageIndex" value="<c:out value="0"/>" />
			    				</form>
				        	</div>
							<div class="ficheArticle"><a href="/${ROOT}<the2D2A:link produit="${produit}" />" class="L"><spring:message code="boutique.ficheArticle"/></a></div>
							<div class="achatExpress"><a href="#" class="L" onclick="document.getElementById('ajoutPanier<c:out value="${produit.proId}"/>').submit();"><spring:message code="boutique.achatExpress"/></a></div>
		      			</div>
		      		<c:if test="${i.index%4 == 3}">
		      			</div>
		      		</c:if>
				</c:forEach>
			</c:otherwise>
		</c:choose>
   		<!-- endItemObjetRapporte -->     
    </div>
    <!-- endObjetRapporte -->
	<p class="XP"></p>

	<!-- start Partenaire -->		
    <table class="accueilLiens">
		<thead>
			<tr>
				<th><spring:message code="accueil.partenaires"/></th>
				<th><spring:message code="accueil.parrains"/></th>
				<th><spring:message code="accueil.liens"/></th>
			</tr>
		</thead>
        <tfoot>
			<tr>
				<td colspan="3"></td>
			</tr>
		</tfoot>
		<tr>
			<td>
				<c:forEach var="i" begin="1" end="10" step="1">
					<c:set var="lien">
						<spring:message code="accueil.partenaires.lien${i}"/>
					</c:set>
					<c:if test="${not empty lien}">
						<br /><a href="<spring:message code="accueil.partenaires.lien${i}"/>" target="_blank"><spring:message code="accueil.partenaires.text${i}"/></a>
					</c:if>
					<c:remove var="lien"/>
				</c:forEach>
			</td>
			<td>
				<c:forEach var="i" begin="1" end="10" step="1">
					<c:set var="lien">
						<spring:message code="accueil.parrains.lien${i}"/>
					</c:set>
					<c:if test="${not empty lien}">
						<br /><a href="<spring:message code="accueil.parrains.lien${i}"/>" target="_blank"><spring:message code="accueil.parrains.text${i}"/></a>
					</c:if>
					<c:remove var="lien"/>
				</c:forEach>
			</td>
			<td>
				<c:forEach var="i" begin="1" end="10" step="1">
					<c:set var="lien">
						<spring:message code="accueil.liens.lien${i}"/>
					</c:set>
					<c:if test="${not empty lien}">
						<br /><a href="<spring:message code="accueil.liens.lien${i}"/>" target="_blank"><spring:message code="accueil.liens.text${i}"/></a>
					</c:if>
					<c:remove var="lien"/>
				</c:forEach>
			</td>
		</tr>
	</table>
	<!-- end Partenaire -->
</div>
<!-- endCorpsFiche -->   
