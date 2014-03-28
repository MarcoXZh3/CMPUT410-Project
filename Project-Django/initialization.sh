#!/bin/bash

answer='no'
password='12345678'

echo 'mysql -u root -p < database.sql'
mysql -u root -p < database.sql 1>/dev/null

echo 'python manage.py syncdb'
expect -c "
  spawn python manage.py syncdb
  expect \"Would you like to create one now? (yes/no):\" { send \"$answer\r\" }
" 1>/dev/null

echo 'mysql -u root -p < PetShelter/tables.sql'
mysql -u root -p < PetShelter/tables.sql 1>/dev/null

echo 'python manage.py createsuperuser --username=marco --email=zxu3@ualberta.ca'
expect -c "
  spawn python manage.py createsuperuser --username=marco --email=zxu3@ualberta.ca
  expect \"Password:\" { send \"$password\\r\" }
  expect \"Password (again):\" { send \"$password\\r\" }
  interact
" 1>/dev/null
echo "Password: $password"

echo 'python manage.py createsuperuser --username=js-11 --email=js-11@b.com'
expect -c "
  spawn python manage.py createsuperuser --username=js-11 --email=js-11@b.com
  expect \"Password:\" { send \"$password\\r\" }
  expect \"Password (again):\" { send \"$password\\r\" }
  interact
" 1>/dev/null
echo "Password: $password"

echo 'python manage.py createsuperuser --username=js-12 --email=js-12@b.com'
expect -c "
  spawn python manage.py createsuperuser --username=js-12 --email=js-12@b.com
  expect \"Password:\" { send \"$password\\r\" }
  expect \"Password (again):\" { send \"$password\\r\" }
  interact
" 1>/dev/null
echo "Password: $password"

echo 'python manage.py createsuperuser --username=js-21 --email=js-21@b.com'
expect -c "
  spawn python manage.py createsuperuser --username=js-21 --email=js-21@b.com
  expect \"Password:\" { send \"$password\\r\" }
  expect \"Password (again):\" { send \"$password\\r\" }
  interact
" 1>/dev/null
echo "Password: $password"

echo 'python manage.py createsuperuser --username=js-31 --email=js-31@b.com'
expect -c "
  spawn python manage.py createsuperuser --username=js-31 --email=js-31@b.com
  expect \"Password:\" { send \"$password\\r\" }
  expect \"Password (again):\" { send \"$password\\r\" }
  interact
" 1>/dev/null
echo "Password: $password"

