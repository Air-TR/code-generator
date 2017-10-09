package com.tr;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.HashMap;
import java.util.Map;

import com.tr.entity.City;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * // <#list map1?keys as key> //key:${key}---->value:${map1[key]?default("")}
 * // </#list>
 * 
 * @author admin
 *
 */

public class RunGenerator {
	
	private static void gen() {
		Model d = new Model();
		
		/** 释放注释生效 */
		String name = City /** 修改这里 */ .class.getSimpleName();
		
		d.setName(name);
		d.setModelName(name.substring(0, 1).toLowerCase() + name.substring(1));
		try {
			gen(d);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static final void main(String[] args) {
		gen();
		// 每天14:12分执行
//		CronScheduleBuilder cronScheduleBuilder = CronScheduleBuilder.dailyAtHourAndMinute(17, 30);
//		Trigger trigger = TriggerBuilder.newTrigger().withSchedule(cronScheduleBuilder).build();
//		org.quartz.impl.triggers.CronTriggerImpl cronTriggerImpl = (org.quartz.impl.triggers.CronTriggerImpl) trigger;
//		System.out.println(cronTriggerImpl.getCronExpression());
	}

	public static final void gen(Model m) throws IOException, TemplateException, URISyntaxException {

		Map<String, Object> root = new HashMap<String, Object>();
		root.put("d", m);

		Configuration config = new Configuration(Configuration.VERSION_2_3_25);
		URI uri = RunGenerator.class.getResource("/").toURI();
		File f = new File(uri);
		config.setDirectoryForTemplateLoading(f);

		{
			Template t = config.getTemplate("controller.ftl");
			// 生成 controller
			// Writer w = new OutputStreamWriter(System.out);
			Writer w = new OutputStreamWriter(new FileOutputStream(m.getName() + "Controller.java"), "UTF-8");
			t.process(root, w);
			w.close();
		}
		{
			Template t = config.getTemplate("service.ftl");
			// 生成 service
			// Writer w = new OutputStreamWriter(System.out);
			Writer w = new OutputStreamWriter(new FileOutputStream(m.getName() + "Service.java"), "UTF-8");
			t.process(root, w);
			w.close();
		}
		{
			Template t = config.getTemplate("repository.ftl");
			// 生成 repository
			// Writer w = new OutputStreamWriter(System.out);
			Writer w = new OutputStreamWriter(new FileOutputStream(m.getName() + "Repository.java"), "UTF-8");
			t.process(root, w);
			w.close();
		}
		
	}

}
