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


@WebServlet("/AtorController")
public class AtorController extends HttpServlet {

    private AtorApplication banco = new AtorApplication();
    public AtorController() {

    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipoRequisicao = req.getParameter("acao");
        System.out.println(tipoRequisicao);

        switch (tipoRequisicao){
            case "inserir":
                inserirAtor(req);
                break;
            case "editar":
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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        service(req, resp);
    }

    private void inserirAtor(HttpServletRequest req){
        String nome_ator = req.getParameter("nome");
        AtorDTO ator = new AtorDTO(nome_ator);
        banco.inserir(ator);
    }

    private void editarAtor(HttpServletRequest req){
        String nome_ator = req.getParameter("nome");
        String id_ator = req.getParameter("id_ator");
        System.out.println("ID:" + id_ator);
        System.out.println(nome_ator);
        AtorDTO ator = banco.findById(id_ator);
        System.out.println(ator.getNome());
        ator.setNome(nome_ator);

        banco.alterar(ator);
    }
    private void excluirAtor(HttpServletRequest req){
        String id_ator = req.getParameter("id_ator");
        AtorDTO ator = banco.findById(id_ator);
        banco.excluir(ator);
    }
}
