package com.bb.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice {
	
	@Before("PointcutCommon.aPointcut()")
	public void printLog(JoinPoint jp) {
		String methodName=jp.getSignature().getName(); // 현재 수행중인 포인트컷(핵심로직,CRUD)의 메서드명
		Object[] args=jp.getArgs(); // 현재 수행중인 포인트컷(핵심로직,CRUD)이 사용하는 인자들의 정보
		
		System.out.println("수행중인 핵심메서드명: "+methodName);
		System.out.println("========사용하는 인자========");
		for(Object v:args) {
			System.out.println(v);
		}
		System.out.println("=========================");
	}
}