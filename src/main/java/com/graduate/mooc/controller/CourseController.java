package com.graduate.mooc.controller;

import com.alibaba.fastjson.JSONObject;
import com.graduate.mooc.domain.*;
import com.graduate.mooc.entity.Dict;
import com.graduate.mooc.entity.Hoist;
import com.graduate.mooc.mapper.*;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.*;

/**
 * Created by Chao Wax on 2019/3/9
 */
@Controller
@RequestMapping("/course")
public class CourseController {

    @Autowired
    CourseMap cMap;

    @Autowired
    TaskMap tMap;

    @Autowired
    SubjectMap subMap;

    @Autowired
    MatchMap matMap;

    @Autowired
    ChapterMap chMap;

    @Autowired
    StudentMap stuMap;

    //跳转课程详情页面  需要
    @GetMapping("/front")
    public String front(@RequestParam("cour")String cid, HttpSession session){
        session.setAttribute("reqCid",cid);
        session.setAttribute("cRoot",cid); //方便调用teacher已有接口
        return "CoursesInfo";
    }

    /*
    进入courseinfo页面就查询该门课程所有安排(没有结束的)
     */
    @GetMapping("/info")
    @ResponseBody
    public List<Task> query(HttpSession session){
        String cid=(String)session.getAttribute("reqCid");
        System.out.println(tMap.findTaskByCID(cid));
        return tMap.findTaskByCID(cid);
    }

/*
progress点击章节链接过来的  insert learn
 */
    @GetMapping("/study/{chid}")  //习题关联 准备观看视频
    public String study(@PathVariable String chid,HttpSession session){
        String sno = (String)session.getAttribute("suser");
        String taskno = (String)session.getAttribute("myTask");
        System.out.println(sno+" "+taskno);

        Chapter chapter = chMap.findChapterByID(chid);
        session.setAttribute("myChapter",chid);
        //session.setAttribute("myTask",null);

        //匹配随机题目
  //if match  表中当前task里面该名学生没有和该章节的关联则  insert match  需要插入更多题目判断是不是随机的
        System.out.println();
        System.out.println("匹配题目：");
        List<Match> mlist = matMap.findMatchByInfo(stuMap.findStudentByName(sno).getSno(),taskno);
        System.out.println(mlist);
        if(mlist.size()==0) {
            List<Subject> subList = subMap.findSubjectByChid(chid);
            System.out.println("章节所有题目： "+subList);
            System.out.println("一共： "+subList.size());
            Set<Integer> set = new HashSet<Integer>();
            if (subList.size() < 5)
                while (set.size() < 3)
                    set.add(new Random().nextInt(subList.size()) + 1);
            else
                while (set.size() < 5)
                    set.add(new Random().nextInt(subList.size()) + 1);
            //System.out.println(set.size());
            //System.out.println("set 里面有 "+set);
            List<Subject> subRes = new ArrayList<>();
            Iterator<Integer> iterator = set.iterator();
            while(iterator.hasNext()){
                int index=iterator.next();
                //System.out.println(index);
                Subject temp=subList.get(index-1);
                //System.out.println(temp);
                subRes.add(temp);
            }

            System.out.println(sno+" 匹配到的题目是 "+subRes);
            System.out.println(subRes.get(0).getSubno());
            System.out.println(stuMap.findStudentByName(sno).getSno());
            System.out.println(taskno);


            for(Subject s:subRes) {
                Match mat = new Match();
                mat.setSno(stuMap.findStudentByName(sno).getSno());
                mat.setState(-1);
                mat.setTask(tMap.findTaskByTno(taskno)); //task
                mat.setSub(s);
                mat.setChoice("none");
                matMap.insertMatch(mat);
            }
        }
        return "Chapters";
    }

/*
进入chapters 获取视频
 */
    @GetMapping("/getVideo")
    @ResponseBody
    public Map<String,Object> getVideo(@RequestParam("myCh")String myCh, HttpSession session){
        //Chapter ch=(Chapter) session.getAttribute("myChapter");
        System.out.println("video ch "+myCh);
        Chapter ch = chMap.findChapterByID(myCh);
        System.out.println(ch);
        String vPath = ch.getVideo();
        System.out.println(vPath);
        int play=ch.getClick();
        System.out.println(play);
        Map<String,Object> map = new HashMap<>();
        map.put("video",vPath);
        map.put("play",play);
        return map;
    }



