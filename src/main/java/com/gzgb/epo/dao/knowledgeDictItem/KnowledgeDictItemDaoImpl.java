package com.gzgb.epo.dao.knowledgeDictItem;

import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Criteria;
import org.hibernate.QueryException;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.gzgb.epo.util.DateUtil;
import com.gzgb.epo.dao.base.BaseDaoImpl;
import com.gzgb.epo.dao.knowledgeDictLib.KnowledgeDictLibDaoImpl;
import com.gzgb.epo.dao.knowledgeDictQuality.KnowledgeDictQualityDaoImpl;
import com.gzgb.epo.entity.KnowledgeDictItem;
import com.gzgb.epo.entity.KnowledgeDictLib;
import com.gzgb.epo.entity.KnowledgeDictQuality;
/**
 * 
 * <pre>
 * 词条管理DaoImpl
 * </pre>
 * @author LiuYongbin
 * @version 1.0, 2014-1-2
 */
@Repository
public class KnowledgeDictItemDaoImpl extends BaseDaoImpl<KnowledgeDictItem> implements KnowledgeDictItemDao{
	
	@Autowired 
	private KnowledgeDictLibDaoImpl kdldi;
	
	@Autowired 
	private KnowledgeDictQualityDaoImpl kdqdi;
	/**
	*
	* <pre>
	* 获得本月新增词条
	* </pre>
	* @param 
	* @return 
	*/
	@SuppressWarnings("unchecked")
	@Override
	public int getNewCountsOfThisMonth() throws QueryException {
		List<KnowledgeDictItem> list = findAll(KnowledgeDictItem.class);
		int count = 0;
		DateUtil du = new DateUtil();
		String  monthOfNow = du.getMonthOfDate(new Date());	
		String yearOfNow = du.getYearOfDate(new Date());
		for(KnowledgeDictItem kdi: list){
			if(yearOfNow.equals(du.getYearOfDate(new Date((long)kdi.getKdiCreateTime()*1000))) && monthOfNow.equals(du.getMonthOfDate(new Date((long)kdi.getKdiCreateTime()*1000))))
				count++;
		}
		return count;
	}

	/**
	*
	* <pre>
	* 获得本年新增词条
	* </pre>
	* @param 
	* @return 
	*/
	@SuppressWarnings("unchecked")
	@Override
	public int getNewCountsOfThisYear() throws QueryException{
		List<KnowledgeDictItem> list = findAll(KnowledgeDictItem.class);
		int count = 0;
		DateUtil du = new DateUtil();
		String yearOfNow = du.getYearOfDate(new Date());
		for(KnowledgeDictItem kdi : list){
			if(yearOfNow.equals(du.getYearOfDate( new Date((long)kdi.getKdiCreateTime()*1000))))
				count++;
		}
		return count;
	}
	
	/**
	*
	* <pre>
	* 获得词条总数
	* </pre>
	* @param 
	* @return 
	*/
	@SuppressWarnings("unchecked")
	@Override
	public long getCountOfAll() throws QueryException{
		try {
			Criteria criteria = getSession().createCriteria(KnowledgeDictLib.class);
			List<KnowledgeDictLib> list = criteria.add(Restrictions.eq("kdlLevel", 1)).list();
			long total = 0;
			for(KnowledgeDictLib kdl : list){
				total+=kdl.getKdlCount();
			}
			return total;
		} catch (QueryException qe){
			throw qe;
			
		}
	}
	
	/**
	*
	* <pre>
	* 找出在特定的词库里面的最新的10条词条
	* List<Long> kdlId(词库的数组)
	* </pre>
	* @param 
	* @return 
	*/
	@SuppressWarnings("unchecked")
	@Override
	public List<KnowledgeDictItem> getNewItem(List<Long> kdlIdList) throws QueryException{
		try {
			Criteria criteria = getSession().createCriteria(KnowledgeDictItem.class);
			if(kdlIdList != null){
				criteria.add(Restrictions.in("kdlId.id", kdlIdList));
			}
			criteria.addOrder(Property.forName("kdiCreateTime").desc());
			return criteria.setMaxResults(10).list();
		} catch (QueryException qe) {
			throw qe;
		}
	}

	/**
	*
	* <pre>
	*根据所属词库、词性、以及模糊查询
	* </pre>
	* @param 
	* @return 
	*/
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> searchItem(List<Long> kdlIdList, Long kdqId, String fuzzy,Integer page, Integer rows,
			String sort, String order) throws QueryException{
		try {
				Criteria criteria = getSession().createCriteria(KnowledgeDictItem.class);
				KnowledgeDictLib kdl;
				KnowledgeDictQuality kdq;
				if(kdlIdList != null){
					 criteria.add(Restrictions.in("kdlId.id", kdlIdList));
				}
				if(kdqId != null && kdqId != 0){
					 kdq = kdqdi.findById(kdqId, KnowledgeDictQuality.class);
					 criteria.add(Restrictions.eq("kdqId", kdq));
				}
				if(fuzzy != null){
					 criteria.add(Restrictions.like("kdiName", "%"+fuzzy+"%"));
				}
				
				List<KnowledgeDictItem> list = criteria.list();
				int total = 0;
				if (list != null) {
					total = list.size();
				}
				if (page == null || page == 0) {
					page = 1;
				}
				if (rows == null || rows == 0) {
					rows = 10;
				}
				if (sort != null && order != null) {
					if ("asc".equals(order)) {
						criteria.addOrder(Order.asc(sort));
					} else {
						criteria.addOrder(Order.desc(sort));
					}
				} else {
					// 默认按照ID升序排序
					criteria.addOrder(Order.asc("id"));
				}
				List<KnowledgeDictItem> objList = criteria.setFirstResult((page - 1) * rows)
						.setMaxResults(rows).list();
				Map<String, Object> returnMap = new HashMap<String, Object>();
				if (objList != null && objList.size() > 0) {
					returnMap.put("total", total);
					returnMap.put("rows", objList);
					return returnMap;
				} else {
					returnMap.put("total", total);
					returnMap.put("rows", "");
					return returnMap;
				}
		} catch (QueryException qe) {
			throw qe;
		}
		
	}
	
	
	/**
	 * 
	 * <pre>
	 * 根据词条的名字查找词条
	 * </pre>
	 * 
	 * @param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public KnowledgeDictItem findByName(String kdiName) throws QueryException{
		try {
			Criteria criteria = getSession().createCriteria(KnowledgeDictItem.class);
			criteria.add(Restrictions.eq("kdiName", kdiName));
			List<KnowledgeDictItem> list = criteria.list();
			if(list.size() == 0){
				return null;
			}	
			return list.get(0);	
		} catch (QueryException qe) {
			throw qe;
		}
	}
	
	
	
	/**
	 * 
	 * <pre>
	 * 根据词条的名字和所属词库Id查找词条
	 * </pre>
	 * 
	 * @param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public KnowledgeDictItem findByNameAndKdlId(String kdiName, Long kdlId) throws QueryException{
		try {
			Criteria criteria = getSession().createCriteria(KnowledgeDictItem.class);
			criteria.add(Restrictions.eq("kdiName", kdiName));
			criteria.add(Restrictions.eq("kdlId.id", kdlId));
			List<KnowledgeDictItem> list = criteria.list();
			if(list.size() == 0){
				return null;
			}	
			return list.get(0);	
		} catch (QueryException qe) {
			throw qe;
		}
	}
	
}
