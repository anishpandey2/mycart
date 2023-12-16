
package com.cart.dao;

import com.cart.entities.Category;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;


public class CategoryDao {
    private SessionFactory factory;

    public CategoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    //saves the category to db
    public int saveCategory(Category cat){
        Session session = this.factory.openSession();
        Transaction tx=session.beginTransaction();
        int catId=(int) session.save(cat);
        tx.commit();
        session.close();
        return catId;
    }
    
    public List<Category> getAllCategories(){
        
        Session s=this.factory.openSession();
        
        Query query=s.createQuery("from Category");
        List <Category> list = query.list();
        s.close();
        return list;
    }
    
    public Category getCategoryById(int cId){
        Category cat=null;
        
        
        try{
            Session session=this.factory.openSession();
            cat = session.get(Category.class, cId);
            
            
            session.close();
            
        }catch(Exception e){
            System.out.println(e);
        }
          
        return cat;
    }
}
