#!/bin/bash

# ==================================== Create database ====================================
echo -e "mysql -u root -p (Creating ralated databases)"
mysql -u root -p -e "
    DROP DATABASE IF EXISTS \`Project-Rails_production\`;
    CREATE DATABASE \`Project-Rails_production\`;
    GRANT ALL ON \`Project-Rails_production\`.* TO 'MarcoXZh'@'localhost' IDENTIFIED BY 'project';
    DROP DATABASE IF EXISTS \`Project-Rails_test\`;
    CREATE DATABASE \`Project-Rails_test\`;
    GRANT ALL ON \`Project-Rails_test\`.* TO 'MarcoXZh'@'localhost' IDENTIFIED BY 'project';
    DROP DATABASE IF EXISTS \`Project-Rails_development\`;
    CREATE DATABASE \`Project-Rails_development\`;
    GRANT ALL ON \`Project-Rails_development\`.* TO 'MarcoXZh'@'localhost' IDENTIFIED BY 'project';
    -- SHOW DATABASES;
    USE \`Project-Rails_development\`;
" # mysql -u root -p -e "..."

echo -e "rake db:migrate"
rake db:migrate

# ==================================== Initialize database records ====================================
echo -e "mysql -u root -p < tables.sql"
mysql -u root -p < tables.sql 1>/dev/null

