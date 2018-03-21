package com.ors.service;

import com.ors.model.Object;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ors.repository.*;

import java.util.List;

/**
 * Created by cos on 07.12.2016.
 */
@Service
public class ObjectServiceImpl implements ObjectService{

    @Autowired
    private ObjectRepository objectRepository;

    @Override
    public Object findById(Long id) {

        return  objectRepository.findById(id);
    }

    @Override
    public Object findByName(String name) {
        return objectRepository.findByName(name);
    }

    @Override
    public List<Object> findByPlace(String place) {
        return objectRepository.findObjectsByPlace(place);
    }

    @Override
    public void save(Object object) {
        objectRepository.save(object);
    }

    @Override
    public int update(Object object) {
        String name = object.getName();
        String place = object.getPlace();
        String street = object.getStreet();
        String price = object.getPrice();
        String description = object.getDescription();
        int extraPrice = object.getExtraPrice();
        int extraPriceValue = object.getExtraPriceValue();
        long id = object.getId(); System.out.println("ssadw3werewrwe");
        return objectRepository.update(name, place, street, price, description, extraPrice, extraPriceValue, id);
    }

    @Override
    public int acceptObject(Long id) {
        return objectRepository.acceptObject(id);
    }

    @Override
    public void remove(Long id) {
        System.out.println(id+"           xcxcx");
       objectRepository.delete(id);
    }

    @Override
    public List<Object> findAll() {
        return objectRepository.findAll();
    }

    @Override
    public int updateMark(String mark, String marksCount, long id) {
        return objectRepository.updateMark(mark, marksCount, id);
    }


}
