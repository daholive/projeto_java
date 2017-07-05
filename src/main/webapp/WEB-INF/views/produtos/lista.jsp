<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>

<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
   <link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap-theme.min.css" rel="stylesheet" />
   <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.2.1.min.js"></script>
	
<div class="container">
    <h1>Lista de Produtos</h1>
    <div>${sucesso} </div>
    <div>${falha} </div>
    <table class="table table-striped">
        <tr>
            <td>Título</td>
            <td>Descrição</td>
            <td>Páginas</td>
        </tr>

        <c:forEach items="${produtos}" var="produto">
            <tr>
                <td><a href="${s:mvcUrl('PC#detalhe').arg(0,produto.id).build()}">${produto.titulo}</a></td>
                <td>${produto.descricao}</td>
                <td>${produto.paginas}</td>
            </tr>
        </c:forEach>
	</table>

</div>