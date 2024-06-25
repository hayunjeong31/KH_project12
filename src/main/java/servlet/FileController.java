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
//				int maxSize = 1024 * 1024 *10; //1024byte=1kbyte 1mbyte*10 =  10mbyte제한
//				String realPath = request.getServletContext().getRealPath("files");// 파일이 저장될 위치 . 주소값 문자열
//				File uploadPath = new File(realPath); // 저장 위치 폴더를 파일인스턴스로 생성해준다. 
//				if(!uploadPath.exists()) { //존재하지 않는다면
//					uploadPath.mkdir(); //make a directory 폴더생성
//				} 
//				MultipartRequest multi = new MultipartRequest(request,realPath,maxSize, "UTF8",new DefaultFileRenamePolicy());
//				
//				// 첨부파일 업로드 여러개 한거 받을 때 
//				Enumeration<String> names = multi.getFileNames();
//				while(names.hasMoreElements()) {
//					String name = names.nextElement();
//					String oriname = multi.getOriginalFileName(name);
//					String sysname = multi.getFilesystemName(name);
//					if(oriname!=null) {dao.insert(new FilesDTO(0, oriname, sysname, 0));}
//				}
//				
//				response.sendRedirect("/index.jsp");
//			
				
			
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
