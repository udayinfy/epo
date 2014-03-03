package com.gzgb.epo.controller.cityRecognize;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gzgb.epo.dao.publicEmotion.PublicEmotionDao;
import com.gzgb.epo.entity.DepartmentBaseInfo;
import com.gzgb.epo.entity.Hierarchy;
import com.gzgb.epo.entity.Mainmedia;
import com.gzgb.epo.entity.MainmediaAttention;
import com.gzgb.epo.entity.PublicEmotion;
import com.gzgb.epo.entity.RegionBaseInfo;
import com.gzgb.epo.service.departmentBaseInfo.DepartmentBaseInfoService;
import com.gzgb.epo.service.hierarchy.HierarchyService;
import com.gzgb.epo.service.keyWords.KeyWordsService;
import com.gzgb.epo.service.mainmediaAttention.MainmediaAttentionService;
import com.gzgb.epo.service.publicEmotion.PublicEmotionService;
import com.gzgb.epo.service.puerMainmedia.PuerMainmediaService;
import com.gzgb.epo.service.reportDistribution.ReportDistributionService;
import com.gzgb.epo.service.user.UserService;

/**
 * 
 * <pre>
 * 城市形象与认知度控制器
 * </pre>
 * 
 * @author XiaoJian
 * @version 1.0, 2013-12-18
 */
@Controller
@RequestMapping(value = "/cityRecognize")
public class CityRecognizeController {

	@Autowired
	private UserService userService;
	@Autowired
	private HierarchyService hService;
	@Autowired
	private PublicEmotionService peService;
	@Autowired
	private KeyWordsService kwService;
	@Autowired
	private ReportDistributionService rdService;
	@Autowired
	private PuerMainmediaService pmmService;
	@Autowired
	private MainmediaAttentionService mmaService;
	@Autowired
	private DepartmentBaseInfoService dbiService;
	Logger logger = LoggerFactory.getLogger(CityRecognizeController.class);

