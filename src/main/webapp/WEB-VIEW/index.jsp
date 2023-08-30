<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.com.trabalho.Model.Domain.AtorDTO" %>
<%@ page import="br.com.trabalho.Model.Application.AtorApplication" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD</title>
    <link rel="stylesheet" href="styles.css">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>

<ul class="tabs">
    <li class="tab-button"><a href="index.jsp"> Ator</a></li>
    <li class="tab-button"><a href="classe.jsp"> Classe </a></li>
</ul>

<div class="container">
    <div id="ator" class="tab-content">
        <div class="header">
            <span>Cadastro de Atores</span>
            <button onclick="openModal()" id="new"><i>Incluir</i></button>
        </div>

        <!-- =========================================================================================== -->
        <!-- ======================= TABELA PARA EXIBIÇÃO DOS ATORES CADASTRADOS ======================= -->
        <!-- =========================================================================================== -->
        <div class="divTable">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th class="acao">Editar</th>
                    <th class="acao">Excluir</th>
                </tr>
                </thead>

                <tbody>
                <%
                    AtorApplication atorApplication = new AtorApplication();            // Instância usando o banco (DAO/Application)
                    List<AtorDTO> listaAtores = atorApplication.listar(AtorDTO.class);  // Coloca a lista de atores na variável "listaAtores"

                    for (AtorDTO ator : listaAtores) {                                  // Faz um FOR para mostrar todos os atores, criando uma linha pra cada ator
                %>
                <tr>

                    <td>                                                                <!-- Cria uma coluna na linha com o ID do ator -->
                        <%= ator.getId_ator() %>
                    </td>

                    <td>                                                                <!-- Cria uma coluna na linha com o nome do ator -->
                        <%= ator.getNome() %>
                    </td>

                    <td class="editar acao">                                            <!-- Cria uma coluna na linha com o botão de editar -->
                        <button onclick="openModalAtor('<%= ator.getId_ator() %>', '<%= ator.getNome() %>')">   <!-- Ao clicar chama a modal de edição, passando id e nome -->
                            <i class='bx bx-edit'></i>
                        </button>
                    </td>

                    <td class="deletar acao">                                           <!-- Cria uma coluna na linha com o botão de excluir -->
                        <a href="AtorController?acao=excluir&id_ator=<%= ator.getId_ator() %>">     <!-- Chama O WebServlet "AtorController" passando paramêtro "ação" com o valor de "excluir" e o parâmetro "id_ator" com o valor do id_ator-->
                            <button><i class='bx bx-trash'></i></button>
                        </a>
                    </td>

                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>

        <!-- ================================================================================= -->
        <!-- ======================= MODAL PARA ADICIONAR UM NOVO ATOR ======================= -->
        <!-- ================================================================================= -->
        <div class="modal-container">
            <div class="modal">
                <form method="post" action="AtorController?acao=inserir">   <!-- Chama O WebServlet "AtorController" passando paramêtro "ação" com o valor de "inserir" -->
                    <label for="m-nome">Nome do Ator:</label>
                    <input type="text" id="m-nome" name="nome" required>

                    <button type="submit">Salvar</button>                   <!-- Envia as informações do formulario pro Servlet -->
                </form>
            </div>
        </div>

        <!-- ========================================================================= -->
        <!-- ======================= MODAL PARA EDITAR UM ATOR ======================= -->
        <!-- ========================================================================= -->
        <div class="modal-container" id="container-ator">
            <div class="modal">
                <form method="post" action="AtorController?acao=editar">    <!-- Chama O WebServlet "AtorController" passando paramêtro "ação" com o valor de "editar" -->
                    <input type="hidden" id="id-ator" name="id_ator">

                    <label for="novo-nome">Nome do Ator:</label>
                    <input type="text" id="novo-nome" name="nome" required>

                    <button type="submit">Atualizar</button>                <!-- Envia as informações do formulario pro Servlet -->
                </form>
            </div>
        </div>

    </div>

    <!-- ========================================================================================== -->
    <!-- ======================= MODAL PARA CONFIRMAR A EXCLUSÃO DE UM ATOR ======================= -->
    <!-- ========================================================================================== -->
    <div class="modal-container popup-exclusao">
        <div class="modal">
            <p>Tem certeza que deseja excluir?</p>
            <div class="botoes">
                <button id="confirmar-exclusao">SIM</button>
                <button id="rejeitar-exclusao">NÃO</button>
            </div>
        </div>
    </div>

</div>
<script src="ator.js"></script>
<script src="script.js"></script>
</body>
</html>