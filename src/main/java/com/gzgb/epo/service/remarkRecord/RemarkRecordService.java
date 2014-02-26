package com.gzgb.epo.service.remarkRecord;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzgb.epo.dao.messageCountChange.MessageCountChangeDao;
import com.gzgb.epo.dao.remakRecord.RemarkRecordDao;
import com.gzgb.epo.entity.MessageCountChange;
import com.gzgb.epo.entity.RemarkRecord;
import com.gzgb.epo.service.base.BaseService;
import com.gzgb.epo.service.knowledgeDictItem.KnowledgeDictItemService;

/**
 * 
 * <pre>
 * 言论记录Service
 * </pre>
 * @author LiuYongbin
 * @version 1.0, 2014-2-25
 */
@Service
public class RemarkRecordService extends BaseService<RemarkRecord>{


	private static Logger logger = LoggerFactory.getLogger(KnowledgeDictItemService.class);
	@Autowired
	private RemarkRecordDao rrDao;
	/**
	 * 
	 * <pre>
	 * 通过社交账号查找记录
	 * </pre>
	 * 
	 * @param socialAccount
	 * @return
	 */
	public List<RemarkRecord> findBySocialAccount(String socialAccount){
		try {
			logger.info("---findBySocialAccount()方法");
			return  rrDao.findBySocialAccount(socialAccount);
		} catch (Exception ex) {
			logger.error(ex.toString());
			return null;
		}

	}

}
