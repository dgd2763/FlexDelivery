package com.project.fd.owner.coupon.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.fd.admin.coupons.model.AdminRegularCouponVO;

@Repository
public class OwnerCouponDAOMybatis implements OwnerCouponDAO{
	@Autowired SqlSessionTemplate sqlSession;
	
	private String namespace="config.mybatis.mapper.oracle.ownercoupon.";

	@Override
	public List<Map<String, Object>> Allcoupons(OwnerCouponSearchVO searchVo) {
		return sqlSession.selectList(namespace+"Allcoupons",searchVo);
	}

	@Override
	public int getTotalRecord(OwnerCouponSearchVO searchVo) {
		return sqlSession.selectOne(namespace+"getTotalRecord",searchVo);
	}

	@Override
	public List<AdminRegularCouponVO> Allselect() {
		return sqlSession.selectList(namespace+"Allselect");
	}

	@Override
	public int registerCoupon(OwnerCouponVO vo) {
		return sqlSession.selectOne(namespace+"registerCoupon",vo);
	}
	
	
}