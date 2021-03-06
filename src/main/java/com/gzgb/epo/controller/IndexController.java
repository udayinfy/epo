package com.gzgb.epo.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gzgb.epo.entity.Menu;
import com.gzgb.epo.entity.User;
import com.gzgb.epo.publics.Constants;
import com.gzgb.epo.service.menu.MenuService;
import com.gzgb.epo.service.shiro.ShiroDbRealm.ShiroUser;
import com.gzgb.epo.service.user.UserService;

/**
 * 
 * <pre>
 * 系统主页入口
 * </pre>
 * 
 * @author XiaoJian
 * @version 1.0, 2013-12-18
 */
@Controller
@RequestMapping(value = "/")
public class IndexController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;
	
	Logger logger = LoggerFactory.getLogger(IndexController.class);

	/**
	 * 进入首页
	 * @return
	 */
	@RequestMapping(value = "index")
	public String index(Model model,HttpServletRequest request){
		ShiroUser shiroUser = (ShiroUser) SecurityUtils.getSubject().getPrincipal();
		if (shiroUser == null)
		{
			return "redirect:/login";
		}else{
			User user = userService.findById(shiroUser.getId(), User.class);
			user.setLoginCount(user.getLoginCount()+1);
			user.setLastLoginIP(request.getRemoteAddr());
			Long time = new Date().getTime();
			time = time / 1000;  //java中的毫秒转换成数据库中的秒数
			user.setLastLoginTime(time.intValue());
			try{
				userService.save(user);
			}catch(Exception e){
				e.printStackTrace();
			}
			request.getSession().setAttribute("userName", user.getUsername());
			request.getSession().setAttribute("userId", user.getId());
			request.getSession().setAttribute("userType", user.getUserType());
			request.getSession().setAttribute("shiroUser", shiroUser);	
			request.getSession().setAttribute(Constants.USER_SESSION_KEY, shiroUser.getId());
			
			List<Menu> menuList = (List<Menu>) menuService.getMenuListByCurrUser(user);
			request.getSession().setAttribute("menuList", menuList);
			if(menuList!=null && menuList.size() > 0){
				Menu menu = null;
				for(Menu m: menuList){
					if(m.getStatus()!=0){
						menu = m;
						break;
					}
				}
				if(menu==null){
					return "/error/403";
				}
				String URL = "redirect:" + menu.getMenuUrl()+"/"+menu.getId();
				return URL; 
			}else{
				return "/error/403";
			}
		}
	}
	
	/**
	 * 欢迎页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "welcome/{pMenuId}")
	public String welcome(@PathVariable Long pMenuId,HttpServletRequest request,Model model) {

		return "welcome";
	}

}
