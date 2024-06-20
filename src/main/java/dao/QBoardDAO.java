package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.QBoardDTO;

public class QBoardDAO {

	public static QBoardDAO instance;

	public synchronized static QBoardDAO getInstance() {  
		if(instance == null) {
			instance = new QBoardDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception { 
		Context ctx = new InitialContext();
		DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	private QBoardDAO() {}


	// 전체 글 개수 
	public int getRecordCountByWriter(String writer) throws Exception{
		String sql = "SELECT COUNT(*) FROM qboard WHERE writer = ?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, writer);
			try(ResultSet rs= pstat.executeQuery()){
				rs.next();
				return rs.getInt(1);
			}
		}
	}

	public List<QBoardDTO>selectByWriter(String writer, int start, int end) throws Exception{
		String sql = "select * from (select qboard.*, row_number() over (order by seq desc) rown from qboard where writer=?) subquery where rown between ? and ?";

		List<QBoardDTO> list = new ArrayList<>();
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, writer);
			pstat.setInt(2, start);
			pstat.setInt(3, end);
			ResultSet rs = pstat.executeQuery();

			while(rs.next()){
				QBoardDTO dto = new QBoardDTO();
				dto.setSeq(rs.getInt("seq"));
				dto.setCategorySeq(rs.getInt("categorySeq"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContents(rs.getString("contents"));
				dto.setWrite_date(rs.getTimestamp("write_date"));
				dto.setUpd_date(rs.getTimestamp("upd_date"));
				dto.setView_count(rs.getInt("view_count"));
				dto.setPassword(rs.getString("password"));
				dto.setIsAnswered(rs.getString("isAnswered"));
				dto.setAdminKey(rs.getInt("adminKey"));
				list.add(dto);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
