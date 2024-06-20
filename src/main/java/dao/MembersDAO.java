package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

import javax.naming.Context;


import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.EncryptionUtils;
import dto.MembersDTO;

public class MembersDAO {

    private static MembersDAO instance;

    public static synchronized MembersDAO getInstance() {
        if (instance == null) {
            instance = new MembersDAO();
        }
        return instance;
    }

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    // userId 중복 확인 메서드
    public boolean isUserIdAvailable(String userId) throws Exception {
        String sql = "SELECT COUNT(*) FROM members WHERE userId = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0;
                }
            }
        }
        return false;
    }

    // email 중복 확인 메서드
    public boolean isEmailAvailable(String email) throws Exception {
        String sql = "SELECT COUNT(*) FROM members WHERE email = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, email);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0;
                }
            }
        }
        return false;
    }

    // nickname 중복 확인 메서드
    public boolean isNicknameAvailable(String nickName) throws Exception {
        String sql = "SELECT COUNT(*) FROM members WHERE nickName = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, nickName);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0;
                }
            }
        }
        return false;
    }

    public int addMember(MembersDTO dto) throws Exception {
        if (!isUserIdAvailable(dto.getUserId())) {
            throw new Exception("이미 사용 중인 아이디입니다.");
        }
        if (!isEmailAvailable(dto.getEmail())) {
            throw new Exception("이미 사용 중인 이메일입니다.");
        }
        if (!isNicknameAvailable(dto.getNickName())) {
            throw new Exception("이미 사용 중인 닉네임입니다.");
        }

        String sql = "INSERT INTO members(userSeq, userId, userPwd, userName, nickName, phone, email, gender, signout, birth_date, join_date, upd_date, adminKey, tempCode) VALUES (members_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, NULL, ?, ?)";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, dto.getUserId());
            pstat.setString(2, dto.getUserPwd());
            pstat.setString(3, dto.getUserName());
            pstat.setString(4, dto.getNickName());
            pstat.setString(5, dto.getPhone());
            pstat.setString(6, dto.getEmail());
            pstat.setString(7, dto.getGender());
            pstat.setString(8, dto.getSignout());
            pstat.setString(9, dto.getBirth_date());
            pstat.setInt(10, dto.getAdminKey());
            pstat.setString(11, dto.getTempCode());

            int result = pstat.executeUpdate();
            System.out.println("Insert 결과: " + result);
            return result;
        }
    }

    // 나머지 메서드는 기존 코드와 동일
    public MembersDTO login(String id, String pw) throws Exception {
        String sql = "SELECT * FROM members WHERE userId = ? AND userPwd = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, id);
            pstat.setString(2, pw);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    int userSeq = rs.getInt("userSeq");
                    String userId = rs.getString("userId");
                    String userPwd = rs.getString("userPwd");
                    String userName = rs.getString("userName");
                    String nickName = rs.getString("nickName");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    String gender = rs.getString("gender");
                    String signout = rs.getString("signout");
                    String birth_date = rs.getString("birth_date");
                    Timestamp join_date = rs.getTimestamp("join_date");
                    Timestamp upd_date = rs.getTimestamp("upd_date");
                    int adminKey = rs.getInt("adminKey");
                    String tempCode = rs.getString("tempCode");

                    return new MembersDTO(userSeq, userId, userPwd, userName, nickName, phone, email, gender, signout, birth_date, join_date, upd_date, adminKey, tempCode);
                }
            }
        }
        return null;
    }
 // 내 정보 출력

    public MembersDTO myInfor(String userId) throws Exception {
        String sql = "SELECT * FROM members WHERE userId = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    String userName = rs.getString("userName");
                    String nickName = rs.getString("nickName");
                    String phone = rs.getString("phone");
                    String email = rs.getString("email");
                    Timestamp join_date = rs.getTimestamp("join_date");
                    return new MembersDTO(0, userId, null, userName, nickName, phone, email, null, null, null, join_date, null, 0, null);
                }
            }
        }
        return null;
    }
    
    // 내 정보 수정
    public int edit(String userId, String userName, String phone, String email) throws Exception {
        String sql = "UPDATE members SET userName = ?, phone = ?, email = ? WHERE userId = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userName);
            pstat.setString(2, phone);
            pstat.setString(3, email);
            pstat.setString(4, userId);
            return pstat.executeUpdate();
        }
    }
    
 // 현재 비밀번호 확인
    public boolean checkPwd(String userId, String currentPwd) {
        String sql = "SELECT userPwd FROM members WHERE userId = ?";
        
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
             
            pstat.setString(1, userId);
            ResultSet rs = pstat.executeQuery();
            
            if (rs.next()) {
                String userPwd = rs.getString("userPwd");
                // 암호화된 비밀번호 비교
                String CurrentSpwd = EncryptionUtils.getSHA512(currentPwd);
                return userPwd.equals(CurrentSpwd);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return true;
    }
    public int deleteById(String userId) throws Exception {
        String sql = "DELETE FROM members WHERE userId = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            return pstat.executeUpdate();
        }

    }

    public boolean updateTempCodeByEmail(String email, String tempCode) throws Exception {
        String sql = "UPDATE members SET tempCode = ? WHERE email = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, tempCode);
            pstat.setString(2, email);
            return pstat.executeUpdate() > 0;
        }
    }

    public String findUserIdByEmailAndTempCode(String email, String tempCode) throws Exception {
        String sql = "SELECT userId FROM members WHERE email = ? AND tempCode = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, email);
            pstat.setString(2, tempCode);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return rs.getString("userId");
                }
            }
        }
        return null;
    }

    public boolean updatePasswordByEmail(String email, String newPassword) throws Exception {
        String sql = "UPDATE members SET userPwd = ? WHERE email = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, newPassword);
            pstat.setString(2, email);
            return pstat.executeUpdate() > 0;
        }
    }

    public MembersDTO getMemberByEmail(String email) throws Exception {
        String sql = "SELECT * FROM members WHERE email = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, email);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    int userSeq = rs.getInt("userSeq");
                    String userId = rs.getString("userId");
                    String userPwd = rs.getString("userPwd");
                    String userName = rs.getString("userName");
                    String nickName = rs.getString("nickName");
                    String phone = rs.getString("phone");
                    String gender = rs.getString("gender");
                    String signout = rs.getString("signout");
                    String birth_date = rs.getString("birth_date");
                    Timestamp join_date = rs.getTimestamp("join_date");
                    Timestamp upd_date = rs.getTimestamp("upd_date");
                    int adminKey = rs.getInt("adminKey");
                    String tempCode = rs.getString("tempCode");

                    return new MembersDTO(userSeq, userId, userPwd, userName, nickName, phone, email, gender, signout, birth_date, join_date, upd_date, adminKey, tempCode);
                }
            }
        }
        return null;
    }


//동일 메소드 존재로 이름 변경 login -> isUserInfoEnabled
	public boolean isUserInfoEnabled(String id, String pw) throws Exception {
		String sql = "select * from members where userId =? and userPwd = ?";
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setString(1, id);
			pstat.setString(2, pw);
			try (ResultSet rs = pstat.executeQuery()) {
				return rs.next();
			}
		}
	}





	// 비밀번호 업데이트
	public boolean updatePwd(String userId, String newPwd) {
		String sql = "UPDATE members SET userPwd = ?, upd_date = sysdate WHERE userId = ?";
		String Spwd = EncryptionUtils.getSHA512(newPwd);

		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {

			pstat.setString(1, Spwd);
			pstat.setString(2, userId);
			pstat.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
