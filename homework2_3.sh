#дамп БД
mysqldump -u root -p example > sample
#создание БД
mysqladmin -u root -p create sample
#развертывание дампа
mysql -u root -p sample < sample
