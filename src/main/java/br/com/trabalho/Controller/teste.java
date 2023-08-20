package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.AtorApplication;
import br.com.trabalho.Model.Domain.AtorDTO;

import java.util.List;

public class teste {
    public static void main(String[] args){

        AtorApplication banco = new AtorApplication();
        AtorDTO ator = banco.findById("2");
        System.out.println(ator);

        AtorDTO ator2 = banco.findById("2");
        System.out.println(ator2.getNome());


    }
}
