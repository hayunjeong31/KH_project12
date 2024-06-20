package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.BoardConfig;
import dto.BoardDTO;

public class BoardDAO {
	private static BoardDAO instance;
	public synchronized static BoardDAO getInstance() {
		if(instance ==null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	private BoardDAO() {}
	
	// 게시글 북마크 등록하기
	public boolean addBookmark(String userId, int postSeq)throws Exception{
		String sql = "insert into bookmarks values (bookmarks_seq.nextval,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, userId);
			pstat.setInt(2, postSeq);
			pstat.executeUpdate();
			return true;
		}
	}
	// 게시글 북마크 제거하기
	public boolean removeBookmark(String userId, int postSeq) throws Exception{
		String sql="delete from bookmarks where userId=? and postSeq=?";
		try (Connection con = getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, userId);
            pstmt.setInt(2, postSeq);
            pstmt.executeUpdate();
            return true;
        }
	}
	// 북마크 상태 가져오기 
	public boolean checkBookmark(String userId, int postSeq) throws Exception{
		boolean isBookmarked = false;
	
		 String sql = "SELECT COUNT(*) FROM bookmarks WHERE userid = ? AND postseq = ?";

	        try (Connection con = this.getConnection();
	        		PreparedStatement pstat = con.prepareStatement(sql);) {
	            pstat.setString(1, userId);
	            pstat.setInt(2, postSeq);
	            
	            try (ResultSet rs = pstat.executeQuery()) {
	                if (rs.next()) {
	                    int count = rs.getInt(1);
	                    if (count > 0) {
	                        isBookmarked = true;
	                    }
	                }
	            }
	       } return isBookmarked;
	}
	
