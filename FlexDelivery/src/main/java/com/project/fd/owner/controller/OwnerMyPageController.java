package com.project.fd.owner.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.fd.common.FileUploadUtil;
import com.project.fd.owner.store.model.OwnerTemporaryVO;
import com.project.fd.owner.temporary.model.OwnerTemporaryService;




@Controller
@RequestMapping("/owner/mypage")
public class OwnerMyPageController {
	@Autowired
	private static final Logger logger
		=LoggerFactory.getLogger(OwnerMyPageController.class);
	@Autowired
	private OwnerTemporaryService ownerTemporaryService;
	
	@Autowired
	private FileUploadUtil fileUtil;
	
	@RequestMapping("/mypageMain.do")
	public String mypageMain(HttpSession session, Model model) {
		String ownerName=(String) session.getAttribute("ownerName");
		
		logger.info("mypage 보여주기 , ownerName ={}",ownerName);
		
		model.addAttribute("ownerName", ownerName);
		return "owner/mypage/mypageMain";
	}
	
	
	
	@RequestMapping(value="/mypageEdit.do", method=RequestMethod.GET)
	public String mypageEdit_GET(HttpSession session, Model model) {
		String ownerId=(String) session.getAttribute("ownerId");
		logger.info("mypageEdit 보여주기 , ownerId ={}",ownerId);
		
		if(ownerId==null || ownerId.isEmpty()) {
			return "owner/index";
		}
		
		Map<String,Object> map = ownerTemporaryService.selectOwnerInfoAll(ownerId);
		
		model.addAttribute("map",map);
		logger.info("map map={}", map);
		
		return "owner/mypage/mypageEdit";
	}
	
	
	
	@RequestMapping(value="/mypageEdit.do", method=RequestMethod.POST)
	public String mypageEdit_POST(@ModelAttribute OwnerTemporaryVO temporaryVo, HttpServletRequest request,
				Model model) {
		logger.info("마이페이지 변경하기 post temporaryVo={}",temporaryVo );
		
		String fileName="";
		try {
			List<Map<String, Object>> fileList
				=fileUtil.fileUplaod(request, FileUploadUtil.TEMPORARY_TYPE);
			for(Map<String, Object> fileMap : fileList) {
				fileName=(String) fileMap.get("fileName");
			}
		}catch (IllegalStateException e) {
			logger.info("파일 업로드 실패!");
			e.printStackTrace();
		} catch (IOException e) {
			logger.info("파일 업로드 실패!");
			e.printStackTrace();
		}
		
		
		temporaryVo.settFileName(fileName);
		
		int cnt = ownerTemporaryService.realInsertTemporary(temporaryVo);
		logger.info("임시저장함 저장 결과 cnt={}",cnt);
		String msg="변경에 실패하였습니다", url="/owner/index.do";
		if(cnt>0) {
			msg="변경에 성공하셨습니다.";
			url="/owner/mypage/mypageMain.do";
		}else {
			if(cnt==-2) {
				msg="변경 승인 대기중입니다.";
				url="/owner/mypage/mypageMain.do";
			}
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	
	@RequestMapping("/zipcode.do")
	public String zipcode(){
		//1
		logger.info("우편번호 조회창 보여주기");
		
		//4
		return "owner/mypage/zipcode";
	}
	
	
	@RequestMapping("/ajaxZipcode.do")
	public void ajaxZipcode(HttpServletRequest req, ModelMap model, 
    		HttpServletResponse response) throws Exception {
		// 요청변수 설정
		String currentPage = req.getParameter("currentPage");    //요청 변수 설정 (현재 페이지. currentPage : n > 0)
		String countPerPage = req.getParameter("countPerPage");  //요청 변수 설정 (페이지당 출력 개수. countPerPage 범위 : 0 < n <= 100)
		String confmKey = req.getParameter("confmKey");          //요청 변수 설정 (승인키)
		String keyword = req.getParameter("dong");            //요청 변수 설정 (키워드)
		
		// OPEN API 호출 URL 정보 설정
		String apiUrl = "https://www.juso.go.kr/addrlink/addrLinkApi.do?currentPage="+currentPage+"&countPerPage="+countPerPage+"&keyword="+URLEncoder.encode(keyword,"UTF-8")+"&confmKey="+confmKey;
		URL url = new URL(apiUrl);
    	BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(),"UTF-8"));
    	StringBuffer sb = new StringBuffer();
    	String tempStr = null;

    	while(true){
    		tempStr = br.readLine();
    		if(tempStr == null) break;
    		sb.append(tempStr);								// 응답결과 XML 저장
    	}
    	br.close();
    	
    	response.setCharacterEncoding("UTF-8");
		response.setContentType("text/xml");
		response.getWriter().write(sb.toString());			// 응답결과 반환
	}
	
	
	
	
	@ResponseBody
	@RequestMapping("/selectLocationNo.do")
	public int selectLocationNo(@RequestParam(defaultValue = "0")String locationName) {
		logger.info("지역명에 따른 지역 번호 가져오기 locationName={}",locationName);
		
		int res = ownerTemporaryService.selectLocationNoByLocationName(locationName);
		logger.info("지역명에 따른 지역번호 결과 res={}",res);
		
		return res;
	}
	
}