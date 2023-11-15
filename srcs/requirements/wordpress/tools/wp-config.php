
<?php
define( 'DB_NAME', 'wordpress' );
define( 'DB_USER', 'essadike');
define( 'DB_PASSWORD', '12345');
define( 'DB_HOST', 'mariadb' );
define( 'DB_CHARSET', 'utf8' );
define( 'DB_COLLATE', '' );
define('WP_CACHE', true);
define('WP_CACHE_KEY_SALT', 'saddik@gmail.com');
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', 6379);
define('WP_REDIS_TIMEOUT', 1);
define('WP_REDIS_READ_TIMEOUT', 1);
define('WP_REDIS_DATABASE', 0);
define('AUTH_KEY', "...");
$table_prefix = 'wp_';
define( 'WP_DEBUG', false );
if ( ! defined( 'ABSPATH' ) ) 
{
    define( 'ABSPATH', '/var/www/html' );
    require_once ABSPATH . 'wp-settings.php';
}
?>