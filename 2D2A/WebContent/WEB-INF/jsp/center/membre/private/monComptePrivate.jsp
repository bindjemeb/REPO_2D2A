<%@ include file="../../../head/include.jsp" %>

<!-- startEnteteFiche -->
<div id="enteteFiche">
	<!-- startTitleFiche -->	
	<p class="b brown fs13 mt5">
		<spring:message code="monComptePrivate.title" htmlEscape="false"/>
	</p>
	<!-- endTitleFiche -->
	<p class="b brown fs13 mt5">
	<spring:message code="monComptePrivate.exp" htmlEscape="false"/>&nbsp;<b><c:out value="${sessionScope.AUTHENTICATED_MEMBER.civilite.titre}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.prenom}"/>&nbsp;<c:out value="${sessionScope.AUTHENTICATED_MEMBER.nom}"/></b>
	</p>
</div>
<div id="separationEnteteFiche"></div>
<!-- endEnteteFiche -->

<div id="separationEnteteFiche"></div>

<!-- startCorpsFiche -->
