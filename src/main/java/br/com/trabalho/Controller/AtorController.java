package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.AtorApplication;
import br.com.trabalho.Model.Domain.AtorDTO;
import br.com.trabalho.Servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/AtorController")
public class AtorController extends HttpServlet {

    private AtorApplication banco = new AtorApplication();
    public AtorController() {

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipoRequisicao = req.getParameter("acao");

        switch (tipoRequisicao){
            case "inserir":
                inserirAtor(req);
                break;
            case "alterar":
                editarAtor(req);
                break;
            case "excluir":
                excluirAtor(req);
                break;
            default:
                break;
        }

        resp.sendRedirect("index.jsp");
    }

    private void inserirAtor(HttpServletRequest req){
        String nome_ator = req.getParameter("nome");
        AtorDTO ator = new AtorDTO(nome_ator);
        banco.inserir(ator);
    }

    private void editarAtor(HttpServletRequest req){
        String nome_ator = req.getParameter("nome");
        String id_ator = req.getParameter("id_ator");

        AtorDTO ator = banco.findById(id_ator);
        ator.setNome(nome_ator);

        banco.alterar(ator);
    }
    private void excluirAtor(HttpServletRequest req){
        String id_ator = req.getParameter("id_ator");
        AtorDTO ator = banco.findById(id_ator);
        banco.excluir(ator);
    }
}
