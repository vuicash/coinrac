Sample init scripts and service configuration for coinracd
==========================================================

Sample scripts and configuration files for systemd, Upstart and OpenRC
can be found in the contrib/init folder.

    contrib/init/coinracd.service:    systemd service unit configuration
    contrib/init/coinracd.openrc:     OpenRC compatible SysV style init script
    contrib/init/coinracd.openrcconf: OpenRC conf.d file
    contrib/init/coinracd.conf:       Upstart service configuration file
    contrib/init/coinracd.init:       CentOS compatible SysV style init script

1. Service User
---------------------------------

All three Linux startup configurations assume the existence of a "coinraccore" user
and group.  They must be created before attempting to use these scripts.
The OS X configuration assumes coinracd will be set up for the current user.

2. Configuration
---------------------------------

At a bare minimum, coinracd requires that the rpcpassword setting be set
when running as a daemon.  If the configuration file does not exist or this
setting is not set, coinracd will shutdown promptly after startup.

This password does not have to be remembered or typed as it is mostly used
as a fixed token that coinracd and client programs read from the configuration
file, however it is recommended that a strong and secure password be used
as this password is security critical to securing the wallet should the
wallet be enabled.

If coinracd is run with the "-server" flag (set by default), and no rpcpassword is set,
it will use a special cookie file for authentication. The cookie is generated with random
content when the daemon starts, and deleted when it exits. Read access to this file
controls who can access it through RPC.

By default the cookie is stored in the data directory, but it's location can be overridden
with the option '-rpccookiefile'.

This allows for running coinracd without having to do any manual configuration.

`conf`, `pid`, and `wallet` accept relative paths which are interpreted as
relative to the data directory. `wallet` *only* supports relative paths.

For an example configuration file that describes the configuration settings,
see `contrib/debian/examples/coinrac.conf`.

3. Paths
---------------------------------

3a) Linux

All three configurations assume several paths that might need to be adjusted.

Binary:              `/usr/bin/coinracd`  
Configuration file:  `/etc/coinraccore/coinrac.conf`  
Data directory:      `/var/lib/coinracd`  
PID file:            `/var/run/coinracd/coinracd.pid` (OpenRC and Upstart) or `/var/lib/coinracd/coinracd.pid` (systemd)  
Lock file:           `/var/lock/subsys/coinracd` (CentOS)  

The configuration file, PID directory (if applicable) and data directory
should all be owned by the coinraccore user and group.  It is advised for security
reasons to make the configuration file and data directory only readable by the
coinraccore user and group.  Access to coinrac-cli and other coinracd rpc clients
can then be controlled by group membership.

3b) Mac OS X

Binary:              `/usr/local/bin/coinracd`  
Configuration file:  `~/Library/Application Support/CoinracCore/coinrac.conf`  
Data directory:      `~/Library/Application Support/CoinracCore`
Lock file:           `~/Library/Application Support/CoinracCore/.lock`

4. Installing Service Configuration
-----------------------------------

4a) systemd

Installing this .service file consists of just copying it to
/usr/lib/systemd/system directory, followed by the command
`systemctl daemon-reload` in order to update running systemd configuration.

To test, run `systemctl start coinracd` and to enable for system startup run
`systemctl enable coinracd`

4b) OpenRC

Rename coinracd.openrc to coinracd and drop it in /etc/init.d.  Double
check ownership and permissions and make it executable.  Test it with
`/etc/init.d/coinracd start` and configure it to run on startup with
`rc-update add coinracd`

4c) Upstart (for Debian/Ubuntu based distributions)

Drop coinracd.conf in /etc/init.  Test by running `service coinracd start`
it will automatically start on reboot.

NOTE: This script is incompatible with CentOS 5 and Amazon Linux 2014 as they
use old versions of Upstart and do not supply the start-stop-daemon utility.

4d) CentOS

Copy coinracd.init to /etc/init.d/coinracd. Test by running `service coinracd start`.

Using this script, you can adjust the path and flags to the coinracd program by
setting the COINRACD and FLAGS environment variables in the file
/etc/sysconfig/coinracd. You can also use the DAEMONOPTS environment variable here.

4e) Mac OS X

Copy org.coinrac.coinracd.plist into ~/Library/LaunchAgents. Load the launch agent by
running `launchctl load ~/Library/LaunchAgents/org.coinrac.coinracd.plist`.

This Launch Agent will cause coinracd to start whenever the user logs in.

NOTE: This approach is intended for those wanting to run coinracd as the current user.
You will need to modify org.coinrac.coinracd.plist if you intend to use it as a
Launch Daemon with a dedicated coinraccore user.

5. Auto-respawn
-----------------------------------

Auto respawning is currently only configured for Upstart and systemd.
Reasonable defaults have been chosen but YMMV.
