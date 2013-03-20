package com.cool.dao.impl;

import com.cool.dao.ProductDAO;
import com.cool.model.DetailProduct;
import com.cool.model.Product;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @author zorro
 * Product数据库层实现类
 */
public class ProductDAOImpl extends JdbcDaoSupport implements ProductDAO {
    private static final String SELECT_PRODUCT_INDEX = "select uid,name,summary,defaultpic from c_product order by pv desc limit 8";
    private static final String SELECT_PRODUCT_PAGE = "select uid,name,summary,defaultpic from c_product order by pv desc limit ?,8";

    public List<Product> getProduct() {
        return getJdbcTemplate().query(SELECT_PRODUCT_INDEX, new ProductRowMapper());
    }

    public List<Product> getProductByPage(int pageNum) {
        return getJdbcTemplate().query(SELECT_PRODUCT_PAGE, new Object[]{pageNum + 1} ,new ProductRowMapper());
    }

    public DetailProduct getDetailProduct(int uid) {
        return null;  //To change body of implemented methods use File | Settings | File Templates.
    }

    private class ProductRowMapper implements RowMapper {
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setUid(rs.getInt("uid"));
            product.setName(rs.getString("name"));
            product.setSummary(rs.getString("summary"));
            product.setDefaultPic(rs.getString("defaultpic"));
            return product;
        }
    }
}
