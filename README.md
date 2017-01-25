WORDPRESS INSTALL
===================


Olá, meu nome é Joel Santos sou desenvolvedor web, criei o **Wordpress install** para facilitar um pouco a minha vida.

----------


Sobre
-------------

Wordpress Install é um script que criei para funcionar em máquinas linux, ele ligeiramente faz a instalação e configuração do wordpress em seu servidor apache(localhost) em menos de 30 segundos eu garanto!

> **Nota: Requisitos**

> - Apache
> - MySQL
> - PHP 5.3^
> - WP-CLI
> - Linux (minha distro Manjaro <3)

#### <i class="icon-file"></i> Configuração

Não vou mostrar como instalar o Apache, MySQL, PHP, devido ao grande número de tutoriais na internet para isso.

Com a pilha instalada devemos instalar e configurar o WP-CLI (http://wp-cli.org/), com o seu terminal aberto, faça os comandos.

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

# Deve retornar mais o menos isso
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

Agora vamos configurar o arquivo wpinstall.sh para nossas configurações, abra-o com qualquer editor de texto, de uma breve lida no código é bem simples e está comentado.

Devemos configurar o local do diretório do apache no meu caso é /srv/http mais várias distros o apache usa /var/www/html ou /var/www deixo a seu critério descobrir.
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
Muito bom, estamos quase terminando falta criar um alias para executarmos esse script em nosso terminal.
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

Usuários windows fico devendo algo parecido kkkk.

Abraços.