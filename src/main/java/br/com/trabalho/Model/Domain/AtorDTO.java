package br.com.trabalho.Model.Domain;

import javax.persistence.*;

@Entity(name = "Ator")
public class AtorDTO {
	@Id @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id_ator;

	@Column(name = "nome", length = 50)
	private String nome;

	public AtorDTO() {
	}

	public AtorDTO(String nome) {
		this.nome = nome;
	}

	public int getId_ator() {
		return id_ator;
	}

	public void setId_ator(int id_ator) {
		this.id_ator = id_ator;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
