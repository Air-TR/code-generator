package cn.zbxx.service.${d.modelName};

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import cn.jlyc.common.hibernate.BaseService;
import cn.jlyc.common.pojo.HqlQuerys;
import cn.jlyc.common.pojo.PageReq;
import cn.jlyc.common.pojo.PageRes;
import cn.zbxx.entity.${d.name};

@Service
public class ${d.name}Service extends BaseService<${d.name}> {

    public static final Logger logger = LoggerFactory.getLogger(${d.name}Service.class);
    
    @Transactional(readOnly = true, propagation = Propagation.NOT_SUPPORTED)
    public PageRes<List<${d.name}>> pageList(PageReq<${d.name}> ${d.modelName}) {
        if (${d.modelName}.getData() == null) {
        		${d.modelName}.setData(new ${d.name}());
        }
        HqlQuerys qr = new HqlQuerys(true)
             .init(${d.modelName})
             .setQueryString("FROM ${d.name} a WHERE 1=1")
             .setCountString("SELECT COUNT(a.id) FROM ${d.name} a WHERE 1=1")
             .setOrderAlias("a")
             //.addParam("status", ${d.modelName}.getData().getStatus(), " and a.status = :status ")
             //.addParam("delf", Delf.N, " and a.delf = :delf ")
             //.addParam("roleId", ${d.modelName}.getData().getRoleId(), " and rs.id = :roleId ")
             //.setGroup("group by a.id ")
             ;
        PageRes<List<${d.name}>> res = super.pageList(qr);
        return res;
    }
    
}
