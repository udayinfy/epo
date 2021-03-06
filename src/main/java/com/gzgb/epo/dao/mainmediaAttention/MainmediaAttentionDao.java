package com.gzgb.epo.dao.mainmediaAttention;

import java.util.List;
import java.util.Map;

import com.gzgb.epo.dao.base.BaseDao;
import com.gzgb.epo.entity.MainmediaAttention;
import com.gzgb.epo.entity.PublicEmotion;

/**
 * 
 * <pre>
 * 主流媒体关注度Dao
 * </pre>
 * 
 * @author LiuYongbin
 * @version 1.0, 2014-2-26
 */
public interface MainmediaAttentionDao extends BaseDao<MainmediaAttention> {

	/**
	 * 
	 * <pre>
	 * 根据情感的类型获得对应时间内的数量
	 * </pre>
	 * 
	 * @param type， month
	 * @return
	 */
	public List<MainmediaAttention> getListByTypeAndTime(String type, Long value, Integer startTime);
	
	/**
	 * 
	 * <pre>
	 *查找在特定月里面的不同的类型的数量list<正面的数量，中立的数量，负面的数量>
	 * </pre>
	 * 
	 * @param startAndEnd
	 * @param isAbout TODO
	 * @param mmId TODO
	 * @return
	 */
	public List<MainmediaAttention> getListBetweenTime(List<Integer> startAndEnd, Map<String, String> map, Integer isAbout, Long mmId);
	
	/**
	 * 
	 * <pre>
	 *根据mainmediaId查找相关类型的记录
	 * </pre>
	 * 
	 * @param mmid
	 * @return
	 */
	public List<MainmediaAttention> getCountListBymmId(Long mmid);
	
	/**
	 * 
	 * <pre>
	 *根据departmentId查找在特定月里面的不同的类型的数量list<正面的数量，中立的数量，负面的数量>
	 * </pre>
	 * 
	 * @param startAndEnd
	 * @return
	 */
	public List<MainmediaAttention> getListBetweenTimeBydbiId(List<Integer> startAndEnd, Long dbiId);
	
	/**
	 * 
	 * <pre>
	 *根据mmId和类型查找在特定时间内的记录
	 * </pre>
	 * @param isAbout TODO
	 * @param startAndEnd
	 * 
	 * @return
	 */
	public List<MainmediaAttention> getListBymmIdAndTypeAndTime(Long mmId, Integer startTime, Integer isAbout);
	
	/**
	 * 
	 * <pre>
	 * 根据月份(几月以前)统计部门关注度
	 * </pre>
	 * @param startTime
	 * @return
	 */
	public int[] getDepartmentConcern(Integer startTime);
}