    @PostMapping("/play")   //点击播放 chapter 增加播放量   当前学生
    @ResponseBody
    public String play(@RequestParam("myCh")String mych){
        System.out.println(mych);
        int click=chMap.findChapterByID(mych).getClick()+1;
        chMap.click(mych,click);
        System.out.println(chMap.findChapterByID(mych));
        return "success";
    }


    @GetMapping("/getSub")
    @ResponseBody
    public List<Match> getSub(@RequestParam("myCh")String mych){
        System.out.println(mych);
        List<Match> mlist = matMap.getSubject(mych);
        System.out.println(mlist);
        return mlist;
    }




//小程序测试
@RequestMapping(value = "/hidden/uploadPic", method = {RequestMethod.POST, RequestMethod.GET})
@ResponseBody  //@RequestParam(value = "file", required = false) MultipartFile[] multipartFile
public void uploadPicture(Hoist Hoist,HttpServletRequest request) throws IOException {
    System.out.println("start：");
    System.out.println("request：" + request);
    System.out.println(Hoist);
    boolean isMultipart = ServletFileUpload.isMultipartContent(request);
    if(isMultipart){
        MultipartHttpServletRequest mulReq= WebUtils.getNativeRequest(request,MultipartHttpServletRequest.class);
        List<MultipartFile> multipartFile = mulReq.getFiles("file");
        System.out.println("multipartFile：" + multipartFile);
        for (int i = 0; i < multipartFile.size(); i++){
            String originalFirstName = multipartFile.get(i).getOriginalFilename();
            String picFirstName = originalFirstName.substring(0, originalFirstName.indexOf("."));
            //realPath填写电脑文件夹路径
            String realPath = "C:\\WeChatPic";
            //取得图片的格式后缀
            String originalLastName = multipartFile.get(i).getOriginalFilename();
            String picLastName = originalLastName.substring(originalLastName.lastIndexOf("."));
            //格式化时间戳
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
            String nowTime = sdf.format(new Date().getTime());
            //拼接：名字+时间戳+后缀
            String picName = picFirstName + "." + nowTime + picLastName;
            System.out.println("picName：" + picName);
        }
    }
    //对应前端的upload的name参数"file"
   // List<MultipartFile> multipartFile = req.getFiles("file");



    ;
    //裁剪用户id

    System.out.println(Hoist);
}

    @GetMapping("/getEquipById")
    @ResponseBody
    public List<Map<String,Object>> getEquipById(@RequestParam(name = "ID") String ID){
        List<Map<String,Object>> dic = new ArrayList<>();
        Map<String,Object> map = new HashMap<>();
        map.put("ID","1");
        map.put("EQUIP_NUMBER","num1");
        map.put("EQUIP_TYPE","t1");
        dic.add(map);
        Map<String,Object> map2 = new HashMap<>();
        map2.put("ID","11");
        map2.put("EQUIP_NUMBER","num11");
        map2.put("EQUIP_TYPE","t11");
        dic.add(map2);
        return dic;
    }

    @RequestMapping("/getDict")
    @ResponseBody
    public List<Dict> getDict(@RequestParam(name = "TNAME") String TNAME){
        try {
            List<Dict> dic = new ArrayList<>();
            dic.add(new Dict("value1","type1"));
            dic.add(new Dict("value2","type2"));
            dic.add(new Dict("value3","type3"));
            return dic;
        } catch (Exception e) {
            return null;
        }
    }
}
