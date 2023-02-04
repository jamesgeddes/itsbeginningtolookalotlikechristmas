FROM amazon/aws-lambda-python:3.9

COPY ./src .
RUN pip3 install -r requirements.txt
CMD [ "python3", "main.py" ]