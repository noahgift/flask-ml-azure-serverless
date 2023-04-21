setup:
	python3 -m venv ~/.flask-ml-azure
	#source ~/.flask-ml-azure/bin/activate
	
install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt

test:
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb


lint:
	#hadolint Dockerfile #uncomment to explore linting Dockerfiles
	pylint --disable=R,C,W1203,W0702 app.py

docker-build:
	docker build -t my-python-flask-app .

docker-run:
	docker run -p 5000:5000 my-python-flask-app

docker-debug:
	#to debug inside the container
	docker run -d -p 5000:5000 --name my-flask-container my-python-flask-app
	docker exec -it my-flask-container bash

docker-clean:
	#remove all images locally
	if [ -n "$$(docker images -aq)" ]; then \
		docker rmi -f $$(docker images -aq); \
	fi

all: install lint test
