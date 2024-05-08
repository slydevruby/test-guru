# Ошибка при установке гема pg
```user@ubuntu22:~/test-guru$ bundle
Fetching gem metadata from https://rubygems.org/.........
Resolving dependencies...
Fetching pg 1.5.6
Installing pg 1.5.6 with native extensions
Gem::Ext::BuildError: ERROR: Failed to build gem native extension.
```

# Решение
`user@ubuntu22:~/test-guru$ sudo apt install libpq-dev`
************************

# Ошибка: не запущен сервер
```
3.2.2 :001 > ActiveRecord::Base.connection_class
 => false 
3.2.2 :002 > ActiveRecord::Base.connection.class
/home/user/.rvm/gems/ruby-3.2.2/gems/activerecord-7.1.3/lib/active_record/connection_adapters/postgresql_adapter.rb:80:in `rescue in new_client': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory (ActiveRecord::ConnectionNotEstablished)
  Is the server running locally and accepting connections on that socket?

/home/user/.rvm/gems/ruby-3.2.2/gems/pg-1.5.6/lib/pg/connection.rb:828:in `connect_start': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: No such file or directory (PG::ConnectionBad)
  Is the server running locally and accepting connections on that socket?
```

# Решение: установить postgresql и запустить его
```
sudo apt install postgresql postgresql-contrib
sudo systemctl start postgresql.service
```
************************

# Ошибка: нет пользователя 'user'
```
3.2.2 :001 > ActiveRecord::Base.connection.class
/home/user/.rvm/gems/ruby-3.2.2/gems/activerecord-7.1.3/lib/active_record/connection_adapters/postgresql_adapter.rb:80:in ``rescue in new_client': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: FATAL:  role "user" does not exist (ActiveRecord::ConnectionNotEstablished)
/home/user/.rvm/gems/ruby-3.2.2/gems/pg-1.5.6/lib/pg/connection.rb:701:in ``async_connect_or_reset': connection to server on socket "/var/run/postgresql/.s.PGSQL.5432" failed: FATAL:  role "user" does not exist (PG::ConnectionBad)
```
# Решение: создать пользователя
```
user@ubuntu22:~/test-guru$ sudo -i -u postgres
postgres@ubuntu22:~$ createuser user
```
************************

# Ошибка в консоли при вызове ActiveRecord::Base.connection.class
```
3.2.2 :001 > ActiveRecord::Base.connection.class
/home/user/.rvm/gems/ruby-3.2.2/gems/activerecord-7.1.3/lib/active_record/connection_adapters/postgresql_adapter.rb:74:in `rescue in new_client': We could not find your database: guru_development. Available database configurations can be found in config/database.yml. (ActiveRecord::NoDatabaseError)

To resolve this error:

- Did you not create the database, or did you delete it? To create the database, run:

    bin/rails db:create

- Has the database name changed? Verify that config/database.yml contains the correct database name.
```
# Решение

`rails db:create`
************************

# Ошибка при создании базы данных текущим пользователем (это user у меня)

```
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

```
# Решение: дать пользователю user привилегий
```
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

postgres=# ALTER USER "user" WITH SUPERUSER;
ALTER ROLE
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of 
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 user      | Superuser                                                  | {}

```
************************
# Ошибка кодировки, требуется LATIN1

```
user@ubuntu22:~/test-guru$ rails db:create
To use retry middleware with Faraday v2.0+, install `faraday-retry` gem
PG::InvalidParameterValue: ERROR:  encoding "UTF8" does not match locale "en_US"
DETAIL:  The chosen LC_CTYPE setting requires encoding "LATIN1".
Couldn't create 'guru_development' database. Please check your configuration.
bin/rails aborted!
ActiveRecord::StatementInvalid: PG::InvalidParameterValue: ERROR:  encoding "UTF8" does not match locale "en_US" (ActiveRecord::StatementInvalid)
DETAIL:  The chosen LC_CTYPE setting requires encoding "LATIN1".
```


# Решение здесь

https://stackoverflow.com/questions/13115692/encoding-utf8-does-not-match-locale-en-us-the-chosen-lc-ctype-setting-requires

я делал оба пункта : 

## Cоздание файла с экспортом переменных 

```
Create a file: nano /etc/profile.d/lang.sh.

Add the following:

* export LANGUAGE="en_US.UTF-8"
* export LANG="en_US.UTF-8"
* export LC_ALL="en_US.UTF-8"
* Save the file

Restart the shell or run all export commands manually in current shell instance
```


## Изменение таблицы template1 через psql:
```
update pg_database set datistemplate=false where datname='template1';
drop database Template1;
create database template1 with owner=postgres encoding='UTF-8'

  lc_collate='en_US.utf8' lc_ctype='en_US.utf8' template template0;

update pg_database set datistemplate=true where datname='template1';
```

Сам по себе файл с переменными не помог, проблема прежняя, только после смены таблицы заработало
и таблицы созданы
```
user@ubuntu22:~/test-guru$ rails db:create
To use retry middleware with Faraday v2.0+, install `faraday-retry` gem
Created database 'guru_development'
Created database 'guru_test'
```
