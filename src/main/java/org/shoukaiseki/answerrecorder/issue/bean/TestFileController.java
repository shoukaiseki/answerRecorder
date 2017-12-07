package org.shoukaiseki.answerrecorder.issue.bean;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import java.io.*;

@Controller()
@RequestMapping ( "/testupload" )
public class TestFileController {


    @RequestMapping("/fileUploadMultiple")
    public String fileUploadMul(@RequestParam("updateFiles") CommonsMultipartFile[] files,  ModelMap model){
        long startTime=System.currentTimeMillis();   //获取开始时间
        for (CommonsMultipartFile file:files){
            if(!file.isEmpty()){
                try {
                    //定义输出流 将文件保存在D盘    file.getOriginalFilename()为获得文件的名字
                    FileOutputStream os = new FileOutputStream("C:/ctemp/"+System.currentTimeMillis()+file.getOriginalFilename());
                    InputStream in = file.getInputStream();
                    int b = 0;
                    while((b=in.read())!=-1){ //读取文件
                        os.write(b);
                    }
                    os.flush(); //关闭流
                    in.close();
                    os.close();
                    model.addAttribute("msg","上传成功");

                } catch (FileNotFoundException e) {
                    e.printStackTrace();
                    model.addAttribute("msg","上传失败");
                } catch (IOException e) {
                    e.printStackTrace();
                    model.addAttribute("msg","上传失败");
                }
            }
        }
        long endTime=System.currentTimeMillis(); //获取结束时间
        System.out.println("上传文件共使用时间："+(endTime-startTime));
        return "testupload/success";
    }

    @RequestMapping("/fileUpload")
    public String fileUpload(@RequestParam("file") CommonsMultipartFile file,  ModelMap model){
        long startTime=System.currentTimeMillis();   //获取开始时间
        if(!file.isEmpty()){
            try {
                //定义输出流 将文件保存在D盘    file.getOriginalFilename()为获得文件的名字
                FileOutputStream os = new FileOutputStream("C:/ctemp/"+System.currentTimeMillis()+file.getOriginalFilename());
                InputStream in = file.getInputStream();
                int b = 0;
                while((b=in.read())!=-1){ //读取文件
                    os.write(b);
                }
                os.flush(); //关闭流
                in.close();
                os.close();
                model.addAttribute("msg","上传成功");

            } catch (FileNotFoundException e) {
                e.printStackTrace();
                model.addAttribute("msg","上传失败");
            } catch (IOException e) {
                e.printStackTrace();
                model.addAttribute("msg","上传失败");
            }
        }
        long endTime=System.currentTimeMillis(); //获取结束时间
        System.out.println("上传文件共使用时间："+(endTime-startTime));
        return "testupload/success";
    }
}
