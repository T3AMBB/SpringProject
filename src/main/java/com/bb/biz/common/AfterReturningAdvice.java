package com.bb.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class AfterReturningAdvice {
	
	@AfterReturning(pointcut="PointcutCommon.bPointcut()", returning="returnObj")
	public void printLogAfterReturning(JoinPoint jp,Object returnObj) {

		System.out.println("핵심메서드의 반환값: "+returnObj);
	}
}