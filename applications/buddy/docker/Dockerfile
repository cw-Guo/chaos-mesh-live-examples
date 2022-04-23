FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python3-pip python3-dev
    
EXPOSE 5000
# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /python/requirements.txt

WORKDIR /python

RUN pip3 install --upgrade setuptools
RUN pip3 install -r requirements.txt

COPY . /python

ENTRYPOINT [ "python3" ]

CMD [ "buddy.py" ]