	/**
	 * 进入城市形象与认知度页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(Model model, HttpServletRequest request) {
		//公众情感
        String emotion_X = "1:|";
		String emotion_Y = "t:";
        long positive = peService.getCountByType("emotion", "正面");
        long negative = peService.getCountByType("emotion", "负面");
        long neutral = peService.getCountByType("emotion", "中立");
        emotion_Y = emotion_Y + (double)positive + "," + (double)neutral + "," + (double)negative;
        emotion_X = emotion_X + "喜欢|" + "中立|" + "讨厌|" + "0:|0|50|100";
        model.addAttribute("emotion_X", emotion_X);
        model.addAttribute("emotion_Y", emotion_Y);
        
        //情感变化倾向趋势
        Map<String, Long> positiveMap = peService.getMapTimeByType("emotion", "正面");
        Map<String, Long> negativeMap = peService.getMapTimeByType("emotion", "负面");
        Map<String, Long> neutralMap = peService.getMapTimeByType("emotion", "中立");
        List<PublicEmotion> peList = peService.findAll(PublicEmotion.class);
        TreeSet<String> timeSet = new TreeSet<String>();
        for(PublicEmotion pe : peList){
        	timeSet.add(pe.getTime());
        }
        String timeEmotion = "t:";
        String timePositive = "";
        String timeNeutral = "";
        String timeNegative = "";
        String timeString = "1:|0|50|100|0:";
        for(String time : timeSet){
        	timeString+="|" + time;
        	if((Long)positiveMap.get(time) != null)
        		timePositive+=(double)positiveMap.get(time)+",";
        	else
        		timePositive+=0.0+",";
        	if((Long)neutralMap.get(time) != null)
        		timeNeutral+=(double)neutralMap.get(time)+",";
        	else
        		timeNeutral+=0.0+",";
        	if((Long)negativeMap.get(time) != null)
        		timeNegative+=(double)negativeMap.get(time)+",";
        	else
        		timeNegative+=0.0+",";
        }
        if(timePositive.length()>0)
        timePositive = timePositive.substring(0, timePositive.length()-1);
        if(timeNeutral.length()>0)
        timeNeutral = timeNeutral.substring(0, timeNeutral.length()-1);
        if(timeNegative.length()>0)
        timeNegative = timeNegative.substring(0, timeNegative.length()-1);
        timeEmotion = timeEmotion + timePositive + "|" + timeNeutral + "|" + timeNegative;
        model.addAttribute("timeEmotion", timeEmotion);
        model.addAttribute("timeString", timeString);
        
        //主流媒体关注度排行
        Map<String, Map<String, Long>> map = mmaService.findAllMainmediaAttention(0);
        String mediaAttention_X = "0:";
        String mediaAttention_Y = "t:";
        String mediaPositive = "";
        String mediaNegative = "";
        String mediaNeutral = "";
        for(String key : map.keySet()){
        	mediaAttention_X+="|" + key;
        	if(map.get(key) != null){
        		if(map.get(key).get("正面") != null)
        			mediaPositive+=(map.get(key).get("正面")>100?(double)map.get(key).get("正面")/100:map.get(key).get("正面"))+",";
        		else
        			mediaPositive+=0.0+",";
        		if(map.get(key).get("中立") != null)
        			mediaNeutral+=(map.get(key).get("中立")>100?(double)map.get(key).get("中立")/100:map.get(key).get("中立"))+",";
        		else 
        			mediaNeutral+=0.0+",";
        		if(map.get(key).get("负面") != null)
        			mediaNegative+=(map.get(key).get("负面")>100?(double)map.get(key).get("负面")/100:map.get(key).get("负面"))+",";
        		else
        			mediaNegative+=0.0+",";
        	}
        	else{
        		mediaPositive+=0.0+",";
            	mediaNeutral+=0.0+",";
            	mediaNegative+=0.0+",";
        	}
        	
        
        }
        mediaAttention_X+="|" + "1:|0|50|100";
        if(mediaPositive.length()>0)
        mediaPositive = mediaPositive.substring(0, mediaPositive.length()-1);
        if(mediaNeutral.length()>0)
        mediaNeutral = mediaNeutral.substring(0, mediaNeutral.length()-1);
        if(mediaNegative.length()>0)
        mediaNegative = mediaNegative.substring(0, mediaNegative.length()-1);
        mediaAttention_Y = mediaAttention_Y + mediaPositive + "|" + mediaNeutral + "|" + mediaNegative;
        model.addAttribute("mediaAttention_Y", mediaAttention_Y);
        model.addAttribute("mediaAttention_X", mediaAttention_X);
        
        //公众对广州的关注度
        Map<String, Map<String, Long>> publicAttention = peService.getAllMapByType(Hierarchy.class);
        String publicAttention_X = "0:";
        String publicAttention_Y = "t:";
        String publicPositive = "";
        String publicNegative = "";
        String publicNeutral = "";
        for(String key : publicAttention.keySet()){
        	publicAttention_X+="|" + key;
        	if(publicAttention.get(key) != null){
        		if(publicAttention.get(key).get("正面") != null)
        			publicPositive+=(publicAttention.get(key).get("正面")>100?(double)publicAttention.get(key).get("正面")/100:publicAttention.get(key).get("正面"))+",";
        		else
        			publicPositive+=0.0+",";
        		if(publicAttention.get(key).get("中立") != null)
        			publicNeutral+=(publicAttention.get(key).get("中立")>100?(double)publicAttention.get(key).get("中立")/100:publicAttention.get(key).get("中立"))+",";
        		else 
        			publicNeutral+=0.0+",";
        		if(publicAttention.get(key).get("负面") != null)
        			publicNegative+=(publicAttention.get(key).get("负面")>100?(double)publicAttention.get(key).get("负面")/100:publicAttention.get(key).get("负面"))+",";
        		else
        			publicNegative+=0.0+",";
        	}
        	else{
        		publicPositive+=0.0+",";
            	publicNeutral+=0.0+",";
            	publicNegative+=0.0+",";
        	}
        	
        
        }
        publicAttention_X+="|" + "1:|0|50|100";
        if(publicPositive.length()>0)
        publicPositive = publicPositive.substring(0, publicPositive.length()-1);
        if(publicNeutral.length()>0)
        publicNeutral = publicNeutral.substring(0, publicNeutral.length()-1);
        if(publicNegative.length()>0)
        publicNegative = publicNegative.substring(0, publicNegative.length()-1);
        publicAttention_Y = publicAttention_Y + publicPositive + "|" + publicNeutral + "|" + publicNegative;
        model.addAttribute("publicAttention_Y", publicAttention_Y);
        model.addAttribute("publicAttention_X", publicAttention_X);
		return "cityRecognize/cityRecognizeIndex";
	}

	/**
	 * 进入情感分析页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityRecognizeSentimentAnalysis")
	public String sentimentAnalysis(Model model, HttpServletRequest request) {
		Map<String, Map<String, Long>> departmentAttention = peService.getAllMapByType(DepartmentBaseInfo.class);
		String departmentAttention_X = "0:";
        String departmentAttention_Y = "t:";
        String departmentPositive = "";
        String departmentNegative = "";
        String departmentNeutral = "";
        for(String key : departmentAttention.keySet()){
        	departmentAttention_X+="|" + key;
        	if(departmentAttention.get(key) != null){
        		if(departmentAttention.get(key).get("正面") != null)
        			departmentPositive+=(departmentAttention.get(key).get("正面")>100?(double)departmentAttention.get(key).get("正面")/100:departmentAttention.get(key).get("正面"))+",";
        		else
        			departmentPositive+=0.0+",";
        		if(departmentAttention.get(key).get("中立") != null)
        			departmentNeutral+=(departmentAttention.get(key).get("中立")>100?(double)departmentAttention.get(key).get("中立")/100:departmentAttention.get(key).get("中立"))+",";
        		else 
        			departmentNeutral+=0.0+",";
        		if(departmentAttention.get(key).get("负面") != null)
        			departmentNegative+=(departmentAttention.get(key).get("负面")>100?(double)departmentAttention.get(key).get("负面")/100:departmentAttention.get(key).get("负面"))+",";
        		else
        			departmentNegative+=0.0+",";
        	}
        	else{
        		departmentPositive+=0.0+",";
            	departmentNeutral+=0.0+",";
            	departmentNegative+=0.0+",";
        	}
        	
        
        }
        departmentAttention_X+="|" + "1:|0|50|100";
        if(departmentPositive.length()>0)
        departmentPositive = departmentPositive.substring(0, departmentPositive.length()-1);
        if(departmentNeutral.length()>0)
        departmentNeutral = departmentNeutral.substring(0, departmentNeutral.length()-1);
        if(departmentNegative.length()>0)
        departmentNegative = departmentNegative.substring(0, departmentNegative.length()-1);
        departmentAttention_Y = departmentAttention_Y + departmentPositive + "|" + departmentNeutral + "|" + departmentNegative;
        model.addAttribute("departmentAttention_Y", departmentAttention_Y);
        model.addAttribute("departmentAttention_X", departmentAttention_X);
        List<DepartmentBaseInfo> departmentName = dbiService.findAll(DepartmentBaseInfo.class);
        model.addAttribute("departmentName", departmentName);
		return "cityRecognize/cityRecognizeSentimentAnalysis_blank";
	}

	/**
	 * 进入印象关键词页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityRecognizeImpressionKey")
	public String impressionKey(Model model, HttpServletRequest request) {
		return "cityRecognize/cityRecognizeImpressionKey";
	}

	/**
	 * 进入涉穗报道分布图页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityRecognizeDistributionMap")
	public String distributionMap(Model model, HttpServletRequest request) {
		return "cityRecognize/cityRecognizeDistributionMap";
	}

	/**
	 * 进入主流媒体关注度页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityRecognizeMainMediaConcern")
	public String mainMediaConcern(Model model, HttpServletRequest request) {
		List<Mainmedia> mainMediaList = pmmService.findAll(Mainmedia.class);
	    model.addAttribute("mainMediaList", mainMediaList);
	    //主流媒体关注
	    Map<String, Map<String, Long>> map = mmaService.findAllMainmediaAttention(0);
        String mediaAttention_X = "0:";
        String mediaAttention_Y = "t:";
        String mediaPositive = "";
        String mediaNegative = "";
        String mediaNeutral = "";
        for(String key : map.keySet()){
        	mediaAttention_X+="|" + key;
        	if(map.get(key) != null){
        		if(map.get(key).get("正面") != null)
        			mediaPositive+=(map.get(key).get("正面")>100?(double)map.get(key).get("正面")/100:map.get(key).get("正面"))+",";
        		else
        			mediaPositive+=0.0+",";
        		if(map.get(key).get("中立") != null)
        			mediaNeutral+=(map.get(key).get("中立")>100?(double)map.get(key).get("中立")/100:map.get(key).get("中立"))+",";
        		else 
        			mediaNeutral+=0.0+",";
        		if(map.get(key).get("负面") != null)
        			mediaNegative+=(map.get(key).get("负面")>100?(double)map.get(key).get("负面")/100:map.get(key).get("负面"))+",";
        		else
        			mediaNegative+=0.0+",";
        	}
        	else{
        		mediaPositive+=0.0+",";
            	mediaNeutral+=0.0+",";
            	mediaNegative+=0.0+",";
        	}
        	
        
        }
        mediaAttention_X+="|" + "1:|0|50|100";
        if(mediaPositive.length()>0)
        mediaPositive = mediaPositive.substring(0, mediaPositive.length()-1);
        if(mediaNeutral.length()>0)
        mediaNeutral = mediaNeutral.substring(0, mediaNeutral.length()-1);
        if(mediaNegative.length()>0)
        mediaNegative = mediaNegative.substring(0, mediaNegative.length()-1);
        mediaAttention_Y = mediaAttention_Y + mediaPositive + "|" + mediaNeutral + "|" + mediaNegative;
        model.addAttribute("mediaAttention_Y", mediaAttention_Y);
        model.addAttribute("mediaAttention_X", mediaAttention_X);
        
        //获得特定媒体的总关注度
        Iterator iterator = mainMediaList.iterator();
        Mainmedia mainmedia = (Mainmedia)iterator.next();
        Map<String, Long> mainmediaMap = mmaService.findMainmediaAttentionByName(mainmedia.getName(),0);
        
        String mainmedia_X="";
        String mainmedia_Y="t:";
        if(mainmediaMap != null && !mainmediaMap.isEmpty())
        for(String name : mainmediaMap.keySet()){
        	mainmedia_X+=name+"|";
        	if(mainmediaMap.get(name) != null)
        		mainmedia_Y+=mainmediaMap.get(name)+",";
        	else
        		mainmedia_Y+=0.0+",";
        }
        mainmedia_X = mainmedia_X.substring(0,  mainmedia_X.length()-1);
        mainmedia_Y = mainmedia_Y.substring(0,  mainmedia_Y.length()-1);
        model.addAttribute("mainmedia_X", mainmedia_X);
        model.addAttribute("mainmedia_Y", mainmedia_Y);
        
        
        //获得特定媒体的涉穂关注度
  
        Map<String, Long> mainmediaIsAboutMap = mmaService.findMainmediaAttentionByName(mainmedia.getName(),1);
        
        String maindmediaIsAbout_X="";
        String mainmediaIsAbout_Y="t:";
        if(mainmediaIsAboutMap != null && !mainmediaIsAboutMap.isEmpty())
        for(String name : mainmediaIsAboutMap.keySet()){
        	maindmediaIsAbout_X+=name+"|";
        	if(mainmediaMap.get(name) != null)
        		mainmediaIsAbout_Y+=mainmediaIsAboutMap.get(name)+",";
        	else
        		mainmediaIsAbout_Y+=0.0+",";
        }
        if(maindmediaIsAbout_X.length() > 0)
        maindmediaIsAbout_X = maindmediaIsAbout_X.substring(0,  maindmediaIsAbout_X.length()-1);
        if(mainmediaIsAbout_Y.length() > 0)
        mainmediaIsAbout_Y = mainmediaIsAbout_Y.substring(0,  mainmediaIsAbout_Y.length()-1);
        model.addAttribute("mainmediaIsAbout_X", maindmediaIsAbout_X);
        model.addAttribute("mainmediaIsAbout_Y", mainmediaIsAbout_Y);
        
        //获得特定媒体的涉穂报道情感变化
        Map<String, Map<String, Long>> attentionChange = mmaService.getEmotionChgTimeByName(mainmedia.getName(), 1);
	   // List<String> list = new ArrayList<String>();
	    String hemotion_Y = "t:";
        String hemotionPositive = "";
        String hemotionNeutral = "";
        String hemotionNegative = "";
        String hemotion_X = "1:|0|50|100|0:";
        List<MainmediaAttention> mainmediaList = mmaService.findAll(MainmediaAttention.class);
        TreeSet<String> htimeSet = new TreeSet<String>();
        if( mainmediaList != null && mainmediaList.size() != 0){
	        for(MainmediaAttention pe : mainmediaList){
	        	htimeSet.add(pe.getTime());
	        }
	        if(attentionChange != null && !attentionChange.isEmpty())
	        for(String time : htimeSet){
	        	hemotion_X+="|" + time;
	        	if(attentionChange.get("正面") != null){
		        	if((Long)attentionChange.get("正面").get(time) != null)
		        		hemotionPositive+=(double)attentionChange.get("正面").get(time)+",";
		        	else
		        		hemotionPositive+=0.0+",";
	        	}
	        	else
	        		hemotionPositive+=0.0+",";
	        	if(attentionChange.get("中立") != null){
		        	if((Long)attentionChange.get("中立").get(time) != null)
		        		hemotionNeutral+=(double)attentionChange.get("中立").get(time)+",";
		        	else
		        		hemotionNeutral+=0.0+",";
	        	}
	        	else
	        		hemotionNeutral+=0.0+",";
	        	if(attentionChange.get("负面") != null){
		        	if((Long)attentionChange.get("负面").get(time) != null)
		        		hemotionNegative+=(double)attentionChange.get("负面").get(time)+",";
		        	else
		        		hemotionNegative+=0.0+",";
	        	}
	        	else
	        		hemotionNegative+=0.0+",";
            }
	    }
        if(hemotionPositive.length()>0)
        hemotionPositive = hemotionPositive.substring(0, hemotionPositive.length()-1);
        if(hemotionNeutral.length()>0)
        hemotionNeutral = hemotionNeutral.substring(0, hemotionNeutral.length()-1);
        if(hemotionNegative.length()>0)
        hemotionNegative = hemotionNegative.substring(0, hemotionNegative.length()-1);
        hemotion_Y = hemotion_Y + hemotionPositive + "|" + hemotionNeutral + "|" + hemotionNegative;
        model.addAttribute("hemotion_Y", hemotion_Y);
        model.addAttribute("hemotion_X", hemotion_X);
		return "cityRecognize/cityRecognizeMainMediaConcern_blank";
	}

	/**
	 * 进入公众评价页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "cityRecognizePublicOpinion")
	public String publicOpinion(Model model, HttpServletRequest request) {
	    List<Hierarchy> hierarchyList = hService.findAll(Hierarchy.class);
	    model.addAttribute("hierarchyList", hierarchyList);
		//情感变化倾向趋势
        Map<String, Long> positiveMap = peService.getMapTimeByType("emotion", "正面");
        Map<String, Long> negativeMap = peService.getMapTimeByType("emotion", "负面");
        Map<String, Long> neutralMap = peService.getMapTimeByType("emotion", "中立");
        List<PublicEmotion> peList = peService.findAll(PublicEmotion.class);
        TreeSet<String> timeSet = new TreeSet<String>();
        for(PublicEmotion pe : peList){
        	timeSet.add(pe.getTime());
        }
        String timeEmotion = "t:";
        String timePositive = "";
        String timeNeutral = "";
        String timeNegative = "";
        String timeString = "1:|0|50|100|0:";
        for(String time : timeSet){
        	timeString+="|" + time;
        	if((Long)positiveMap.get(time) != null)
        		timePositive+=(double)positiveMap.get(time)+",";
        	else
        		timePositive+=0.0+",";
        	if((Long)neutralMap.get(time) != null)
        		timeNeutral+=(double)neutralMap.get(time)+",";
        	else
        		timeNeutral+=0.0+",";
        	if((Long)negativeMap.get(time) != null)
        		timeNegative+=(double)negativeMap.get(time)+",";
        	else
        		timeNegative+=0.0+",";
        }
        if(timePositive.length()>0)
        timePositive = timePositive.substring(0, timePositive.length()-1);
        if(timeNeutral.length()>0)
        timeNeutral = timeNeutral.substring(0, timeNeutral.length()-1);
        if(timeNegative.length()>0)
        timeNegative = timeNegative.substring(0, timeNegative.length()-1);
        timeEmotion = timeEmotion + timePositive + "|" + timeNeutral + "|" + timeNegative;
        model.addAttribute("timeEmotion", timeEmotion);
        model.addAttribute("timeString", timeString);
        //公众对广州的关注度
        Map<String, Map<String, Long>> publicAttention = peService.getAllMapByType(Hierarchy.class);
        String publicAttention_X = "0:";
        String publicAttention_Y = "t:";
        String publicPositive = "";
        String publicNegative = "";
        String publicNeutral = "";
        for(String key : publicAttention.keySet()){
        	publicAttention_X+="|" + key;
        	if(publicAttention.get(key) != null){
        		if(publicAttention.get(key).get("正面") != null)
        			publicPositive+=(publicAttention.get(key).get("正面")>100?(double)publicAttention.get(key).get("正面")/100:publicAttention.get(key).get("正面"))+",";
        		else
        			publicPositive+=0.0+",";
        		if(publicAttention.get(key).get("中立") != null)
        			publicNeutral+=(publicAttention.get(key).get("中立")>100?(double)publicAttention.get(key).get("中立")/100:publicAttention.get(key).get("中立"))+",";
        		else 
        			publicNeutral+=0.0+",";
        		if(publicAttention.get(key).get("负面") != null)
        			publicNegative+=(publicAttention.get(key).get("负面")>100?(double)publicAttention.get(key).get("负面")/100:publicAttention.get(key).get("负面"))+",";
        		else
        			publicNegative+=0.0+",";
        	}
        	else{
        		publicPositive+=0.0+",";
            	publicNeutral+=0.0+",";
            	publicNegative+=0.0+",";
        	}
        	
        
        }
        publicAttention_X+="|" + "1:|0|50|100";
        if(publicPositive.length()>0)
        publicPositive = publicPositive.substring(0, publicPositive.length()-1);
        if(publicNeutral.length()>0)
        publicNeutral = publicNeutral.substring(0, publicNeutral.length()-1);
        if(publicNegative.length()>0)
        publicNegative = publicNegative.substring(0, publicNegative.length()-1);
        publicAttention_Y = publicAttention_Y + publicPositive + "|" + publicNeutral + "|" + publicNegative;
        model.addAttribute("publicAttention_Y", publicAttention_Y);
        model.addAttribute("publicAttention_X", publicAttention_X);
        
        //根据特定的阶层，获得其情感情况
        Iterator iterator = publicAttention.keySet().iterator();
        String hierarhyName = (String)iterator.next();
        Map<String, Long> hierarchyMap = peService.getMapByType("hierarchy",hierarhyName);
        String hierarchy_X="";
        String hierarchy_Y="t:";
        if(hierarchyMap != null && !hierarchyMap.isEmpty())
        for(String name : hierarchyMap.keySet()){
        	hierarchy_X+=name+"|";
        	if(hierarchyMap.get(name) != null)
        		hierarchy_Y+=hierarchyMap.get(name)+",";
        	else
        		hierarchy_Y+=0.0+",";
        }
        hierarchy_X = hierarchy_X.substring(0,  hierarchy_X.length()-1);
        hierarchy_Y = hierarchy_Y.substring(0,  hierarchy_Y.length()-1);
        model.addAttribute("hierarchy_X", hierarchy_X);
        model.addAttribute("hierarchy_Y", hierarchy_Y);
        
        //获得特定阶层的不同教育水平的数据
        Map<String, Map<String, Long>> educationMap = peService.getAllMapBySpecialType("hierarchy",hierarhyName );
        String heducation_X = "0:";
        String heducation_Y = "t:";
        String educationPositive = "";
        String educationNegative = "";
        String educationNeutral = "";
        if(educationMap != null && !educationMap.isEmpty())
        for(String key : educationMap.keySet()){
        	heducation_X+="|" + key;
        	if(educationMap.get(key) != null){
        		if(educationMap.get(key).get("正面") != null)
        			educationPositive+=(educationMap.get(key).get("正面")>100?(double)educationMap.get(key).get("正面")/100:educationMap.get(key).get("正面"))+",";
        		else
        			educationPositive+=0.0+",";
        		if(educationMap.get(key).get("中立") != null)
        			educationNeutral+=(educationMap.get(key).get("中立")>100?(double)educationMap.get(key).get("中立")/100:educationMap.get(key).get("中立"))+",";
        		else 
        			educationNeutral+=0.0+",";
        		if(educationMap.get(key).get("负面") != null)
        			educationNegative+=(educationMap.get(key).get("负面")>100?(double)educationMap.get(key).get("负面")/100:educationMap.get(key).get("负面"))+",";
        		else
        			educationNegative+=0.0+",";
        	}
        	else{
        		educationPositive+=0.0+",";
        		educationNeutral+=0.0+",";
        		educationNegative+=0.0+",";
        	}
        	
        
        }
        heducation_X+="|" + "1:|0|50|100";
        if(educationPositive.length()>0)
        educationPositive = educationPositive.substring(0, educationPositive.length()-1);
        if(educationNeutral.length()>0)
        educationNeutral = educationNeutral.substring(0, educationNeutral.length()-1);
        if(educationNegative.length()>0)
        educationNegative = educationNegative.substring(0, educationNegative.length()-1);
        heducation_Y = heducation_Y + educationPositive + "|" + educationNeutral + "|" + educationNegative;
        model.addAttribute("heducation_Y", heducation_Y);
        model.addAttribute("heducation_X", heducation_X);
        
         //获得特定阶层的情感变化
        Map<String, Map<String, Long>> attentionChange = peService.getEmotionChgTimeByType("hierarchy", hierarhyName);
		    List<String> list = new ArrayList<String>();
		    String hemotion_Y = "t:";
	        String hemotionPositive = "";
	        String hemotionNeutral = "";
	        String hemotionNegative = "";
	        String hemotion_X = "1:|0|50|100|0:";
	        List<PublicEmotion> hierarypeList = peService.findAll(PublicEmotion.class);
	        TreeSet<String> htimeSet = new TreeSet<String>();
	        for(PublicEmotion pe : hierarypeList){
	        	htimeSet.add(pe.getTime());
	        }
	        if(attentionChange != null && !attentionChange.isEmpty())
	        for(String time : htimeSet){
	        	hemotion_X+="|" + time;
	        	if(attentionChange.get("正面") != null){
		        	if((Long)attentionChange.get("正面").get(time) != null)
		        		hemotionPositive+=(double)attentionChange.get("正面").get(time)+",";
		        	else
		        		hemotionPositive+=0.0+",";
	        	}
	        	else
	        		hemotionPositive+=0.0+",";
	        	if(attentionChange.get("中立") != null){
		        	if((Long)attentionChange.get("中立").get(time) != null)
		        		hemotionNeutral+=(double)attentionChange.get("中立").get(time)+",";
		        	else
		        		hemotionNeutral+=0.0+",";
	        	}
	        	else
	        		hemotionNeutral+=0.0+",";
	        	if(attentionChange.get("负面") != null){
		        	if((Long)attentionChange.get("负面").get(time) != null)
		        		hemotionNegative+=(double)attentionChange.get("负面").get(time)+",";
		        	else
		        		hemotionNegative+=0.0+",";
	        	}
	        	else
	        		hemotionNegative+=0.0+",";
	        }
	        if(hemotionPositive.length()>0)
	        hemotionPositive = hemotionPositive.substring(0, hemotionPositive.length()-1);
	        if(hemotionNeutral.length()>0)
	        hemotionNeutral = hemotionNeutral.substring(0, hemotionNeutral.length()-1);
	        if(hemotionNegative.length()>0)
	        hemotionNegative = hemotionNegative.substring(0, hemotionNegative.length()-1);
	        hemotion_Y = hemotion_Y + hemotionPositive + "|" + hemotionNeutral + "|" + hemotionNegative;
            model.addAttribute("hemotion_Y", hemotion_Y);
            model.addAttribute("hemotion_X", hemotion_X);
		return "cityRecognize/cityRecognizePublicOpinion_blank";
	}
	
	/**
	 * ajax getAttentionChange
	 * 
	 * @return
	 */
	@RequestMapping(value = "getAttentionChange")
	public @ResponseBody
	List<String> getAttentionChange(HttpServletRequest request, String department) {
		Map<String, Map<String, Long>> attentionChange = peService.getEmotionChgTimeByType("department", department);
		if(attentionChange == null)
			return null;
		List<String> list = new ArrayList<String>();
		    String department_Y = "t:";
	        String timePositive = "";
	        String timeNeutral = "";
	        String timeNegative = "";
	        String department_X = "1:|0|50|100|0:";
	        List<PublicEmotion> peList = peService.findAll(PublicEmotion.class);
	        TreeSet<String> timeSet = new TreeSet<String>();
	        for(PublicEmotion pe : peList){
	        	timeSet.add(pe.getTime());
	        }
	        for(String time : timeSet){
	        	department_X+="|" + time;
	        	if(attentionChange.get("正面") != null){
		        	if((Long)attentionChange.get("正面").get(time) != null)
		        		timePositive+=(double)attentionChange.get("正面").get(time)+",";
		        	else
		        		timePositive+=0.0+",";
	        	}
	        	else
	        		timePositive+=0.0+",";
	        	if(attentionChange.get("中立") != null){
		        	if((Long)attentionChange.get("中立").get(time) != null)
		        		timeNeutral+=(double)attentionChange.get("中立").get(time)+",";
		        	else
		        		timeNeutral+=0.0+",";
	        	}
	        	else
	        		timePositive+=0.0+",";
	        	if(attentionChange.get("负面") != null){
		        	if((Long)attentionChange.get("负面").get(time) != null)
		        		timeNegative+=(double)attentionChange.get("负面").get(time)+",";
		        	else
		        		timeNegative+=0.0+",";
	        	}
	        	else
	        		timePositive+=0.0+",";
	        }
	        timePositive = timePositive.substring(0, timePositive.length()-1);
	        timeNeutral = timeNeutral.substring(0, timeNeutral.length()-1);
	        timeNegative = timeNegative.substring(0, timeNegative.length()-1);
	        department_Y = department_Y + timePositive + "|" + timeNeutral + "|" + timeNegative;
	        list.add(department_Y);
	        list.add(department_X);
	        return list;
	}


