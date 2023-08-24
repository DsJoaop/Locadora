package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.AtorApplication;
import br.com.trabalho.Model.Application.ClasseApplication;
import br.com.trabalho.Model.Domain.AtorDTO;
import br.com.trabalho.Model.Domain.ClasseDTO;

import java.util.List;

public class teste {
    public static void main(String[] args){

        AtorApplication banco = new AtorApplication();
        AtorDTO ator = new AtorDTO("Joao");

        banco.inserir(ator);

        ClasseApplication classeApplication = new ClasseApplication();
        ClasseDTO classe = new ClasseDTO("classe", 20, 30);

        classeApplication.inserir(classe);


    }
}
