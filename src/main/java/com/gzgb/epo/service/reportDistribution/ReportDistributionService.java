package com.gzgb.epo.service.reportDistribution;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gzgb.epo.dao.mcode.McodeDao;
import com.gzgb.epo.dao.remakRecord.RemarkRecordDao;
import com.gzgb.epo.dao.reportDistribution.ReportDistributionDao;
import com.gzgb.epo.dao.reportFocusDistribution.ReportFocusDistributionDao;
import com.gzgb.epo.entity.MainmediaAttention;
import com.gzgb.epo.entity.PublicEmotion;
import com.gzgb.epo.entity.RemarkRecord;
import com.gzgb.epo.entity.ReportDistribution;
import com.gzgb.epo.service.base.BaseService;
import com.gzgb.epo.service.remarkRecord.RemarkRecordService;

/**
 * 
 * <pre>
 * 报道区域分布Service
 * </pre>
 * 
 * @author LiuYongbin
 * @version 1.0, 2014-2-26
 */
@Service
public class ReportDistributionService extends BaseService<ReportDistribution> {

	private static Logger logger = LoggerFactory.getLogger(RemarkRecordService.class);
	@Autowired
	private ReportDistributionDao rdDao;
	@Autowired
	private ReportFocusDistributionDao rfdDao;
	@Autowired
	private McodeDao mcDao;
	/**
	 * 
	 * <pre>
	 * 通过地区的Id 以及 时间 和 类型 找出对应的数量
	 * </pre>
	 * 
	 * @param cityRegionId  地区Id
	 * @param type  		0:为情感类型	1：为政治类型
	 * @param startTime  开始时间
	 * @param isAbout    是否涉穂
	 * @return
	 */
	public List<Long> getTypeListAfterTime(Long cityRegionId, Integer type, Integer startTime, Integer isAbout){ 
		try {
			logger.info("---getTypeListAfterTime()方法");
			Map<String, Long> map = null;
			if(cityRegionId != null){
				map = new HashMap<String, Long>();
				map.put("cityRegionId.id", cityRegionId);
			}
			long positiveCount = 0;
			long neutralCount = 0;
			long negativeCount = 0;
			List<ReportDistribution> list = rdDao.getListAfterTime(startTime, map, isAbout);
			List<Long> returnList = new ArrayList<Long>();
			if(list == null || list.size() == 0){
				returnList.add(positiveCount);
				returnList.add(neutralCount);
				returnList.add(negativeCount);
				return returnList;
			}
			else{
				//获得情感类型的数据
				if(type == 0){
					for(int j=0; j<list.size(); j++){
						if("1".equals(list.get(j).getReportEmotion().getMvalue()))
							positiveCount+=list.get(j).getReportCount();
						else if("2".equals(list.get(j).getReportEmotion().getMvalue()))
							neutralCount+=list.get(j).getReportCount();
						else
							negativeCount+=list.get(j).getReportCount();
					}
				}
				//获得政治类型的数据
				else{
					for(int j=0; j<list.size(); j++){
						if("1".equals(list.get(j).getReportPolitical().getMvalue()))
							positiveCount+=list.get(j).getReportCount();
						else if("2".equals(list.get(j).getReportPolitical().getMvalue()))
							neutralCount+=list.get(j).getReportCount();
						else
							negativeCount+=list.get(j).getReportCount();
					}
				}
				returnList.add(positiveCount);
				returnList.add(neutralCount);
				returnList.add(negativeCount);
				return returnList;
					
			}
		} catch (Exception ex) {
			logger.error(ex.toString());
			return null;
		}

	}
	
