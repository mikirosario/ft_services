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
define( 'WP_SITEURL', 'http://192.168.99.202:5050' );
define( 'WP_HOME', 'http://192.168.99.202:5050/' );

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'wordpress' );

/** MySQL database username */
define( 'DB_USER', 'root' );

/** MySQL database password */
define( 'DB_PASSWORD', 'pass' );

/** MySQL hostname */
define( 'DB_HOST', 'mysql.default.svc.cluster.local:3306' );

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
define('AUTH_KEY',         '{udX,&C%t#h@=Q+QY> |d=$E?/D6@V{+-j)Jnj[ctZzoWp-0|S&lh,Z:{M!XexW~');
define('SECURE_AUTH_KEY',  '+aX97z9/S?;egd}t{rH7)A3Zm;;YD&;7M-IHHLmS1tY[!mRb_Ul{+l@Z^2}|9Tm_');
define('LOGGED_IN_KEY',    '6ojSSf_A8W5?29dQ4ZyTq_#B::#~yy;7L2Ouf/O=Ci9}fd.7d6qo-PDh8<j3(t&|');
define('NONCE_KEY',        'l[C8oMh;`&[(K9E.q_-w3{|b(v~V-keRn,1Wn_,*RjXv>D_gwvLk`M^z!(D[tf4g');
define('AUTH_SALT',        '-xZ(T,>:}]?4%MB8;BrNiV?m~?-cL2mnc+U^=3>vc308:|9j+?2e;yT+TFe2tWd4');
define('SECURE_AUTH_SALT', 'P5{JS:{+%L%Mhmn,z~e!0cXF)x?J:gZwfPJ/vxE<Qr}]HL}C8zn}suISk1*;+91Q');
define('LOGGED_IN_SALT',   'S[wfSR>JBL8c T$E6/nNddjJGC8,-[w}kywo c,!z%($RUi`S,L4rd_bil4z1pby');
define('NONCE_SALT',       'be0cXY?Wz@8#1.c&NLmQuVZ4t`*j<D-fg8puyt?J&>!.bc+hc!u@q$#E=EUv1%W-');

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
