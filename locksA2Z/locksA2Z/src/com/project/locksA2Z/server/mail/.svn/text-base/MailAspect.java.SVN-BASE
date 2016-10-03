package com.project.locksA2Z.server.mail;

import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;

//TODO Class
@Aspect
public class MailAspect {

	private JavaMailSender mailSender;
	@SuppressWarnings("unused")
	private VelocityEngine velocityEngine;

	public void setMailSender(JavaMailSender mailSender) {
		this.mailSender = mailSender;
	}

	public void setVelocityEngine(VelocityEngine velocityEngine) {
		this.velocityEngine = velocityEngine;
	}

	@Before(value = "within(@org.springframework.stereotype.Controller *)")
	public void sendRegistrationConfirmationMail() {
		System.out.println("Successfully joined");
		// Map<String, Object> model = new HashMap<String, Object>();
		// model.put("customer", customer);
		// String text = VelocityEngineUtils.mergeTemplateIntoString(
		// velocityEngine, "registrationConfirmation.vm", model);
		// sendMessage(text, "fake537@gmail.com", customer.getEmail());
	}

	@SuppressWarnings("unused")
	private void sendMessage(final String text, final String from, final String to) {
		MimeMessagePreparator preparator = new MimeMessagePreparator() {

			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage);
				message.setTo(to);
				message.setFrom(from);
				message.setText(text);
			}
		};

		this.mailSender.send(preparator);
	}
}
