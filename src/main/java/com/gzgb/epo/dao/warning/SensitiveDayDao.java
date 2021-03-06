package com.gzgb.epo.dao.warning;

import java.util.Map;

import com.gzgb.epo.dao.base.BaseDao;
import com.gzgb.epo.entity.SensitiveDay;

/**
 * 
 * <pre>
 * 每天敏感信息量DAO
 * </pre>
 * @author XiaoJian
 * @version 1.0, 2014-3-1
 */
public interface SensitiveDayDao extends BaseDao<SensitiveDay> {
	
	/**
	 * 
	 * <pre>
	 * 查找最新敏感舆情数
	 * </pre>
	 * @param startTime 开始时间
	 * @param endTime 结束时间
	 * @return
	 */
	public SensitiveDay findLatelyCount(Integer startTime,
			Integer endTime);

}
