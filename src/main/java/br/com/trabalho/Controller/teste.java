package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.AtorApplication;
import br.com.trabalho.Model.Domain.AtorDTO;

import java.util.List;

public class teste {
    public static void main(String[] args){

        AtorApplication banco = new AtorApplication();
        AtorDTO ator = new AtorDTO("Joao");

        banco.inserir(ator);



    }
}
