package br.com.trabalho.Model.Application;

import java.util.List;
import javax.persistence.criteria.CriteriaQuery;

import br.com.trabalho.Utils.PersistenceUtil;
import org.hibernate.HibernateException;
import org.hibernate.Session;

public class GenericApplication {

    //DML = Data Manipulation Language (insert, update, delete, listar)
    public List GenericDML(Object objeto, int tipoDML, Class classe){   // É List por causa do listar, retorna uma lista. Se não entrar if do listar, então retorna null, sendo assim não interfere em nada.
        Session sessao = null;
        List lista = null;
  
        try{
            sessao = PersistenceUtil.getSessionFactory().openSession();
            sessao.beginTransaction();
            
            //Poderia ser switch também.
            if(tipoDML == 1){               //Se for tipo 1, significa que é inserir.
                sessao.save(objeto);
            } else if(tipoDML == 2){        //Se for tipo 2, significa que é alterar.
                sessao.update(objeto);
            } else if(tipoDML == 3){        //Se for tipo 3, significa que é excluir.
                sessao.delete(objeto);
            } else if(tipoDML == 4){        //Se for tipo 4, significa que é listar, retorna uma lista.
                CriteriaQuery consulta = sessao.getCriteriaBuilder().createQuery(classe);
                consulta.from(classe);
                //consulta.orderBy(lista);
                lista = sessao.createQuery(consulta).getResultList();     
                //consulta.orderBy(lista);
            }   
            
            sessao.getTransaction().commit();
            sessao.close();    
        } catch (HibernateException erro){
            if(sessao != null){
                sessao.getTransaction().rollback();
                sessao.close();
            } throw new HibernateException(erro);
        }
        return lista;
    }
    
    public void inserir(Object objeto) throws HibernateException{  
        GenericDML(objeto, 1, null);        //Como não utiliza um parâmetro de classe, passo classe como null.
    }
    
    public void alterar(Object objeto) throws HibernateException{
        GenericDML(objeto, 2, null);        //Como não utiliza um parâmetro de classe, passo classe como null.
    }
            
    public void excluir(Object objeto) throws HibernateException {
        GenericDML(objeto, 3, null);        //Como não utiliza um parâmetro de classe, passo classe como null.
    }
   
    public List listar(Class classe){
        return GenericDML(null, 4, classe); //Como não utiliza um parâmetro de objeto, passo objeto como null.
    }    
}
   