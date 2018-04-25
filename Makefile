rm:
	# Delete all containers
	#docker rm -f $(docker ps -a -q)
	# Delete all images
	#docker rmi $(docker images -q)

build:
	docker build --rm --force-rm -t cristianounix/jupyterlab:beta .

del:
	docker images -a | grep "cristianounix/jupyterlab" | awk '{print $3}' | xargs docker rmi --force

up:
	docker-compose up

