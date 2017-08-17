package com.dingzhang.util;

import com.dingzhang.BaseTest;
import com.dingzhang.dao.EnterpriseDao;
import com.dingzhang.model.EnterpriseWithBLOBs;
import com.dingzhang.util.MD5Util;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;

import static com.dingzhang.constants.Constants.QINIU_IMAGE_URL;

/**
 * @author Xiao Xu
 * @create 2017-08-06 20:34
 **/

public class MD5Test extends BaseTest{
    @Test
    public void testAdd() throws Exception {
        String html = "<p>qq</p><p>ww</p>";

        Document doc = Jsoup.parseBodyFragment(html);

        doc.outputSettings().prettyPrint(false);
        System.out.println(doc.body().html());
    }
}
