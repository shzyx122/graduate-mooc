package com.graduate.mooc.controller;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@Component
public class LoadTool {

    public String staticRes(String path,MultipartFile file,String name){ //设置静态资源路径
        System.out.println("上传静态资源");
        String dir="D:\\IDEAworkspace\\mooc\\src\\main\\resources\\static\\"+path+"\\";
        return this.trans(dir,file,name);
    }

    private String trans(String dir , MultipartFile file,String name){ //创建目录并上传
        File f=new File(dir);
        if(!f.exists()){
            f.mkdirs();
            System.out.println("创建"+dir);
        }
        System.out.println("创建目录"+dir);
        System.out.println("原文件名file="+file.getOriginalFilename());

        String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String filename=file.getName()+suffix;   //表单file控件的name属性值
        System.out.println("文件本体-----"+filename);
//HttpServletRequest request.session.getServletContext.getRealPath(服务器文件上传的路径前缀)
        //配置文件中 img.location = /img  然后bean中的属性上面 @Value("${img.location}") 配置文件里面默认是target里面的xxxxsnapshot下
        System.out.println(name+suffix);
        File serverFile=new File(dir+name+suffix);//file.getOriginalFilename());
        try {
            file.transferTo(serverFile);  //把内容塞进去
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("上传失败");
        }
        System.out.println("上传成功");
        return name+suffix;
    }


    public void upload(String path,MultipartFile file){
        System.out.println("上传文件");
        String dir="D:\\backup_for_mooc\\server\\"+path;
        File f=new File(dir);
        if(!f.exists()){
            f.mkdirs();
            System.out.println("创建"+dir);
        }
        System.out.println(dir);
        System.out.println("file="+file.getOriginalFilename());  //物理文件名

        String suffix=file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String filename=file.getName()+suffix;   //表单file控件的name属性值
        System.out.println("-----"+filename);

        File serverFile=new File(dir+file.getOriginalFilename());
        try {
            file.transferTo(serverFile);  //把内容塞进去
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("上传失败");
        }
        System.out.println("上传成功");

    }

    public List<String[][]> inject(MultipartFile file) throws IOException{
        System.out.println("批量导入");
        InputStream is = file.getInputStream();
        XSSFWorkbook workbook = new XSSFWorkbook(is);
        int sheetNum = workbook.getNumberOfSheets();
        System.out.println("sheet "+sheetNum);
        List<String[][]> datalist = new ArrayList<String[][]>();

        for(int index = 0;index<sheetNum;index++){
            XSSFSheet sheet = workbook.getSheetAt(index);
            if(sheet==null){ //空页跳过
                continue;
            }

            int rownum=sheet.getPhysicalNumberOfRows();  //当前页行数
            if(rownum==0)  //当页无数据
                continue;
            System.out.println("row "+rownum);
            int col=sheet.getRow(0).getPhysicalNumberOfCells();
            System.out.println("col "+col);
            String[][] shResult=new String[rownum][col];

            for(int rowIndex=0;rowIndex<rownum;rowIndex++){
                XSSFRow curow=sheet.getRow(rowIndex); //当前行对象
                if(curow==null){
                    continue;
                }
                int colnum=curow.getPhysicalNumberOfCells(); // 当前行的列数

                for(int cellIndex=0;cellIndex<colnum;cellIndex++){
                    XSSFCell data = curow.getCell(cellIndex);
                    data.setCellType(1);
                    String value=data.getStringCellValue();
                    shResult[rowIndex][cellIndex]=value;
                }
            }
            datalist.add(shResult);
        }
        is.close();
        return datalist;
    }

}
