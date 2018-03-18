package com.ors.repository;

import com.ors.model.Object;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import javax.transaction.Transactional;

/**
 * Created by cos on 07.12.2016.
 */
public interface ObjectRepository extends JpaRepository<Object, Long> {

    @Transactional
    @Modifying()
    @Query("UPDATE Object o SET o.name = ?1, o.place = ?2, o.street = ?3, o.price = ?4, o.description = ?5, o.extraPrice = ?6, o.extraPriceValue = ?7 WHERE o.id = ?8")
    int update(String name,String placeString ,String street, String price,String description,int extraPrice,int extraPriceValue,long id);

    @Transactional
    @Modifying()
    @Query("UPDATE Object o SET o.objectAccept = 1 WHERE o.id = ?1")
    int acceptObject(long id);

    Object findById(Long id);
    Object findByName(String name);
}
