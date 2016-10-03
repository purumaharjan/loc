package com.project.locksA2Z.server.mail;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
public @interface MailContent {
	public abstract String value(); //value corresponds to velocityTemplate file
	public abstract String from() default "mrsurajpoudel@gmail.com";
	public abstract String subject() default "LocksA2Z Email";
}
