package com.project.fd.admin.largecategory.model;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.project.fd.common.SearchVO;

@Repository
public class LargeCategoryDAOMybatis implements LargeCategoryDAO{

	@Override
	public List<LargeCategoryVO> selectAll(SearchVO searchVo) {
		return null;
	}

	@Override
	public int selectTotalRecord(SearchVO searchVo) {
		return 0;
	}

}
