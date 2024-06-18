package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FreeBoardDTO;
import dto.MembersDTO;

public class DashboardDAO {

	private static DashboardDAO instance;

	public synchronized static DashboardDAO getInstance() {
		if (instance == null) {
			instance = new DashboardDAO();
		}
		return instance;
	}

	private Connection getConnection() throws Exception {
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private DashboardDAO() {
	}
	// 게시판 전부 받아오는 DAO

	public List<FreeBoardDTO> getAllBoardListAsAdmin() {
		String getAllBoardListAsAdminSQL = "select * from Free_Board";
		FreeBoardDTO selectedOneBoard = new FreeBoardDTO();
		List<FreeBoardDTO> allBoardList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getAllBoardListAsAdminSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				int freeBoard_seq = rs.getInt("freeseq");
				int category_seq = rs.getInt("categoryseq");
				String userId = rs.getString("userId");
				String title = rs.getString("title");
				String content = rs.getString("content");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int view_count = rs.getInt("view_count");
				int adminKey = rs.getInt("adminkey");

				selectedOneBoard = new FreeBoardDTO(freeBoard_seq, category_seq, userId, title, content, reg_date,
						updated_date, view_count, adminKey);

				allBoardList.add(selectedOneBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return allBoardList;
	}

	// 유저 전부 받아오는 DAO
	public List<MembersDTO> selectAllMembersAsAdmin() {
		String selectAllMembersAsAdminSQL = "select * from members";
		MembersDTO selectedOneMember = new MembersDTO();
		List<MembersDTO> selectedAllmemberList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(selectAllMembersAsAdminSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				int userSeq = rs.getInt("userSeq");
				String userId = rs.getString("userId");
				String userPwd = rs.getString("userpwd");
				String userName = rs.getString("username");
				String nickName = rs.getString("nickname");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String gender = rs.getString("birth_Date");
				String signout = rs.getString("gender");
				String birth_date = rs.getString("signout");
				Timestamp join_date = rs.getTimestamp("join_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int adminKey = rs.getInt("adminkey");
				selectedOneMember = new MembersDTO(userSeq,userId,userPwd,userName,nickName,phone,email,gender,signout,birth_date,join_date,updated_date,adminKey);
				selectedAllmemberList.add(selectedOneMember);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return selectedAllmemberList;
	}
	// 사용자 연령대 받아오는 DAO
	public List<Integer> getAllAgeFromUsers(){
		String getAllAgeFromUsersSQL = "select birth_date from members";
		List<Integer> ageList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getAllAgeFromUsersSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while(rs.next()) {
				int birthdate = rs.getInt("birth_date");
				ageList.add((Integer)birthdate);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return ageList;
	}
	// 사용자 성별 받아오는 DAO
}
