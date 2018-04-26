rm:
	#docker rm -f $(docker ps -a -q)
	#docker rmi $(docker images -q)

build:
	docker build --rm --force-rm -t cristianounix/datascience:beta .

del:
	docker images -a | grep "cristianounix/datascience" | awk '{print $3}' | xargs docker rmi --force

up:
	docker-compose up

