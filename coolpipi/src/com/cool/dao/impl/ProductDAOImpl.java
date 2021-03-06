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
import java.util.*;

/**
 * @author zorro
 * Product数据库层实现类
 */
public class ProductDAOImpl extends JdbcDaoSupport implements ProductDAO {
    private static final String SELECT_ALL_PRODUCT = "select uid,name,summary,defaultpic,tag from c_product";
    private static final String SELECT_PRODUCT_INDEX = "select uid,name,summary,defaultpic,tag from c_product order by pv desc limit 8";
    private static final String SELECT_PRODUCT_PAGE = "select uid,name,summary,defaultpic,tag from c_product order by pv desc limit ?,8";
    private static final String SELECT_PRODUCT = "select uid,name,summary,defaultpic,description from c_product where uid = ?";
    private static final String INSERT_PRODUCT = "insert into c_product(name,summary,defaultpic,description) values(?,?,?,?)";
    private static final String UPDATE_PRODUCT = "update c_product set name=?,summary=?,defaultpic=?,description=? where uid=?";
    private Map<Integer, String> tagsMap = new HashMap();

    public void init() {
        tagsMap = getTagsFromDB();
    }

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

    public Map getTags() {
        return tagsMap;
    }

    public List<Integer> getTagsByUid(int uid) {
        String sql = "select tagid from c_tag_mapping where uid = ?";
        return getJdbcTemplate().query(sql, new Object[]{uid}, new RowMapper() {
            public Object mapRow(ResultSet resultSet, int i) throws SQLException {
                return resultSet.getInt("tagid");
            }
        });

    }

    public void editTag(int uid, String[] tags) {
        String delTagSql = "delete from c_tag_mapping where uid = ?";
        String addTagSql = "insert into c_tag_mapping(uid,tagid) values(?,?)";
        String updateSql = "update c_product set tag=? where uid = ?";

        getJdbcTemplate().update(delTagSql, new Object[]{uid});
        String tagsString = "";
        for(String tag : tags){
            Set<Integer> kset=tagsMap.keySet();
            boolean isExist = false;
            for(int tagId : kset){
                if(tag.equals(tagsMap.get(tagId))){
                    getJdbcTemplate().update(addTagSql, new Object[]{uid, tagId});
                    isExist = true;
                    tagsString += tag+",";
                    break;
                }
            }
            //表示标签不存在，需要新建标签
            if(!isExist){
                String sql = "insert into c_tag(tagname) values(?)";
                int tagId = tagsMap.size()+1;
                getJdbcTemplate().update(sql, new Object[]{tag});
                getJdbcTemplate().update(addTagSql, new Object[]{uid, tagId});
                tagsString += tag+",";
                init();
            }
        }
        if(!tagsString.isEmpty())
            getJdbcTemplate().update(updateSql, new Object[]{tagsString.substring(0,tagsString.length()-1), uid});
    }

    private Map getTagsFromDB() {
        String sql = "select tagid, tagname from c_tag";
        final Map<Integer, String> map = new HashMap();
        getJdbcTemplate().query(sql, new RowMapper() {
            public Object mapRow(ResultSet resultSet, int i) throws SQLException {
                map.put(Integer.valueOf(resultSet.getString("tagid")), resultSet.getString("tagname"));
                return null;
            }
        });
        return map;
    }

    private class ProductRowMapper implements RowMapper {
        public Object mapRow(ResultSet rs, int rowNum) throws SQLException {
            Product product = new Product();
            product.setUid(rs.getInt("uid"));
            product.setName(rs.getString("name"));
            product.setSummary(rs.getString("summary"));
            product.setDefaultPic(rs.getString("defaultpic"));
            String tag = rs.getString("tag");
            if(tag != null){
                product.setTag(Arrays.asList(tag.split(",")));
            }
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
