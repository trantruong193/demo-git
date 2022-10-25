package com.springmvc.demo.controller;

import com.springmvc.demo.models.Category;
import com.springmvc.demo.models.Product;
import com.springmvc.demo.repositories.RepositoryCategory;
import com.springmvc.demo.repositories.RepositoryProduct;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;


@Controller
@RequestMapping(path = "products")
// http://localhost:8080/products
public class ProductController {
    @Autowired
    private RepositoryProduct repositoryProduct;
    @Autowired
    private RepositoryCategory repositoryCategory;
    // get all products
    // http://localhost:8080/products
    @RequestMapping(value = "",method = RequestMethod.GET)
    public String getAllProduct(ModelMap modelMap){
        Iterable<Product> products = repositoryProduct.findAll();
        modelMap.addAttribute("products",products);
        return "product";
    }
    // get product by category id
    // http://localhost:8080/products/getProductByCategoryId/{categoryID}
    @RequestMapping(value = "/getProductByCategoryId/{categoryID}",method = RequestMethod.GET)
    public String getProductByCategoryID(ModelMap modelMap, @PathVariable String categoryID){
        Iterable<Product> products = repositoryProduct.findByCategoryID(categoryID);
        modelMap.addAttribute("products",products);
        return "productList";
    }
    // update a product
    @RequestMapping(value = "/updateProduct/{productID}",method = RequestMethod.GET)
    public String updateProduct(ModelMap modelMap, @PathVariable String productID){
        Iterable<Category> categories = repositoryCategory.findAll();
        modelMap.addAttribute("categories",categories);
        modelMap.addAttribute("product",repositoryProduct.findById(productID).get());
        return "updatePage";
    }
    @RequestMapping(value = "/resultUpdateProduct/{productID}", method = RequestMethod.POST)
    public String resultUpdateProduct(
            ModelMap modelMap,
            @Valid @ModelAttribute("product") Product product,
            BindingResult bindingResult,
            @PathVariable String productID)

    {
        if (bindingResult.hasErrors()){
            modelMap.addAttribute("categories",repositoryCategory.findAll());
            return "updatePage";
        }
        if(repositoryProduct.findById(productID).isPresent()){
            Product foundProduct = repositoryProduct.findById(productID).get();
            if (!foundProduct.getProductName().trim().isBlank()){
                foundProduct.setProductName(product.getProductName());
            }
            if (!foundProduct.getCategoryID().trim().isBlank()){
                foundProduct.setCategoryID(product.getCategoryID());
            }
            if (foundProduct.getPrice()>0){
                foundProduct.setPrice(product.getPrice());
            }
            if (!foundProduct.getDescription().trim().isBlank()){
                foundProduct.setDescription(product.getDescription());
            }
            repositoryProduct.save(foundProduct);
        }
        return "redirect:/products";
    }
}
