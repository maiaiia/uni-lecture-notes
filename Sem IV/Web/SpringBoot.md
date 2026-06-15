https://start.spring.io/

![[Screenshot 2026-06-15 at 16.19.52.png]] + Lombok

```java
# src/main/resources/application.properties
# Database
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/task_management
spring.datasource.username=root
spring.datasource.password=
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver

server.servlet.session.timeout=30m
```