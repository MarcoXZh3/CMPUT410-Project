Project-Rails
=============

This is a pet shelter website written by using Ruby on Rails framework for project of the course CMPUT410:
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

2. Run the bash script `$Project-Rails/initialization.sh` in the root directory.
   It will perform 3 tasks and require you to type in your mysql server password:
 - Re-create required database and authorize user permition (see the source code)
 - Create tables used in the project (`rake db:migrate`)
 - Insert several sample table records (see `$Project-Rails/tables.sql`)

3. Start the server

```bash
git clone https://github.com/MarcoXZh/CMPUT410-Project.git     # step 1
cd CMPUT410-Project/Project-Rails/
./initialization.sh                                           # step 2
rails server # -p 3000                                        # step 3
```


What is ready
=============

 * Project initial configurations

 * gem package 'devise' and its configurations

 * Model and controller creations

 * Controller URIs designs and relevant actions definations
   (see `$Project-Rails/config/routes.rb`)

 * Part of the action methods implementations

 * Part of the view templates implementations


Check list -- Dones & Todos
===========================

See The ["Check list: All done"](https://github.com/MarcoXZh/Project-Rails/wiki/Check-list:-All-done) and
["Check list: Partly done"](https://github.com/MarcoXZh/Project-Rails/wiki/Check-list:-Partly-done) wiki page.


Licensing
=========

Generally everything is LICENSE'D under the Apache 2 license by Zhen(Marco) Xu.

