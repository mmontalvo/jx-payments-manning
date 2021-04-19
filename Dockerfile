FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir -p /manning/jx-payments-manning
WORKDIR /manning/jx-payments-manning
COPY requirements.txt /manning/jx-payments-manning/
RUN pip install -r requirements.txt
ADD . /manning/jx-payments-manning/

EXPOSE 8080

CMD ["gunicorn", "--bind", ":8080", "jx-payments-manning.wsgi:application"]
