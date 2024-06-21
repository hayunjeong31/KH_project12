package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
	private static final long serialVersionUID = 1L;
	private Properties emailProperties;

	public MembersController() {
		super();
		loadEmailProperties();
	}

	private void loadEmailProperties() {
		emailProperties = new Properties();
		try (InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties")) {
			if (input == null) {
				System.out.println("Sorry, unable to find config.properties");
				return;
			}
			// Load a properties file from class path
			emailProperties.load(input);
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		System.out.println("사용자 요청: " + cmd);
		MembersDAO dao = MembersDAO.getInstance();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		HttpSession session = request.getSession();
		try {
			// 내 정보 출력
			if(cmd.equals("/mypage.members")) {
				String loginId = (String)session.getAttribute("loginID");
				System.out.println(loginId);
				MembersDTO dto = dao.myInfor(loginId);
				request.setAttribute("dto", dto);
				request.getRequestDispatcher("/members/mypage.jsp").forward(request, response);

			} 
			// 수정
			else if(cmd.equals("/edit.members")) {
				String loginId = (String)session.getAttribute("loginID");
				String userName = request.getParameter("userName");

				String phone = request.getParameter("phone");
				String email = request.getParameter("email");
				int editResult = dao.edit(loginId, userName, phone, email);
				if (editResult > 0) {
					request.setAttribute("dto", dao.myInfor(loginId));
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
			
			// 인교 코드
			 // 회원가입 처리
			else if (cmd.equals("/signup.members")) {
                String userId = request.getParameter("userId");
                String userPwd = EncryptionUtils.getSHA512(request.getParameter("userPwd"));
                String userName = request.getParameter("userName");
                String nickName = request.getParameter("nickName");
                String phone = request.getParameter("phone");
                String email = request.getParameter("email");
                String gender = request.getParameter("gender");
                String birth_date = request.getParameter("birth_date");
                int adminKey = Integer.parseInt(request.getParameter("adminKey"));
                String tempCode = null; // 가입 시에는 임시 코드 없음

                MembersDTO dto = new MembersDTO(0, userId, userPwd, userName, nickName, phone, email, gender, "n", birth_date, null, null, adminKey, tempCode);

                try {
                    int result = dao.addMember(dto);
                    if (result > 0) {
                        System.out.println("회원가입 성공");
                        response.setStatus(HttpServletResponse.SC_OK);
                        response.sendRedirect("/index.jsp");
                    } else {
                        System.out.println("회원가입 실패");
                        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "회원 가입에 실패했습니다.");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("error", e.getMessage());
                    request.getRequestDispatcher("/signup.jsp").forward(request, response);
                }

            // 아이디 중복 확인 처리
            } else if (cmd.equals("/idcheck.members")) {
                String userId = request.getParameter("userId");
                boolean isAvailable = dao.isUserIdAvailable(userId);
                response.getWriter().write(isAvailable ? "true" : "false");

            // 닉네임 중복 확인 처리
            } else if (cmd.equals("/nicknameCheck.members")) {
                String nickname = request.getParameter("nickname");
                boolean isAvailable = dao.isNicknameAvailable(nickname);
                response.getWriter().write(isAvailable ? "true" : "false");

            // 로그인 처리
            } else if (cmd.equals("/login.members")) {
                String id = request.getParameter("id");
                String pw = request.getParameter("pw");
                String spw = EncryptionUtils.getSHA512(pw);
                MembersDTO member = dao.login(id, spw);
                if (member != null) {
                    session.setAttribute("loginID", member.getUserId());
                    session.setAttribute("userName", member.getUserName()); // 사용자 이름 세션에 저장
                    session.setAttribute("adminKey", member.getAdminKey());
                    response.sendRedirect("/index.jsp");
                } else {
                    session.setAttribute("loginError", "아이디가 존재하지 않거나 비밀번호가 일치하지 않습니다.");
                    response.sendRedirect("/index.jsp"); // 로그인 실패 시 처리
                }
            

            // 로그아웃 처리
            } else if (cmd.equals("/logout.members")) {

                session.invalidate();
                response.sendRedirect("/index.jsp");

            // 마이페이지 정보 조회 처리
            } else if(cmd.equals("/mypage.members")) {

                String result = (String)session.getAttribute("loginID");
                MembersDTO dto = dao.myInfor(result);
                request.setAttribute("dto", dto);
                request.getRequestDispatcher("/members/mypage.jsp").forward(request, response);

            // 회원 정보 수정 처리
            } else if(cmd.equals("/edit.members")) {
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

            // 회원 탈퇴 처리
            } else if(cmd.equals("/memberout.members")) {

                String result = (String)session.getAttribute("loginID");
                dao.deleteById(result);
                session.invalidate();
                response.sendRedirect("/index.jsp");

            // 인증 코드 전송 처리
            } else if (cmd.equals("/sendAuthCode.members")) {
                String email = request.getParameter("email");
                Random random = new Random();
                int checkNum = random.nextInt(888888) + 111111;
                String checkNumStr = Integer.toString(checkNum);

                // 임시 코드를 데이터베이스에 저장
                dao.updateTempCodeByEmail(email, checkNumStr);
                // 이메일 전송 로직
                sendEmail(email, "회원가입 인증 이메일입니다.", "인증 번호는 " + checkNumStr + "입니다. 해당 인증번호를 인증번호 확인란에 기입하여 주세요.");
                response.getWriter().write("이메일로 인증번호가 전송되었습니다.");        

            // 인증 코드 확인 처리
            } else if (cmd.equals("/verifyAuthCode.members")) {
                String email = request.getParameter("email");
                String authCode = request.getParameter("authCode");
                String userId = dao.findUserIdByEmailAndTempCode(email, authCode);
                if (userId != null) {
                    response.getWriter().write("회원님의 아이디는 " + userId + "입니다.");
                } else {
                    response.getWriter().write("인증 코드가 유효하지 않습니다.");
                }

            // 비밀번호 재설정 처리
            } else if (cmd.equals("/resetPassword.members")) {
                String email = request.getParameter("email");
                String newPassword = generateTempPassword(); // 임시 비밀번호 생성
                String hashedPassword = EncryptionUtils.getSHA512(newPassword);

                boolean isUpdated = dao.updatePasswordByEmail(email, hashedPassword);
                if (isUpdated) {
                    sendEmail(email, "비밀번호 재설정", "새 비밀번호는 " + newPassword + "입니다.");
                    response.getWriter().write("비밀번호가 성공적으로 변경되었습니다. 이메일을 확인해주세요.");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "비밀번호 변경에 실패했습니다.");
                }

            // 잘못된 요청 처리
            } else if (cmd.equals("/getPasswordByEmail.members")) {
                // 이 기능은 resetPassword.members와 중복되므로 필요하지 않습니다.
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "잘못된 요청입니다.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void sendEmail(String to, String subject, String content) {
        String host = "smtp.gmail.com";
        String user = emailProperties.getProperty("email.username");
        String password = emailProperties.getProperty("email.password");

        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", 587);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(user, password);
            }
        });

        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject);
            message.setText(content);

            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    private String generateTempPassword() {
        String upperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCase = "abcdefghijklmnopqrstuvwxyz";
        String digits = "0123456789";
        String allChars = upperCase + lowerCase + digits;
        Random random = new Random();

        StringBuilder password = new StringBuilder();

        // 각 하나 이상의 대문자, 소문자, 숫자 추가
        password.append(upperCase.charAt(random.nextInt(upperCase.length())));
        password.append(lowerCase.charAt(random.nextInt(lowerCase.length())));
        password.append(digits.charAt(random.nextInt(digits.length())));

        // 나머지 5자 랜덤 추가
        for (int i = 3; i < 8; i++) {
            password.append(allChars.charAt(random.nextInt(allChars.length())));
        }

        // 생성된 비밀번호를 셔플
        return shuffleString(password.toString());
    }

    private String shuffleString(String input) {
        char[] characters = input.toCharArray();
        Random random = new Random();
        for (int i = 0; i < characters.length; i++) {
            int randomIndex = random.nextInt(characters.length);
            char temp = characters[i];
            characters[i] = characters[randomIndex];
            characters[randomIndex] = temp;
        }
        return new String(characters);
    }
}
