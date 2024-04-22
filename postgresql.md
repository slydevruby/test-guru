user@ubuntu22:~/test-guru$ bundle
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Fetching pg 1.5.6
Installing pg 1.5.6 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.

user@ubuntu22:~/test-guru$ sudo apt install libpq-dev
--------------------------



3.2.2 :001 > ActiveRecord::Base.connection_class
 => false 
3.2.2 :002 > ActiveRecord::Base.connection.class
/home/user/.rvm/gems/ruby-3.2.2/gems/activerecord-7.1.3/lib/active_record/connection_adapters/postgresql_adapter.rb:80:in `rescue in new_client': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory (ActiveRecord::ConnectionNotEstablished)
  Is the server running locally and accepting connections on that socket?

/home/user/.rvm/gems/ruby-3.2.2/gems/pg-1.5.6/lib/pg/connection.rb:828:in `connect_start': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory (PG::ConnectionBad)
  Is the server running locally and accepting connections on that socket?


sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service
sudo -i -u postgres
psql
--------------


3.2.2 :001 > ActiveRecord::Base.connection.class
/home/user/.rvm/gems/ruby-3.2.2/gems/activerecord-7.1.3/lib/active_record/connection_adapters/postgresql_adapter.rb:80:in `rescue in new_client': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: FATAL:  role "user" does not exist (ActiveRecord::ConnectionNotEstablished)
/home/user/.rvm/gems/ruby-3.2.2/gems/pg-1.5.6/lib/pg/connection.rb:701:in `async_connect_or_reset': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: FATAL:  role "user" does not exist (PG::ConnectionBad)

user@ubuntu22:~/test-guru$ sudo -i -u postgres
postgres@ubuntu22:~$ createuser user
--------------------


3.2.2 :001 > ActiveRecord::Base.connection.class
/home/user/.rvm/gems/ruby-3.2.2/gems/activerecord-7.1.3/lib/active_record/connection_adapters/postgresql_adapter.rb:74:in `rescue in new_client': We could not find your database: guru_development. Available database configurations can be found in config/database.yml. (ActiveRecord::NoDatabaseError)

To resolve this error:

- Did you not create the database, or did you delete it? To create the database, run:

    bin/rails db:create

- Has the database name changed? Verify that config/database.yml contains the correct database name.

rails db:create
----------------------------


user@ubuntu22:~/test-guru$ rails db:create
To use retry middleware with Faraday v2.0+, install `faraday-retry` gem
PG::InsufficientPrivilege: ERROR:  permission denied to create database
Couldn't create 'guru_development' database. Please check your configuration.
bin/rails aborted!
ActiveRecord::StatementInvalid: PG::InsufficientPrivilege: ERROR:  permission denied to create database (ActiveRecord::StatementInvalid)


Caused by:
PG::InsufficientPrivilege: ERROR:  permission denied to create database (PG::InsufficientPrivilege)

Tasks: TOP => db:create
(See full trace by running task with --trace)
user@ubuntu22:~/test-guru$ sudo -i -u postgres
postgres@ubuntu22:~$ psql
psql (14.11 (Ubuntu 14.11-0ubuntu0.22.04.1))
Type "help" for help.

postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 user      |                                                            | {}

postgres=# alter user 'user' with superuser;
ERROR:  syntax error at or near "'user'"
LINE 1: alter user 'user' with superuser;
                   ^
postgres=# ALTER USER user WITH SUPERUSER;
ERROR:  syntax error at or near "user"
LINE 1: ALTER USER user WITH SUPERUSER;
                   ^
postgres=# ALTER USER "user" WITH SUPERUSER;
ALTER ROLE
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 user      | Superuser                                                  | {}
