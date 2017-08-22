package com.dingzhang.util;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.io.IOUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.parser.Parser;
import org.jsoup.select.Elements;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import static com.dingzhang.constants.Constants.*;
import static sun.security.util.PolicyUtil.getInputStream;

/**
 * @author Xiao Xu
 * @create 2017-08-16 1:21
 **/

public class QiniuUtil {
    private static Configuration cfg = new Configuration(Zone.zone1());
    private static UploadManager uploadManager = new UploadManager(cfg);
    private static Auth auth = Auth.create(QINIU_ACCESS_KEY, QINIU_SECRET_KEY);

    //上传图片
    public static boolean uploadImage(MultipartFile image, String imageName){
        CommonsMultipartFile cf = (CommonsMultipartFile)image;
        DiskFileItem diskFileItem = (DiskFileItem) cf.getFileItem();
        try {
            InputStream inputStream = diskFileItem.getInputStream();
            byte[] uploadBytes = IOUtils.toByteArray(inputStream);
            String upToken = auth.uploadToken(QINIU_BUCKET_NAME);
            try {
                Response response = uploadManager.put(uploadBytes, imageName, upToken);
                //解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                }
                return false;
            }
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public static boolean uoloadLocalImage(String path, String imageName){
        String upToken = auth.uploadToken(QINIU_BUCKET_NAME);
        try {
            Response response = uploadManager.put(path, imageName, upToken);
            //解析上传成功的结果
            DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
        } catch (QiniuException ex) {
            Response r = ex.response;
            System.err.println(r.toString());
            try {
                System.err.println(r.bodyString());
            } catch (QiniuException ex2) {
                //ignore
            }
            return false;
        }
        return true;
    }

    public static boolean deleteImage(String path){
        String imageName = path.substring(QINIU_IMAGE_URL.length(),path.length());
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(QINIU_BUCKET_NAME, imageName);
            return true;
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            System.err.println(ex.code());
            System.err.println(ex.response.toString());
            return false;
        }
    }

    //上传富文本编辑器生成的html中所用到的图片
    public static String uploadHtmlImage(String path,String html){
        Document doc = Jsoup.parseBodyFragment(html);
        Elements imgs = doc.getElementsByTag("img");
        for (Element img : imgs) {
            String linkHref = img.attr("src");
            if(linkHref.indexOf(QINIU_IMAGE_URL)==-1){
                String fileName = linkHref.substring(26,34)+linkHref.substring(35,linkHref.length());
                uoloadLocalImage(path+linkHref,fileName);
                ImageUtil.deleteImage(path+linkHref);
                img.attr("src",QINIU_IMAGE_URL+fileName);
                img.attr("title",QINIU_IMAGE_URL+fileName);
            }
        }
        doc.outputSettings().prettyPrint(false);
        return doc.body().html();
    }

    //从七牛删除修改富文本编辑器内容后无用的图片
    public static void deleteUnusedImage(String oldhtml,String html){
        List<String> oldImgUrls = new ArrayList<String>();
        List<String> imgUrls = new ArrayList<String>();
        Document doc = Jsoup.parseBodyFragment(oldhtml);
        Elements imgs = doc.getElementsByTag("img");
        for (Element img : imgs) {
            oldImgUrls.add(img.attr("src"));
        }
        doc = Jsoup.parseBodyFragment(html);
        imgs = doc.getElementsByTag("img");
        for (Element img : imgs) {
            imgUrls.add(img.attr("src"));
        }
        boolean has = false;
        for(String oldImgUrl : oldImgUrls){
            for(String imgUrl:imgUrls){
                if(imgUrl.equals(oldImgUrl)){
                    has = true;
                    break;
                }
            }
            if(!has){
                deleteImage(oldImgUrl);
                has = false;
            }
        }
    }

    //以下两函数功能为将图片由开发七牛云迁移到业务七牛云
    public static String translate(String linkHref){
        String oldURL = "http://oum5cl51q.bkt.clouddn.com/";
        if(linkHref.indexOf(oldURL)== -1){
            return linkHref;
        }
        String fileName = linkHref.substring(oldURL.length(),linkHref.length());
        try {
            URL url = new URL(linkHref);
            // 打开连接
            URLConnection con = url.openConnection();
            // 输入流
            InputStream inputStream = con.getInputStream();
            byte[] uploadBytes = IOUtils.toByteArray(inputStream);
            String upToken = auth.uploadToken(QINIU_BUCKET_NAME);
            try {
                Response response = uploadManager.put(uploadBytes, fileName, upToken);
                //解析上传成功的结果
                DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
            } catch (QiniuException ex) {
                Response r = ex.response;
                System.err.println(r.toString());
                try {
                    System.err.println(r.bodyString());
                } catch (QiniuException ex2) {
                }
                return linkHref;
            }
        } catch (MalformedURLException e) {
            e.printStackTrace();
            return linkHref;
        } catch (IOException e) {
            e.printStackTrace();
            return linkHref;
        }
        return QINIU_IMAGE_URL+fileName;
    }

    public static String translateHtml(String html){
        URL url;
        Document doc = Jsoup.parseBodyFragment(html);
        Elements imgs = doc.getElementsByTag("img");
        for (Element img : imgs) {
            String linkHref = img.attr("src");

            String newUrl = translate(linkHref);
            img.attr("src",newUrl);
            img.attr("title",newUrl);
        }
        doc.outputSettings().prettyPrint(false);
        return doc.body().html();
    }
}
