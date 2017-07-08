/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ecommerce.common;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

/**
 *
 * @author Ganna
 * @param <T>
 */
public class JsonSerializer<T> implements IEntitySerializer<T> {

    private final Gson gson = new GsonBuilder().create();

    @Override
    public String serialize(T obj) {
        return gson.toJson(obj);
    }

    @Override
    public T deserialize(String data, Class<T> typeclass) {
        return gson.fromJson(data, typeclass);
    }
}
