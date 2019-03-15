package com.graduate.mooc.controller;

import com.graduate.mooc.domain.Chapter;
import com.graduate.mooc.domain.Course;
import com.graduate.mooc.domain.Teacher;
import com.graduate.mooc.mapper.ChapterMap;
import com.graduate.mooc.mapper.CourseMap;
import com.graduate.mooc.mapper.TeacherMap;
import com.graduate.mooc.service.CouServ;
import com.graduate.mooc.service.TeaServ;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
public class TeaController {
    @Autowired
    CouServ cs;
    @Autowired
    CourseMap coum;
    @Autowired
    TeacherMap team;
    @Autowired
    TeaServ ts;
    @Autowired
    LoadTool lt;
    /*
    课程相关
     */
    // teacher's courses
    @RequestMapping(value="/Cou",method = RequestMethod.GET)
    public String Cou(HttpSession session,ModelMap model)
    {
        String user=(String)session.getAttribute("tuser");
        List<Course> clist=cs.findCourseByTid(user);
        model.addAttribute("clist",clist);
        return "T_course";
    }

    @RequestMapping(value="/addCou",method = RequestMethod.POST)
    public String addCou(Course c,HttpSession session){
        String tname=(String)session.getAttribute("tuser");
        String tid=ts.findIDByName(tname);
        c.setTid(tid);
        System.out.println(c);
        coum.insertCourse(c);
        System.out.println("inserted one course "+c);
        return "redirect:/Cou";
    }
//批量课程上传  需要在前端添加课程描述的内容
    @RequestMapping(value="/insertCou",method = RequestMethod.POST)  //文件上传、发布
    public String addfexp(@RequestParam("coufile") MultipartFile file, HttpSession session) throws IOException {
        String tname=(String)session.getAttribute("tuser");
        String tid=ts.findIDByName(tname);

        List<String[][]> list=lt.inject(file);
        System.out.println(list);
        for(String[][] s:list) {                    //课程必要 课程名、课时、课程图片的后缀
            for (int i = 0; i < s.length; i++) {  //课程图片设置前缀，excel需要自己输入图片名称和后缀 上传到服务器目录
                Course c = new Course();
                c.setCname(s[i][0]);
                c.setDuring(Integer.parseInt(s[i][1]));
                c.setTid(tid);
                coum.insertCourse(c);
            }
        }
        return "redirect:Cou";
    }

    @RequestMapping(value="/edCou/{cid}",method = RequestMethod.GET)
    public String edit(@PathVariable String cid,HttpSession session){
        session.setAttribute("edcou",cid);
        return "redirect:/Cou";
    }

    @RequestMapping(value="/upCou",method = RequestMethod.POST)
    public String update(Course c,HttpSession session){
        String tname=(String)session.getAttribute("tuser");
        String tid=ts.findIDByName(tname);
        c.setTid(tid);
        System.out.println(c);
        coum.update(c);
        session.setAttribute("edcou",null);
        return "redirect:Cou";
    }

    /*
    章节相关
     */
    @Autowired
    ChapterMap chm;
    //find chapters by cid
    @RequestMapping(value="/chapter/{cid}",method = RequestMethod.GET)
    public String chapter(@PathVariable String cid,ModelMap model,HttpSession session){
        session.setAttribute("cRoot",cid);  //记录从哪门课程点进来的
        return "T_chapter";
    }

    @RequestMapping(value="/qchapter",method = RequestMethod.GET)  //ajax query list
    @ResponseBody
    public List<Chapter> qchapter(HttpSession session){
        String cid=(String)session.getAttribute("cRoot");
        List<Chapter> chlist = chm.findChapterByCID(cid);
        System.out.println(chlist);
        return chlist;
    }

    @RequestMapping(value="/addChap",method = RequestMethod.POST)
    public String addChap(Chapter c,HttpSession session){
        System.out.println("inserted one course "+c);
        chm.insertChapter(c);
        String cid=(String)session.getAttribute("cRoot");
        return "redirect:/chapter/"+cid;
    }

    @RequestMapping(value="/insertChap",method = RequestMethod.POST)  //文件上传、发布
    public String addchap(@RequestParam("chfile") MultipartFile file, HttpSession session) throws IOException {
        String cid=(String)session.getAttribute("cRoot");
        List<String[][]> list=lt.inject(file);
        for(String[][] s:list) {
            for (int i = 0; i < s.length; i++) {
                Chapter ch = new Chapter();
                ch.setChname(s[i][0]); //第一列放章节名称
                ch.setCid(cid);
                ch.setExstate(0);   //默认不是考试，考试需要教师自己去改
                ch.setVideo("");   //因为mybatis认为这样才是空
                chm.insertChapter(ch);
            }
        }
        return "redirect:/chapter/"+cid;
    }

//还是要借用控件选择文件  上传章节视频
    @RequestMapping(value = "/upvideo/{chid}",method = RequestMethod.POST)//上传视频
    public String upvideo(@PathVariable String chid,@RequestParam("chFile") MultipartFile file, HttpSession session){
        System.out.println(chid);
        System.out.println("将要上传");
        String cid=(String)session.getAttribute("cRoot");
        String tname=(String)session.getAttribute("tuser");
        String path=tname+"\\"+cid+"\\"+chid+"_video\\";
        lt.upload(path,file);
        Chapter ch = chm.findChapterByID(chid);
        path+=file.getOriginalFilename();
        System.out.println(path);
        chm.update(chid,ch.getChname(),path,ch.getExstate()); //数据库中path存相对server的路径
        return "redirect:/chapter/"+cid;
    }


    @RequestMapping(value="/delch",method = RequestMethod.GET)  //删除章节
    public String delchap(@RequestParam("ch") String chid, HttpSession session)  {
        System.out.println(chid);
        chm.delete(chid);
        System.out.println("删除了");
        String cid=(String)session.getAttribute("cRoot");
        return "redirect:/chapter/"+cid;
    }

    @RequestMapping(value = "/upch",method = RequestMethod.POST)  //编辑更新章节
    public void upchap(@RequestParam("id")String id,@RequestParam("name")String name,
                       @RequestParam("vid")String vid,@RequestParam("ex")int ex,
                       HttpServletResponse response) throws IOException {

        System.out.println("upchapter "+name);
        chm.update(id,name,vid,ex);
        System.out.println("更新了"+chm.findChapterByName(name));
        response.getWriter().print("更新成功");  //requestmapping如果不返回些东西的话会默认返回value名作为视图 容易报错
    }

    /*
    题库相关
     */
    @GetMapping("/addSub")  //添加题目
    public String assSub(){
        return "T_subject";
    }

    @GetMapping("/subject") //查询一个章节的题库
    public String subject(@RequestParam("chsub")String chid){
        return "";
    }
}
