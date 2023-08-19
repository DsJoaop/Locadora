package br.com.trabalho.Model.Domain;

import javax.persistence.*;
public class ClasseDTO {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_classe;

    @Column(name = "nome", length = 50)
    private String nome;

    @Column(name = "prazo_devolucao")
    private int prazoDevolucao;

    public ClasseDTO() {
    }

    public ClasseDTO(int id_classe, String nome, int prazoDevolucao) {
        this.id_classe = id_classe;
        this.nome = nome;
        this.prazoDevolucao = prazoDevolucao;
    }

    public int getId_classe() {
        return id_classe;
    }

    public void setId_classe(int id_classe) {
        this.id_classe = id_classe;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getPrazoDevolucao() {
        return prazoDevolucao;
    }

    public void setPrazoDevolucao(int prazoDevolucao) {
        this.prazoDevolucao = prazoDevolucao;
    }
}
