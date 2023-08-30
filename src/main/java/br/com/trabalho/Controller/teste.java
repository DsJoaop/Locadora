package br.com.trabalho.Controller;

import br.com.trabalho.Model.Application.AtorApplication;
import br.com.trabalho.Model.Application.ClasseApplication;
import br.com.trabalho.Model.Domain.AtorDTO;
import br.com.trabalho.Model.Domain.ClasseDTO;

import java.util.List;

public class teste {
    public static void main(String[] args){
        AtorApplication banco = new AtorApplication();
        AtorDTO ator1 = new AtorDTO("Joao");
        AtorDTO ator2 = new AtorDTO("William");
        banco.inserir(ator1);
        banco.inserir(ator2);

        List<AtorDTO> listaAtores = banco.listar(AtorDTO.class);
        
        System.out.println("\n\n====== MOSTRANDO ATORES CADASTRADOS NO BANCO ======");
        for(AtorDTO ator : listaAtores){
            System.out.println("Nome do ator: " + ator.getNome());
        }
        System.out.println("====== MOSTRANDO ATORES CADASTRADOS NO BANCO ======\n\n");
    }
}
