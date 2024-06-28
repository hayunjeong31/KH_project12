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
   
   // 댓글 등록하기.
   public int insertComment(ReplyDTO dto) throws Exception{
      String sql = "insert into reply values (reply_seq.nextval,?,?,?,sysdate,?,'n')";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)){
         pstat.setInt(1, dto.getBoardSeq());
         pstat.setInt(2, dto.getParent_cmt());
         pstat.setString(3, dto.getContents());
         pstat.setString(4, dto.getUserId());
         
         return pstat.executeUpdate();      
      }
   }
   // 댓글 출력하기
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
            String isDeleted = rs.getString("isDeleted");
            list.add(new ReplyDTO(seq,boardSeq,parent_cmt,contents,write_date, writer, isDeleted));   
         }
         return list;
      }
   }
   }

   public int getRepliesByParentcmt(int c_seq) throws Exception{
      String sql = "select count(*) from reply where parent_cmt=?";
      try(Connection con = this.getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)){
         pstat.setInt(1, c_seq);
         try(ResultSet rs = pstat.executeQuery()){
            rs.next();
            return rs.getInt(1);
         
         }
      }
   }
   
   
   
   //////////////////////////////////////////////
   
   
   
   //댓글 삭제하기(답글 없을때) & 답글 삭제하기 => UPDATE하기 
   // 삭제여부 default = 'n' => 'y'로 update!!! 
   public int replydelete(int seq) throws Exception{
      String sql = "update reply set isDeleted ='y' where seq=? ";
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

   ///////////////////////////////////////////////////////
   
   // 댓글 좋아요 등록하기
      public boolean addLike(String userId, int replySeq)throws Exception{
         String sql = "insert into likes (seq,userid,replyseq) values (likes_seq.nextval,?,?)";
         try(Connection con = this.getConnection();
               PreparedStatement pstat = con.prepareStatement(sql)){
            pstat.setString(1, userId);
            pstat.setInt(2, replySeq);
            pstat.executeUpdate();
            return true;
         }
      }
      // 댓글 좋아요 제거하기
      public boolean removeLike(String userId, int replySeq) throws Exception{
         String sql="delete from likes where userId=? and replySeq=?";
         try (Connection con = getConnection(); 
            PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            pstat.setInt(2, replySeq);
            pstat.executeUpdate();
               return true;
           }
      }
      // 좋아요 상태 가져오기 
      public boolean checkLike(String userId, int replySeq) throws Exception{
         boolean isLiked = false;
      
          String sql = "SELECT COUNT(*) FROM likes WHERE userid = ? AND replyseq = ?";

              try (Connection con = this.getConnection();
                    PreparedStatement pstat = con.prepareStatement(sql);) {
                  pstat.setString(1, userId);
                  pstat.setInt(2, replySeq);
                  
                  try (ResultSet rs = pstat.executeQuery()) {
                      if (rs.next()) {
                          int count = rs.getInt(1);
                          if (count > 0) {
                              isLiked = true;
                          }
                      }
                  }
             } return isLiked;
      }
      // 싫어요 상태 가져오기
      public boolean checkHate(String userId, int replySeq) throws Exception{
         boolean isLiked = false;
      
          String sql = "SELECT COUNT(*) FROM hates WHERE userid = ? AND replyseq = ?";

              try (Connection con = this.getConnection();
                    PreparedStatement pstat = con.prepareStatement(sql);) {
                  pstat.setString(1, userId);
                  pstat.setInt(2, replySeq);
                  
                  try (ResultSet rs = pstat.executeQuery()) {
                      if (rs.next()) {
                          int count = rs.getInt(1);
                          if (count > 0) {
                              isLiked = true;
                          }
                      }
                  }
             } return isLiked;
      }
      // 댓글 좋아요 갯수 가져오기
      public int getCountLikes (int replySeq) throws Exception{
         String sql="select count(*) from likes where replyseq=?";
         try(Connection con = getConnection(); 
            PreparedStatement pstat = con.prepareStatement(sql)){
            pstat.setInt(1, replySeq);
            try(ResultSet rs = pstat.executeQuery()){
               rs.next();
               return rs.getInt(1);
            }
         }
      }
      // 댓글 싫어요 갯수 가져오기
      public int getCountHates (int replySeq) throws Exception{
         String sql="select count(*) from hates where replyseq=?";
         try(Connection con = getConnection(); 
            PreparedStatement pstat = con.prepareStatement(sql)){
            pstat.setInt(1, replySeq);
            try(ResultSet rs = pstat.executeQuery()){
               rs.next();
               return rs.getInt(1);
            }
         }
      }
      //댓글 싫어요 등록하기
      public boolean addHate(String userId, int replySeq)throws Exception{
         String sql = "insert into hates values (hates_seq.nextval,?,?)";
         try(Connection con = this.getConnection();
               PreparedStatement pstat = con.prepareStatement(sql)){
            pstat.setString(1, userId);
            pstat.setInt(2, replySeq);
            pstat.executeUpdate();
            return true;
         }
      }
      // 댓글 싫어요 제거하기
      public boolean removeHate(String userId, int replySeq) throws Exception{
         String sql="delete from hates where userId=? and replySeq=?";
         try (Connection con = getConnection(); 
            PreparedStatement pstat = con.prepareStatement(sql)) {
            pstat.setString(1, userId);
            pstat.setInt(2, replySeq);
            pstat.executeUpdate();
               return true;
           }
      }
      
      //////////////////////////////////////////////////////
      //게시글의 댓글 총 갯수 가져오기
      public int getReplyCount(int boardSeq) throws Exception{
         String sql = "select count(*) from reply where boarseq=?";
         try(Connection con = getConnection();
            PreparedStatement pstat = con.prepareStatement(sql)){
            pstat.setInt(1, boardSeq);
            try(ResultSet rs = pstat.executeQuery()){
               rs.next();
               return rs.getInt(1);
            }
         }
      }
   
   
}
