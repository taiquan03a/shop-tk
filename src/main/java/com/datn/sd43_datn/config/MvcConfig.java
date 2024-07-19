package com.datn.sd43_datn.config;

import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

public class MvcConfig implements WebMvcConfigurer {
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        exposeDirectory("img",registry);
    }
    public void exposeDirectory(String dirName,ResourceHandlerRegistry registry){
        Path upPath= Paths.get(dirName);
        String upLoadPaths=upPath.toFile().getAbsolutePath();
        if(dirName.startsWith("../")){
            dirName=dirName.replace("../","");

        }
        registry.addResourceHandler("/"+dirName+"/**").addResourceLocations("file:/"+upLoadPaths+"/");
    }
}
