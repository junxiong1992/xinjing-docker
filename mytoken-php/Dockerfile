FROM centos:7
RUN \
yum install -y https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-EPEL-7 && \
yum install -y http://rpms.famillecollet.com/enterprise/remi-release-7.rpm && \
curl -O -J http://rpms.remirepo.net/RPM-GPG-KEY-remi && \
rpm --import RPM-GPG-KEY-remi && \
export LC_ALL=en_US.UTF-8 && \
export LANG=en_US.UTF-8 && \
yum install -y \
git \
php72 \
php72-php-common \
php72-php-fpm \
php72-php-cli \
php72-php-gmp \
php72-php-apcu \
php72-php-bcmath \
php72-php-mbstring \
php72-php-xml \
php72-php-gd \
php72-php-pecl-mcrypt \
php72-php-pecl-zip \
php72-php-pecl-yaf \
php72-php-pecl-redis \
php72-php-pecl-mysql \
php72-php-pecl-mongodb \
php72-php-pecl-rdkafka \
php72-php-pecl-swoole2 \
php72-php-pecl-xdebug \
&& \
echo "yaf.use_namespace=1" >> /etc/opt/remi/php72/php.ini && \
echo "yaf.use_spl_autoload=1" >> /etc/opt/remi/php72/php.ini && \
ln -sf /opt/remi/php72/root/bin/php /usr/bin/php && \
ln -sf /opt/remi/php72/root/sbin/php-fpm /usr/sbin/php-fpm && \
curl -o /usr/bin/composer -J https://getcomposer.org/download/1.6.3/composer.phar && \
chmod +x /usr/bin/composer
