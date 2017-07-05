<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
						
						<li><a href="http://localhost:8080/casadocodigo/" rel="nofollow">Lista Produtos</a></li>
					
						<li><a href="/carrinho" rel="nofollow">Carrinho(${carrinhoCompras.quantidade})</a></li>

					</ul>
				</nav>
			</div>
		</div>
	</header>

<div>
 <header id="product-highlight" class="clearfix">
		    <div id="product-overview" class="container">
	<table>
   <form:form action="${s:mvcUrl('PC#gravar').build()}" method="post" commandName="produto" enctype="multipart/form-data">
    <tr>
   		<td><label>Título</label> 
   		</td>
   		<td><form:input path="titulo" /> <form:errors path="titulo" /></td>
   	</tr>
	 <tr>
   		<td><label>descricao</label> 
   		</td>
   		<td> <form:textarea rows="10" cols="20" path="descricao" /> <form:errors path="descricao" /></td>
   	</tr>

	<tr>
   		<td><label>Páginas</label> 
   		</td>
   		<td> <form:input path="paginas" /><form:errors path="paginas" /> </td>
   	</tr>

	<tr>
   		<td><label>Data de Lançamento</label> 
   		</td>
   		<td> <form:input path="dataLancamento" /> <form:errors path="dataLancamento" /> </td>
   	</tr>

	<c:forEach items="${tipos}" var="tipoPreco" varStatus="status">
	<tr>
   		<td><label>${tipoPreco}</label> 
   		</td>
   		<td> <form:input path="precos[${status.index}].valor" /> <form:hidden path="precos[${status.index}].tipo" value="${tipoPreco}" /> </td>
   	</tr>
	</c:forEach>
	
	<tr>
   		<td><label>Sumário</label> 
   		</td>
   		<td> <input name="sumario" type="file" /></td>
   	</tr>
   	<tr>
   		<td><label></label> 
   		</td>
   		<td> <button type="submit">Cadastrar</button></td>
   	</tr>
    
    
</form:form>

</table>
  </div>
 </header>
</div>

<c:import url="../footer.jsp" />