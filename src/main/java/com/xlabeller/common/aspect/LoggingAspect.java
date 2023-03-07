package com.xlabeller.common.aspect;

import com.xlabeller.imExport.ImExportService;
import lombok.extern.slf4j.Slf4j;
import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.*;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

@Slf4j
@Aspect
@Component
@EnableAspectJAutoProxy
public class LoggingAspect {
    private static Logger logger = Logger.getLogger(LoggingAspect.class);

    // 관심있는 조인 포인트를 결정, 어드바이스가 실행되는 시점을 제어하기 위해 선언
    // advice를 적용할 메서드 명시
    @Pointcut("execution(* com.xlabeller..*Service.*(..))")
    public void servicePointcut() {
    }

    @Pointcut("execution(* com.xlabeller..*Controller.*(..))")
    public void controllerPointcut() {
    }

    @Pointcut("execution(* com.xlabeller..*Dao.*(..))")
    public void daoPointcut() {
    }

    @Pointcut("within(@org.springframework.stereotype.Repository *)" +
            " || within(@org.springframework.stereotype.Service *)" +
            " || within(@org.springframework.web.bind.annotation.RestController *)")
    public void springBeanPointcut() {
        // Method is empty as this is just a Pointcut, the implementations are in the advices.
    }

    /**
     * 대상 객체의 메서드 실행 전, 후 또는 예외 발생 시점에 공통 기능을 실행
     *
     * @param joinPoint
     * @return
     * @throws Throwable
     *
     */
//    @Around("springBeanPointcut() || servicePointcut() || controllerPointcut() || daoPointcut()")
//    public Object doAround(final ProceedingJoinPoint joinPoint) throws Throwable {
//
//        Object thisObj = joinPoint.getTarget();
//        String className = thisObj.getClass().getName();
//        String classSimpleName = thisObj.getClass().getSimpleName();
//        Object[] args = joinPoint.getArgs();
//        long startTime = System.currentTimeMillis();
//        String type = joinPoint.getSignature().getDeclaringTypeName();
//        String name = "";
//
//        log.info(name);
//        log.info("[ Class Name  ] {} : {}", classSimpleName, className);
//        log.info("[ Method Name ] {} : {}", classSimpleName, joinPoint.getSignature().getName() + "()");
//
//        if (args != null && args.length > 0) {
////            LOG.debug("[ Parameter  ] {} : {}", classSimpleName, argsToJson(((ProceedingJoinPoint) joinPoint).getArgs(), true));
//        }
//
//        Date dt = new Date();
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss.SSS", Locale.KOREAN);
//
//        log.debug("[ Start Time  ] {} : {}", classSimpleName, sdf.format(dt));
//
//        Object obj = joinPoint.proceed();
//
//        long endTime = System.currentTimeMillis();
//        Date dt2 = new Date();
//        SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd, hh:mm:ss.SSS", Locale.KOREAN);
//
//        log.info("[ End Time    ] {} : {}", classSimpleName, sdf2.format(dt2));
//        log.info("[ Execute Time] {} : {}", classSimpleName, (endTime - startTime)/1000.0 + "sec");
//
//        return obj;
//    }

    /**
     * Advice that logs methods throwing exceptions.
     *
     * @param joinPoint join point for advice
     * @param e exception
     */
//    @AfterThrowing(pointcut = "springBeanPointcut() || servicePointcut() || controllerPointcut() || daoPointcut()", throwing = "e")
//    public void logAfterThrowing(JoinPoint joinPoint, Throwable e) {
//        String cause = String.valueOf(e);
//        log.error("Exception in {}.{}() with cause = {}", joinPoint.getSignature().getDeclaringTypeName(),
//                joinPoint.getSignature().getName(), cause);
//    }

    // JoinPoint로 메서드 정보 가져오기
//    private Method getMethod(JoinPoint joinPoint) {
//        MethodSignature signature = (MethodSignature) joinPoint.getSignature();
//        return signature.getMethod();
//    }

}
