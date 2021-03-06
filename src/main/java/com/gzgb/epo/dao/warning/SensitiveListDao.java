package com.gzgb.epo.dao.warning;

import java.util.Map;

import com.gzgb.epo.dao.base.BaseDao;
import com.gzgb.epo.entity.SensitiveList;

/**
 * 
 * <pre>
 * 敏感信息DAO
 * </pre>
 * @author XiaoJian
 * @version 1.0, 2014-3-1
 */
public interface SensitiveListDao extends BaseDao<SensitiveList> {
	
	/**
	 * 
	 * <pre>
	 * 根据时间戳、站点、内容查询博敏感信息
	 * </pre>
	 * 
	 * @param startTime
	 *            开始时间戳
	 * @param endTime
	 *            结束时间戳
	 * @param site
	 *            站点
	 * @param content
	 *            内容
	 * @param page
	 *            当前第几页
	 * @param rows
	 *            每页显示数目
	 * @param sort
	 *            按某字段排序
	 * @param order
	 *            升/降序
	 * @return
	 */
	public Map<String, Object> findSensitive(Integer startTime, Integer endTime,
			Integer site, String content, Integer page, Integer rows,
			String sort, String order);

}
