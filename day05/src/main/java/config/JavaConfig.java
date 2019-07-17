package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import aspect.ExeTimeAspect2;
import chap06.Calculator;
import chap06.ImplCalculator;
import chap06.RecCalculator;

@Configuration
@EnableAspectJAutoProxy
public class JavaConfig {
	
	@Bean
	public ExeTimeAspect2 exeTimeAspect() {
		return new ExeTimeAspect2();
	}
	@Bean
	public Calculator ImplCal() {
		return new ImplCalculator();
	}
	@Bean
	public Calculator recCal() {
		return new RecCalculator();
	}
}
