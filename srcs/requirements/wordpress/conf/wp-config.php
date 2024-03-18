<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the installation.
 * You don't have to use the website, you can copy this file to "wp-config.php"
 * and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * Database settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://developer.wordpress.org/advanced-administration/wordpress/wp-config/
 *
 * @package WordPress
 */

// ** Database settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'mymaria' );

/** Database username */
define( 'DB_USER', '$_ENV['MYSQL_USER']' );

/** Database password */
define( 'DB_PASSWORD', '$_ENV['MYSQL_PASSWORD']' );

/** Database hostname */
define( 'DB_HOST', 'localhost' );

/** Database charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The database collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication unique keys and salts.
 *
 * Change these to different unique phrases! You can generate these using
 * the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}.
 *
 * You can change these at any point in time to invalidate all existing cookies.
 * This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'b$|!%+s=V[DC4*p?W4|jvo#:ck&f5w)&@%+b[h RRZ;{QB^}3=2+t{~PaIn/.74B');
define('SECURE_AUTH_KEY',  'Owq;k7fHVUh!B SF_e0b4vIN_.+ZHi*BSJFV Do__R-(<bW;UrC%WKYC|qS&{7t$');
define('LOGGED_IN_KEY',    ';ON%$%{kRYgm6%MYI7A>Z--J&v@0^@b}CJR)WU-:cn%G^xf1%oro_h8!;!U{/tz%');
define('NONCE_KEY',        'AR*{^$WN`^*/vls}Kf/?8a|:bTyydqYJ,U0fgV7^|ad09xWMbB VVa!L$>3^Wq9o');
define('AUTH_SALT',        'f*Mj;ER--|?$C8[iVL|]61slO}rr$7O&-frZ}G.QvT.[Y,Fq@Ff~mtS]tJT@aZ(D');
define('SECURE_AUTH_SALT', 'L3O2OkB:>cnD.sU_25N0Z+n+;CB 5{|#Qx`a,_FV%.j6uS[q^SND#b01F;x&jh:2');
define('LOGGED_IN_SALT',   '@6Iz}G_DBlI-HE-YA0%aDL$|-y2yF-&o3k+G[av^LM[RcOyzLgru{XyAGN;-bCSF');
define('NONCE_SALT',       'efWaO T08K^j14{o-4~bQ?2[ =}m2+Z{&?!OOAdHpNh]oi@}a|]f;`5_rP%GwH04');

/**#@-*/

/**
 * WordPress database table prefix.
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
 * visit the documentation.
 *
 * @link https://developer.wordpress.org/advanced-administration/debug/debug-wordpress/
 */
define( 'WP_DEBUG', false );

/* Add any custom values between this line and the "stop editing" line. */



/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';
