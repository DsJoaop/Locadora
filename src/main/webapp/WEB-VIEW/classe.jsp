<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="br.com.trabalho.Model.Application.ClasseApplication" %>
<%@ page import="java.util.List" %>
<%@ page import="br.com.trabalho.Model.Domain.ClasseDTO" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRUD</title>
    <link rel="stylesheet" href="styles.css">
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

<ul class="tabs">
    <li class="tab-button"><a href="index.jsp"> Ator</a></li>
    <li class="tab-button"><a href="classe.jsp"> Classe </a></li>
</ul>

<div class="container">
    <div id="ator" class="tab-content">
        <div class="header">
            <span>Cadastro de Classe</span>
            <button onclick="openModal()" id="new"><i>Incluir</i></button>
        </div>

        <!-- ============================================================================================ -->
        <!-- ======================= TABELA PARA EXIBIÇÃO DAS CLASSES CADASTRADAS ======================= -->
        <!-- ============================================================================================ -->
        <div class="divTable">
            <table>
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>valor</th>
                    <th>prazo (dias)</th>
                    <th class="acao">Editar</th>
                    <th class="acao">Excluir</th>
                </tr>
                </thead>

                <tbody>
                <%
                    ClasseApplication classeApplication = new ClasseApplication();              // Instância usando o banco (DAO/Application)
                    List<ClasseDTO> listaClasses = classeApplication.listar(ClasseDTO.class);   // Coloca a lista de atores na variável "listaClasses"

                    for (ClasseDTO classe : listaClasses) {                                     // Faz um FOR para mostrar todas as classes, criando uma linha pra cada classe
                %>
                <tr>

                    <td>                                                                        <!-- Cria uma coluna na linha com o ID da classe -->
                        <%= classe.getId_classe() %>
                    </td>

                    <td>                                                                        <!-- Cria uma coluna na linha com o nome da classe -->
                        <%= classe.getNome() %>
                    </td>

                    <td>                                                                        <!-- Cria uma coluna na linha com o valor da classe -->
                        <%= classe.getValor() %>
                    </td>

                    <td>                                                                        <!-- Cria uma coluna na linha com o prazo da classe -->
                        <%= classe.getPrazoDevolucao() %>
                    </td>

                    <td class="editar acao">                                                    <!-- Cria uma coluna na linha com o ID da classe -->
                        <button onclick="openModalClasse('<%= classe.getId_classe() %>', '<%= classe.getNome() %>', '<%= classe.getValor() %>', '<%= classe.getPrazoDevolucao() %>')">
                            <i class='bx bx-edit'></i>
                        </button>

                    </td>

                    <td class="deletar acao">                                                   <!-- Cria uma coluna na linha com o botão de excluir -->
                        <a href="ClasseController?acao=excluir&id_classe=<%= classe.getId_classe() %>"> <!-- Chama O WebServlet "ClasseController" passando paramêtro "ação" com o valor de "excluir" e o parâmetro "id_classe" com o valor do id_ator-->
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

        <!-- ==================================================================================== -->
        <!-- ======================= MODAL PARA ADICIONAR UMA NOVA CLASSE ======================= -->
        <!-- ==================================================================================== -->
        <div class="modal-container">
            <div class="modal">
                <form method="post" action="ClasseController?acao=inserir">     <!-- Chama O WebServlet "ClasseController" passando paramêtro "ação" com o valor de "inserir" -->
                    <label for="nome">Nome da Classe:</label>
                    <input type="text" id="nome" name="nome" required>

                    <label for="valor">Valor da Classe:</label>
                    <input type="number" id="valor" name="valor" required>
                    <label for="data">Tempo para devolução:</label>

                    <input type="number" id="data" name="data" required>

                    <button type="submit">Salvar</button>                       <!-- Envia as informações do formulario pro Servlet -->
                </form>
            </div>
        </div>

        <!-- ============================================================================ -->
        <!-- ======================= MODAL PARA EDITAR UMA CLASSE ======================= -->
        <!-- ============================================================================ -->
        <div class="modal-container" id="container-classe">
            <div class="modal">
                <form method="post" action="ClasseController?acao=editar">      <!-- Chama O WebServlet "ClasseController" passando paramêtro "ação" com o valor de "editar" -->
                    <input type="hidden" id="id-classe" name="id-classe">

                    <label for="novo-nome">Nome da Classe:</label>
                    <input type="text" id="novo-nome" name="novo-nome" required>

                    <label for="novo-valor">Valor da Classe:</label>
                    <input type="number" id="novo-valor" name="novo-valor" required>

                    <label for="nova-data">Prazo de Devolução:</label>
                    <input type="number" id="nova-data" name="nova-data" required>

                    <button type="submit">Atualizar</button>                    <!-- Envia as informações do formulario pro Servlet -->
                </form>
            </div>
        </div>
    </div>

    <!-- ============================================================================== -->
    <!-- ======================= MODAL PARA EXCLUIR NOVA CLASSE ======================= -->
    <!-- ============================================================================== -->
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
<script src="classe.js"></script>
<script src="script.js"></script>
</body>

</html>