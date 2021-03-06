<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
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
						<li><a href="/casadocodigo/" rel="nofollow">Lista Produtos</a></li>
						
						<li><a href="${s:mvcUrl('CCC#itens').build()}" rel="nofollow">Carrinho (${carrinhoCompras.quantidade})</a></li>

					</ul>
				</nav>
			</div>
		</div>
	</header>

	
	<section class="container middle">
		  <h2 id="cart-title">Seu carrinho de compras</h2>
		  
		    <table id="cart-table">
		      <colgroup>
		        <col class="item-col"/>
		        <col class="item-price-col"/>
		        <col class="item-quantity-col"/>
		        <col class="line-price-col"/>
		        <col class="delete-col"/>
		      </colgroup>
		      <thead>
		        <tr>
		          <th class="cart-img-col"></th>
		          <th width="65%">Item</th>
		          <th width="10%">Preço</th>
		          <th width="10%">Quantidade</th>
		          <th width="10%">Total</th>
		          <th width="5%"></th>
		        </tr>
		      </thead>
		      <tbody>

		      	  <c:forEach items="${carrinhoCompras.itens}" var="item">
		      	  
				      <tr>
				          <td class="cart-img-col"></td>
				          <td class="item-title">${item.produto.titulo}</td>
				          <td class="numeric-cell">${item.preco}</td>
				          <td class="quantity-input-cell">
				          	<input type="number" min="0" readonly="readonly" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item)}"/>
				          </td>
				          <td class="numeric-cell">${carrinhoCompras.getTotal(item)}</td>
				          <td class="remove-item">
				          		<form action="${s:mvcUrl('CCC#remover').arg(0,item.produto.id).arg(1,item.tipoPreco).build()}" method="post">
				          			<input type="image" src="" value="remover">
				          		</form>
				          </td>
				      </tr>
			      
			      </c:forEach>
		      </tbody>
			      <tfoot>
			        <tr>
			          <td colspan="3">
			          <form action="${s:mvcUrl('PC#finalizar').build()}" method="post">
			          	<input type="submit" class="checkout" name="checkout" value="Finalizar compra" />
			          </form>
			          </td>
			          <td class="numeric-cell">${carrinhoCompras.total}</td><td></td>
			        </tr>
			      </tfoot>
		    </table>
		  
		 
		</section> 

		
		
	
</body>
</html>