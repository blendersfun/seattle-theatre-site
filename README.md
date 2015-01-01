seattle-theatre-site
====================

A site for finding theatrical productions in Seattle, and educating oneself about theatre art both generally, and as it pertains to the Seattle scene.

## Notes:

Currently the jsx build is done by hand. The concept is that the ./public/ folder will be generated by the build. However, the server code will make references to the output of the generated code. So it's basically impossible to run the thing before running the build. 

## Database:

I'm using mysql via the XAMPP project. To create the table structure assumming XAMPP is installed on a mac with all default settings, navigate to the "db" folder, then:
```
/Applications/xampp/xamppfiles/bin/mysql -u root
mysql> connect [your-destination-database-name] localhost;
mysql> source create_tables.sql
```

I've symlinked mysql to a folder on the path, so I can just do "mysql" from the command-line and get to it. The destination database should be an empty database. If you have XAMPP installed, you can create one with phpMyAdmin.

## Build Stuff, So Far:

This is how to conduct a full rebuild. It is currently done by hand via the command line:
```
rm -R public/
jsx -x jsx client/ public/
jsx -x js client/ public/
yaml2json ./client/pages/home/homeQueries.yaml > ./public/pages/home/homeQueries.json
browserify client/client.js > public/client.js
```

Browserify must be done after jsx conversion. No modules require in jsx files. Instead, jsx is built into js and modules require the built copies. So, if the built copies don't exist yet, browserify will fail.

This process depends on global installs of the following: browserify, react-tools, yamljs.
