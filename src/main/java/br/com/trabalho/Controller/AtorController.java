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

    public AtorController() {

    }


    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        AtorApplication banco = new AtorApplication();
        AtorDTO atorDTO = new AtorDTO();

        String nome = req.getParameter("nome");
        String id_ator = req.getParameter("id_ator");

        String tipoRequisicao = req.getParameter("acao");

        switch (tipoRequisicao){
            case "inserir":
                atorDTO.setNome(nome);
                banco.inserir(atorDTO);
                break;
            case "editar":
                atorDTO = banco.findById(id_ator);
                atorDTO.setNome(nome);
                banco.alterar(atorDTO);
                break;
            case "excluir":
                atorDTO = banco.findById(id_ator);
                banco.excluir(atorDTO);
                break;
            default:
                break;
        }
    }
}
