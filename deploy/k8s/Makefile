init:
	kubectl create ns corteza

deploy:
	kubectl apply -f server.yml -f db.yml -n corteza

delete:
	kubectl delete -f server.yml -f db.yml corteza

clean:
	kubectl delete ns corteza
