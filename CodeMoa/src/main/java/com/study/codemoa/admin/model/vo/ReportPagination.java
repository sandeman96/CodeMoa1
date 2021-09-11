package com.study.codemoa.admin.model.vo;


public class ReportPagination {
	
	public static ReportInfo getReportInfo(int currentPageP, int listCountP) {
		
		int pageLimitP = 20;
		int boardLimitP = 10;
		int maxPageP = (int)Math.ceil((double)listCountP/boardLimitP);
		int startPageP = (currentPageP - 1) / pageLimitP * pageLimitP +1;
		int endPageP = startPageP + pageLimitP -1;
		if(endPageP > maxPageP) {
			endPageP = maxPageP;
		}
		
		ReportInfo rpi = new ReportInfo(currentPageP, listCountP, pageLimitP, maxPageP, startPageP, endPageP, boardLimitP);
		return rpi;
	}


}
