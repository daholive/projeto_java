<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/" var="contextPath" />
	  <meta charset="utf-8"/>
		  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
		  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
		<link rel="icon"
			href="//cdn.shopify.com/s/files/1/0155/7645/t/177/assets/favicon.ico?11981592617154272979"
			type="image/ico" />
		<link href="https://plus.googlecom/108540024862647200608"
			rel="publisher"/>
		<title>Livros de Java, SOA, Android, iPhone, Ruby on Rails e
			muito mais - Casa do Código</title>
		<link href="${contextPath}resources/css/cssbase-min.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href='http://fonts.googleapis.com/css?family=Droid+Sans:400,700'
			rel='stylesheet'/>
		<link href="${contextPath}resources/css/fonts.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-ie7.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello-embedded.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/fontello.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/layout-colors.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/responsive-style.css"
			rel="stylesheet" type="text/css" media="all" />
		<link href="${contextPath}resources/css/guia-do-programador-style.css" 
			rel="stylesheet" type="text/css"  media="all"  />
	    <link href="${contextPath}resources/css/produtos.css" 
	    	rel="stylesheet" type="text/css"  media="all"  />
		<link rel="canonical" href="http://www.casadocodigo.com.br/" />	
</head>
<body>

  <header id="layout-header">
		<div class="clearfix container">
			<a href="/" id="logo">
			</a>
			<div id="header-content">
				<nav id="main-nav">
					
					<ul class="clearfix">
						<li><a href="http://localhost:8080<%=request.getContextPath()%>/" rel="nofollow">Lista Produtos</a></li>
					
						<li><a href="/carrinho" rel="nofollow">Carrinho(${carrinhoCompras.quantidade})</a></li>

					</ul>
				</nav>
			</div>
		</div>
	</header>
	<nav class="categories-nav">
		<ul class="container">

		</ul>
	</nav>

	<article id="${produto.id}">
		  <header id="product-highlight" class="clearfix">
		    <div id="product-overview" class="container">
		      <h1 class="product-title">${produto.titulo}</h1>
		      <p class="product-author">
		        <span class="product-author-link">
		          
		        </span>
		      </p>	
			
		    <p class="book-description">
		    	${produto.descricao}
		    </p>
		    </div>
		  </header>
	
	  
  <section class="buy-options clearfix">  
	  <form action='<c:url value="/carrinho/add" />' method="post" class="container">
	    <ul id="variants" class="clearfix">
	    	<input type="hidden" value="${produto.id}" name="produtoId" />
	    	<c:forEach items="${produto.precos}" var="preco">
	    	  <li class="buy-option">
	            <input type="radio" name="tipoPreco" class="variant-radio" id="tipo" value="${preco.tipo}" checked>
	            <label  class="variant-label" for="product-variant-9720393823">
	              ${preco.tipo}
	            </label>
	            <small class="compare-at-price">R$ 39,90</small>
	            <p class="variant-price">${preco.valor}</p>
	          </li>         
	        </c:forEach>   
	    </ul>
	    <button type="submit" class="submit-image icon-basket-alt" alt="Compre Agora" title="Compre Agora"></button>
	  </form>
	</section>
	  
	<div class="container">
	  <section class="summary">
	    <ul>
	      	<li><h3>E muito mais... <a href='/pages/sumario-java8'>veja o sumário</a>.</h3></li>
	    </ul>
	  </section>
	  
	  <section class="data product-detail">
	    <h2 class="section-title">Dados do livro:</h2>
	    <p>Número de páginas: <span>${produto.paginas}</span></p>
	    <p></p>
	    <p>Data de publicação: <fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}" /></p>
	  </section>
	</div>
	
	</article>	

</body>
</html>