package com.cn.great.util;

import org.apache.commons.lang3.time.DateFormatUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;

/**
 * 日期工具类, 继承org.apache.commons.lang.time.DateUtils类
 * @author ThinkGem
 * @version 2014-4-15
 */
@SuppressWarnings({"ALL", "AliAccessToNonThreadSafeStaticFieldFromInstance"})
public class DateUtils extends org.apache.commons.lang3.time.DateUtils {
	public static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	public static  SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	/**
	 * yyyy-MM-dd HH:mm:ss
	 */
	public static final String DATE_PATTERN_S = "yyyy-MM-dd HH:mm:ss";
	private static String[] parsePatterns = {
		"yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", "yyyy-MM", 
		"yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm", "yyyy/MM",
		"yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm", "yyyy.MM"};

	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd）
	 */
	public static String getDate() {
		return getDate("yyyy-MM-dd");
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getCurrentTime() {
		return getDate("HH:mm:ss");
	}

	public static String getCurrentTime(String pattern) {
		return DateFormatUtils.format(System.currentTimeMillis(), pattern);
	}

	/**
	 * 时间戳转换成时间 yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String timeStampCheckDate(long  date){
		
		return DateFormatUtils.format(new Date(Long.parseLong(String.valueOf(date * 1000))), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 时间戳转换成时间 yyyy-MM-dd HH:mm:ss
	 * @return
	 */
	public static String timeStampCheckDate(Long  date){

		return DateFormatUtils.format(new Date(Long.parseLong(String.valueOf(date * 1000))), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 时间戳转换成时间 yyyy-MM-dd
	 * @return
	 */
	public static String timeStampCheckDates(Long  date){

		return DateFormatUtils.format(new Date(Long.parseLong(String.valueOf(date * 1000))), "yyyy-MM-dd");
	}

	/**
	 * 时间戳转换成时间  HH:mm:ss"
	 * @return
	 */
	public static String gethhmmss(Long  date){

		return DateFormatUtils.format(new Date(Long.parseLong(String.valueOf(date * 1000))), "HH:mm:ss");
	}

	/**
	 * 时间转时间戳
	 * @throws ParseException 
	 */
	@SuppressWarnings("AliAccessToNonThreadSafeStaticFieldFromInstance")
    public static long  dateCheckTimeStamp(String date){
		long res=0;
		try{
			Date date2 = parseDate(date, parsePatterns);
			res=date2.getTime();
		}catch (ParseException e ){
			e.printStackTrace();
		}
		return res;
	}


	/**
	 * 时间转时间戳
	 * @throws ParseException
	 */
	public static long  dateCheckTimeStamps(String date) throws ParseException{
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date2 = format.parse(date);
		return date2.getTime()/1000;
	}
	
	/**
	 * 得到当前日期字符串 格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String getDate(String pattern) {
		return DateFormatUtils.format(new Date(), pattern);
	}
	
	/**
	 * 得到日期字符串 默认格式（yyyy-MM-dd） pattern可以为："yyyy-MM-dd" "HH:mm:ss" "E"
	 */
	public static String formatDate(Date date, Object... pattern) {
		String formatDate = null;
		if (pattern != null && pattern.length > 0) {
			formatDate = DateFormatUtils.format(date, pattern[0].toString());
		} else {
			formatDate = DateFormatUtils.format(date, "yyyy-MM-dd");
		}
		return formatDate;
	}
	
	/**
	 * 得到日期时间字符串，转换格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String formatDateTime(Date date) {
		return formatDate(date, "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前时间字符串 格式（HH:mm:ss）
	 */
	public static String getTime() {
		return formatDate(new Date(), "HH:mm:ss");
	}

	/**
	 * 得到当前日期和时间字符串 格式（yyyy-MM-dd HH:mm:ss）
	 */
	public static String getDateTime() {
		return formatDate(new Date(), "yyyy-MM-dd HH:mm:ss");
	}

	/**
	 * 得到当前年份字符串 格式（yyyy）
	 */
	public static String getYear() {
		return formatDate(new Date(), "yyyy");
	}

	/**
	 * 得到当前月份字符串 格式（MM）
	 */
	public static String getMonth() {
		return formatDate(new Date(), "MM");
	}

	/**
	 * 得到当天字符串 格式（dd）
	 */
	public static String getDay() {
		return formatDate(new Date(), "dd");
	}

	/**
	 * 得到当前星期字符串 格式（E）星期几
	 */
	public static String getWeek() {
		return formatDate(new Date(), "E");
	}
	
	/**
	 * 日期型字符串转化为日期 格式
	 * { "yyyy-MM-dd", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd HH:mm", 
	 *   "yyyy/MM/dd", "yyyy/MM/dd HH:mm:ss", "yyyy/MM/dd HH:mm",
	 *   "yyyy.MM.dd", "yyyy.MM.dd HH:mm:ss", "yyyy.MM.dd HH:mm" }
	 */
	public static Date parseDate(Object str) {
		if (str == null){
			return null;
		}
		try {
			return parseDate(str.toString(), parsePatterns);
		} catch (ParseException e) {
			return null;
		}
	}

	/**
	 * 获取过去的天数
	 * @param date
	 * @return
	 */
	public static long pastDays(Date date) {
		long t = System.currentTimeMillis()-date.getTime();
		return t/(24*60*60*1000);
	}

	/**
	 * 获取过去的小时
	 * @param date
	 * @return
	 */
	public static long pastHour(Date date) {
		long t = System.currentTimeMillis()-date.getTime();
		return t/(60*60*1000);
	}
	
	/**
	 * 获取过去的分钟
	 * @param date
	 * @return
	 */
	public static long pastMinutes(Date date) {
		long t = System.currentTimeMillis()-date.getTime();
		return t/(60*1000);
	}
	
	/**
	 * 转换为时间（天,时:分:秒.毫秒）
	 * @param timeMillis
	 * @return
	 */
    public static String formatDateTime(long timeMillis){
		long day = timeMillis/(24*60*60*1000);
		long hour = (timeMillis/(60*60*1000)-day*24);
		long min = ((timeMillis/(60*1000))-day*24*60-hour*60);
		long s = (timeMillis/1000-day*24*60*60-hour*60*60-min*60);
		long sss = (timeMillis-day*24*60*60*1000-hour*60*60*1000-min*60*1000-s*1000);
		return (day>0?day+",":"")+hour+":"+min+":"+s+"."+sss;
    }
	
	/**
	 * 获取两个日期之间的天数
	 * 
	 * @param before
	 * @param after
	 * @return
	 */
	public static long getDistanceOfTwoDate(Date before, Date after) {
		long beforeTime = before.getTime();
		long afterTime = after.getTime();
		return (afterTime - beforeTime) / (1000 * 60 * 60 * 24);
	}

	public static String getTodays() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   0);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd HH:mm:ss").format(cal.getTime());
		return yesterday;
	}

	public static String getToday() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   0);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd").format(cal.getTime());
		return yesterday;
	}

	public static String getTodayForTimingTask() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   0);
		String yesterday = new SimpleDateFormat( "yyyyMMdd").format(cal.getTime());
		return yesterday;
	}

	public static String getTomorrowForTimingTask() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   1);
		String yesterday = new SimpleDateFormat( "yyyyMMdd").format(cal.getTime());
		return yesterday;
	}


	public static String getTomorrow() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   1);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd").format(cal.getTime());
		return yesterday;
	}

	public static String getYesterday() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -1);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return yesterday;
	}
    //获取三天之前的日期
	public static String getThreeDaysAgo() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -3);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return yesterday;
	}
    //获取一周之前的日期
	public static String getSevenDaysAgo() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -7);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return yesterday;
	}

	public static String getTenDaysAgo() {
		Calendar   cal   =   Calendar.getInstance();
		cal.add(Calendar.DATE,   -10);
		String yesterday = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return yesterday;
	}

	//获取一周之前的日期
	public static String getMonthAgo(){
		Calendar   cal   =   Calendar.getInstance();
		cal.setTime(new Date());
		cal.add(Calendar.MONTH, -1);
		Date m = cal.getTime();
		String mon = new SimpleDateFormat( "yyyy-MM-dd ").format(cal.getTime());
		return mon;
	}

	public static String getTomorrow(Date date) {
		Calendar   cal   =   Calendar.getInstance();
		cal.setTime(date);
		int day = cal.get(Calendar.DATE);
		cal.set(Calendar.DATE,day+1);
		String dayAfter=new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		return dayAfter;
	}

	/**
	 * 将Date转换String
	 * @param date
	 * @param pattern 日期格式yyyy-MM-dd HH:mm:ss
	 * @return String
	 */
	public static String format(Date date,String pattern) {
		String dateStr = null;
		if (date == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		sdf.setTimeZone(TimeZone.getTimeZone("GMT+8"));
		dateStr = sdf.format(date);
		return dateStr;
	}

	public static Date format(String dateStr) {
		Date date = null;
		if (dateStr == null || "".equals(dateStr.trim())) {
			return date;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN_S);

		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {
			date = null;
		}
		return date;
	}

	/**
	 * 美东时间转中国时间
	 * @param usaDate
	 * @return
	 */
	public static Date toChinaDate(Date usaDate){
		Calendar calDateA = Calendar.getInstance();
		calDateA.setTime(usaDate);
		calDateA.add(Calendar.HOUR, 12);
		return calDateA.getTime();
	}

	/**
	 * 根据日期模式，返回需要的日期对象
	 *
	 * @param date
	 * @param pattern
	 * @return String
	 */
	public static String convert2Str(Date date, String pattern) {
		String dateStr = null;
		if (date == null) {
			return null;
		}
		SimpleDateFormat sdf = new SimpleDateFormat(pattern);
		dateStr = sdf.format(date);
		return dateStr;
	}

	/**
	 * 获取美东时间
	 * @param chinaDate
	 * @return
	 */
	public static Date getDateByUsa(Date chinaDate){
		Calendar calDateA = Calendar.getInstance();
		calDateA.setTime(chinaDate);
		calDateA.add(Calendar.HOUR, -12);
		return calDateA.getTime();
	}

	public static boolean getTimeDifference(Long endTime){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d HH:mm:ss");
		String s = DateUtils.timeStampCheckDate(endTime);
		String nowTime = DateUtils.getDateTime();
		Date start = null;
		Date end=null;
		try {
			start = sdf.parse(nowTime);
			end = sdf.parse(s);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		long cha =  start.getTime()-end.getTime();
		double result = cha * 1.0 / (1000 * 60 * 60);
		if(result>=24){
			return false; //说明小于24小时
		}else{
			return true;
		}
	}
}