	/**
	 * 
	 * <pre>
	 * 根据cityRegionId和类型查找在特定时间内的不同的类型的数量list<正面的数量，中立的数量，负面的数量>
	 * </pre>
	 * @param type 情感/政治倾向 ：0、全部	1、情感	2、政治
	 * @param month 月份
	 * @param cityRegionId 地区的Id
	 * @param isAbout 是否涉穂
	 * 
	 * @return
	 */
	public List<Long> getCountListByRegionIdAndTypeAndTime(Long cityRegionId, Integer type, Integer startTime, Integer isAbout){
		try {
			logger.info("---getCountListByRegionIdAndTypeAndTime()方法");
			Map<String, Long> mapCityRegionId = null;
			if(cityRegionId != null){
				mapCityRegionId = new HashMap<String, Long>();
				mapCityRegionId.put("cityRegionId.id", cityRegionId);
			}
			List<ReportDistribution> list = rdDao.getListAfterTime(startTime, mapCityRegionId, isAbout);
			long positiveCount = 0;
			long neutralCount = 0;
			long negativeCount = 0;
			List<Long> returnList = new ArrayList<Long>();
			if(list == null || list.size() == 0){
				returnList.add(positiveCount);
				returnList.add(neutralCount);
				returnList.add(negativeCount);
				return returnList;
			}
			else{
				
				if(type == 0){
					for(ReportDistribution rd : list){
						if("1".equals(rd.getReportEmotion().getMvalue()))
							positiveCount+=rd.getReportCount();
						else if("2".equals(rd.getReportEmotion().getMvalue()))
							neutralCount+=rd.getReportCount();
						else
							negativeCount+=rd.getReportCount();		
					}
				}
				else{
					for(ReportDistribution rd : list){
						if("1".equals(rd.getReportPolitical().getMvalue()))
							positiveCount+=rd.getReportCount();
						else if("2".equals(rd.getReportPolitical().getMvalue()))
							neutralCount+=rd.getReportCount();
						else
							negativeCount+=rd.getReportCount();		
					}
					
				}		
				returnList.add(positiveCount);
				returnList.add(neutralCount);
				returnList.add(negativeCount);
				return returnList;
			}
		} catch (Exception ex) {
			logger.error(ex.toString());
			return null;
		}

	}
	
	
	/**
	 * 
	 * <pre>
	 * 根据地区的Id，起始时间，情感倾向/政治倾向类型，是否涉穂获得list<正面/右倾的数量，中立的数量，负面/左倾的数量>
	 * </pre>
	 * @param startAndEnd  地区Id
	 * @param startAndEnd	起始时间
	 * @param type 			情感/政治倾向
	 * @param isAbout 		是否涉穂
	 * @return
	 */
	public List<Long> getCountListBetweenTime(Long cityRegionId, List<Integer> startAndEnd, Integer type, Integer isAbout) {
		try {
			logger.info("---getCountListBetweenTime()方法");
			List<ReportDistribution> list = rdDao.getListBetweenTime(cityRegionId, startAndEnd, isAbout);
			long positiveCount = 0;
			long neutralCount = 0;
			long negativeCount = 0;
			List<Long> returnList = new ArrayList<Long>();
			if(list == null || list.size() == 0){
				returnList.add(positiveCount);
				returnList.add(neutralCount);
				returnList.add(negativeCount);
				return returnList;
			}	
			else{
				if(type == 0){
					for(ReportDistribution rr : list){
						if("1".equals(rr.getReportEmotion().getMvalue()))
							positiveCount+=rr.getReportCount();
						else if("2".equals(rr.getReportEmotion().getMvalue()))
							neutralCount+=rr.getReportCount();
						else
							negativeCount+=rr.getReportCount();		
					}
				}
				else{
					for(ReportDistribution rr : list){
						if("1".equals(rr.getReportPolitical().getMvalue()))
							positiveCount+=rr.getReportCount();
						else if("2".equals(rr.getReportPolitical().getMvalue()))
							neutralCount+=rr.getReportCount();
						else
							negativeCount+=rr.getReportCount();		
					}
				}
				
				returnList.add(positiveCount);
				returnList.add(neutralCount);
				returnList.add(negativeCount);
				return returnList;
			}
		} catch (Exception ex) {
			logger.error(ex.toString());
			return null;
		}

	}
	

}
