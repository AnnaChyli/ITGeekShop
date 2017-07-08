/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

/**
 *
 * @author Ganna
 * @param <T>
 */
public interface IEntitySerializer<T> {

    String serialize(T obj);

    T deserialize(String data, Class<T> typeclass);
}
