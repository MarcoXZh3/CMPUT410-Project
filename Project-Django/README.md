Project-Django
==============

This is a pet shelter website written by using Django framework for project of the course CMPUT410:
Web based information system. It provides basic functions for hosting information of pets, shelters,
staffs, users and activities such as adoptions, surrenders, donations as well as volunteers.

This project is using MySQL as database engine.


Requirements
============

 * Information that the website is hosting contains:
   - Shelters: name, staffs (members and volunteers), type (ragular shelter or vet), address, open hours, etc.;
   - Staffs: id, name, belonged to which shelter, type(member or volunteer), etc.;
   - Users: id, name, gender, age, etc.;
   - Pets: id, name, species, available or not, some photos, etc.;
   - Activities: details of adoptions, surrenders, donations and volunteers.

 * The website can serve information of all pets (or by species)

 * The website can serve information of all activities

 * The website can serve application forms for people to adopt, surrender animals and to donate or to volunteer

 * The website can serve information of all shelters

 * The website can serve information of all staffs (or by shelters)

 * The website allows staffs to log in/out

 * The website allows logged in staffs to manage information about:
   - his/her own profile (simply to reset password);
   - shelters
   - staffs
   - applications from users (adopt, surrender, donate or volunteer);


Setting up
==========

There are only three simple steps to set up project:

1. Clone this repository into local system

2. Run the bash script `$Project-Django/initialization.sh` in the root directory.
   It will perform 4 tasks and require you to type in your mysql server password:
 - Re-create required database and authorize user permition
   (see `$Project-Django/database.sql`)
 - Create tables used in the project (`python manage.py syncdb`)
 - Insert several sample table records (see `$Project-Django/PetShelter/tables.sql`)
 - Create superusers of the websites -- the staffs in the sample records

3. Start the server

```bash
git clone https://github.com/MarcoXZh/CMPUT410-Project.git    # step 1
cd CMPUT410-Project/Project-Django/
./initialization.sh                                           # step 2
python manage.py runserver #127.0.0.1:8000                    # step 3
```


What is ready
=============

 * Project initial configurations add `PetShelter` app creation

 * Model classes compositions

 * Controller URIs designs and relevant view methods definations
   (see `$Project-Django/PetShelter/views/`)

 * Part of the view methods implementations

 * Part of the view templates


Check list -- Dones & Todos
===========================

See The ["Check list: All done"](https://github.com/MarcoXZh/Project-Django/wiki/Check-list:-All-done) and  ["Check list: Partly done"](https://github.com/MarcoXZh/Project-Django/wiki/Check-list:-Partly-done) wiki page.


Licensing
=========

Generally everything is LICENSE'D under the Apache 2 license by Zhen(Marco) Xu.
