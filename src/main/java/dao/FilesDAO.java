package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.FilesDTO;

public class FilesDAO {
	private static FilesDAO instance;
	public synchronized static FilesDAO getInstance() {
		if(instance ==null) {
			instance = new FilesDAO();
		}
		return instance;
	}
	private Connection getConnection() throws Exception{
		Context ctx= new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}
	
	public int insert(FilesDTO dto) throws Exception{
		String sql = "insert into files values (files_seq.nextval, ?,?,?,?)";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setString(1, dto.getOriname());
			pstat.setString(2, dto.getSysname());
			pstat.setInt(3, dto.getParent_seq());
			pstat.setInt(4, dto.getCategorySeq());
			
			return pstat.executeUpdate();
		}
	}
	public List<FilesDTO> selectAll(int parent_seq, int categorySeq) throws Exception{
		String sql = "select * from files where parent_seq=? and categoryseq=?";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql)){
			pstat.setInt(2, categorySeq );
			pstat.setInt(1, parent_seq);
			try(ResultSet rs = pstat.executeQuery()){
					
				List<FilesDTO> list = new ArrayList<>();
				while(rs.next()) {
					int seq = rs.getInt("seq");
					String oriname = rs.getString("oriname");
					String sysname = rs.getString("sysname");
					int pseq = rs.getInt("parent_seq");
					
					list.add(new FilesDTO(seq, oriname, sysname, pseq,categorySeq));
					
				}return list;
			}
		}
	}
		
	 public int deleteBySysname(String sysname, int categorySeq) throws Exception {
	        String sql = "delete from files where sysname=? and categorySeq=?";
	        try (Connection con = this.getConnection();
	             PreparedStatement pstat = con.prepareStatement(sql)) {
	            pstat.setString(1, sysname);
	            pstat.setInt(2, categorySeq);
	            return pstat.executeUpdate();
	        }
	    }
	
}
