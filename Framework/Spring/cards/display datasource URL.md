# How to display the value of the datasource URL

```
@Value("${spring.datasource.url}")
private String dataSourceUrl;

System.out.println("dataSourceUrl = " + dataSourceUrl);
```
