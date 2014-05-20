Nginx vhost generator
=====================

Nginx conf templates pack, vhost generator and other.

* SSL and SPDY, Logs agregator, Backup, Private/Public, FastCGI, uWSGI and HTTP Proxy
* lang and frameworks
    - php (a lot)
    - ruby (rails, sinatra, mruby, etc)
    - python (django, etc)
    - lua (openresty)
* 3rdPartyModules
* Posts
* Perfomance

You should better read this page and look at `generate_nginx_vhost.sh`. 

## vhost tree

```
.
├── conf
│   ├── apps
│   │   ├── Lua
│   │   ├── PHP
│   │   ├── Python
│   │   └── Ruby
│   ├── ssl
│   └── upstream
├── log
├── backup
├── private
└── public
```

## Requirements:

* ack-grep - parsing vhost templates

## Install

1. Add to nginx.conf inside http directive
`include /var/www/*/conf/nginx.conf;`
2. git clone to /var/www/
3. Run ./generate_nginx_vhost.sh

## Tasks

- [x] add ssl key generate
- [ ] upstream generate
- [ ] subdomain
- [ ] color output
- [ ] ln -s for all log (one lgo directory)
- [ ] clue all conf-files in one before start nginx (Sysoev said)
- [ ] remove rewrite and other Regex from conf
- [ ] add more templates



## Frameworks

* PHP
    - _php
    - _fpm-status
    - ecommerce
        + opencart
        + prestashop
    - frameworks
        + zend
        + yiiframework
        + phalcon
        + kohanaphp
        + drupal6
    - CMS, wiki
        + dokuwiki
        + moodle
    - CRM
        + SugarCRM
        + Vtiger


## Plan to add some features from

* https://github.com/Umkus/nginx-boilerplate
* https://github.com/h5bp/server-configs-nginx
* https://github.com/miteshashar/nginx_vhosts
* https://github.com/davinov/ansible-nginx-vhost
* https://github.com/gycklarn/manage_vhost
* https://github.com/maxogden/nginx-vhosts
* https://github.com/maxogden/nginx-reload
* https://github.com/lawrencecurtis/deploy
* https://github.com/mingalar/vhost_generator
* https://github.com/bbg-cookbooks/nginx_vhost
* https://github.com/rstefanov/nginx-vhost PHP FPM
* https://github.com/biozshock/nginx_vhost PHP FPM
* https://github.com/suyb/Nginx_vhost_Flow_Control

## Nginx 3rdPartyModules Community

* http://wiki.nginx.org/3rdPartyModules
    * https://github.com/wandenberg/nginx-push-stream-module
    * https://github.com/yaoweibin/nginx_upstream_check_module

* Lua
    * https://github.com/openresty
    * https://github.com/wingify/lua-resty-rabbitmqstomp
    * http://habrahabr.ru/post/215237/ Russian
    * http://habrahabr.ru/company/2gis/blog/199504/ Russian
    * http://blog.cloudflare.com/pushing-nginx-to-its-limit-with-lua
    * http://habrahabr.ru/post/217773/ Russian

* MRuby github/matsumoto-r
    * https://github.com/matsumoto-r/ngx_mruby
    * https://github.com/cubicdaiya/mruby_nginx_module

* Secure
    * SSL
        * https://github.com/alinefr/nginx-polarssl
        * http://habrahabr.ru/post/213741/ Auth user with SSL
    * DDOS
        * http://habrahabr.ru/post/20934/
        * http://habrahabr.ru/post/215235/

* Subdomain
    * http://server-tuning.info/nginx/auto-subdomains-nginx.html

* Tunning
    * http://habrahabr.ru/post/221803/
* Admin
    * SaltStack
        * http://habrahabr.ru/post/218231/ Russian


## MIT
