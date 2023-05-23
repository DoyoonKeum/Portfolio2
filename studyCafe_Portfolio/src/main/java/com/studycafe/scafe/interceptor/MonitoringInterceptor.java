package com.studycafe.scafe.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
/* interceptor(인터셉터)
- 특정 url울 요청할 때 컨트롤러로 가는 요청을 가로채     특정 작업을 처리하는 것을 의미한다.
    따라서 컨트롤러가   응답(response)하기  전에 가로채므로
  handler interceptor(핸들러 인터셉터)라고도 한다. 
- 컨트롤러에 들어오는 요청 HttpRequest와   HttpResponse를 가로채는 역할을 한다
- 인터셉터는
    컨트롤러에  요청이  들어가기  전!!!
    컨트롤러에  요청을  수행한    후!!!
    컨트롤러에  요청을  수행하여 view를 보여 준 후!!
- 사용예)
  - spooling : 응답 페이지를 출력하기 전에   서버에서  미리 데이터를 가져오는 기능
  - 요청이 처리되기 전에 파일을 업로드(multipart)하는 기능
  - logging : 각 요청에 대한 상세내역을 기록하는 기능
  - validation : 유효성 검사기능
  - 폼에서 제출(submit)이 중복으로 일어나는 것을 막는 기능        
*/

//logging : 각 요청에 대한 상세내역을 기록하는 기능
/*1.인터셉터 등록
       여기에서는 servlet-context.xml문서에서      인터셉터(클래스)bean 등록
	<!-- 인터셉터(클래스)bean 등록 -->
	<interceptors>
   <!-- <beans:bean class="패키지명.인터셉터클래스명"/> -->
		<beans:bean class="com.mycom.app.interceptor.ExInterceptor"/>
	</interceptors>
	
  2.등록된 인터셉터빈 내용 구현
       여기에서는 HandlerInterceptor인터페이스를 구현하여 진행
  - HandlerInterceptor인터페이스
    preHandle() : 컨트롤러에  요청이  들어가기  전에 호출.false를 리턴하면   이 후의 내용을 실행하지x  	
    postHandle() :컨트롤러에  요청을  처리한  후 호출.컨트롤러에서 예외가 발생하면 더 이상 실행하지x  	
    afterHandle():컨트롤러에  요청을  처리하여 view전송이 종료 된 후 호출  	
 */
public class MonitoringInterceptor implements HandlerInterceptor {
	
	private static final Logger logger = LoggerFactory.getLogger(MonitoringInterceptor.class);
	
	ThreadLocal<StopWatch> stopWatchLocal = new ThreadLocal<StopWatch>(); 
	
	//컨트롤러에  요청이  들어가기  전에 호출되어지면서      요청핸들러(컨트롤러)의 실행을 차단한다.
		/*파라미터 
		  HttpServletRequest- 현재 HTTP 요청
		  HttpServletResponse-현재 HTTP 응답
		  Object handler     -실행 핸들러
		  리턴타입 : boolean - false를 리턴하면   이 후의 내용을 실행하지x*/

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//logger.info("preHandle()호출");
		StopWatch stopWatch = new StopWatch(handler.toString());
		stopWatch.start(handler.toString());
		stopWatchLocal.set(stopWatch);
		
		logger.info("접근경로:"+getURLPath(request));
		logger.info("요청처리 시작 시각:"+getCurrentTime());
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		//logger.info("postHandle()호출");
		logger.info("요청처리 종료 시각:"+getCurrentTime());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		//logger.info("afterCompletion()호출");
		StopWatch stopWatch= stopWatchLocal.get();
		stopWatch.stop(); //타이머종료
		logger.info("요청처리 소요시간:"+stopWatch.getTotalTimeMillis()+"ms");
		stopWatchLocal.set(null);
		logger.info("=======================================");
	}
	
	//접근경로 구하기
	// 요청주소 : http://localhost:8083/app/qwer?ss=12&df=123
	//request.getRequestURI(); : /app/WEB-INF/views/home.jsp
	//request.getQueryString(); : ss=12&df=123
	//쿼리문이 없다면 request.getQueryString(); : null
	private String getURLPath(HttpServletRequest request) {
		String currentPath = request.getRequestURI();
		String queryS = request.getQueryString();
		queryS = queryS==null ? "" : "?"+queryS;
		return currentPath+queryS;
	}
	
	//현재 시스템의 시간 구하기
	private String getCurrentTime() {
		//현재 시간
		//Date today = new Date();
		Calendar today = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		today.setTimeInMillis( System.currentTimeMillis()  );
		//현재 시간에 날짜시간패턴입히기
		return df.format(today.getTime());
	}
	
	

}
