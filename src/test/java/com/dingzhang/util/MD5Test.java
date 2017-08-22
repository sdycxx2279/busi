package com.dingzhang.util;

import com.dingzhang.BaseTest;
import com.dingzhang.dao.EnterpriseDao;
import com.dingzhang.model.EnterpriseExample;
import com.dingzhang.model.EnterpriseWithBLOBs;
import com.dingzhang.util.MD5Util;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

import static com.dingzhang.constants.Constants.QINIU_IMAGE_URL;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:34
 **/

public class MD5Test extends BaseTest{

    @Test
    public void testAdd() throws Exception {
        String randomName="";
        for(int i = 0;i < 6;i++){
            randomName += (int)(Math.random()*(10-1+1));
        }
        System.out.println(randomName);
    }
}
