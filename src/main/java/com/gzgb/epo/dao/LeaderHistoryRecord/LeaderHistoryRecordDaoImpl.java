package com.gzgb.epo.dao.LeaderHistoryRecord;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.QueryException;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.gzgb.epo.dao.base.BaseDaoImpl;
import com.gzgb.epo.entity.KnowledgeDictItem;
import com.gzgb.epo.entity.LeaderHistoryRecord;

/**
 * 
 * <pre>
 * 舆论领袖参与历史事件DaoImpl
 * </pre>
 * @author LiuYongbin
 * @version 1.0, 2014-2-25
 */
@Repository
public class LeaderHistoryRecordDaoImpl extends BaseDaoImpl<LeaderHistoryRecord> implements LeaderHistoryRecordDao{

	/**
	 * 
	 * <pre>
	 * 根据社交账号获得记录
	 * </pre>
	 * 
	 * @param
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<LeaderHistoryRecord> findBySocialAccount(String socialAccount) throws QueryException{
		try {
			Criteria criteria = getSession().createCriteria(LeaderHistoryRecord.class);
			criteria.add(Restrictions.eq("socialAccount", socialAccount));
			List<LeaderHistoryRecord> list = criteria.list();
			if(list.size() == 0){
				return null;
			}	
			return list;	
		} catch (QueryException qe) {
			throw qe;
		}
	}
}
