package com.buptsse.spm.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


import com.buptsse.spm.domain.Schedule;
import com.buptsse.spm.domain.SpChapter;
import com.buptsse.spm.domain.SpChapterVideo;
import com.buptsse.spm.domain.User;
import com.buptsse.spm.service.IScheduleService;
import com.buptsse.spm.service.ISpChapterService;
import com.buptsse.spm.service.ISpChapterVideoService;

import com.opensymphony.xwork2.ActionSupport;


/**
 * @author BUPT-TC
 * @date 2015年11月26日 下午4:17
 * @description 实现视频相关功能 
 * @modify BUPT-TC
 * @modifyDate 
 */
public class SpChapterAction extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private static Logger LOG = LoggerFactory.getLogger(SpChapterAction.class);
	@Resource
	private ISpChapterService spChapterService;
	
	@Resource
	private ISpChapterVideoService spChapterVideoService;	
	
	@Resource
	private IScheduleService scheduleService;
	
	public List spChapterList = new ArrayList();
	
	public List spChapterVideoList = new ArrayList();
	
	public List scheduleList = new ArrayList();	
	//public String [] Name;
	//public String a = "拉拉拉";
	
	public SpChapter spChapter;
	
	public SpChapterVideo spChapterVideo;
	
	public String spChapterName="";
	
	public int videoSize;
	
	public int totalSchedule;//总学习进度
	
	public List chapterScheduleList =  new ArrayList(); ;//章节进度



	/**
	 * 查找所有的视频
	 * @return
	 * @throws Exception
	 */
	public String findSpChapterList() throws Exception{
		
		
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		spChapterList = spChapterService.findSpChapterDetial();
		
		int averageTotal=0;
		//for(SpChapter spChapter:spChapterList){
		//Name = new String[spChapterList.size()];
		for(int i=0;i<spChapterList.size();i++){	
			//SpChapter spChapter = (SpChapter)spChapterList.get(i);
			Object[] spchapter = (Object[])spChapterList.get(i);
			//Name[i]=spchapter[2].toString();
			int sumValueTotal=0;
			int k=0;
			List<Schedule> scheduleListtmp = scheduleService.findScheduleByUserIdAndChapterId(Integer.parseInt(spchapter[0].toString()), user.getUserId());
			for(Schedule schedule:scheduleListtmp){
				sumValueTotal+=schedule.getPercent();
				k++;
			}
			if(k!=0){
			averageTotal+=sumValueTotal/k;
			//存入章节进度
			chapterScheduleList.add(sumValueTotal/k);
		}else{
			chapterScheduleList.add(0);
		}
				
		}
		
		//总进度赋值
		totalSchedule = averageTotal/17;
		
		
		
		return "success";
	}	
	
	
	/**
	 * 查询章节细节
	 * @return
	 * @throws Exception
	 */
	public String findSpChapter() throws Exception{
		
		User user = (User)ServletActionContext.getRequest().getSession().getAttribute("user");
		System.out.println(spChapter.getChapter_id());
		spChapterVideoList = spChapterVideoService.findSpChapterVideoByChapterId(spChapter.getChapter_id());
		String a = new String(spChapter.getChapter_name().getBytes("iso-8859-1"),"utf-8"); 
		spChapterName = "第"+spChapter.getChapter_id()+"章 "+a;
		
		videoSize = spChapterVideoList.size();
		System.out.println("*****SpChapterList******:"+spChapter.getChapter_name());
		//获取进度
		scheduleList = scheduleService.findScheduleByUserIdAndChapterId(spChapter.getChapter_id(), user.getUserId());
		
		
		return "success";
	}		
	
	

	
	
	public ISpChapterService getSpChapterService() {
		return spChapterService;
	}


	public void setSpChapterService(ISpChapterService spChapterService) {
		this.spChapterService = spChapterService;
	}


	public SpChapter getSpChapter() {
		return spChapter;
	}

	public void setSpChapter(SpChapter spChapter) {
		this.spChapter = spChapter;
	}
	
	
	public ISpChapterVideoService getSpChapterVideoService() {
		return spChapterVideoService;
	}

	public void setSpChapterVideoService(
			ISpChapterVideoService spChapterVideoService) {
		spChapterVideoService = spChapterVideoService;
	}
	
	public SpChapterVideo getSpChapterVideo() {
		return spChapterVideo;
	}


	public void setSpChapterVideo(SpChapterVideo spChapterVideo) {
		this.spChapterVideo = spChapterVideo;
	}
	
	public List getSpChapterVideoList() {
		return spChapterVideoList;
	}


	public void setSpChapterVideoList(List spChapterVideoList) {
		this.spChapterVideoList = spChapterVideoList;
	}


	public String getSpChapterName() {
		return spChapterName;
	}


	public void setSpChapterName(String spChapterName) {
		this.spChapterName = spChapterName;
	}


	public int getVideoSize() {
		return videoSize;
	}


	public void setVideoSize(int videoSize) {
		this.videoSize = videoSize;
	}


	public IScheduleService getScheduleService() {
		return scheduleService;
	}


	public void setScheduleService(IScheduleService scheduleService) {
		this.scheduleService = scheduleService;
	}


	public List getScheduleList() {
		return scheduleList;
	}


	public void setScheduleList(List scheduleList) {
		scheduleList = scheduleList;
	}


	public int getTotalSchedule() {
		return totalSchedule;
	}


	public void setTotalSchedule(int totalSchedule) {
		this.totalSchedule = totalSchedule;
	}



	public List getChapterScheduleList() {
		return chapterScheduleList;
	}


	public void setChapterScheduleList(List chapterScheduleList) {
		this.chapterScheduleList = chapterScheduleList;
	}


	public List getSpChapterList() {
		return spChapterList;
	}


	public void setSpChapterList(List spChapterList) {
		this.spChapterList = spChapterList;
	}

	
	
	
}
