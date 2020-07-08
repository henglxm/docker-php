#!/bin/sh
echo "172.17.0.1 cloud.imobielocal.com account.imobielocal.com manager.imobielocal.com heic.imobielocal.com anyget.imobielocal.com anytrans.imobile.com convert.imobielocal.com share.imobielocal.com anytrans.imobielocal.com www.aws.com admin.imobielocal.com static-heic.imobie.com pass.imobielocal.com" >> /etc/hosts
exec   crond & php-fpm & /usr/bin/supervisord -n -c /etc/supervisord.conf
