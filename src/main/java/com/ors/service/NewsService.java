package com.ors.service;

import com.ors.model.News;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cos on 15.12.2016.
 */

public interface NewsService {
    News findById(Long id);

    List<News> findAll();

    void save(News news);

    boolean delete(Long id);

    boolean update(News news);

    Object findByObjectId(Long objectId);
}
