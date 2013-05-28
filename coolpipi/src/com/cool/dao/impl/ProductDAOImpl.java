package com.cool.dao.impl;

import com.cool.dao.ProductDAO;
import com.cool.model.DetailProduct;
import com.cool.model.Product;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.support.JdbcDaoSupport;

import java.io.UnsupportedEncodingException;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 * @author zorro
 * Product数据库层实现类
 */
public class ProductDAOImpl extends JdbcDaoSupport implements ProductDAO {
    private static final String SELECT_ALL_PRODUCT = "select uid,name,summary,defaultpic from c_product";
    private static final String SELECT_PRODUCT_INDEX = "select uid,name,summary,defaultpic from c_product order by pv desc limit 8";
    private static final String SELECT_PRODUCT_PAGE = "select uid,name,summary,defaultpic from c_product order by pv desc limit ?,8";
    private static final String SELECT_PRODUCT = "select uid,name,summary,defaultpic,description from c_product where uid = ?";
    private static final String INSERT_PRODUCT = "insert into c_product(name,summary,defaultpic,description) values(?,?,?,?)";
    private static final String UPDATE_PRODUCT = "update c_product set name=?,summary=?,defaultpic=?,description=? where uid=?";

    public List<Product> getAllProduct() {
        return getJdbcTemplate().query(SELECT_ALL_PRODUCT, new ProductRowMapper());
    }

    public List<Product> getProduct() {
        return getJdbcTemplate().query(SELECT_PRODUCT_INDEX, new ProductRowMapper());
    }

    public List<Product> getProductByPage(int pageNum) {
        return getJdbcTemplate().query(SELECT_PRODUCT_PAGE, new Object[]{pageNum + 1} ,new ProductRowMapper());
    }

    public Product getProductByUid(int uid) {
        return (Product) getJdbcTemplate().query(SELECT_PRODUCT, new Object[]{uid}, new ProductDetailRowMapper()).get(0);
    }

    public int insertProduct(Product product) {
        return getJdbcTemplate().update(INSERT_PRODUCT, new Object[]{product.getName(),
                product.getSummary(), product.getDefaultPic(), product.getEditorValue()});
    }

    public int updateProduct(Product product) {
        return getJdbcTemplate().update(UPDATE_PRODUCT, new Object[]{product.getName(), product.getSummary(),
                product.getDefaultPic(), product.getEditorValue(), product.getUid()});
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

    private class ProductDetailRowMapper implements RowMapper {
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setUid(rs.getInt("uid"));
            product.setName(rs.getString("name"));
            product.setSummary(rs.getString("summary"));
            product.setDefaultPic(rs.getString("defaultpic"));
            Blob desc = rs.getBlob("description");
            if(desc != null && desc.length() > 1){
                try {
                    product.setEditorValue(new String(desc.getBytes(1, (int) desc.length()), "UTF-8"));
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                }
            }
            return product;
        }
    }
}
