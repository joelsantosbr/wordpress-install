#!/bin/bash -e
clear

echo '==='
echo 'Instalação do wordpress'
echo '==='

echo 'Nome do banco de dados: '
read -e dbname

echo 'Nome do site: '
read -e sitename

echo 'Slug do site: '
read -e slug

# verifica se é isso mesmo que deseja fazer
echo 'Deseja fazer a instalação? (y/n) '
read -e run

if [ "$run" == n ] ; then
exit
else

# cria a pasta com o slug passado e entra no diretório criado no meu caso o diretório do apache está em /srv/http/
mkdir /srv/http/$slug
cd /srv/http/$slug

# dados necessários
dbuser='USUARIO-BANCO-DE-DADOS'
dbpass='SENHA-BANCO-DE-DADOS'
dbhost='localhost'
dbprefix='wp'
wpuser='USUARIO-ADMIN-WORDPRESS'
wppass='SENHA-ADMIN-WORDPRESS'
wpemail='user@example.org'

# download do wordpress versão mais recente
wp core download --locale=pt_BR

# configurar o wp-config
wp core config --dbname=$dbname --dbuser=$dbuser --dbpass=$dbpass --dbhost=$dbhost --dbprefix=$dbprefix

# cria o banco de dados
wp db create

# faz a instalação do wordpress
wp core install --url="http://localhost/$slug" --title="$sitename" --admin_user="$wpuser" --admin_password="$wppass" --admin_email="$wpemail"

clear

echo "==="
echo "Instalação concluída. Acesse o site em http://localhost/$slug"
echo ""
echo "Login: $wpuser"
echo "Senha: $wppass"
echo ""
echo "==="

fi