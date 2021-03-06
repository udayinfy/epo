package com.gzgb.epo.dao.warning;

import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.gzgb.epo.dao.base.BaseDaoImpl;
import com.gzgb.epo.entity.BlogList;
import com.gzgb.epo.entity.SensitiveDay;

/**
 * 
 * <pre>
 * 每天敏感信息量DAO实现类
 * </pre>
 * @author XiaoJian
 * @version 1.0, 2014-3-1
 */
@Repository
public class SensitiveDayDaoImpl extends BaseDaoImpl<SensitiveDay> implements
SensitiveDayDao {

	@Override
	public SensitiveDay findLatelyCount(Integer startTime, Integer endTime) {
		Criteria c = getSession().createCriteria(SensitiveDay.class);
		c.add(Restrictions.between("jsdUpdateTime", startTime, endTime));
		SensitiveDay sensitiveDay=null;
		if(c.list().size()>0){
			sensitiveDay = (SensitiveDay) c.list().get(0);
		}
		return sensitiveDay;
	}

}
