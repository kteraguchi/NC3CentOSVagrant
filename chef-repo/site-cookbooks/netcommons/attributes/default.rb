#
# Cookbook Name:: netcommons
# Atttibute:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

default['system']['timezone'] = 'Asia/Tokyo'

default['locale']['lang'] = 'ja_JP.UTF-8'
default['locale']['lc_all'] = 'ja_JP.UTF-8'

default['apache']['user'] = 'vagrant'
default['apache']['group'] = 'vagrant'

default['php']['directives'] = {"date.timezone" => "Asia/Tokyo"}
default['php']['packages'] = [
  'php',
  'php-devel',
  'php-cli',
  'php-mbstring',
  'php-mysql',
  'php-mcrypt', # for CakePHP
  'php-xml'  # for PHPUnit
]

# https://github.com/djoos-cookbooks/composer/blob/aeacd15a95d32eec24900140ef0c02114ed46385/recipes/install.rb#L8
default['composer']['php_recipe'] = 'php::package'

default['mariadb']['use_default_repository'] = true

default['nodejs']['npm_packages'] = [
  # http://stackoverflow.com/questions/20435793/unable-to-install-hubot-npm-dependency-not-met#comments-20768611
  {'name' => 'inherits'},
  {'name' => 'bower'}
]
