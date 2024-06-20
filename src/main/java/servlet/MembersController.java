package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import commons.EncryptionUtils;
import dao.MembersDAO;
import dto.MembersDTO;

@WebServlet("*.members")
public class MembersController extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String cmd = request.getRequestURI();
        System.out.println("사용자 요청: " + cmd);
        MembersDAO dao = MembersDAO.getInstance();
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        HttpSession session = request.getSession();

        try {
            if (cmd.equals("/signup.members")) {
                String userId = request.getParameter("userId");
                String userPwd = EncryptionUtils.getSHA512(request.getParameter("userPwd"));
                String userName = request.getParameter("userName");
                String nickName = request.getParameter("nickName");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String signout = request.getParameter("signout");
                String birth_date = request.getParameter("birth_date");
                int adminKey = Integer.parseInt(request.getParameter("adminKey"));
                String tempCode = request.getParameter("tempCode");

                MembersDTO dto = new MembersDTO(0, userId, userPwd, userName, nickName, phone, email, gender, signout, birth_date, null, null, adminKey,null);
                dao.addMember(dto);
                response.setStatus(HttpServletResponse.SC_OK);
                
            } else if (cmd.equals("/idcheck.members")) {
                String userId = request.getParameter("userId");
                boolean isAvailable = dao.isUserIdAvailable(userId);
                response.getWriter().write(isAvailable ? "true" : "false");
                
            } else if (cmd.equals("/login.members")) {
                String id = request.getParameter("id");
                String pw = request.getParameter("pw");
                String spw = EncryptionUtils.getSHA512(pw);
                boolean result = dao.login(id, spw);
                if (result) {
                    session.setAttribute("loginID", id);
                    response.sendRedirect("/index.jsp");
                } else {
                    response.sendRedirect("/login.jsp"); // 로그인 실패 시 처리
                }
            } else if (cmd.equals("/logout.members")) {
                session.invalidate();
                response.sendRedirect("/index.jsp");
            }
            // 내 정보 출력
            else if(cmd.equals("/mypage.members")) {
                String result = (String)session.getAttribute("loginID");
                System.out.println(result);
                MembersDTO dto = dao.myInfor(result);
                request.setAttribute("dto", dto);
                request.getRequestDispatcher("/members/mypage.jsp").forward(request, response);
            }
            // 수정
            else if(cmd.equals("/edit.members")) {
                String result = (String)session.getAttribute("loginID");
                String userName = request.getParameter("userName");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                int editResult = dao.edit(result, userName, phone, email);
                if (editResult > 0) {
                    request.setAttribute("dto", dao.myInfor(result));
                    request.getRequestDispatcher("/mypage.members").forward(request, response);
                } else {
                    response.sendRedirect("/mypage.members");
                }
            }
            // 비밀번호 변경
            else if (cmd.equals("/pwdChange.members")) {
                String loginID = (String) session.getAttribute("loginID");
                String currentPwd = request.getParameter("currentPwd");
                String newPwd = request.getParameter("newPwd");

                // 현재 비밀번호 확인
                boolean isPwdCorrect = dao.checkPwd(loginID, currentPwd);

                if (isPwdCorrect) {
                    // 비밀번호 변경
                    boolean updateSuccess = dao.updatePwd(loginID, newPwd);
                    if (updateSuccess) {
                        response.getWriter().write("{\"success\": true}");
                    } else {
                        response.getWriter().write("{\"success\": false, \"error\": \"pwdUpdateFailed\"}");
                    }
                } else {
                    // 현재 비밀번호가 일치하지 않았을 시
                    response.getWriter().write("{\"success\": false, \"error\": \"currentPwdIncorrect\"}");
                }
            }
            // 회원탈퇴
            else if(cmd.equals("/memberout.members")) {
                String result = (String)session.getAttribute("loginID");
                dao.deleteById(result);
                session.invalidate();
                response.sendRedirect("/index.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
