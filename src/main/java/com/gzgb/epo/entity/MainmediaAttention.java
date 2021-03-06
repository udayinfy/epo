package com.gzgb.epo.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

import com.gzgb.epo.publics.Constants;

/**
 * 
 * <pre>
 * 主流媒体关注度
 * </pre>
 * 
 * @author LiuYongbin
 * @version 1.0, 2014-2-26
 */
@Entity
@Table(name = "epo_mainmediaattention", schema = Constants.GZGB_SCH)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "gzgb_mainmediaAttention", sequenceName = "gzgb_mainmediaAttention_seq", allocationSize = 1)
public class MainmediaAttention extends BaseEntity {

	private static final long serialVersionUID = 994333688827631654L;

	/**
	 * 自增id
	 */
	private Long id;

	/**
	 * 媒体Id
	 */
	private Mainmedia mainmediaId;
	
	/**
	 *涉及部门Id
	 */
	private DepartmentBaseInfo departmentId;

	/**
	 * 政治类型
	 */
	private Mcode political;
	
	/**
	 * 情感类型
	 */
	private Mcode emotion;
    
	/**
	 * 数量
	 */
	private Long count;
	
	/**
	 * 是否涉穗
	 */
    private Integer isAbout;
    
    /**
	 * 时间
	 */
    private Integer time;
	/**
	 * @return id
	 * @see com.gzgb.epo.entity.MainmediaAttention#id
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "gzgb_mainmediaAttention")
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            id
	 * @see com.gzgb.epo.entity.MainmediaAttention#id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	
	/**
	 * @return type
	 * @see com.gzgb.epo.entity.MainmediaAttention#political
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "mcode_political", nullable = false)
	public Mcode getPolitical() {
		return political;
	}

	/**
	 * @param type
	 *            type
	 * @see com.gzgb.epo.entity.MainmediaAttention#political
	 */
	public void setPolitical(Mcode political) {
		this.political = political;
	}

	/**
	 * @return count
	 * @see com.gzgb.epo.entity.MainmediaAttention#count
	 */
	@Column(name = "count", nullable = false)
	public Long getCount() {
		return count;
	}

	/**
	 * @param count
	 *            count
	 * @see com.gzgb.epo.entity.MainmediaAttention#count
	 */
	public void setCount(Long count) {
		this.count = count;
	}

	@Column(name="isAbout", nullable = false, columnDefinition = "INT default 1")
	public Integer getIsAbout() {
		return isAbout;
	}

	public void setIsAbout(Integer about) {
		this.isAbout = about;
	}
   
	@Column(name="time", nullable = false)
	public Integer getTime() {
		return time;
	}

	public void setTime(Integer time) {
		this.time = time;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "mcode_emotion", nullable = false)
	public Mcode getEmotion() {
		return emotion;
	}

	public void setEmotion(Mcode emotion) {
		this.emotion = emotion;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mainmediaId", nullable = false)
	public Mainmedia getMainmediaId() {
		return mainmediaId;
	}

	public void setMainmediaId(Mainmedia mainmediaId) {
		this.mainmediaId = mainmediaId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "departmentId")
	public DepartmentBaseInfo getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(DepartmentBaseInfo departmentId) {
		this.departmentId = departmentId;
	}

	
	
}