	/**
	 * ajax getHierarchyDetail
	 * 
	 * @return
	 */
	@RequestMapping(value = "getHierarchyDetail")
	public @ResponseBody
	List<Map<String, String>> getHierarchyDetail(HttpServletRequest request, String hierarchyName) {	
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		//根据特定的阶层，获得其情感情况
        Map<String, Long> hierarchyMap = peService.getMapByType("hierarchy",hierarchyName);
        String hierarchy_X="";
        String hierarchy_Y="t:";
        if(hierarchyMap != null && !hierarchyMap.isEmpty())
        for(String name : hierarchyMap.keySet()){
        	hierarchy_X+=name+"|";
        	if(hierarchyMap.get(name) != null)
        		hierarchy_Y+=hierarchyMap.get(name)+",";
        	else
        		hierarchy_Y+=0.0+",";
        }
        hierarchy_X = hierarchy_X.substring(0,  hierarchy_X.length()-1);
        hierarchy_Y = hierarchy_Y.substring(0,  hierarchy_Y.length()-1);
        Map<String, String> hMap = new HashMap<String, String>();
        hMap.put("X", hierarchy_X);
        hMap.put("Y", hierarchy_Y);
        list.add(hMap);
        
        //获得特定阶层的不同教育水平的数据
        Map<String, Map<String, Long>> educationMap = peService.getAllMapBySpecialType("hierarchy",hierarchyName );
        String heducation_X = "0:";
        String heducation_Y = "t:";
        String educationPositive = "";
        String educationNegative = "";
        String educationNeutral = "";
        if(educationMap != null && !educationMap.isEmpty())
        for(String key : educationMap.keySet()){
        	heducation_X+="|" + key;
        	if(educationMap.get(key) != null){
        		if(educationMap.get(key).get("正面") != null)
        			educationPositive+=(educationMap.get(key).get("正面")>100?(double)educationMap.get(key).get("正面")/100:educationMap.get(key).get("正面"))+",";
        		else
        			educationPositive+=0.0+",";
        		if(educationMap.get(key).get("中立") != null)
        			educationNeutral+=(educationMap.get(key).get("中立")>100?(double)educationMap.get(key).get("中立")/100:educationMap.get(key).get("中立"))+",";
        		else 
        			educationNeutral+=0.0+",";
        		if(educationMap.get(key).get("负面") != null)
        			educationNegative+=(educationMap.get(key).get("负面")>100?(double)educationMap.get(key).get("负面")/100:educationMap.get(key).get("负面"))+",";
        		else
        			educationNegative+=0.0+",";
        	}
        	else{
        		educationPositive+=0.0+",";
        		educationNeutral+=0.0+",";
        		educationNegative+=0.0+",";
        	}
        	
        
        }
        heducation_X+="|" + "1:|0|50|100";
        
        if(educationPositive.length()>0)
        educationPositive = educationPositive.substring(0, educationPositive.length()-1);
        if(educationNeutral.length()>0)
        educationNeutral = educationNeutral.substring(0, educationNeutral.length()-1);
        if(educationNegative.length()>0)
        educationNegative = educationNegative.substring(0, educationNegative.length()-1);
        heducation_Y = heducation_Y + educationPositive + "|" + educationNeutral + "|" + educationNegative;
        Map<String, String> heMap = new HashMap<String, String>();
        heMap.put("X", heducation_X);
        heMap.put("Y", heducation_Y);
        list.add(heMap);
        
         //获得特定阶层的情感变化
        Map<String, Map<String, Long>> attentionChange = peService.getEmotionChgTimeByType("hierarchy", hierarchyName);
		    List<String> attentionChangeList = new ArrayList<String>();
		    String hemotion_Y = "t:";
	        String hemotionPositive = "";
	        String hemotionNeutral = "";
	        String hemotionNegative = "";
	        String hemotion_X = "1:|0|50|100|0:";
	        List<PublicEmotion> hierarypeList = peService.findAll(PublicEmotion.class);
	        TreeSet<String> htimeSet = new TreeSet<String>();
	        for(PublicEmotion pe : hierarypeList){
	        	htimeSet.add(pe.getTime());
	        }
	        if(attentionChange != null && !attentionChange.isEmpty())
	        for(String time : htimeSet){
	        	hemotion_X+="|" + time;
	        	if(attentionChange.get("正面") != null){
		        	if((Long)attentionChange.get("正面").get(time) != null)
		        		hemotionPositive+=(double)attentionChange.get("正面").get(time)+",";
		        	else
		        		hemotionPositive+=0.0+",";
	        	}
	        	else
	        		hemotionPositive+=0.0+",";
	        	if(attentionChange.get("中立") != null){
		        	if((Long)attentionChange.get("中立").get(time) != null)
		        		hemotionNeutral+=(double)attentionChange.get("中立").get(time)+",";
		        	else
		        		hemotionNeutral+=0.0+",";
	        	}
	        	else
	        		hemotionNeutral+=0.0+",";
	        	if(attentionChange.get("负面") != null){
		        	if((Long)attentionChange.get("负面").get(time) != null)
		        		hemotionNegative+=(double)attentionChange.get("负面").get(time)+",";
		        	else
		        		hemotionNegative+=0.0+",";
	        	}
	        	else
	        		hemotionNegative+=0.0+",";
	        }
	        if(hemotionPositive.length()>0)
	        hemotionPositive = hemotionPositive.substring(0, hemotionPositive.length()-1);
	        if(hemotionNeutral.length()>0)
	        hemotionNeutral = hemotionNeutral.substring(0, hemotionNeutral.length()-1);
	        if(hemotionNegative.length()>0)
	        hemotionNegative = hemotionNegative.substring(0, hemotionNegative.length()-1);
	        hemotion_Y = hemotion_Y + hemotionPositive + "|" + hemotionNeutral + "|" + hemotionNegative;
	        Map<String, String> hemMap = new HashMap<String, String>();
	        hemMap.put("X", hemotion_X);
	        hemMap.put("Y", hemotion_Y);
	        list.add(hemMap);
		    return list;	
		  
	}

