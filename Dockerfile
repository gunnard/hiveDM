FROM php:8.0-fpm

# Install system dependencies
RUN apt-get update && apt-get install -y git vim

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo_mysql

# Get latest Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Set working directory
COPY ./public /var/www
WORKDIR /var/www
