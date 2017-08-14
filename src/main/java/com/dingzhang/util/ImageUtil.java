package com.dingzhang.util;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

import static com.dingzhang.constants.Constants.uploadImageDir;

/**
 * @author Xiao Xu
 * @create 2017-08-14 15:05
 **/

public class ImageUtil {
    public static String uploadImage(String path, MultipartFile file){
        String fileName = file.getOriginalFilename();

        String newFilePathString = path+'/'+fileName;
        // 创建新图片
        File newFile = new File(newFilePathString);

        //保存
        try {
            if(!newFile.exists())
                newFile.createNewFile();
            file.transferTo(newFile);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return uploadImageDir+"/" + fileName;
    }
}
