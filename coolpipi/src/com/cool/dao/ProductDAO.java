package com.cool.dao;

import com.cool.model.DetailProduct;
import com.cool.model.Product;

import java.util.List;

/**
 * @author zorro
 * Product数据库层
 */
public interface ProductDAO {
    List<Product> getAllProduct();

    List<Product> getProduct();

    List<Product> getProductByPage(int pageNum);

    Product getProductByUid(int uid);

    int insertProduct(Product product);

    int updateProduct(Product product);

    DetailProduct getDetailProduct(int uid);
}
