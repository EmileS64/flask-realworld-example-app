.. image:: image.png

Quickstart
----------

CircleCI build:

.. image:: https://circleci.com/gh/gothinkster/flask-realworld-example-app.png


First, set your app's secret key as an environment variable. For example,
add the following to ``.bashrc`` or ``.bash_profile``.

.. code-block:: bash

    export CONDUIT_SECRET='something-really-secret'

Before running shell commands, set the ``FLASK_APP`` and ``FLASK_DEBUG``
environment variables ::

    export FLASK_APP=/path/to/autoapp.py
    export FLASK_DEBUG=1

Then run the following commands to bootstrap your environment ::

    git clone https://github.com/gothinkster/flask-realworld-example-app.git
    cd flask-realworld-example-app
    pip install -r requirements/dev.txt


Run the following commands to create your app's
database tables and perform the initial migration ::

    flask db init
    flask db migrate
    flask db upgrade

To run the web application use::

    flask run --with-threads


Deployment
----------

In your production environment, make sure the ``FLASK_DEBUG`` environment
variable is unset or is set to ``0``, so that ``ProdConfig`` is used, and
set ``DATABASE_URL`` which is your postgresql URI for example
``postgresql://localhost/example`` (this is set by default in heroku).


Shell
-----

To open the interactive shell, run ::

    flask shell

By default, you will have access to the flask ``app`` and models.


Running Tests
-------------

To run all tests, run ::

    flask test


Migrations
----------

Whenever a database migration needs to be made. Run the following commands ::

    flask db migrate

This will generate a new migration script. Then run ::

    flask db upgrade

To apply the migration.

For a full migration command reference, run ``flask db --help``.

Exercice devOps
---------------

To build a docker image with the Dockerfile. After cloning the repository github,
in the repository, run the following command (you need to be root or sudor for this) ::

    docker build -t realworld .

This will build the docker image realworld.
To run the docker, run the following command ::

    docker run -d -v realworld:/var/realworld -p 8443:8443 realworld

To check if the docker container is running, use the following command ::

    docker ps

To push the image in a Docker Hub repository from the GitHub repository,
the action docker-published.yml build and push an image using the Dockerfile
in the main branch.

To pull the image created from Docker Hub, use the following command with the 
corresponding tagname::

    docker pull dockeridemiles/images_realworld_example:tagname

In the docker command to run a docker conatiner, we opened the port 8443 with
the option -p 8443:8443 ::

    docker run -d -v realworld:/var/realworld -p 8443:8443 realworld
