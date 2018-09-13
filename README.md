# icecast2-docker

This is an image to set up an icecast server easily.

##How to run

	docker run -p 8888:8888 tomizius/icecast

Access the server in your browser localhost:8888, you can access the stream with localhost:8888/live

Run the image with custom parameter:
You can set up
	
	*Hostname
	*Maximum clients
	*Port
	*Admin password
	*Source password
	*Relay password

	docker run -d -p 8888:8888 -e ICE_SOURCE_PASS=mypass -e ICE_RELAY_PASS=mypass -e ICE_PORT=8888 -e HOSTNAME=your.domain.lan -e ICE_MAX_CLIENTS=1000 tomizius/icecast

###Customize the image

Feel free to customize this image. You can add enviroments, whichever you prefer for your streamingserver.
Edit the Dockerfile and the start.sh

####Example
	add to the Dockerfile

		ENV MOUNT=/example 

	add to the start.sh
	
		if [ -n "$MOUNT" ]; then
  			sed -i "s/<shoutcast-mount>[^<]*<\/shoutcast-mount>/<shoutcast-mount>$MOUNT<\/shoutcast-mount>/g" /etc/icecast2/icecast.xml
		fi

###docker-compose
	
	version: '3.1'

	services:
  	 icecast:
    	  container_name: icecast
   	  image: ice
    	  environment:
     	  - ICE_SOURCE_PASS=soocooness
       	  - ICE_RELAY_PASS=soocooness
     	  - ICE_ADMIN_PASS=soocooness
     	  - ICE_PORT=8888
     	  - HOSTNAME=ara.medien-saar.lan
     	  - ICE_MAX_CLIENTS=1010
    	  restart: unless-stopped
    	  ports:
     	  - 8888:8888
