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


## CheatSheet
|ASP.NET|Spring Boot|
|---|---|
|`[ApiController]`|`@RestController`|
|`[Route("path")]`|`@RequestMapping("/path")`|
|`[HttpGet]`|`@GetMapping`|
|`[HttpPost]`|`@PostMapping`|
|`[FromQuery]`|`@RequestParam`|
|`[FromBody]`|`@RequestBody`|
|`HttpContext.Session.GetInt32("key")`|`(Integer) session.getAttribute("key")`|
|`HttpContext.Session.SetInt32("key", val)`|`session.setAttribute("key", val)`|
|`return Ok(...)`|`return ResponseEntity.ok(...)`|
|`return Unauthorized(...)`|`return ResponseEntity.status(401).body(...)`|
|`new DAL()`|`@Autowired DAL dal`|