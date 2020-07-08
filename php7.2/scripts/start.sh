#!/bin/sh
echo "172.17.0.1 cloud.imobielocal.com account.imobielocal.com manager.imobielocal.com heic.imobielocal.com anyget.imobielocal.com anytrans.imobile.com convert.imobielocal.com share.imobielocal.com anytrans.imobielocal.com www.aws.com admin.imobielocal.com static-heic.imobie.com" >> /etc/hosts
composer config --global --auth http-basic.repo.packagist.com imobie 1ccb1a5343530c3dcb65163818cf147f0575e21c75c413e49e8c52c45f05
exec   crond & php-fpm & /usr/bin/supervisord -n -c /etc/supervisord.conf
