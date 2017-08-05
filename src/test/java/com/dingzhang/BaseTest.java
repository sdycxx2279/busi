package com.dingzhang;

/**
 * 配置spring和junit整合，junit启动时加载springIOC容器 spring-test,junit
 * @author Xiao Xu
 * @create 2017-08-03 16:36
 **/

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
// 告诉junit spring配置文件
@ContextConfiguration({ "classpath:applicationContext.xml" })
public class BaseTest {

}
