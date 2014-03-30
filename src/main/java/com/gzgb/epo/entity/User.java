package com.gzgb.epo.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.gzgb.epo.publics.Constants;

/**
 * <pre>
 * 用户实体
 * </pre>
 * 
 * @author XiaoJian
 * @version 1.0, 2013-12-18
 */
@Entity
@Table(name = "epo_usermaininfo", schema = Constants.GZGB_SCH)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "gzgb_user", sequenceName = "gzgb_user_seq", allocationSize = 1)
public class User extends BaseEntity {

	private static final long serialVersionUID = 995235545427631654L;

	/**
	 * 自增ID
	 */
	private Long id;

	/**
	 * 登陆名称
	 */
	private String loginName;

	/**
	 * 密码(不允许空值)
	 */
	@JsonBackReference
	private String password;
	
	/**
	 * 密码随机码
	 */
	@JsonBackReference
	private String umiRandomcode;

	/**
	 * 真实姓名（或昵称，依系统而定）
	 */
	private String username;

	/**
	 * 用户状态（1：启用（默认）；0：禁用）
	 */
	private Integer status;

	/**
	 * 用户类型:
	 * 1  系统管理员
	 * 2  部负责人
	 * 3   处室负责人
	 * 4  处室人员
	 * 5  中心负责人
	 * 6  中心人员
	 * 
	 * 系统用户0和管理员用户1
	 */
	private Byte userType;
	
	/**
	 * 临时用户类型(文字描述)
	 */
	private String type;
	
	/**
	 * 电子邮箱
	 */
	private String email;
	
	/**
	 * 登陆IP限制
	 */
	private String umiLoginIp;
	
	/**
	 * 创建时间
	 */
	private Integer createDate;
	
	/**
	 * 累计登陆次数
	 */
	private Integer loginCount;

	/**
	 * 最后登陆IP
	 */
	private String lastLoginIP;

	/**
	 * 最后登陆时间
	 */
	private Integer lastLoginTime;
	
	/**
	 * 临时登陆时间
	 */
	private String lastTime;
	
	/**
	 * 是否超级管理员，默认为0
	 */
	private int  superManager; 
	
	/**
	 * 	用户角色列表
	 */
	@JsonBackReference 
	private List<Role> roleList;
	
	
	/**
	 * 所属部门
	 */
	private DepartmentBaseInfo dbiId;
	
	/**
	 * 所属区县
	 */
	private RegionBaseInfo rbiId;
	
	/**
	 * DepartmentBaseInfo Long型的临时变量
	 */
	private Long dbiIdLong;
	
	/**
	 * RegionBaseInfo Long型的临时变量
	 */
	private Long rbiIdLong;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "gzgb_user")
	@Column(name = "umiId")
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "umiName", nullable = false)
	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	@Column(name = "umiPassword", nullable = false)
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	@Column(name = "umiRandomcode", nullable = false)
	public String getUmiRandomcode() {
		return umiRandomcode;
	}

	public void setUmiRandomcode(String umiRandomcode) {
		this.umiRandomcode = umiRandomcode;
	}

	@Column(name = "umiNickname", nullable = false)
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	@Column(name = "umiStatus", nullable = false, columnDefinition = "INTEGER default 1")
	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "umiType", nullable = false, columnDefinition = "INTEGER default 0")
	public Byte getUserType() {
		return userType;
	}

	public void setUserType(Byte userType) {
		this.userType = userType;
	}
	
	@Column(name = "umiEmail", nullable = false)
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "umiLoginIp", nullable = true)
	public String getUmiLoginIp() {
		return umiLoginIp;
	}

	public void setUmiLoginIp(String umiLoginIp) {
		this.umiLoginIp = umiLoginIp;
	}

	@Column(name = "umiCreateTime", nullable = false)
	public Integer getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Integer createDate) {
		this.createDate = createDate;
	}

	@Column(name = "umiNumber", nullable = false, columnDefinition = "INTEGER default 0")
	public Integer getLoginCount() {
		return loginCount;
	}

	public void setLoginCount(Integer loginCount) {
		this.loginCount = loginCount;
	}

	@Column(name = "umiLastIp")
	public String getLastLoginIP() {
		return lastLoginIP;
	}

	public void setLastLoginIP(String lastLoginIP) {
		this.lastLoginIP = lastLoginIP;
	}

	@Column(name = "umiLastTime")
	public Integer getLastLoginTime() {
		return lastLoginTime;
	}

	public void setLastLoginTime(Integer lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	@Transient
	public String getLastTime() {
		return lastTime;
	}

	public void setLastTime(String lastTime) {
		this.lastTime = lastTime;
	}

	@Transient
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "superManager",nullable=true,columnDefinition="INTEGER default 0")
	public int getSuperManager() {
		return superManager;
	}

	public void setSuperManager(int superManager) {
		this.superManager = superManager;
	}

	// 多对多定义
	@ManyToMany(targetEntity=Role.class,cascade = { CascadeType.PERSIST,CascadeType.MERGE }, fetch = FetchType.LAZY)
	@JoinTable(name = "user_role" ,schema=Constants.GZGB_SCH, joinColumns = { @JoinColumn(name = "user_id") }, inverseJoinColumns = { @JoinColumn(name = "role_id") })
	// Fecth策略定义
	@Fetch(FetchMode.SUBSELECT)
	// 集合按id排序
	@OrderBy("id ASC")
	// 缓存策略
	@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
	public List<Role> getRoleList() {
		return roleList;
	}

	public void setRoleList(List<Role> roleList) {
		this.roleList = roleList;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "dbiId", nullable = true)
	public DepartmentBaseInfo getDbiId() {
		return dbiId;
	}

	public void setDbiId(DepartmentBaseInfo dbiId) {
		this.dbiId = dbiId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rbiId", nullable = true)
	public RegionBaseInfo getRbiId() {
		return rbiId;
	}
	
	public void setRbiId(RegionBaseInfo rbiId) {
		this.rbiId = rbiId;
	}
	
	@Transient
	public Long getDbiIdLong() {
		return dbiIdLong;
	}

	public void setDbiIdLong(Long dbiIdLong) {
		this.dbiIdLong = dbiIdLong;
	}

	@Transient
	public Long getRbiIdLong() {
		return rbiIdLong;
	}

	public void setRbiIdLong(Long rbiIdLong) {
		this.rbiIdLong = rbiIdLong;
	}
	
	

	
}