## Run with self sign trusted certificate

> Better options to use mkcert instead of openssl because your browser will trust the cert automatically.

### Once on the system do after installation.

```bash
mkcert -install
```

### Generate a new certificate

```bash
mkcert nginx/certs/drupal.local
```

Add this line into ``/etc/hosts``:

```bash
127.0.0.1   drupal.local
```

> edit settings.php at **/opt/drupal/web/sites/default/settings.php** by adding this for urls and redis config ``AFTER`` Enable it.

```php
$settings['trusted_host_patterns'] = [
  '^drupal\.local$',
];

/**
 * Configuration Redis for the cache
**/
try {
  $redis = new Redis();
  $redis->connect('Redis');
  if ($redis->IsConnected()) {
    $redis->auth(NULL);
    $response = $redis->ping();
    if ($response) {
      # Configuration Redis for the cache
      $settings['redis.connection']['host'] = 'redis';
      $settings['redis.connection']['password'] = NULL;
      $settings['redis.connection']['instance'] = 'cache';
      $settings['redis.connection']['interface'] = 'PhpRedis';
      $settings['cache']['default'] = 'cache.backend.redis';
      $settings['container_yamls'][] = 'modules/contrib/redis/example.services.yml';
      $conf['redis_perm_ttl'] = 2592000;
      $settings['redis_compress_length'] = 100;
      $settings['redis_compress_level'] = 3;
    }
  }
} catch (Exception $e) {
}
```