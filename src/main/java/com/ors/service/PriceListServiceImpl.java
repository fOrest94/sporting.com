package com.ors.service;

import com.ors.model.PriceList;
import com.ors.model.User;
import com.ors.repository.PriceListRepository;
import com.ors.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;



@Service
public class PriceListServiceImpl implements PriceListService {

    @Autowired
    private PriceListRepository priceListRepository;
    @Autowired
    private UserRepository userRepository;
    @Override
    public PriceList findById(Long id) {
        return priceListRepository.findById(id);
    }

    @Override
    public PriceList findByObjectId(Long objectId) {
        return priceListRepository.findByObjectId(objectId);
    }

    @Override
    public List<PriceList> findAll() {
        return priceListRepository.findAll();
    }

    @Override
    public User getUser(String userName) {
        return userRepository.findByUsername(userName);
    }
}
