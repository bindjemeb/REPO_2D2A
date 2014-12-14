<%@ include file="../../head/include.jsp" %>

<html>

	<!-- Head -->
  	<jsp:include page="../../head/head.jsp" />
  	<!-- Fin Head -->
  	
  	<!-- Body -->
  	<body class="page">
  	
  		<div id="container">
  		
	  		<div id="header">
	  			<jsp:include page="../../header/header.jsp" />
	  		</div>
	  			  		
	  	    <!-- top_menu -->
	  	    <div id="top_menu">
	  	    	<jsp:include page="../../top_menu/top_menu.jsp" />
	  	    </div>
	  	    <!-- fin top_menu -->

	  	    <!-- top_menu_bas-->
	  	     
	  	    <div id="top_menu_bas">
	  	    	<jsp:include page="../../top_menu/top_menu_bas.jsp" />
	  	    </div>
	  	    <!-- fin top_menu_bas -->
	  	       
	  	    <!-- left_menu -->
	  	    <div id="left_menu">		  	    	
	  	    	<jsp:include page="../../left_menu/left_menu.jsp" />
	  	    </div>	
	  	    <!-- fin left_menu -->
	  	    
	  	    <!-- center -->
		    <div id="center">
		    	<jsp:include page="../../center/filAriane.jsp" />
		    	<c:choose>
		    		<c:when test="${empty FONCTIONAL}">
		    			<jsp:include page="../../center/boutique/homeBoutique.jsp" />
		    		</c:when> 
	  	    		<c:otherwise>
	  	    			TODO : Pas de produit pour cette rubrique
	  	    		</c:otherwise>
	  	    	</c:choose>
	  	    </div>	
	  	    <!-- fin center -->
		  	    
		</div>
		<!-- fin page -->
  	</body>
  	<!-- Fin body -->
</html>
