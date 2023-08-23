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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<body>

<ul class="tabs">
    <li class="tab-button"><a href="index.jsp"> Ator</a></li>
    <li class="tab-button"><a href="classe.html"> Classe </a></li>
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
                    <th>Id</th>
                    <th>Nome</th>
                    <th class="acao">Editar</th>
                    <th class="acao">Excluir</th>
                </tr>
                </thead>
                <tbody>
                <%
                    AtorApplication atorApplication = new AtorApplication();
                    List<AtorDTO> listaAtores = atorApplication.listar(AtorDTO.class);

                    for (AtorDTO ator : listaAtores) {
                %>
                <tr>
                    <td>
                        <%= ator.getId_ator() %>
                    </td>
                    <td>
                        <%= ator.getNome() %>
                    </td>
                    <td class="editar">
                        <button onclick="openModalAtor( <%= ator.getId_ator()%>,<%= ator.getNome()%> )"><i
                                class='bx bx-trash'></i></button>
                    </td>
                    <td class="deletar">
                        <a href="AtorController?acao=excluir&id_ator=<%= ator.getId_ator() %>">
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
                <form method="post" action="AtorController">
                    <!-- Atribuindo tipo de operação ao controlador -->
                    <input type="hidden" name="acao" value="inserir">

                    <label for="m-nome">Nome do Ator:</label>
                    <input type="text" id="m-nome" name="nome" required>

                    <button type="submit">Salvar</button>
                </form>
            </div>
        </div>


        <div class="modal-container-editAtor">
            <div class="modal">
                <form method="post" action="AtorController">
                    <!-- Atribuindo tipo de operação ao controlador -->
                    <input type="hidden" name="acao" value="editar">

                    <label for="novo-nome">Nome do Ator:</label>
                    <input type="text" id="id-ator" name="novoNome" disabled>

                    <label for="novo-nome">Nome do Ator:</label>
                    <input type="text" id="novo-nome" name="novoNome" required>

                    <button type="submit">Atualizar</button>
                </form>
            </div>
        </div>
    </div>


</div>
<script src="script.js"></script>
</body>

</html>