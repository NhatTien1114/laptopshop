package vn.hoidanit.laptopshop.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.ServletContext;

@Service
public class UpLoadFileService {
    private ServletContext servletContext;

    public UpLoadFileService(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    public String handleUpLoadFile(MultipartFile file, String subFolder) {
        if (file.isEmpty()) {
            return "";
        }
        String rootPath = this.servletContext.getRealPath("/resources/image");
        String finalName = "";
        try {
            byte[] avatarBytes = file.getBytes();
            File dir = new File(rootPath + File.separator + subFolder);
            if (!dir.exists()) {
                dir.mkdirs();
            }

            finalName = System.currentTimeMillis() + "-" + file.getOriginalFilename();
            File servletFile = new File(dir.getAbsoluteFile() + File.separator + finalName);
            BufferedOutputStream outputStream = new BufferedOutputStream(new FileOutputStream(servletFile));
            outputStream.write(avatarBytes);
            outputStream.flush();
            outputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return finalName;
    }
}
