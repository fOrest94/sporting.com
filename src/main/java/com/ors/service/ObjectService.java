package com.ors.service;

import com.ors.model.Object;

import java.util.List;

public interface ObjectService {

    Object findById(Long id);
    Object findByName(String name);
    List<Object> findByPlace(String place);
    void save(Object object);
    int update(Object object);
    void remove(Long id);
    int acceptObject(Long id);
    List<Object> findAll();
    int updateMark(String mark, String marksCont, long id);
}
