FROM python:3.9

RUN pip install --upgrade pip

RUN mkdir /code
WORKDIR /code

## Uncomment if using requirements.txt
COPY requirements.txt /code/
RUN pip install -r requirements.txt

COPY . /code/