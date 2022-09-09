Wordpress install
===================
![image](https://img.shields.io/badge/maintained-no!%20(as%20of%202017)-red)

Sobre
-------------

Wordpress Install é um script que que está funcionando em linux, ele ligeiramente faz a instalação e configuração do wordpress em seu servidor apache(localhost).

> **Nota: Requisitos**

> - Apache
> - MySQL
> - PHP 5.3^
> - WP-CLI
> - Linux (minha distro Manjaro <3)

#### <i class="icon-file"></i> Configuração



Instalar e configurar o WP-CLI (http://wp-cli.org/), com o seu terminal aberto, rode os comandos.

```
# Ir para o diretório home.
$ cd ~

# Fazer download do wp-cli.phar instale o pacote curl caso não tenha instalado.
$ curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# Verifica se está funcionando
$ php wp-cli.phar --info

# Torne o arquivo em executável
$ chmod +x wp-cli.phar

# Mova o arquivo para a pasta de executáveis
$ sudo mv wp-cli.phar /usr/local/bin/wp

# Teste novamente com o alias do wp-cli
$ wp --info

# Deve ser retornado algo parecido com isso:
PHP binary:    /usr/bin/php5
PHP version:    5.5.9-1ubuntu4.14
php.ini used:   /etc/php5/cli/php.ini
WP-CLI root dir:        /home/wp-cli/.wp-cli
WP-CLI packages dir:    /home/wp-cli/.wp-cli/packages/
WP-CLI global config:   /home/wp-cli/.wp-cli/config.yml
WP-CLI project config:
WP-CLI version: 1.0.0
```

Com isso você já pode desfrutar do wp-cli em seu terminal, agora vamos para a configuração do script.

```
# Faça o download deste repositório e mova o arquivo wpinstall.sh para uma pasta em sua home.
$ mkdir ~/scripts
$ mv wordpress-install/wpinstall.sh ~/scripts

# Torne o arquivo em executável
$ chmod a+x ~/scripts/wpinstall.sh
```

Agora vamos configurar o arquivo wpinstall.sh para nossas configurações, abra-o com qualquer editor de texto.

Devemos configurar o local do diretório do apache no meu caso é /srv/http mais várias distros o apache usa /var/www/html ou /var/www
```
Linha 26: mkdir /srv/http/$slug
Linha 27: cd /srv/http/$slug
```
Configure os dados padrões para criação e configuração do wordpress.
```
Linhas 30 ~ 36:
dbuser='USUARIO-BANCO-DE-DADOS'
dbpass='SENHA-BANCO-DE-DADOS'
dbhost='localhost'
dbprefix='wp'
wpuser='USUARIO-ADMIN-WORDPRESS'
wppass='SENHA-ADMIN-WORDPRESS'
wpemail='user@example.org'
```
Crie um alias para executarmos esse script em nosso terminal.
```
# Acrescente no final do arquivo .bashrc a linha "alias wordpress='~/scripts/wpinstall.sh'" sem as aspas duplas, eu usei o editor nano para isso.

$ nano ~/.bashrc

# Aproveite e crie mais alias para facilitar sua vida
"alias cli='cd ~/projetos/clientes'"
"alias server='cd /srv/http'"
```

Com isso terminamos podemos digitar o comando **wordpress** no terminal para executarmos o script.

Também criei o alias **cli** para acessar minha pasta de projetos e **server** para acessar minha pasta do apache.

Faça um bom proveito para novos projetos em wordpress.

Para usuários windows fico devendo.
