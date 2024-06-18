package servlet;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import dao.FilesDAO;
import dto.FilesDTO;


@WebServlet("*.file")
public class FileController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cmd = request.getRequestURI();
		FilesDAO dao = new FilesDAO();
		
		try {
			if(cmd.equals("/upload.file")) {
		
				
			
			}else if(cmd.equals("/download.file")) {
				String filepath = request.getServletContext().getRealPath("files");   // 다운 받을 파일의 위치 확보
	            String sysname = request.getParameter("sysname");              		 // 다운 받을 파일 이름 확보
	            String oriname = request.getParameter("oriname");
	            
	            oriname = new String(oriname.getBytes("UTF8"), "ISO-8859-1");
	            
	            response.reset();
	            response.setHeader("Content-Disposition", "attachment;filename=\""+oriname+"\"");
	            
	            File target = new File(filepath + "/" + sysname);               // 위치와 이름을 결합하여 타겟 파일 인스턴스 생성


	            byte[] fileContents = new byte[(int)target.length()];            // 하드디스크에서 뽑아낸 타겟 파일 내용을 저장할 배열을 준비
	            try(FileInputStream fis = new FileInputStream(target);         
	               DataInputStream dis = new DataInputStream(fis);   
	               ServletOutputStream sos = response.getOutputStream();){
	               dis.readFully(null);
	               sos.write(fileContents);
	               sos.flush();   
			}
		}
			
			// 파일 삭제 servlet - > 수정완료했을떼 실행되도록 해야함. 
			else if (cmd.equals("/delete.file")) {
	           
	                String sysname = request.getParameter("sysname");
	                int result = dao.deleteBySysname(sysname);
	                if (result > 0) {
	                    response.getWriter().write("success");
	                } else {
	                    response.getWriter().write("failure");
	                }
	           
	        }	
			
			
		
		}catch(Exception e) {
			e.printStackTrace();
			response.sendRedirect("/error.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
