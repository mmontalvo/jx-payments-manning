FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /manning/jx-payments-2
RUN apt-get install -y libmariadb-dev
WORKDIR /manning/jx-payments-2
COPY requirements.txt /manning/jx-payments-2/
RUN pip install -r requirements.txt
RUN pip install mysqlclient
ADD . /manning/jx-payments-2/

EXPOSE 8080

CMD ["gunicorn", "--bind", ":8080", "jx-payments-2.wsgi:application"]
