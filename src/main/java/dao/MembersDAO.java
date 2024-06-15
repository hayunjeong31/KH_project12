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

    private MembersDAO() {}

    private Connection getConnection() throws Exception {
        Context ctx = new InitialContext();
        DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
        return ds.getConnection();
    }

    public int addMember(MembersDTO dto) throws Exception {
        String sql = "insert into members(userSeq, userId, userPwd, userName, nickName, phone, email, gender, signout, birth_date ,join_date, upd_date, adminKey) values (members_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate, null, ?)";
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
            return pstat.executeUpdate();
        }
    }

    public boolean isUserIdAvailable(String userId) throws Exception {
        String sql = "select count(*) from members where userId = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            try (ResultSet rs = pstat.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt(1) == 0; // count가 0이면 사용 가능
                }
            }
        }
        return false;
    }

    public boolean login(String id, String pw) throws Exception {
        String sql = "select * from members where userId =? and userPwd = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, id);
            pstat.setString(2, pw);
            try (ResultSet rs = pstat.executeQuery()) {
                return rs.next();
            }
        }
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
                    return new MembersDTO(0, userId, null, userName, nickName, phone, email, null, null, null, join_date, null, 0);
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
        
        return false;
    }
    
    // 비밀번호 업데이트
    public boolean updatePwd(String userId, String newPwd) {
        String sql = "UPDATE members SET userPwd = ?, upd_date = sysdate WHERE userId = ?";
        String Spwd = EncryptionUtils.getSHA512(newPwd);
        
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
             
            pstat.setString(1, Spwd);
            pstat.setString(2, userId);
            pstat.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
		return false;
    }


    // 회원탈퇴
    public int deleteById(String userId) throws Exception {
        String sql = "DELETE FROM members WHERE userId = ?";
        try (Connection con = this.getConnection();
             PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            return pstat.executeUpdate();
        }
    }
}
