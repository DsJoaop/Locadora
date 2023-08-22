package br.com.trabalho.Model.Domain;

import javax.persistence.*;
public class ClasseDTO {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id_classe;

    @Column(name = "nome", length = 50)
    private String nome;

    @Column(name = "valor")
    private float valor;

    @Column(name = "prazo_devolucao")
    private int prazoDevolucao;

    public ClasseDTO() {
    }

    public ClasseDTO(String nome, float valor, int prazoDevolucao) {
        this.nome = nome;
        this.valor = valor;
        this.prazoDevolucao = prazoDevolucao;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public float getValor() {
        return valor;
    }

    public void setValor(float valor) {
        this.valor = valor;
    }

    public int getPrazoDevolucao() {
        return prazoDevolucao;
    }

    public void setPrazoDevolucao(int prazoDevolucao) {
        this.prazoDevolucao = prazoDevolucao;
    }
}
