package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.AtorApplication;
import br.com.trabalho.Model.Domain.AtorDTO;

import java.util.List;

public class teste {
    public static void main(String[] args){
        AtorDTO ator = new AtorDTO("joao");
        AtorApplication banco = new AtorApplication();
        banco.inserir(ator);
        ator.setNome("eduardo");
        banco.alterar(ator);
        banco.excluir(ator);
    }
}
