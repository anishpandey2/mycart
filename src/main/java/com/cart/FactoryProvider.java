
package com.cart;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class FactoryProvider {
    
    public static SessionFactory factory;
    
    public static SessionFactory getFactory(){
        try{
            if(factory==null){
            factory=new Configuration().configure().buildSessionFactory();
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return factory;
    }
    
    
}
