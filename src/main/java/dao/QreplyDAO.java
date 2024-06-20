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

import dto.QReplyDTO;

public class QreplyDAO {
	private static QreplyDAO instance;
	public synchronized static QreplyDAO getInstance() {
		if(instance ==null) {
			instance = new QreplyDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	private QreplyDAO() {}
	
	public int insertReply(QReplyDTO dto) throws Exception{
		String sql = "insert into qreply values (qreply_seq.nextval,?,?,sysdate,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, dto.getUserId());
			pstat.setString(2, dto.getContents());
			pstat.setInt(3, dto.getQueSeq());
			
			return pstat.executeUpdate();		
			
		}
	}
	
	public List<QReplyDTO> getReply (int seq) throws Exception{
		String sql = "select * from qreply where queSeq=? order by seq desc";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				List<QReplyDTO> list = new ArrayList<>();
				while(rs.next()) {
					int qseq = rs.getInt("seq");
					String writer = rs.getString("userid");
					String contents = rs.getString("contents");
					Timestamp write_date = rs.getTimestamp("write_date");
					list.add(new QReplyDTO(qseq,writer,contents,write_date,seq));
							
				}
				return list;
			}
		}
	}
	
	public int replydelete(int a) throws Exception{
		String sql = "delete from qreply where seq=?";
		  try (Connection con = this.getConnection();
		             PreparedStatement pstat = con.prepareStatement(sql)) {
		            pstat.setInt(1, a);
		            return pstat.executeUpdate();
		        }
	}
	
	public int replyedit(QReplyDTO dto) throws Exception{
		String sql = "update qreply set contents=?,write_date=sysdate where seq=?";
		try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setString(1, dto.getContents());
	            pstat.setInt(2, dto.getSeq());
	            return pstat.executeUpdate();
	        }
	}
	
	// 댓글 갯수 가져오기 
	public int getreplycount(int seq) throws Exception{
		String sql = "select count(*) from qreply where queSeq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(1, seq);
			try(ResultSet rs = pstat.executeQuery()){
				if(rs.next()) {
					return rs.getInt(1);					
				}else {
					return 0;
				}
				
			}
		}
	}
	
	
	
	
	
	
	
}










