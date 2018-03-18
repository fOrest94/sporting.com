package com.ors.repository;

import com.ors.model.News;
import com.ors.model.Object;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by cos on 15.12.2016.
 */
public interface NewsRepository extends JpaRepository<News, Long> {
    News findById(Long id);

    List<News> findAll();

    Object findByObjectId(Long objectId);

    @Transactional
    @Modifying
    @Query("update News u set u.title = ?1, u.description = ?2, u.data = ?3 where u.id = ?4")
    void update(String title, String description, String date, Long userId);
}
