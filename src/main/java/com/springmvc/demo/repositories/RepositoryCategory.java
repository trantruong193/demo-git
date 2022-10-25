package com.springmvc.demo.repositories;

import com.springmvc.demo.models.Category;
import org.springframework.data.repository.CrudRepository;

public interface RepositoryCategory extends CrudRepository<Category, String> {// String la truong khoa chinh

}
