FROM amazon/aws-lambda-python:3.9

COPY requirements.txt requirements.txt
COPY spotify.py spotify_api.py
COPY main.py ${LAMBDA_TASK_ROOT}

CMD [ "app.handler" ]