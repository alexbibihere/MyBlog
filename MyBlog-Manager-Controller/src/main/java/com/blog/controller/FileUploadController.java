package com.blog.controller;

import com.blog.utils.IDUtils;
import com.blog.utils.IOUtils;
import org.apache.commons.collections.map.HashedMap;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
/**
 * Created by Administrator on 2017/7/22.
 * 丁俊
 * ueditor 上传文件
 */
@Controller
@RequestMapping("/file")
public class FileUploadController {

        @RequestMapping(value = "/uploadimage",method = RequestMethod.POST,produces = MediaType.APPLICATION_JSON_VALUE)
        @ResponseBody
        public Map<String,Object> uploadImg(@RequestParam(value = "upfile",required = false)MultipartFile file, HttpServletRequest request, HttpServletResponse response){

            Map<String,Object> map = new HashedMap();
            try {
            // 上传文件以日期为单位分开存放，可以提高图片的查询速度
            String filePath = "/" + new SimpleDateFormat("yyyy").format(new Date()) + "_"
                    + new SimpleDateFormat("MM").format(new Date()) + "_"
                    + new SimpleDateFormat("dd").format(new Date());

                String realPath = "D:\\resourcesfile\\images\\"+filePath;
                File folder = new File(realPath);
                if(!folder.exists() && !folder.isDirectory()){
                        folder.mkdir();
                }
                //获得原始文件名
                String originalFilename = file.getOriginalFilename();
                String newFileName = IDUtils.genImageName() + originalFilename.substring(originalFilename.lastIndexOf("."));

                InputStream in = new BufferedInputStream(file.getInputStream());
                OutputStream out = new BufferedOutputStream(new FileOutputStream(new File(realPath,newFileName)));

                IOUtils.uploadCopy(in,out);

                //将图片的url插入到数据库中
                map.put("state", "SUCCESS");// UEDITOR的规则:不为SUCCESS则显示state的内容
                map.put("url",filePath+"/"+newFileName);         //能访问到你现在图片的路径
                map.put("title","");
                map.put("original","realName");
            }catch (Exception e){
                map.put("state", "文件上传失败!"); //在此处写上错误提示信息，这样当错误的时候就会显示此信息
                map.put("url","");
                map.put("title", "");
                map.put("original", "");
                e.printStackTrace();
            }
            return map;
        }
}