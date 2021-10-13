# Manning LiveProject - CI/CD with JenkinsX

In order to start working with this project we would need:

* Docker
* docker-compose


You need to clone this repository onto your machine by executing:

```bash
git clone git@github.com:mmontalvo/jx-payments-manning.git
```
or
```bash
git clone https://github.com/mmontalvo/jx-payments-manning.git
```

After this, you go into `jx-payments-manning` folder and run:

```bash
docker-compose up
```

It will start pulling the images needed, setting up the MySQL database installation and the packages from the Django applications.

Once the app and the database are running, we would need to run migrations to have the database tables in a work ready state.
For it, we need to get into the application's Docker running instance.

Running `docker ps` we can spot the instance running our application (it would be something similar to the following line):

```bash
CONTAINER ID        IMAGE                     COMMAND                  CREATED              STATUS              PORTS                               NAMES
_container_id_        jx_payments_jx-payments   "gunicorn --bind :80…"   About a minute ago   Up About a minute   0.0.0.0:8080->8080/tcp              jx_payments_jx-payments_1
```

Now we need to start an interactive shell, and run the migrations with the following command:

```bash
# Access the container where we have our database running with:
docker exec -it _container_id_ bash

# Run migrations with:
python manage.py migrate
```

We can verify everything is running as expected by opening a browser and point to any:
trading service: `http://localhost:8080/`