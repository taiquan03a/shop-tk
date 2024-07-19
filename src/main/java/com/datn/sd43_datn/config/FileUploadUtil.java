package com.datn.sd43_datn.config;

import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

public class FileUploadUtil {
    public static void saveFile(String uploadDir, String fileName, MultipartFile multipartFile)throws Exception{
        Path upLoadPath= Paths.get(uploadDir);
        if(!Files.exists(upLoadPath)){
            Files.createDirectories(upLoadPath);
        }
        try(InputStream inputStream=multipartFile.getInputStream()) {
            Path filePath=upLoadPath.resolve(fileName);
            Files.copy(inputStream,filePath, StandardCopyOption.REPLACE_EXISTING);
        }
        catch (Exception e ){
            throw  new Exception("Lưu file thất bại"+fileName,e);
        }
    }
}