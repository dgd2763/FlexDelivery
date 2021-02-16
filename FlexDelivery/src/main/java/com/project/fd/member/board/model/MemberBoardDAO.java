package com.project.fd.member.board.model;

import java.util.List;

public interface MemberBoardDAO {
	List<MemberBoardVO> selectEvent(MemberBoardSearchVO vo);
	List<MemberBoardVO> selectNotice(MemberBoardSearchVO vo);
	int eventCount(MemberBoardSearchVO vo);
	int noticeCount(MemberBoardSearchVO vo);
	MemberBoardVO boardDetail(int boardNo);
}
