package br.com.trabalho.Model.Application;

import java.util.List;

import javax.persistence.NoResultException;
import javax.persistence.criteria.*;

import br.com.trabalho.Model.Domain.AtorDTO;
import br.com.trabalho.Utils.PersistenceUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;


public class AtorApplication extends GenericApplication{

	 private AtorDTO pesquisar(String pesquisa) throws HibernateException {
        Session sessao = null;
        AtorDTO atorEncontrado = null;
        
        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            CriteriaBuilder builder = sessao.getCriteriaBuilder();
            CriteriaQuery consulta = builder.createQuery(AtorDTO.class);
            Root tabela = consulta.from(AtorDTO.class);

            Expression expressaoPesquisada = null;
            Predicate restricoes = null;

            expressaoPesquisada = tabela.get("id_ator");
            restricoes = builder.equal(expressaoPesquisada, pesquisa);

            consulta.where(restricoes);

            atorEncontrado = (AtorDTO) sessao.createQuery(consulta).getSingleResult();
            
            sessao.getTransaction().commit();
            sessao.close();
        } catch (NoResultException ex) {
            // O id_ator não foi encontrado, então não faz nada e retorna null
        } catch (HibernateException ex) {
            if (sessao != null) {
                sessao.getTransaction().rollback();
                sessao.close();
            }
            throw new HibernateException(ex);
        }
        return atorEncontrado;
    }
	            
	    public AtorDTO findById(String id_ator){
	        return pesquisar(id_ator);
	    }
	
}
