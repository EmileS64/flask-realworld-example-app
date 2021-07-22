# syntax=docker/dockerfile:1
FROM centos:8

COPY . /realworld

ENV FLASK_APP=/realworld/autoapp.py
ENV FLASK_RUN_PORT=8443
ENV FLASK_DEBUG=1

WORKDIR /realworld/

RUN yum -y install epel-release

RUN yum -y install python3
RUN yum -y install python3-devel
RUN yum -y install python3-pip
RUN yum -y install postgresql-devel
RUN yum -y install gcc

RUN pip3 install -r requirements/dev.txt
RUN pip3 install Flask-Migrate
RUN pip3 install PyJWT==1.7.1
RUN pip3 install Flask-JWT-Extended==3.0
RUN pip3 install SQLAlchemy==1.3.1
RUN pip3 install Flask_SQLAlchemy==2.2
RUN flask db init
RUN flask db migrate
RUN flask db upgrade

CMD ["flask", "run", "--host=0.0.0.0", "--with-threads"]

EXPOSE 8443
