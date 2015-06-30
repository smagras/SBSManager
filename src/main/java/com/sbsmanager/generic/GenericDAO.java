package com.sbsmanager.generic;

import java.lang.reflect.ParameterizedType;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

public class GenericDAO<T> {

    @Autowired
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sf) {
	this.sessionFactory = sf;
    }

    public SessionFactory getSessionFactory() {
	return sessionFactory;
    }

    protected Class entityClass;

    public Class getEntityClass() {
	return entityClass;
    }

    public void setEntityClass(Class entityClass) {
	this.entityClass = this.getClass();
    }

    public GenericDAO() {
	ParameterizedType genericSuperclass = (ParameterizedType) getClass()
		.getGenericSuperclass();
	this.entityClass = (Class<T>) genericSuperclass
		.getActualTypeArguments()[0];
    }

    /**
     * Permet de récupérer un objet via son ID
     * 
     * @param id
     * @return
     */
    public T find(Long id) {
	Session session = this.sessionFactory.getCurrentSession();
	// return (T) session.load(entityClass.getName(), id);

	return (T) session
		.createQuery(
			"from " + entityClass.getName()
				+ " where identifiant = " + id).list().get(0);
    }

    /**
     * Permet de chercher par requette
     * 
     * @return CriteriaQuery
     */
    public List<T> findByQuery(String query) {
	Session session = this.sessionFactory.getCurrentSession();
	return session.createQuery(query).list();
    }

    /**
     * Permet de récupérer une liste d'objets
     * 
     * @return liste
     */

    public List<T> findAll() {

	Session session = this.sessionFactory.getCurrentSession();

	List<T> listToReturn = session.createQuery(
		"from " + entityClass.getName()).list();
	return listToReturn;

    }

    /**
     * Permet de mettre à jour les données d'une entrée dans la base
     * 
     * @param obj
     */
    public T save(T obj) {
	Session session = this.sessionFactory.getCurrentSession();
	return (T) session.merge(obj);
    }

    /**
     * Permet la suppression d'une entrée de la base
     * 
     * @param obj
     */
    public void remove(Long id) {
	T obj = this.find(id);
	Session session = this.sessionFactory.getCurrentSession();
	session.delete(obj);
    }

    /**
     * Permet la suppression d'une entrée de la base
     * 
     * @param obj
     */
    public void delete(T obj) {
	Session session = this.sessionFactory.getCurrentSession();
	session.delete(obj);
    }

}
