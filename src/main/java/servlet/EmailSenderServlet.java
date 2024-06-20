package servlet;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.MembersDAO;

@WebServlet("/sendAuthCode")
public class EmailSenderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(EmailSenderServlet.class.getName());
    private String username;
    private String appPassword;

    @Override
    public void init() throws ServletException {
        Properties properties = new Properties();
        try (InputStream input = getClass().getClassLoader().getResourceAsStream("config.properties")) {
            if (input == null) {
                logger.severe("config.properties 파일을 찾을 수 없습니다.");
                return;
            }
            properties.load(input);
            username = properties.getProperty("email.username");
            appPassword = properties.getProperty("email.password");
        } catch (IOException ex) {
            logger.log(Level.SEVERE, "config.properties 로드 실패", ex);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        String email = request.getParameter("email");

        if (email != null && !email.isEmpty()) {
            Random random = new Random();
            int checkNum = random.nextInt(888888) + 111111;
            String checkNumStr = Integer.toString(checkNum);

            String subject = "아이디/비번 찾기 인증 이메일입니다.";
            String content = "인증 번호는 " + checkNumStr + "입니다. 해당 인증번호를 인증번호 확인란에 기입하여 주세요.";

            try {
                sendEmail(email, subject, content);

                // 임시 코드를 데이터베이스에 저장
                try {
                    MembersDAO dao = MembersDAO.getInstance();
                    boolean updateSuccess = dao.updateTempCodeByEmail(email, checkNumStr);
                    if (updateSuccess) {
                        response.getWriter().write("이메일로 인증번호가 전송되었습니다.");
                    } else {
                        response.getWriter().write("데이터베이스 업데이트 실패: 업데이트되지 않았습니다.");
                    }
                } catch (Exception e) {
                    logger.log(Level.SEVERE, "데이터베이스 업데이트 실패", e);
                    response.getWriter().write("데이터베이스 업데이트 실패: " + e.getMessage());
                }
            } catch (MessagingException e) {
                logger.log(Level.SEVERE, "이메일 전송 실패", e);
                response.getWriter().write("이메일 전송 실패: " + e.getMessage());
            }
        } else {
            response.getWriter().write("유효하지 않은 이메일");
        }
    }

    private void sendEmail(String to, String subject, String content) throws MessagingException {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, appPassword);
            }
        });

        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(username));
        message.addRecipient(MimeMessage.RecipientType.TO, new InternetAddress(to));
        message.setSubject(subject);
        message.setText(content);

        Transport.send(message);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
