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

import commons.EncryptionUtils;
import dto.QBoardDTO;

public class QBoardDAO {
   private static QBoardDAO instance;
   public synchronized static QBoardDAO getInstance() {
      if(instance ==null) {
         instance = new QBoardDAO();
      }
      return instance;
   }
   private Connection getConnection() throws Exception{
      Context ctx= new InitialContext();
      DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
      return ds.getConnection();
   }
   private QBoardDAO() {}

   public int insert(QBoardDTO dto) throws Exception{
      String sql = "insert into qboard values (qboard_seq.nextval,2,?,?,?,sysdate,null,0,?,'N',1)";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql, new String[] {"seq"})){
         pstat.setString(1, dto.getWriter());
         pstat.setString(2, dto.getTitle());
         pstat.setString(3, dto.getContents());
         if(dto.getPassword() != null) {
            pstat.setString(4, dto.getPassword());
         }else {
            pstat.setNull(4, java.sql.Types.VARCHAR); // 암호화처리 안하고 널값으로 입력하는 방식
         }
         
         pstat.executeUpdate();
         try(ResultSet rs = pstat.getGeneratedKeys();){
            rs.next();
            int seq = rs.getInt(1);
            System.out.println("파일업로드된 게시물번호"+seq);
            return seq;
         }
      }
   }

   public QBoardDTO getinfo(int seq) throws Exception{
      String sql = "select * from qboard where seq=?";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);){
         pstat.setInt(1, seq);
         try(ResultSet rs = pstat.executeQuery()){
            while(rs.next()) {
               int categorySeq = rs.getInt("categorySeq");
               String title = rs.getString("title");
               String writer = rs.getString("writer");
               String contents = rs.getString("contents");
               Timestamp write_date = rs.getTimestamp("write_date");
               Timestamp upd_date = rs.getTimestamp("upd_date");
               int view_count= rs.getInt("view_count");
               String password = rs.getString("password");
               String isAnswered = rs.getString("isAnswered");
               int adminKey = rs.getInt("adminKey");
               return new QBoardDTO(seq,categorySeq,writer,title,contents,write_date,upd_date,view_count,password,isAnswered,adminKey);
            }
         }
      }
      return null;
   }   
   public int update(QBoardDTO dto) throws Exception {
      String sql = "update qboard set title=?, contents=?,upd_date=sysdate where seq=?";
      try (Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)) {
         pstat.setString(1, dto.getTitle());
         pstat.setString(2, dto.getContents());
         pstat.setInt(3, dto.getSeq());
         return pstat.executeUpdate();
      }
   }

   public int delete(int seq) throws Exception {
      String sql = "delete from qboard where seq=?";
      try (Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)) {
         pstat.setInt(1, seq);
         return pstat.executeUpdate();
      }
   }

   public void increaseViewCount(int seq) throws Exception {
      String sql = "update qboard set view_count = view_count + 1 where seq=?";
      try (Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)) {
         pstat.setInt(1, seq);
         pstat.executeUpdate();
      }
   }


   // 게시글 전체 수 얻기 
   public int getRecordCount() throws Exception {
      String sql = "select count(*) from qboard";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql);
            ResultSet rs = pstat.executeQuery()){
         rs.next();
         return rs.getInt(1);

      }
   }
   // if keyword null값이면 전체 수 얻기 
   // if keyword option값 있으면 아래. 
   // 검색 게시글 수 얻기 
   public int getSearchRecordCount(String keyword, String option) throws Exception{
      String sql = "";
      switch (option) {
         case "title":
            sql = "select count(*) from qboard where title like ?";
            break;
         case "writer":
            sql = "select count(*) from qboard where writer like ?";
            break;
         case "title_writer":
            sql = "select count(*) from qboard where title like ? or writer like ?";
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

   // 전체 게시글 a~b 뽑아내기. 
   public List<QBoardDTO> selectNtoM(int a, int b) throws Exception{
      String sql = "select * from ( select qboard.*, row_number() over(order by seq desc) rown from qboard) subquery where rown between ? and ?";          
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)){
         pstat.setInt(1, a);
         pstat.setInt(2, b);
         try(ResultSet rs = pstat.executeQuery()){
            List<QBoardDTO> list = new ArrayList<>();
            while(rs.next()) {
               int seq = rs.getInt("seq");
               int categorySeq = rs.getInt("categorySeq");
               String writer = rs.getString("writer");
               String title = rs.getString("title");
               String contents = rs.getString("contents"); 
               Timestamp write_date = rs.getTimestamp("write_date");
               Timestamp upd_date = rs.getTimestamp("upd_date");
               int view_count = rs.getInt("view_count");
               String password = rs.getString("password");
               String isAnswered = rs.getString("isAnswered");
               int adminKey = rs.getInt("adminKey");
               list.add(new QBoardDTO(seq,categorySeq,writer,title,contents,write_date,upd_date,view_count,password,isAnswered,adminKey));   
            }
            return list;
         }
      }
   }
   // 게시글 검색. start에서 end까지 번호 게시글들 뽑기. 
      public List<QBoardDTO> searchPosts(String keyword, String option, int start, int end) throws Exception {
          List<QBoardDTO> list = new ArrayList<>();
          String sql = "";

          switch (option) {
              case "title":
                  sql = "select * from (select qboard.*, row_number() over(order by seq desc) rown from qboard where title like ?) subquery where rown between ? and ?";
                  break;
              case "writer":
                  sql = "select * from (select qboard.*, row_number() over(order by seq desc) rown from qboard where writer like ?) subquery where rown between ? and ?";
                  break;
              case "title_writer":
                  sql = "select * from (select qboard.*, row_number() over(order by seq desc) rown from qboard where title like ? OR writer like ?) subquery where rown between ? and ?";
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
                	  QBoardDTO dto = new QBoardDTO();
                      dto.setSeq(rs.getInt("seq"));
                      dto.setCategorySeq(rs.getInt("categorySeq"));
                      dto.setTitle(rs.getString("title"));
                      dto.setContents(rs.getString("contents"));
                      dto.setWriter(rs.getString("writer"));     
                      dto.setWrite_date(rs.getTimestamp("write_date"));
                      dto.setUpd_date(rs.getTimestamp("upd_date"));
                      dto.setView_count(rs.getInt("view_count"));
                      dto.setPassword(rs.getString("password"));
                      dto.setIsAnswered(rs.getString("isAnswered"));
                      dto.setAdminKey(rs.getInt("adminKey"));
                      list.add(dto);
                  }
              }
          }
          return list;
      }
   
   public void updateAnswered(int seq) throws Exception{
      String sql = "update qboard set isAnswered='Y' where seq =?";
      try(Connection con = this.getConnection();
         PreparedStatement pstat = con.prepareStatement(sql)){
         pstat.setInt(1, seq);
         pstat.executeUpdate();
      }
   }
   
   public int comparePassword(int seq, String password) throws Exception{
      String sql = "select * from qboard where seq=? and password=?";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)){
         pstat.setInt(1, seq);
         pstat.setString(2, password);
         try(ResultSet rs = pstat.executeQuery()){
            if(rs.next()) {
               return rs.getInt(1)>0?1:0;
            }
         }
      }
      return 0;
   }
   
   


    
    
}
