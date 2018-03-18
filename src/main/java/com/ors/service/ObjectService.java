package com.ors.service;

import com.ors.model.Object;

import java.util.List;

public interface ObjectService {

    Object findById(Long id);
    Object findByName(String name);
    void save(Object object);
    int update(Object object);
    void remove(Long id);
    int acceptObject(Long id);
    List<Object> findAll();
}
