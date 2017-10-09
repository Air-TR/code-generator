package cn.zbxx.web.controller.${d.modelName};

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeanUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import cn.jlyc.common.pojo.PageReq;
import cn.jlyc.common.pojo.PageRes;
import cn.zbxx.dao.${d.modelName}.${d.name}Repository;
import cn.zbxx.entity.${d.name};
import cn.zbxx.result.Result;
import cn.zbxx.service.${d.modelName}.${d.name}Service;
import cn.zbxx.util.ParamCheckUtils;
import cn.zbxx.web.controller.BaseController;
import io.swagger.annotations.ApiOperation;

@RestController
public class ${d.name}Controller extends BaseController {

	public static final Logger logger = LoggerFactory.getLogger(${d.name}Controller.class);

	@Autowired
	private ${d.name}Service ${d.modelName}Service;
	
	@Autowired
	private ${d.name}Repository ${d.modelName}Repository;
	
	/**
	 * 新增
	 * 
	 * @param ${d.modelName}
	 * @return
	 */
	@ApiOperation(value = "新增实体")
	@PostMapping(value = "/mgr/${d.modelName}/add")
	public Result<${d.name}> add(@RequestBody ${d.name} ${d.modelName}) {
		return Result.success(${d.modelName}Repository.save(${d.modelName}));
	}

	/**
	 * 根据Id删除
	 * 
	 * @param id
	 * @return
	 */
	@ApiOperation(value = "根据Id删除实体")
	@DeleteMapping(value = "/mgr/${d.modelName}/delete/{id}")
	public Result<String> delete(@PathVariable Integer id) {
		${d.modelName}Repository.delete(id);
		return Result.success();
	}

	/**
	 * 修改
	 * 
	 * @param ${d.modelName}
	 * @return
	 */
	@ApiOperation(value = "修改实体")
	@PostMapping(value = "/mgr/${d.modelName}/modify")
	public Result<${d.name}> modify(@RequestBody ${d.name} ${d.modelName}) {
		ParamCheckUtils.notNull(new Object[] { ${d.modelName}.getId() }, new String[] { "id" });
		${d.name} record = ${d.modelName}Service.get(${d.name}.class, ${d.modelName}.getId());
		BeanUtil.copyNotNullProperties(${d.modelName}, record);
		record.setUpdateDate(new Date());
		${d.modelName}Service.merge(record);
		return Result.success(record);
	}
	
	/**
	 * 根据Id查找
	 * 
	 * @param id
	 * @return
	 */
	@ApiOperation(value = "根据Id查找实体")
	@GetMapping(value = "/mgr/${d.modelName}/get/{id}")
	public Result<${d.name}> get(@PathVariable Integer id) {
		return Result.success(${d.modelName}Repository.findOne(id));
	}

	/**
	 * 查询列表
	 * 
	 * @param ${d.modelName}
	 * @return
	 */
	@ApiOperation(value = "查询实体列表")
	@PostMapping(value = "/mgr/${d.modelName}/pageList")
	public PageRes<List<${d.name}>> pageList(@RequestBody PageReq<${d.name}> ${d.modelName}) {
		return ${d.modelName}Service.pageList(${d.modelName});
	}
	
}
