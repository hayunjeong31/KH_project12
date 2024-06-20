package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import commons.BoardConfig;
import dto.BoardDTO;

public class BoardDAO {

	public static BoardDAO instance;

	public synchronized static BoardDAO getInstance() {  
		if(instance == null) {
			instance = new BoardDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception { 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private BoardDAO() {}


	// 전체 글 개수 
	public int getRecordCountByWriter(String writer) throws Exception{
		String sql = "SELECT COUNT(*) FROM board WHERE writer = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, writer);
			try(ResultSet rs= pstat.executeQuery()){
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	public List<BoardDTO>selectByWriter(String writer, int start, int end) throws Exception{
		String sql = "select * from (select board.*, row_number() over (order by seq desc) rown from board where writer=?) subquery where rown between ? and ?";

		List<BoardDTO> list = new ArrayList<>();
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, writer);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			ResultSet rs = pstat.executeQuery();

			while(rs.next()){
				BoardDTO dto = new BoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setCategorySeq(rs.getInt("categorySeq"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setWrite_date(rs.getTimestamp("write_date"));
				dto.setUpd_date(rs.getTimestamp("upd_date"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setAdminKey(rs.getInt("adminKey"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	// 페이지 네비게이션 생성
	//	public String getPageNavi(int currentPage, int recordTotalCount)throws Exception {
	//		
	//		
	//		int pageTotalCount = 0;
	//		
	//		if(recordTotalCount % BoardConfig.RECORD_COUNT_PER_PAGE > 0) {
	//			pageTotalCount = recordTotalCount / BoardConfig.RECORD_COUNT_PER_PAGE + 1;
	//		}else {
	//			pageTotalCount = recordTotalCount / BoardConfig.RECORD_COUNT_PER_PAGE;
	//		}
	//		
	//		int startNavi = (currentPage - 1) / BoardConfig.NAVI_COUNT_PER_PAGE * BoardConfig.NAVI_COUNT_PER_PAGE + 1;
	//		int endNavi = startNavi + BoardConfig.NAVI_COUNT_PER_PAGE - 1;
	//		
	//		if(endNavi > pageTotalCount) {
	//			endNavi = pageTotalCount;
	//		}
	//		
	//		boolean needNext = startNavi > 1;
	//		boolean needPrev = endNavi < pageTotalCount;
	//		
	//		StringBuilder sb = new StringBuilder();
	//		
	//		// 전 네비 이동
	//		if(needPrev) {sb.append("<a href='/list.board?cpage="+(startNavi-1)+"'><</a>");
	//		}
	//
	//
	//		for(int i = startNavi;i <= endNavi;i++) {sb.append("<a href='/list.board?cpage="+i+"'>"+i+"</a> ");
	//		}
	//
	//		// 후 네비 이동
	//		if(needNext) {sb.append("<a href='/list.board?cpage="+(endNavi+1)+"'>></a>");
	//		}
	//		return sb.toString();
	//	}
}
