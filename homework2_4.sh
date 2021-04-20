#дамп БД
sudo mysqldump -u root -p --opt --where='1 limit 100' mysql help_keyword > hkd

