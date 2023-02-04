FROM amazon/aws-lambda-python:3.9

COPY ./src .
RUN pip3 install -r requirements.txt
COPY main.py ${LAMBDA_TASK_ROOT}

CMD [ "python3", "main.py" ]