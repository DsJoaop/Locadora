<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.com.trabalho.Model.Domain.AtorDTO" %>
<%@ page import="br.com.trabalho.Model.Application.AtorApplication" %>
<%@ page import="java.util.List" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Locadora Passatempo</title>
</head>
<body>

<!-- Abas -->
    <div class="tabs">
        <button class="tab-button" onclick="openTab('ator')">Ator</button>
        <button class="tab-button" onclick="openTab('classe')">Classe</button>
    </div>

    <div id="ator" class="tab-content">

    <!-- Form de cadastro do Ator -->
    <div class="form-container">
        <h2>Cadastrar Ator</h2>
        <form action="AtorController" method="post">
            <!-- Indicando ao controllador que tipo de ação ele deverá ter -->
            <input type="hidden" name="acao" value="inserir">

            <label for="nome">Nome do Ator:</label>
            <input type="text" id="nome" name="nome" required>
            <button type="submit">Cadastrar</button>
        </form>
    </div>


    <!-- Tabela de listagem dos atores -->
    <div class="table-container">
        <h1>Lista de Atores</h1>
        <table>
            <thead>
            <tr>
                <th>ID</th>
                <th>Nome</th>
                <th>Ações</th>
            </tr>
            </thead>
              <tbody>
                  <%
                      AtorApplication atorApplication = new AtorApplication();
                      List<AtorDTO> listaAtores = atorApplication.listar(AtorDTO.class);

                      for (AtorDTO ator : listaAtores) {
                  %>
                  <tr>
                      <td><%= ator.getId_ator() %></td>
                      <td><%= ator.getNome() %></td>
                      <td>
                          <a href="EditarAtorServlet?id=${ator.id}" >Editar</a>
                          <a href="AtorController?acao=excluir&id_ator=<%= ator.getId_ator() %>" >Excluir</a>
                          <button> Ok </button>
                          <button> Cancelar </button>
                      </td>
                  </tr>
                  <%
                      }
                  %>
              </tbody>
        </table>

        <!-- Fim da listagem de atores -->
    </div>


    <div id="classe" class="tab-content">


        <!-- formulário de cadastro da Classe -->
        <div class="form-container">
            <h2>Cadastrar Classe</h2>
            <form id="classe-form">
                <label for="classe-nome"> Nome da Classe:</label>
                <input type="text" id="classe-nome" required>

                <label for="classe-valor">Valor:</label>
                <input type="text" id="classe-valor" required>

                <label for="classe-data-devolucao">Data de Devolução:</label>
                <input type="date" id="classe-data-devolucao" required>

                <button type="submit">Cadastrar Classe</button>
            </form>
        </div>


        <!-- Tabela de listagem das Classes -->
        <div class="table-container">
            <!-- Fim da listagem de atores -->
        </div>
    </div>


</div>


<script src="script.js"></script>
</body>
</html>
