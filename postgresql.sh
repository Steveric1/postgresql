#!/usr/bin/bash
#Purpose: Altschool Africa 2nd Semester Exam
#Version: 1.0
#Created Date: Fri Nov 04 12:08:05 WAT 2022
#Modified Date: 04/11/2022
#Author: Kinger Stephen Eric
# START #

#Declaration of variable to install postgresql 
update= sudo apt update
postgres= sudo apt install postgresql postgresql-contrib -y

#Postgresql function to install postgres
postgres() {
    #update the server machine and install postgresql
    if [ "$update" = "$update" -a "$postgres" = "$postgres" -a "$?" = 0 ];
    then
           echo "System update successfully"
           echo "Postgresql has been installed sucessfully "
    else
          echo "Error occur during update, couldn't finish the update"
          echo "Error occur during installation of the package"
    fi
}
postgres

#Declaration of database and user variable and setup database for altschool
DB_NAME="altschool"
DB_USER="altschool"
DB_PASSWD="alt12345"

sudo su postgres <<EOF
psql -c "CREATE USER $DB_USER WITH PASSWORD '$DB_USER_PASSWD';"
psql -c "CREATE DATABASE $DB_NAME WITH OWNER $DB_USER;"
psql -c "ALTER USER $DB_USER WITH SUPERUSER;"
psql -c "ALTER USER $DB_USER SET TIMEZONE = 'UTC';
psql -c "grant all privileges on database $DB_NAME to $DB_USER;"
echo "Postgres User '$DB_USER' and database 'DB_NAME' created."
EOF

#Create a database table for altschool user
sudo -u altschool psql <<EOF
CREATE TABLE students (
	user_id serial PRIMARY KEY,
	username VARCHAR ( 50 ) UNIQUE NOT NULL,
	password VARCHAR ( 50 ) NOT NULL,
	email VARCHAR ( 255 ) UNIQUE NOT NULL,
	location varchar(25) check (location in ('north', 'south', 'west', 'east', 'northeast', 'southeast', 'southwest', 'northwest')),
        install_date date
);
EOF

# END #
