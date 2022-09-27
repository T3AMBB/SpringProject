package com.bb.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterThrowingAdvice {
	
	@AfterThrowing(pointcut="PointcutCommon.aPointcut()", throwing="exceptObj")
	public void printLogAfterThrowing(JoinPoint jp,Exception exceptObj) {
		String methodName=jp.getSignature().getName();
		Object[] args=jp.getArgs();
		
		System.out.println("수행중인 핵심메서드명: "+methodName);
		System.out.println("사용하는 인자");
		System.out.println("=====");
		for(Object v:args) {
			System.out.println(v);
		}
		System.out.println("=====");
				
		System.out.println("발생한 예외: "+exceptObj.getMessage());
		if(exceptObj instanceof Exception) {
			System.out.println("예외가 발생했습니다...");
		}
		else {
			System.out.println("확인되지않은 에러가 발생했습니다!!!");
		}
	}
}