	/**
	 * ajax getMainmediaAttentionDetail
	 * 
	 * @return
	 */
	@RequestMapping(value = "getMainmediaAttentionDetail")
	public @ResponseBody
	List<Map<String, String>> getMainmediaAttentionDetail(HttpServletRequest request, String mainmediaName) {	
		List<Map<String, String>> returnList = new ArrayList<Map<String, String>>();
		//根据特定的阶层，获得其情感情况
        Map<String, Long> mainmediaMap = mmaService.findMainmediaAttentionByName(mainmediaName,0);
        
        String mainmedia_X="";
        String mainmedia_Y="t:";
        if(mainmediaMap != null && !mainmediaMap.isEmpty())
        for(String name : mainmediaMap.keySet()){
        	mainmedia_X+=name+"|";
        	if(mainmediaMap.get(name) != null)
        		mainmedia_Y+=mainmediaMap.get(name)+",";
        	else
        		mainmedia_Y+=0.0+",";
        }
        mainmedia_X = mainmedia_X.substring(0,  mainmedia_X.length()-1);
        mainmedia_Y = mainmedia_Y.substring(0,  mainmedia_Y.length()-1);
        Map<String, String> hMap = new HashMap<String, String>();
        hMap.put("X", mainmedia_X);
        hMap.put("Y", mainmedia_Y);
        returnList.add(hMap);
        
        //获得特定媒体的涉穂关注度  
        Map<String, Long> mainmediaIsAboutMap = mmaService.findMainmediaAttentionByName(mainmediaName,1);  
        String maindmediaIsAbout_X="";
        String mainmediaIsAbout_Y="t:";
        if(mainmediaIsAboutMap != null && !mainmediaIsAboutMap.isEmpty())
        for(String name : mainmediaIsAboutMap.keySet()){
        	maindmediaIsAbout_X+=name+"|";
        	if(mainmediaMap.get(name) != null)
        		mainmediaIsAbout_Y+=mainmediaIsAboutMap.get(name)+",";
        	else
        		mainmediaIsAbout_Y+=0.0+",";
        }
        if(maindmediaIsAbout_X.length() > 0)
        maindmediaIsAbout_X = maindmediaIsAbout_X.substring(0,  maindmediaIsAbout_X.length()-1);
        if(mainmediaIsAbout_Y.length() > 0)
        mainmediaIsAbout_Y = mainmediaIsAbout_Y.substring(0,  mainmediaIsAbout_Y.length()-1);
        Map<String, String> heMap = new HashMap<String, String>();
        heMap.put("X", maindmediaIsAbout_X);
        heMap.put("Y", mainmediaIsAbout_Y);
        returnList.add(heMap);
        
      //获得特定媒体的涉穂报道情感变化
        Map<String, Map<String, Long>> attentionChange = mmaService.getEmotionChgTimeByName(mainmediaName, 1);
	    //List<String> list = new ArrayList<String>();
	    String hemotion_Y = "t:";
        String hemotionPositive = "";
        String hemotionNeutral = "";
        String hemotionNegative = "";
        String hemotion_X = "1:|0|50|100|0:";
        List<MainmediaAttention> hierarypeList = mmaService.findAll(MainmediaAttention.class);
        TreeSet<String> htimeSet = new TreeSet<String>();
        for(MainmediaAttention pe : hierarypeList){
        	htimeSet.add(pe.getTime());
        }
        if(attentionChange != null && !attentionChange.isEmpty())
        for(String time : htimeSet){
        	hemotion_X+="|" + time;
        	if(attentionChange.get("正面") != null){
	        	if((Long)attentionChange.get("正面").get(time) != null)
	        		hemotionPositive+=(double)attentionChange.get("正面").get(time)+",";
	        	else
	        		hemotionPositive+=0.0+",";
        	}
        	else
        		hemotionPositive+=0.0+",";
        	if(attentionChange.get("中立") != null){
	        	if((Long)attentionChange.get("中立").get(time) != null)
	        		hemotionNeutral+=(double)attentionChange.get("中立").get(time)+",";
	        	else
	        		hemotionNeutral+=0.0+",";
        	}
        	else
        		hemotionNeutral+=0.0+",";
        	if(attentionChange.get("负面") != null){
	        	if((Long)attentionChange.get("负面").get(time) != null)
	        		hemotionNegative+=(double)attentionChange.get("负面").get(time)+",";
	        	else
	        		hemotionNegative+=0.0+",";
        	}
        	else
        		hemotionNegative+=0.0+",";
        }
        if(hemotionPositive.length()>0)
        hemotionPositive = hemotionPositive.substring(0, hemotionPositive.length()-1);
        if(hemotionNeutral.length()>0)
        hemotionNeutral = hemotionNeutral.substring(0, hemotionNeutral.length()-1);
        if(hemotionNegative.length()>0)
        hemotionNegative = hemotionNegative.substring(0, hemotionNegative.length()-1);
        hemotion_Y = hemotion_Y + hemotionPositive + "|" + hemotionNeutral + "|" + hemotionNegative;
	    Map<String, String> hemMap = new HashMap<String, String>();
	    hemMap.put("X", hemotion_X);
	    hemMap.put("Y", hemotion_Y);
	    returnList.add(hemMap);
		return returnList;	
		  
	}

	
	
}
