package com.gzgb.epo.service.warning;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gzgb.epo.dao.warning.WeiBoListDao;
import com.gzgb.epo.entity.WeiBoList;
import com.gzgb.epo.service.base.BaseService;

/**
 * 
 * <pre>
 * 微博舆情service
 * </pre>
 * 
 * @author XiaoJian
 * @version 1.0, 2014-2-25
 */
@Service
@Transactional(readOnly = true)
public class WeiBoListService extends BaseService<WeiBoList> {

	private static Logger logger = LoggerFactory
			.getLogger(WeiBoListService.class);

	@Autowired
	private WeiBoListDao weiBoListMainDao;

	/**
	 * 
	 * <pre>
	 * 根据时间戳、微博站点、微博内容查询微博
	 * </pre>
	 * 
	 * @param startTime
	 *            开始时间戳
	 * @param endTime
	 *            结束时间戳
	 * @param site
	 *            微博站点（新浪/腾讯)
	 * @param content
	 *            微博内容
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
	public Map<String, Object> findWeiBo(Integer startTime, Integer endTime,
			Integer site, String content, Integer page, Integer rows,
			String sort, String order) {
		logger.info("--findWeiBo()方法");
		Map<String, Object> map = weiBoListMainDao.findWeiBo(startTime,
				endTime, site, content, page, rows, sort, order);
		return map;
	}

	/**
	 * 
	 * <pre>
	 * 根据时间戳、微博站点查询热度最高的20条微博
	 * </pre>
	 * 
	 * @param startTime
	 *            开始时间戳
	 * @param endTime
	 *            结束时间戳
	 * @param site
	 *            微博站点（新浪/腾讯)
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> findWeiBoTop20(Integer startTime,
			Integer endTime, Integer site) {
		logger.info("--findWeiBoTop20()方法");
		Map<String, Object> map = findWeiBo(startTime, endTime, site, null,
				null, null, null, null);
		List<WeiBoList> objList = (List<WeiBoList>) map.get("rows");
		List<Map<String, Object>> myMap = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < 20; i++) {
			WeiBoList weiBoList = objList.get(i);
			Map<String, Object> inMap = new HashMap<String, Object>(); 
			inMap.put("url", weiBoList.getWwlUrl());
			inMap.put("fullContent", weiBoList.getWwlContent());
			inMap.put("wsmId", weiBoList.getWsmId().getId());
			inMap.put("content", weiBoList.getWwlContent());
			inMap.put("comment", weiBoList.getWwlComment());
			inMap.put("ftorwarding", weiBoList.getWwlFtorwarding());
			inMap.put("author", weiBoList.getWwlAuthor());
			inMap.put("date", weiBoList.getWwlDate());
			inMap.put("date", weiBoList.getWwlDate());
			
		}
		return myMap;
	}

}
