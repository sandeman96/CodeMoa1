package com.study.codemoa.admin.model.vo;


public class MemberPagination {
	
	public static MemberInfo getMemberInfo(int currentPageM, int listCountM) {
		
		int pageLimitM = 10;
		int boardLimitM = 5;
		int maxPageM = (int)Math.ceil((double)listCountM/boardLimitM);
		int startPageM = (currentPageM - 1) / pageLimitM * pageLimitM +1;
		int endPageM = startPageM + pageLimitM -1;
		if(endPageM > maxPageM) {
			endPageM = maxPageM;
		}
		
		MemberInfo pi = new MemberInfo(currentPageM, listCountM, pageLimitM, maxPageM, startPageM, endPageM, boardLimitM);
		return pi;
	}


}
