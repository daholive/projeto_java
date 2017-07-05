package br.com.casadocodigo.loja.infra;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	@Autowired
	private HttpServletRequest request;
	
	public String write(String baseFolder, MultipartFile file){
		
		try{
			String realPath = request.getServletContext().getRealPath("/"+baseFolder);
			String path = realPath + "/" + file.getOriginalFilename();
			file.transferTo(new File(path));
			System.out.println(realPath);
			/*String realPath = request.getServletContext().getRealPath("/" + baseFolder);

            File temp_file = new File(file.getOriginalFilename());
            String path = realPath + "\\" + temp_file.getName();
            
            System.out.println(path);

            file.transferTo(new File(path));*/

			return realPath;
		} catch (IllegalStateException | IOException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public String contexto(){
		
		String context = request.getServletContext().getRealPath("").replace("casadocodigo", "");

		return context;
	}
}
