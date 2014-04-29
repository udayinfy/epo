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
 * 公众情感Entity
 * </pre>
 * 
 * @author LiuYongbin
 * @version 1.0, 2014-2-26
 */
@Entity
@Table(name = "epo_publicemotion", schema = Constants.GZGB_SCH)
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
@SequenceGenerator(name = "gzgb_publicEmotion", sequenceName = "gzgb_publicEmotion_seq", allocationSize = 1)
public class PublicEmotion extends BaseEntity {

	private static final long serialVersionUID = 995555666627631654L;

	/**
	 * 自增id
	 */
	private Long id;

	/**
	 * 公众阶层
	 */
	private Mcode hierarchyId;

	/**
	 * 公众学历
	 */
	private Mcode educationId;

	/**
	 * 公众情感
	 */
	private Mcode emotion;

	/**
	 * 公众政治倾向
	 */
	private Mcode political;
	
	/**
	 * 是否跟广州有关
	 */
	private Integer isAbout;
	/**
	 * 关注的部门
	 */
	private DepartmentBaseInfo departmentId;

	/**
	 * 数量
	 */
	private Long count;

	/**
	 * 时间
	 */
	private Integer time;

	/**
	 * @return id
	 * @see com.gzgb.epo.entity.PublicEmotion#id
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "gzgb_publicEmotion")
	public Long getId() {
		return id;
	}

	/**
	 * @param id
	 *            id
	 * @see com.gzgb.epo.entity.PublicEmotion#id
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return hierarchy
	 * @see com.gzgb.epo.entity.PublicEmotion#hierarchy
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mcode_hierarchyId", nullable = false)
	public Mcode getHierarchyId() {
		return hierarchyId;
	}

	/**
	 * @param hierarchyId
	 *            hierarchyId
	 * @see com.gzgb.epo.entity.PublicEmotion#hierarchy
	 */
	public void setHierarchyId(Mcode hierarchyId) {
		this.hierarchyId = hierarchyId;
	}

	/**
	 * @return education
	 * @see com.gzgb.epo.entity.PublicEmotion#education
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mcode_educationId", nullable = false)
	public Mcode getEducationId() {
		return educationId;
	}

	
	/**
	 * @param education
	 *            education
	 * @see com.gzgb.epo.entity.PublicEmotion#education
	 */
	public void setEducationId(Mcode educationId) {
		this.educationId = educationId;
	}

	/**
	 * @return emotion
	 * @see com.gzgb.epo.entity.PublicEmotion#emotion
	 */
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "mcode_emotion",  nullable = false)
	public Mcode getEmotion() {
		return emotion;
	}

	/**
	 * @param emotion
	 *            emotion
	 * @see com.gzgb.epo.entity.PublicEmotion#emotion
	 */
	public void setEmotion(Mcode emotion) {
		this.emotion = emotion;
	}

	/**
	 * @return department
	 * @see com.gzgb.epo.entity.PublicEmotion#department
	 */
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "departmentId")
	public DepartmentBaseInfo getDepartmentId() {
		return departmentId;
	}

	/**
	 * @param department
	 *            department
	 * @see com.gzgb.epo.entity.PublicEmotion#department
	 */
	public void setDepartmentId(DepartmentBaseInfo departmentId) {
		this.departmentId = departmentId;
	}

	/**
	 * @return count
	 * @see com.gzgb.epo.entity.PublicEmotion#count
	 */
	@Column(name = "count", nullable = false)
	public Long getCount() {
		return count;
	}

	/**
	 * @param count
	 *            count
	 * @see com.gzgb.epo.entity.PublicEmotion#count
	 */
	public void setCount(Long count) {
		this.count = count;
	}

	/**
	 * @return time
	 * @see com.gzgb.epo.entity.PublicEmotion#time
	 */
	@Column(name = "time", nullable = false)
	public Integer getTime() {
		return time;
	}

	/**
	 * @param time
	 *            time
	 * @see com.gzgb.epo.entity.PublicEmotion#time
	 */
	public void setTime(Integer time) {
		this.time = time;
	}

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "mcode_political", nullable = false)
	public Mcode getPolitical() {
		return political;
	}

	public void setPolitical(Mcode political) {
		this.political = political;
	}

	@Column(name = "isAbout", nullable = false, columnDefinition = "INT default 1")
	public Integer getIsAbout() {
		return isAbout;
	}

	public void setIsAbout(Integer isAbout) {
		this.isAbout = isAbout;
	}
	
	
	

}
