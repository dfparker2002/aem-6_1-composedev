# Docker Compose a simple AEM dev environment 

You will need to build the following images localy first before running the docker-compse command from the projects directory
```
docker-compose up -d
```
Step 1 
Build the publisher image locally 
Make sure to follow the README and put the aem source jar and the license files in the resource directory.  Since it requires your install media you have to build this locally.
https://github.com/AdobeAtAdobe/aem-6_1-publish
```
docker build -t aem_6-1_publish .
```

Step 2
Build the author image locally
Make sure to follow the README and put the aem source jar and the license files in the resource directory.  Since it requires your install media you have to build this locally.
https://github.com/AdobeAtAdobe/aem-6_1-author
```
docker build -t aem_6-1_author .
```

Step 3 
Build the dispatcher image.  This set can be done based on a DockerHub image but at the moment its not
https://github.com/AdobeAtAdobe/aem-6_1-dispatcher-publish
```
docker build -t dispatcher_4-1-9 .
```
now if you run 
```
docker images
```
you should see all the images listed and ready for use.  Now you can run the compose

```
docker-compose up -d
```


