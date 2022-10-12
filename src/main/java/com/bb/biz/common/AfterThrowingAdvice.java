package com.bb.biz.common;

import java.sql.SQLException;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {
	
	@AfterThrowing(pointcut="PointcutCommon.aPointcut()", throwing="exceptObj")
	public void printLogAfterThrowing(JoinPoint jp,Exception exceptObj) {
		
		System.out.println("발생한 예외: "+exceptObj.getMessage());
		
		if(exceptObj instanceof IllegalArgumentException) {
			System.out.println("올바르지않은 인자값을 사용했습니다...");
		}
		else if(exceptObj instanceof NullPointerException) {
			System.out.println("null을 가지고 있는 객체/변수를 호출했습니다...");
		}
		else if(exceptObj instanceof SQLException) {
			System.out.println("SQL 에러입니다... ");
		}
		else if(exceptObj instanceof NumberFormatException) {
			System.out.println("숫자 형식이 아닌 값을 사용했습니다...");
		}
		else if(exceptObj instanceof Exception) {
			System.out.println("예외가 발생했습니다...");
		}
		else {
			System.out.println("확인되지않은 에러가 발생했습니다!!!");
		}
	}
}