#!/bin/bash

######### SCRIPT PARA BACKUP MYSQL #########
# Anderson Fantini <fantiniinfo@gmail.com> #

# Definindo parametros do MySQL
echo "  -- Definindo parametros do MySQL ..."
DB_NAME=''
DB_USER=''
DB_PASS=''
DB_PARAM='--add-drop-table --add-locks --extended-insert --single-transaction -quick'

# Definindo parametros do sistema
echo "  -- Definindo parametros do sistema ..."
DATE=`date +%Y-%m-%d`
MYSQLDUMP=/usr/bin/mysqldump
BACKUP_DIR=/home/linaro/hd_externo/mysql
BACKUP_NAME=mysql-$DATE.sql
BACKUP_TAR=mysql-$DATE.tar

#Gerando arquivo sql
echo "  -- Gerando Backup da base de dados $DB_NAME em $BACKUP_DIR/$BACKUP_NAME ..."
$MYSQLDUMP $DB_NAME $DB_PARAM -u $DB_USER -p$DB_PASS > $BACKUP_DIR/$BACKUP_NAME

# Compactando arquivo em bzip2
echo "  -- Compactando arquivo em zip..."
zip $BACKUP_DIR/$DATE.zip $BACKUP_DIR/$BACKUP_NAME

# Excluindo arquivos desnecessarios
echo "  -- Excluindo arquivos desnecessarios ..."
rm -rf $BACKUP_DIR/$BACKUP_NAME
