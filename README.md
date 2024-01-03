# log-analysis-automation


### Environment and Technology uses:

    - Linux
    - Java
    - Python
    - Shell Scripting


Nginx  reverse proxy setup for two microservices (customer-info and product-info):

	server {
		listen 8080;
		location /customer-info/ {
			proxy_pass http://localhost:8081/customer-info/;
			proxy_set_header Host $host;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header X-Forwarded-Proto $scheme;
		}
		location /product-info/ {
			proxy_pass http://localhost:8082/product-info/;
			proxy_set_header Host $host;
			proxy_set_header X-Real-IP $remote_addr;
			proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
			proxy_set_header X-Forwarded-Proto $scheme;
		}
	}


Access log formate set:

 	log_format  custom_logs  '$remote_addr - [$time_local] "$request" ''$status $body_bytes_sent "$http_referer" '
                       '"$http_user_agent" $upstream_addr $upstream_response_time' " $request_time" " $request_id";
	access_log /var/log/nginx/access.log custom_logs;
	error_log /var/log/nginx/error.log;




Total Request Status summery:

     cat access.log | awk '{print $8}' | sort  | uniq --count
  


 Service Wise hit count:

     cat access.log | awk '{print $6}'|grep customer-info | wc -l
     cat access.log | awk '{print $6}'|grep product-info | wc -l



Report preview:


![image](https://github.com/imrangthub/log-analysis-automation/assets/32607915/4aba936e-1311-4317-87d3-01d2d5d0cf6d)








