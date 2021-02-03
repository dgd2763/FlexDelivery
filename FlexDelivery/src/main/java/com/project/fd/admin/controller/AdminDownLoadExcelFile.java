package com.project.fd.admin.controller;

import java.util.List;
import java.util.Locale;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.fd.admin.stores.model.AdminStoresService;
import com.project.fd.admin.stores.model.AdminStoresVO;
import com.project.fd.common.ExcelService;

@Controller
@RequestMapping(value = "/admin/menu2")
public class AdminDownLoadExcelFile{
	private static final Logger logger
	= LoggerFactory.getLogger(AdminDownLoadExcelFile.class);
	
	@Autowired
	AdminStoresService storesService;
	@Autowired
	ExcelService excelService;
	
	@RequestMapping(value = "/downloadExcelFile.do", method = RequestMethod.POST)
    public String downloadExcelFile(Model model) {
		
		logger.info("점포 승인 ExcelDownLoad 화면");
		//1
		//2
		List<AdminStoresVO> list= storesService.adminApprovalList();
		logger.info("승인 list, list.size={}",list.size());
        
        SXSSFWorkbook workbook = excelService.excelFileDownloadProcess(list);
        
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        model.addAttribute("workbookName", "점포 승인 목록");
        
        return "excelDownloadView";
    }

	

}