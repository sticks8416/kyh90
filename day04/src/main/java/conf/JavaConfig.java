package conf;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import spring.Client;
import spring.Client2;

@Configuration
public class JavaConfig {

		@Bean(initMethod="afterPropertiesSet", destroyMethod="destroy")
		public Client client() {
			Client client = new Client();
			client.setHost("서버2");
			return client;
		}
		@Bean(destroyMethod="close")
		public Client2 client2() {
			Client2 client2 = new Client2();
			client2.setHost("서버2");
			return client2;
		}
}
