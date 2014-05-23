Step 1:  Build the base image:

    $ docker build -t centos-torquebox .

Step 2:  Change dir to your application:

    $ cd /path/to/ruby/app

Step 3:  Create a container with the base image and your application:

    $ docker run -v $(pwd):/tmp/src centos-torquebox

Step 4:  Commit it:

    $ docker commit <HOSTNAME> torquebox-ruby-app

Step 5:  Run the container:

    $ docker run -i -t --rm -p 8080:8080 torquebox-ruby-app
