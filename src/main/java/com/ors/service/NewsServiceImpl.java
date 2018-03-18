package com.ors.service;

import com.ors.model.News;
import com.ors.repository.NewsRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by cos on 15.12.2016.
 */
@Service
public class NewsServiceImpl implements NewsService {

    @Autowired
    NewsRepository newsRepository;

    @Override
    public News findById(Long id) {
        return newsRepository.findById(id);
    }

    @Override
    public List<News> findAll() {
        return newsRepository.findAll(sortByDataAsc());
    }

    private Sort sortByDataAsc() {
        return new Sort(Sort.Direction.ASC, "objectId");
    }

    @Override
    public void save(News news) {
        newsRepository.save(news);

    }

    @Override
    public boolean delete(Long id) {
        if (newsRepository.findById(id) == null) {
            return false;
        }
        newsRepository.delete(id);
        return true;
    }

    @Override
    public boolean update(News news) {

        newsRepository.update(news.getTitle(),news.getDescription(),news.getData(),news.getId());
        return true;
    }

    @Override
    public Object findByObjectId(Long objectId) {
        return newsRepository.findByObjectId(objectId);
    }
}
