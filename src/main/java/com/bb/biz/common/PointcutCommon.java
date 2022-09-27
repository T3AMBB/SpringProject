package com.bb.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
	@Pointcut("execution(* com.bb.biz..*Impl.*(..))")
	public void aPointcut() {}
	@Pointcut("execution(* com.bb.biz..*Impl.select*(..))")
	public void bPointcut() {}
}