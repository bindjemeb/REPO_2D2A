<%@ include file="../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->
	<p class="b brown fs13 mt5">Gestion des Sp�cificit�s produit</p>
	<!-- endTitleFiche -->
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="ficheCorps">	
	<table class="formulaire">
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<col class="col1_Back"/>
		<tr>
			<th>Nom fran�ais</th>
			<th>Abbr�viation (FR)</th>
			<th>Nom anglais</th>
			<th>Abbr�viation (EN)</th>
			<th>&nbsp;</th>
		</tr>
		<tr><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td class="back">&nbsp;</td><td>&nbsp;</td></tr>
		<c:forEach var="spec" items="${listeSpec}" varStatus="i">
			<tr>
				<td class="back"><c:out value="${spec.nom_FR}"/></td>
				<td class="back"><c:out value="${spec.abbr_FR}"/></td>
				<td class="back"><c:out value="${spec.nom_EN}"/></td>
				<td class="back"><c:out value="${spec.abbr_EN}"/></td>					
				<td>
					<form style="display:inline;" name="spec_modif_<c:out value="${i.index}"/>" method="post" action="./modifSpecificite.htm">
						<input type="hidden" name="speId" value="<c:out value="${spec.speId}"/>">
						<input type="hidden" name="nom_FR" value="<c:out value="${spec.nom_FR}"/>">
						<input type="hidden" name="nom_EN" value="<c:out value="${spec.nom_EN}"/>">
						<input type="hidden" name="abbr_FR" value="<c:out value="${spec.abbr_FR}"/>">
						<input type="hidden" name="abbr_EN" value="<c:out value="${spec.abbr_EN}"/>">
						<input type="hidden" name="action" value="2"/>
					</form>
					<form style="display:inline;" name="spec_del_<c:out value="${i.index}"/>" method="post" action="./modifSpecificite.htm">
						<input type="hidden" name="speId" value="<c:out value="${spec.speId}"/>">
						<input type="hidden" name="action" value="3"/>
					</form>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="document.spec_modif_<c:out value="${i.index}"/>.submit();"><img src="/${ROOT}/resources/pic/panier/edit.gif" border="0"/></a>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#" onclick="if (confirm('Etes-vous certain de vouloir supprimer cette sp�cificit� ?')) eval('document.spec_del_<c:out value="${i.index}"/>.submit();')"><img src="/${ROOT}/resources/pic/panier/corbeille.gif" border="0"/></a>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	<div style="text-align: center; width: 100%;">
		<br />
		<br :>
		<form style="display:inline; width: 100%;" name="spec_add" id="spec_add" method="post" action="./modifSpecificite.htm">
			<input type="hidden" name="action" value="1"/>
			<a onclick="document.getElementById('spec_add').submit();" class="bouton" href="#" title="Cr�er une nouvelle sp�cificit�"><span><span>Cr�er une nouvelle sp�cificit�</span></span></a>
		</form>
	</div>
</div>
