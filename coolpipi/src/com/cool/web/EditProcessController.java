package com.cool.web;

import com.cool.dao.ProductDAO;
import com.cool.model.Product;
import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

/**
 * @author Zorro
 * 后台编译页面提交处理控制器
 */
public class EditProcessController {
    Logger log = Logger.getLogger(EditProcessController.class);
    private ProductDAO productDAO;

    public void setProductDAO(ProductDAO productDAO){
        this.productDAO = productDAO;
    }

    @RequestMapping("submit.do")
    public ModelAndView upload(HttpServletRequest request,HttpServletResponse response ){
        String pathdir = "/indexPic";               //图片上传路径
        String realpathdir = request.getSession().getServletContext().getRealPath(pathdir);    // 得到图片保存目录的真实路径
        String name = request.getParameter("name");
        String summary = request.getParameter("summary");
        MultipartHttpServletRequest multipartActionRequest = (MultipartHttpServletRequest) request;
        MultipartFile file = multipartActionRequest.getFile((String) multipartActionRequest.getFileNames().next());
        String fileName = ((CommonsMultipartFile) file).getFileItem().getName();
        //数据入库
        Product product = new Product();
        product.setName(name);
        product.setSummary(summary);
        product.setDefaultPic(fileName);
        productDAO.insertProduct(product);
        //图片保存到文件夹中
        if(file.getSize()>0){
            try{
                SaveFileFromInputStream(file.getInputStream(), realpathdir , fileName);
            } catch (IOException e){
                System.out.println(e.getMessage());
            }
        }
        return new ModelAndView("admin");
    }

    public void SaveFileFromInputStream(InputStream stream, String path, String filename) throws IOException{
        FileOutputStream fs= new FileOutputStream(path + "/"+ filename);
        byte[] buffer = new byte[1024*1024];
        int bytesum = 0;
        int byteread = 0;
        while ((byteread = stream.read(buffer))!=-1){
            bytesum += byteread;
            fs.write(buffer,0,byteread);
            fs.flush();
        }
        fs.close();
        stream.close();
    }
}
