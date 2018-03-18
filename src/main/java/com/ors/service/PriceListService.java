package com.ors.service;

import com.ors.model.PriceList;
import com.ors.model.User;

import java.util.List;


public interface PriceListService
{
    PriceList findById(Long id);
    PriceList findByObjectId(Long objectId);
    List<PriceList> findAll();
    User getUser(String userName);
}
