<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'eassouli' );

/** MySQL database password */
define( 'DB_PASSWORD', 'ACnh713!' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'TkEA*#tD_GSlU([Si;@68R+Hd/;/0!J uVF:tpjL~A*jsfaY U|Z#i@=tgc8~9V>');
define('SECURE_AUTH_KEY',  '1s9,>uH]>@)Ip1@Lk+_SWvtclMQ&8_P-.W-$?*C}h~_Yf=kP5R<u8v0b]LNm=6(M');
define('LOGGED_IN_KEY',    ']vRzIg>oVRo[-/vyPiaxTHU5i rKA-/0ps0PG=X7S@-vP9q3g:^0 ]q1|}^E%C{5');
define('NONCE_KEY',        '/Xri81hlB@ea]TY:|x~^Ih?bXz8+d>3Vp}&$9?]&x$HzU]`5C>N1~$/miw-OJ)Lu');
define('AUTH_SALT',        ':|qGsB)88WzL|k5_ [3|W-CaQc<Az}[(/!*[`I[+_-t,z3.9GkU?vhyLjAaI^6iN');
define('SECURE_AUTH_SALT', '4:a>2i<%oNP,w]>Ys+`@;-g,ShqDLI|JXn`Di$V44T}.WK_9W!ZNq<qxQs[bU$ER');
define('LOGGED_IN_SALT',   '*wh9d?Ui|F!.8Da(cF;[$ZK1w61>/}{D<&u j8nWN&hxU%lYI4T_~&<c9/wWE=9]');
define('NONCE_SALT',       '_Le)@KrT7!H`[@G~8]3Qus1Kw2#%obI5T8&4:`|9RTLg>Q.I%U(hbVhw6p qW#- ');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
        define( 'ABSPATH', dirname( __FILE__ ) . '/' );
}

/** Sets up WordPress vars and included files. */
require_once( ABSPATH . 'wp-settings.php' );