package com.ruoyi;

import org.apache.catalina.connector.Connector;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.boot.web.servlet.server.ConfigurableServletWebServerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class EmbeddedTomcatConfiguration {

    /*
    @Value("${server.additionalPort}")
    private String additionalPort;

    @Bean
    public TomcatServletWebServerFactory servletContainer() {
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

     */

    @Bean
    public WebServerFactoryCustomizer<ConfigurableServletWebServerFactory> webServerFactoryCustomizer() {
        return factory -> {
            if (factory instanceof TomcatServletWebServerFactory) {
                ((TomcatServletWebServerFactory) factory).addAdditionalTomcatConnectors(httpConnector());
            }
        };
    }

    private Connector httpConnector() {
        Connector connector = new Connector(TomcatServletWebServerFactory.DEFAULT_PROTOCOL);
        connector.setScheme("http");
        connector.setPort(80); // HTTP port
        connector.setSecure(false);
        connector.setRedirectPort(443); // Redirect to HTTPS port
        return connector;
    }
}