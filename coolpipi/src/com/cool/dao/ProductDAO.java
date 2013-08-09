package com.cool.dao;

import com.cool.model.DetailProduct;
import com.cool.model.Product;

import java.util.List;
import java.util.Map;

/**
 * @author zorro
 * Product数据库层
 */
public interface ProductDAO {

    void init();

    List<Product> getAllProduct();

    List<Product> getProduct();

    List<Product> getProductByPage(int pageNum);

    Product getProductByUid(int uid);

    int insertProduct(Product product);

    int updateProduct(Product product);

    DetailProduct getDetailProduct(int uid);

    Map getTags();

    List<Integer> getTagsByUid(int uid);

    void editTag(int uid, String[] tags);
}
