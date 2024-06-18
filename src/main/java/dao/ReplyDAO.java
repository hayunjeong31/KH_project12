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
import dto.ReplyDTO;

public class ReplyDAO {
	private static ReplyDAO instance;
	public synchronized static ReplyDAO getInstance() {
		if(instance ==null) {
			instance = new ReplyDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	private ReplyDAO() {}
	
	
	public int insertComment(ReplyDTO dto) throws Exception{
		String sql = "insert into reply values (reply_seq.nextval,?,?,?,sysdate,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, dto.getBoardSeq());
			pstat.setInt(2, dto.getParent_cmt());
			pstat.setString(3, dto.getContents());
			pstat.setString(4, dto.getUserId());
			
			return pstat.executeUpdate();		
		}
	}
	public List<ReplyDTO> getinfo(int boardSeq) throws Exception{
		String sql = "select * from reply where boardSeq = ? order by 1 desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
		pstat.setInt(1, boardSeq);
		try(ResultSet rs = pstat.executeQuery()){
			List<ReplyDTO> list = new ArrayList<>();
			while(rs.next()) {
				int seq = rs.getInt("seq");
				int parent_cmt = rs.getInt("parent_cmt");
				String contents = rs.getString("contents"); 
				Timestamp write_date = rs.getTimestamp("write_date");
				String writer = rs.getString("userId");
				list.add(new ReplyDTO(seq,boardSeq,parent_cmt,contents,write_date, writer));	
			}
			return list;
		}
	}
	}
	//댓글 삭제하기
	public int replydelete(int seq) throws Exception{
		String sql = "delete from reply where seq=?";
	  try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setInt(1, seq);
	            return pstat.executeUpdate();
	        }
	}
	// 댓글 수정하기
	public int replyedit(ReplyDTO dto) throws Exception{
		String sql = "update reply set contents=?,write_date=sysdate where seq=?";
		try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setString(1, dto.getContents());
	            pstat.setInt(2, dto.getSeq());
	            return pstat.executeUpdate();
	        }
	}
	
	
}
