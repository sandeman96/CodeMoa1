# CodeMoa1
👨‍💻
adminBoard, adminMember, adminUpdateMember파일 수정

👨‍💻 AdminController 아래 부분 삭제
/* 디테일 */
   @RequestMapping("boardDetail.ad")
   public String boardDetail(@RequestParam("bNo") int bNo, String page) {
      return "redirect:boardDetail.bo?bNo=" + bNo + "&page=" + page;
   }
   
   /* mypage 접근 */
   @RequestMapping("memberDetail.ad")
   public String myPage(Model model, @RequestParam(value = "userId") String userId) {
      return "redirect:mypage.me?userId=" + userId;
   }
