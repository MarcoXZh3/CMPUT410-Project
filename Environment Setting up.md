Django
======

 1. Installation:
   1. Install python and pip
   2. Install Django using pip
      ```shell
      sudo pip install django
      ```

   3. Install MySQL and supporting component
      ```shell
      sudo apt-get install mysql-server
      sudo apt-get install python-mysqldb
      ```

 2. Create Django Project
    ```shell
    django-admin.py startproject mysite
    cd mysite/
    ```

 3. Start project
    ```shell
    python manage.py runserver #127.0.0.1:8000
    ```

 5. Create apps
    ```shell
    python manage.py startapp new_app
    ```


Ruby on Rails
=============
 1. Installation:
   1. Install Ruby and Rails
      ```shell
      sudo apt-get install ruby
      sudo gem install rails
      ```
      Or using RVM:
      ```shell
      sudo apt-get install curl
      \curl -sSL https://get.rvm.io | bash -s stable --rails
      ```

   2. Install javascript runtime (Node.js -- Only necessary for Linux)
      ```shell
      sudo apt-get install -y python-software-properties python g++ make
      sudo add-apt-repository ppa:chris-lea/node.js
      sudo apt-get update
      sudo apt-get install nodejs
      ```

   3. MySQL support
      ```shell
      sudo apt-get install libmysqlclient-dev
      sudo gem install mysql2
      ```

 2. Create Rails project:
    ```shell
    rails new Project-Rails -d mysql
    cd Project-Rails
    ```

 3. Start project
    ```shell
    rails server -p 3000
    ```

 4. Create models and controllers
    ```shell
    rails g model model1 name:string{20} gender:boolean birthday:date age:integer \
                         income:decimal{9,2} hobby:text -f
    rake db:create
    rake db:migrate
    rails g controller controller1 views_for_controller1 -f
    ```

