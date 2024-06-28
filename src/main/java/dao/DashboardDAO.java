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

import dto.BoardDTO;
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
	public List<BoardDTO> getAllBoardListAsAdmin() {
		String getAllBoardListAsAdminSQL = "select * from board";
		BoardDTO selectedOneBoard = new BoardDTO();
		List<BoardDTO> allBoardList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getAllBoardListAsAdminSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				int freeBoard_seq = rs.getInt("seq");
				int category_seq = rs.getInt("categoryseq");
				String userId = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("contents");
				Timestamp reg_date = rs.getTimestamp("write_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int view_count = rs.getInt("view_count");
				int adminKey = rs.getInt("adminkey");

				selectedOneBoard = new BoardDTO(freeBoard_seq, category_seq, userId, title, content, reg_date,
						updated_date, view_count, adminKey);

				allBoardList.add(selectedOneBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return allBoardList;
	}

	// 최근 게시글 4개만 받아오는 DAO(대시보드 메인용)
	public List<BoardDTO> getRecentFourPost() {
		String getRecentFourPostSQL = "select * from(select * from board order by seq desc) where rownum <= 4";
		BoardDTO selectedOneBoard = new BoardDTO();
		List<BoardDTO> allBoardList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getRecentFourPostSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				int freeBoard_seq = rs.getInt("seq");
				int category_seq = rs.getInt("categoryseq");
				String userId = rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("contents");
				Timestamp reg_date = rs.getTimestamp("write_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int view_count = rs.getInt("view_count");
				int adminKey = rs.getInt("adminkey");

				selectedOneBoard = new BoardDTO(freeBoard_seq, category_seq, userId, title, content, reg_date,
						updated_date, view_count, adminKey);

				allBoardList.add(selectedOneBoard);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return allBoardList;
	}

	// 최근 유저 네사람만 불러오는 DAO(대시보드 메인용)
	public List<MembersDTO> selectRecentFourUser() {
		String selectRecentFourUserSQL = "select * from(select * from members order by userseq desc) where rownum <= 4";
		MembersDTO selectedOneMember = new MembersDTO();
		List<MembersDTO> selectedAllmemberList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(selectRecentFourUserSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				int userSeq = rs.getInt("userSeq");
				String userId = rs.getString("userId");
				String userPwd = rs.getString("userpwd");
				String userName = rs.getString("username");
				String nickName = rs.getString("nickname");
				String phone = rs.getString("phone");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				String birth_date = rs.getString("birth_date");
				Timestamp join_date = rs.getTimestamp("join_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int adminKey = rs.getInt("adminkey");
				String tempCode = rs.getString("tempcode");
				int blacklistSeq = rs.getInt("blacklistseq");
				String signout = rs.getString("signout");
				selectedOneMember = new MembersDTO(userSeq, userId, userPwd, userName, nickName, phone, email, gender,
						signout, birth_date, join_date, updated_date, adminKey, tempCode, blacklistSeq);
				selectedAllmemberList.add(selectedOneMember);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectedAllmemberList;
	}

	// 유저 전부 받아오는 DAO
	public List<MembersDTO> getAllMembersAsAdmin() {
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
				String gender = rs.getString("gender");
				String signout = rs.getString("signout");
				String birth_date = rs.getString("birth_date");
				Timestamp join_date = rs.getTimestamp("join_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int adminKey = rs.getInt("adminkey");
				String tempCode = rs.getString("tempcode");
				int blacklistSeq = rs.getInt("blacklistseq");

				selectedOneMember = new MembersDTO(userSeq, userId, userPwd, userName, nickName, phone, email, gender,
						signout, birth_date, join_date, updated_date, adminKey, tempCode, blacklistSeq);
				selectedAllmemberList.add(selectedOneMember);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectedAllmemberList;
	}

	// 최근 가입한 네명의 유저들을 찾아주는 SQL
	public List<MembersDTO> getRecentFourUsers() {
		String selectAllMembersAsAdminSQL = "select * from(select * from members order by userseq desc) where rownum <= 4";
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
				String gender = rs.getString("gender");
				String signout = rs.getString("signout");
				String birth_date = rs.getString("birth_date");
				Timestamp join_date = rs.getTimestamp("join_date");
				Timestamp updated_date = rs.getTimestamp("upd_date");
				int adminKey = rs.getInt("adminkey");
				String tempCode = rs.getString("tempcode");
				int blacklistSeq = rs.getInt("blacklistseq");

				selectedOneMember = new MembersDTO(userSeq, userId, userPwd, userName, nickName, phone, email, gender,
						signout, birth_date, join_date, updated_date, adminKey, tempCode, blacklistSeq);
				selectedAllmemberList.add(selectedOneMember);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return selectedAllmemberList;
	}

	// 사용자 연령대 받아오는 DAO
	public List<Integer> getAllAgeFromUsers() {
		String getAllAgeFromUsersSQL = "select birth_date from members";
		List<Integer> ageList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getAllAgeFromUsersSQL);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				int birthdate = rs.getInt("birth_date");
				ageList.add((Integer) birthdate);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ageList;
	}

	// 사용자 성별 받아오는 DAO
	public List<String> getAllGenderFromUser() {
		String getAllGenderFromUser = "select gender from members";
		List<String> genderList = new ArrayList<>();
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getAllGenderFromUser);
				ResultSet rs = pstmt.executeQuery();) {
			while (rs.next()) {
				String gender = rs.getString("gender");
				genderList.add(gender);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return genderList;
	}

	// 오늘의 게시물을 찾아주는 DAO
	public int getTodayPost() throws Exception {
		int result = 0;
		String getTodayPostSQL = "select count(*) as cnt from board where to_char(write_date, 'yymmdd') = to_char(sysdate, 'yymmdd')";
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getTodayPostSQL);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				int count = rs.getInt("cnt");
				return count;
			}
			return result;
		}
	}

	// 오늘 가입한 유저를 찾아주는 DAO
	public int getTodayUser() throws Exception {
		int result = 0;
		String getTodayUserSQL = "select count(*) as cnt from members where to_char(join_date, 'yymmdd')=to_char(sysdate, 'yymmdd')";
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getTodayUserSQL);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				int count = rs.getInt("cnt");
				return count;
			}
			return result;
		}
	}

	// 전체 유저의 숫자를 찾아주는 DAO
	public int getTotalUser() throws Exception {
		int result = 0;
		String getTotalUserSQL = "select count(*) as cnt from members";
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getTotalUserSQL);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				int count = rs.getInt("cnt");
				return count;
			}

			return result;
		}
	}

	// 전체 게시글 수를 찾는 DAO
	public int getTotalPost() throws Exception {
		int result = 0;
		String getTotalPostSQL = "select count(*) as cnt from board";
		try (Connection conn = this.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(getTotalPostSQL);
				ResultSet rs = pstmt.executeQuery();) {
			if (rs.next()) {
				int count = rs.getInt("cnt");
				return count;
			}

			return result;
		}
	}

	// 유저 정보 확인하는 DAO
	public MembersDTO getOneUserInfoAsAdmin(int userSeq) throws Exception {
		String sql = "SELECT * FROM members WHERE userSeq = ?";
		MembersDTO members = new MembersDTO();
		try (Connection con = this.getConnection(); PreparedStatement pstat = con.prepareStatement(sql)) {
			pstat.setInt(1, userSeq);
			try (ResultSet rs = pstat.executeQuery()) {
				if (rs.next()) {
					String userName = rs.getString("userName");
					String userId = rs.getString("userId");
					String nickName = rs.getString("nickname");
					String password = rs.getString("userpwd");
					String phone = rs.getString("phone");
					String email = rs.getString("email");
					String gender = rs.getString("gender");
					String signout = rs.getString("signout");
					Timestamp join_date = rs.getTimestamp("join_date");
					Timestamp upd_date = rs.getTimestamp("upd_date");
					int adminKey = rs.getInt("adminKey");
					String tempCode = rs.getString("tempCode");
					String birth_date = rs.getString("birth_date");
					int blackListSeq = rs.getInt("blacklistSeq");

					members = new MembersDTO(userSeq, userId, password, userName, nickName, phone, email, gender,
							signout, birth_date, join_date, upd_date, adminKey, tempCode, blackListSeq);
				}
			}
		}
		return members;
	}

	// 블랙리스트 처리 된 이유 찾는 DAO
	public String getBlockedReason(int blackListSeq) throws Exception {
		String getBlockedReasonSQL = "select reason from blacklist where blacklistSeq = ?";
		String blockedReason = new String();
		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(getBlockedReasonSQL)) {
			pstat.setInt(1, blackListSeq);
			try (ResultSet rs = pstat.executeQuery()) {
				if (rs.next()) {
					blockedReason = rs.getString("reason");
				}
			}
		}
		return blockedReason;
	}

	// 블랙리스트 추가하는 DAO
	public int addBlockUser(String blockedReason, int userSeq, String userId) throws Exception {
		int result = 0;
		String addBlockUserSQL = "insert into blacklist values(blacklist_seq.nextval, ?, ?, sysdate, ?)";
		try (Connection con = this.getConnection(); PreparedStatement pstmt = con.prepareStatement(addBlockUserSQL);) {
			pstmt.setString(1, userId);
			pstmt.setString(2, blockedReason);
			pstmt.setInt(3, userSeq);
			result = pstmt.executeUpdate();
		}
		return result;
	}

	// 추가된 블랙리스트 seq 찾는 DAO
	public int getBlackListSeq(int userSeq) throws Exception {
		String getBlackListSeqSQL = "select blacklistSeq from blacklist where userSeq = ?";
		int blacklistSeq = 0;
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(getBlackListSeqSQL);) {
			pstmt.setInt(1, userSeq);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					blacklistSeq = rs.getInt("blacklistSeq");
				}

			}
		}
		return blacklistSeq;
	}

	// 블랙리스트 추가된 멤버의 정보를 업데이트 하는 DAO
	public int updateBlockedMemberInfo(int blacklistSeq, int userSeq) throws Exception {
		int result = 0;
		String updateBlockedMemberInfo = "update members set blacklistSeq = ? where userSeq = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(updateBlockedMemberInfo);) {
			pstmt.setInt(1, blacklistSeq);
			pstmt.setInt(2, userSeq);
			result = pstmt.executeUpdate();
		}
		return result;
	}

	// 블랙리스트 해제
	public int unblockBlockedUser(int userSeq) throws Exception {
		int result = 0;
		String unblockBlockedUserSQL = "update members set blacklistSeq = 0 where userSeq = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(unblockBlockedUserSQL);) {
			pstmt.setInt(1, userSeq);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 블랙리스트에서도 삭제
	public int deleteBlacklist(int blacklistSeq, int userSeq) throws Exception {
		int result = 0;
		String deleteBlacklistSQL = "delete from blacklist where blacklistSeq=? and userSeq = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(deleteBlacklistSQL);) {
			pstmt.setInt(1, blacklistSeq);
			pstmt.setInt(2, userSeq);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 유저가 등록한 자유게시판 글 모아보기
	public List<BoardDTO> showAllBoardByUserId(String userId) throws Exception {
		BoardDTO userPost = new BoardDTO();
		List<BoardDTO> postList = new ArrayList<>();
		String showAllBoardByUserIdSQL = "select * from board where writer = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(showAllBoardByUserIdSQL);) {
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery();) {
				if (rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					userPost = new BoardDTO(seq, writer, title, contents, write_date);
					postList.add(userPost);
				}

			}
		}
		return postList;
	}

	// 데이터베이스 업데이트 메소드
	public int updateUserInfoAsAdmin(int userSeq, String updatedNickName, String updatedEmail, String updatedPhone) {
		int result = 0;
		String updateUserInfoSQL = "UPDATE members SET nickname = ?, email = ?, phone = ? WHERE userseq = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(updateUserInfoSQL);) {

			// 디버깅: 쿼리에 설정될 값 출력
			System.out.println("Updating with values: " + updatedNickName + ", " + updatedEmail + ", " + updatedPhone
					+ ", " + userSeq);

			pstmt.setString(1, updatedNickName);
			pstmt.setString(2, updatedEmail);
			pstmt.setString(3, updatedPhone);
			pstmt.setInt(4, userSeq);

			result = pstmt.executeUpdate();

			// 디버깅: 업데이트 결과 출력
			System.out.println("Update result from DB: " + result);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// 포스팅 수정 DAO
	public int postUpdateAsAdmin(int boardSeq, String title, String contents) {
		int result = 0;
		String postUpdateAsAdminSQL = "update board set title = ? , contents = ? where seq = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(postUpdateAsAdminSQL);) {
			pstmt.setString(1, title);
			pstmt.setString(2, contents);
			pstmt.setInt(3, boardSeq);
			result = pstmt.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	// 게시물 삭제
	public int postDeletionAsAdmin(int boardSeq) {
		int result = 0;
		String postDeletionAsAdminSQL = "delete board where seq = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(postDeletionAsAdminSQL);) {
			result = pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	// 중간관리자까지만 추가
	public int promotionToAdmin(int userSeq, String userName, String userId) {
		int result = 0;
		String promotionToAdminSQL = "insert into admin values(admin_seq.nextval, 1, ?, ?, ?)";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(promotionToAdminSQL);) {
			pstmt.setString(1, userName);
			pstmt.setString(2, userId);
			pstmt.setInt(3, userSeq);

			result = pstmt.executeUpdate();

		}catch(Exception e)
	{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}return result;

	}

	public int updateAdminKey(int userSeq) {
		int result = 0;
		String updateAdminKeySQL = "update members set adminKey = 1 where userSeq = ?";
		try {
			MembersDTO memberInfo = getOneUserInfoAsAdmin(userSeq);
			if (memberInfo.getAdminKey() == 0 && memberInfo.getBlacklistSeq() == 0) {
				try (Connection con = this.getConnection();
						PreparedStatement pstmt = con.prepareStatement(updateAdminKeySQL);) {
					pstmt.setInt(1, userSeq);
					result = pstmt.executeUpdate();
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	
	//유저별 작성한 게시글 갯수 찾는 DAO
	public int getAllPostCountPerUser(String writer) {
		int count = 0;
		String getAllPostCountPerUserSQL = "select count (*) as cnt from board where writer = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(getAllPostCountPerUserSQL);) {
			pstmt.setString(1,writer);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					count = rs.getInt("cnt");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

	//유저별 작성한 댓글 갯수 찾는 DAO
	public int getAllReplyCountPerUser(String writer) {
		int count = 0;
		String getAllReplyCountPerUser = "select count (*) as cnt from Reply where userId = ?";
		try (Connection con = this.getConnection();
				PreparedStatement pstmt = con.prepareStatement(getAllReplyCountPerUser);) {
			pstmt.setString(1,writer);
			try(ResultSet rs = pstmt.executeQuery();){
				if(rs.next()) {
					count = rs.getInt("cnt");
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return count;
	}

}
