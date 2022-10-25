package com.springmvc.demo.repositories;

import com.springmvc.demo.models.Product;
import org.springframework.data.repository.CrudRepository;

public interface RepositoryProduct extends CrudRepository<Product, String> {
    Iterable<Product> findByCategoryID(String categoryID);
}
