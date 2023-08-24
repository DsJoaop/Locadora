package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.ClasseApplication;
import br.com.trabalho.Model.Domain.ClasseDTO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ClasseController")
public class ClasseController extends HttpServlet {

    private final ClasseApplication banco = new ClasseApplication();
    public ClasseController() {
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tipoRequisicao = req.getParameter("acao");

        switch (tipoRequisicao){
            case "inserir":
                inserirClasse(req);
                break;
            case "editar":
                editarClasse(req);
                break;
            case "excluir":
                excluirClasse(req);
                break;
            default:
                break;
        }
        resp.sendRedirect("classe.jsp");
    }

    private void inserirClasse(HttpServletRequest req){
        String nome_classe = req.getParameter("nome");
        float valor = Float.parseFloat(req.getParameter("valor"));
        int prazo_devolucao = Integer.parseInt(req.getParameter("data"));

        ClasseDTO classe = new ClasseDTO(nome_classe, valor, prazo_devolucao);
        banco.inserir(classe);
    }

    private void editarClasse(HttpServletRequest req){
        String id_classe = req.getParameter("id-classe");
        String nome_classe = req.getParameter("novo-nome");
        float valor = Float.parseFloat(req.getParameter("novo-valor"));
        int prazo_devolucao = Integer.parseInt(req.getParameter("nova-data"));

        ClasseDTO classe = banco.findById(id_classe);
        classe.setNome(nome_classe);
        classe.setValor(valor);
        classe.setPrazoDevolucao(prazo_devolucao);

        banco.alterar(classe);
    }

    private void excluirClasse(HttpServletRequest req){
        String id_classe = req.getParameter("id_classe");
        ClasseDTO classe = banco.findById(id_classe);
        banco.excluir(classe);
    }
}
