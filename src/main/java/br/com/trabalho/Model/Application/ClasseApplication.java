package br.com.trabalho.Model.Application;

import br.com.trabalho.Model.Domain.AtorDTO;
import br.com.trabalho.Model.Domain.ClasseDTO;
import br.com.trabalho.Utils.PersistenceUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;

import javax.persistence.NoResultException;
import javax.persistence.criteria.*;

public class ClasseApplication extends GenericApplication{

    private ClasseDTO pesquisar(String pesquisa) throws HibernateException {
        Session sessao = null;
        ClasseDTO classeEncontrada = null;

        try {
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();

            CriteriaBuilder builder = sessao.getCriteriaBuilder();
            CriteriaQuery consulta = builder.createQuery(ClasseDTO.class);
            Root tabela = consulta.from(ClasseDTO.class);

            Expression expressaoPesquisada = null;
            Predicate restricoes = null;

            expressaoPesquisada = tabela.get("id_classe");
            restricoes = builder.equal(expressaoPesquisada, pesquisa);

            consulta.where(restricoes);

            classeEncontrada = (ClasseDTO) sessao.createQuery(consulta).getSingleResult();


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
        return classeEncontrada;
    }

    public ClasseDTO findById(String id_classe){
        return pesquisar(id_classe);
    }

}
