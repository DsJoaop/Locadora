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
                <span>Cadastro de Atores</span>
                <button onclick="openModal()" id="new"><i>Incluir</i></button>
            </div>

            <div class="divTable">
                <table>
                    <thead>
                    <tr>
                        <th>Nome</th>
                        <th>valor</th>
                        <th>prazo (dias)</th>
                        <th class="acao">Editar</th>
                        <th class="acao">Excluir</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ClasseApplication classeApplication = new ClasseApplication();
                        List<ClasseDTO> listaClasses = classeApplication.listar(ClasseDTO.class);

                        for (ClasseDTO classe : listaClasses) {
                    %>
                    <tr>
                        <td>
                            <%= classe.getNome() %>
                        </td>
                        <td>
                            <%= classe.getValor() %>
                        </td>

                        <td>
                            <%= classe.getPrazoDevolucao() %>
                        </td>
                        <td class="editar">
                        <button onclick="openModalClasse('<%= classe.getId_classe() %>', '<%= classe.getNome() %>', '<%= classe.getValor() %>', '<%= classe.getPrazoDevolucao() %>')">
                            <i class='bx bx-edit'></i>
                        </button>

                        </td>
                        <td class="deletar">
                            <a href="ClasseController?acao=excluir&id_classe=<%= classe.getId_classe() %>">
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

            <div class="modal-container">
                <div class="modal">
                    <form method="post" action="ClasseController?acao=inserir">

                        <label for="nome">Nome da Classe:</label>
                        <input type="text" id="nome" name="nome" required>

                        <label for="valor">Valor da Classe:</label>
                        <input type="number" id="valor" name="valor" required>

                        <label for="data">Tempo para devolução:</label>
                        <input type="number" id="data" name="data" required>


                        <button type="submit">Salvar</button>
                    </form>
                </div>
            </div>


            <div class="modal-container" id="container-classe">
                <div class="modal">
                    <form method="post" action="ClasseController?acao=editar">

                        <input type="hidden" id="id-classe" name="id-classe">

                        <label for="novo-nome">Nome da Classe:</label>
                        <input type="text" id="novo-nome" name="novo-nome" required>

                        <label for="novo-valor">Valor da Classe:</label>
                        <input type="number" id="novo-valor" name="novo-valor" required>


                        <label for="nova-data">Prazo de Devolução:</label>
                        <input type="number" id="nova-data" name="nova-data" required>


                        <button type="submit">Atualizar</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
<script src="classe.js"></script>
<script src="script.js"></script>
</body>

</html>