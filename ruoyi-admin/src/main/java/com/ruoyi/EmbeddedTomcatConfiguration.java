package com.ruoyi;

import org.apache.catalina.connector.Connector;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EmbeddedTomcatConfiguration {

    @Value("${server.additionalPort}")
    private String additionalPort;

    @Bean
    public TomcatServletWebServerFactory servletContainer() {
        System.out.println("Add additional port:" + additionalPort);
        var tomcat = new TomcatServletWebServerFactory();
        var additionalConnector = this.additionalConnector();
        if (additionalConnector != null) {
            tomcat.addAdditionalTomcatConnectors(additionalConnector);
        }
        return tomcat;
    }

    private Connector additionalConnector() {
        if (StringUtils.isBlank(this.additionalPort)) {
            return null;
        }
        var connector = new Connector("org.apache.coyote.http11.Http11NioProtocol");
        connector.setScheme("http");
        connector.setPort(Integer.parseInt(additionalPort));
        return connector;
    }
}