	// 게시글 등록하기
	public int insert(BoardDTO dto) throws Exception{
		String sql = "insert into board values (board_seq.nextval,1,?,?,?,sysdate,null,0,1)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql, new String[] {"seq"})){ //첨부파일 등록할때 방해 안받을려고
			pstat.setString(1, dto.getWriter());
			pstat.setString(2, dto.getTitle());
			pstat.setString(3, dto.getContents());
			
			pstat.executeUpdate();
			try(ResultSet rs = pstat.getGeneratedKeys();){
				rs.next();
				int seq = rs.getInt(1);
				System.out.println("ddfdf"+seq);
				return seq;
			}
		}
	}
	
	public List<BoardDTO> selectAll() throws Exception{
		String sql="select * from board order by 1 desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery()){
			List<BoardDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				String writer = rs.getString("writer");
				String title = rs.getString("title");
				String contents = rs.getString("contents"); 
				Timestamp write_date = rs.getTimestamp("write_date");
				Timestamp upd_date = rs.getTimestamp("upd_date");
				int view_count = rs.getInt("view_count");
				int adminKey = rs.getInt("adminKey");
				list.add(new BoardDTO(seq,0,writer,title,contents,write_date,upd_date,view_count,adminKey));	
			}
			return list;
		}
	}
	
	public BoardDTO getinfo(int seq) throws Exception{
		String sql = "select * from board where seq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				while(rs.next()) {
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					Timestamp upd_date = rs.getTimestamp("upd_date");
					int view_count= rs.getInt("view_count");
					int adminKey = rs.getInt("adminKey");
					
					return new BoardDTO(seq,0,writer,title,contents,write_date,upd_date,view_count,adminKey);
				}
			}
		}
		return null;
	}	
	
	   public int update(BoardDTO dto) throws Exception {
	        String sql = "update board set title=?, contents=?,upd_date=sysdate where seq=?";
	        try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setString(1, dto.getTitle());
	            pstat.setString(2, dto.getContents());
	            pstat.setInt(3, dto.getSeq());
	            return pstat.executeUpdate();
	        }
	    }
	    
	    public int delete(int seq) throws Exception {
	        String sql = "delete from board where seq=?";
	        try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setInt(1, seq);
	            return pstat.executeUpdate();
	        }
	    }
	    
	    public void increaseViewCount(int seq) throws Exception {
	        String sql = "update board set view_count = view_count + 1 where seq=?";
	        try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setInt(1, seq);
	            pstat.executeUpdate();
	        }
	    }
	    
	    // 바깥에서 안쓰고 내부에서만 쓰니깐 private으로  // client에 페이지네비 할거니깐 public으로 고쳐주기.
	    public int getRecordCount() throws Exception {
	    	String sql = "select count(*) from board";
	    	try(Connection con = this.getConnection();
					PreparedStatement pstat = con.prepareStatement(sql);
	    			ResultSet rs = pstat.executeQuery()){
	    		rs.next();
	    		return rs.getInt(1);
	    		
	    		}
	    	}
	    	
	    public List<BoardDTO> selectNtoM(int a, int b) throws Exception{
	    	String sql = "select * from ( select board.*, row_number() over(order by seq desc) rown from board) subquery where rown between ? and ?";
	    		
	    	try(Connection con = this.getConnection();
	    			PreparedStatement pstat = con.prepareStatement(sql)){
	    		pstat.setInt(1, a);
	    		pstat.setInt(2, b);
	    		try(ResultSet rs = pstat.executeQuery()){
	    		List<BoardDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String writer = rs.getString("writer");
					String title = rs.getString("title");
					String contents = rs.getString("contents"); 
					Timestamp write_date = rs.getTimestamp("write_date");
					Timestamp upd_date = rs.getTimestamp("upd_date");
					int view_count = rs.getInt("view_count");
					int adminKey = rs.getInt("adminKey");
					list.add(new BoardDTO(seq,0,writer,title,contents,write_date,upd_date,view_count,adminKey));	
				}
				return list;
			}
	    	}
	    }
	 // 게시글 검색. start에서 end까지 번호 게시글들 뽑기. 
 		public List<BoardDTO> searchPosts(String keyword, String option, int start, int end) throws Exception {
 		    List<BoardDTO> list = new ArrayList<>();
 		    String sql = "";

 		    switch (option) {
 		        case "title":
 		            sql = "select * from (select board.*, row_number() over(order by seq desc) rown from board where title like ?) subquery where rown between ? and ?";
 		            break;
 		        case "writer":
 		            sql = "select * from (select board.*, row_number() over(order by seq desc) rown from board where writer like ?) subquery where rown between ? and ?";
 		            break;
 		        case "title_writer":
 		            sql = "select * from (select board.*, row_number() over(order by seq desc) rown from board where title like ? OR writer like ?) subquery where rown between ? and ?";
 		            break;
 		    }

 		    try (Connection conn = getConnection(); 
 		         PreparedStatement pstat = conn.prepareStatement(sql)) {
 		        pstat.setString(1, "%" + keyword + "%");
 		        if (option.equals("title_writer")) {
 		            pstat.setString(2, "%" + keyword + "%");
 		            pstat.setInt(3, start);
 		            pstat.setInt(4, end);
 		        } else {
 		            pstat.setInt(2, start);
 		            pstat.setInt(3, end);
 		        }
 		        try (ResultSet rs = pstat.executeQuery()) {
 		            while (rs.next()) {
 		                BoardDTO dto = new BoardDTO();
 		                dto.setSeq(rs.getInt("seq"));
 		                dto.setCategorySeq(rs.getInt("categorySeq"));
 		                dto.setTitle(rs.getString("title"));
 		                dto.setContents(rs.getString("contents"));
 		                dto.setWriter(rs.getString("writer"));     
 		                dto.setWrite_date(rs.getTimestamp("write_date"));
 		                dto.setUpd_date(rs.getTimestamp("upd_date"));
 		                dto.setView_count(rs.getInt("view_count"));
 		                dto.setAdminKey(rs.getInt("adminKey"));
 		                list.add(dto);
 		            }
 		        }
 		    }
 		    return list;
 		}
 	// if keyword null값이면 전체 수 얻기 
 		// if keyword option값 있으면 아래. 
 		// 검색 게시글 수 얻기 
 		public int getSearchRecordCount(String keyword, String option) throws Exception{
 			String sql = "";
 			switch (option) {
 				case "title":
 					sql = "select count(*) from board where title like ?";
 					break;
 				case "writer":
 					sql = "select count(*) from board where writer like ?";
 					break;
 				case "title_writer":
 					sql = "select count(*) from board where title like ? or writer like ?";
 					break;
 			}
 			 try (Connection conn = getConnection(); 
 			         PreparedStatement pstat = conn.prepareStatement(sql)) {
 			        pstat.setString(1, "%" + keyword + "%");
 			        if (option.equals("title_writer")) {
 			            pstat.setString(2, "%" + keyword + "%");
 			        }
 			        try (ResultSet rs = pstat.executeQuery()) {
 			        	rs.next();
 			        	return rs.getInt(1);
 			        }
 			 }
 			//
 			
 		}
	 	  
	    

	 
	
	
	
}
