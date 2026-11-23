![](https://imgur.com/TFTzDud.png)

PlayerPoints is a plugin that allows management of a primary or secondary economy based around a point system. This is a continuation of the original PlayerPoints plugin by Blackixx which can be found [here](https://github.com/Mitsugaru/PlayerPoints).

### Documentation
Any and all information you need for the plugin should already be included [in our Wiki](https://github.com/Rosewood-Development/PlayerPoints/wiki)!

### Database password environment variable

When MySQL is enabled, PlayerPoints reads the database password from
`PLAYERPOINTS_DB_PASSWORD` in the server process environment. This overrides
`mysql-settings.user-password` in `config.yml`. If the variable is not set,
the configured password is used. An explicitly empty variable means an empty
password; spaces and special characters are preserved exactly.

On Windows, add `PLAYERPOINTS_DB_PASSWORD` under **System Properties > Advanced >
Environment Variables > System variables**. No changes to the server startup
script are needed. Restart the server and its launcher (or Windows service) so
the Java process inherits the variable. A system restart may be needed if the
service still inherits an older environment.

After setting the variable, you can clear `mysql-settings.user-password` to `''`
in `config.yml`. PlayerPoints does not save the environment password to this
file or log it. Changing the system variable requires restarting the server
process; a plugin reload cannot refresh the process environment.

### Distribution command restrictions

This distribution allows `give`, `giveall`, `import`, `importlegacy`, `convert`,
and balance increases through `set` only on server listening ports listed in
`BasePointsCommand.POINTS_INCREASE_PORTS` (currently `2000`). Edit that array and
rebuild the plugin to change the ports, for example `{2000, 2001}`. Container
deployments use the internal listening port, not the mapped external port.
On other ports, `set` can only keep or reduce an existing balance.
Blocked operations display `此功能在本分发版本未受Fairylands许可`, including
when `-s` is supplied. These restrictions also apply to console command senders.
Taking points, resetting balances, and player-to-player payments remain
available. The PlayerPoints API remains unchanged and can still add points.

### Obfuscated build

Run `gradlew.bat build` (Windows) or `./gradlew build` to produce
`build/libs/PlayerPoints-3.3.5-obfuscated.jar`. Install only this JAR in the server
plugins directory. The `-plain.jar` is not a standalone plugin distribution.
The unobfuscated shaded JAR is also retained for diagnostics.

ProGuard rules are in `proguard-rules.pro`. Public API signatures, events,
command annotations, parameter metadata, and bundled library names are retained.
Keep `build/obfuscation/mapping.txt` privately for decoding stack traces.

### Support
If there's anything we left out, you have a question, you want to report a bug, or anything else, please [join our Discord server](https://discord.gg/MgUsTBK).  We offer any and all support in our server.

### Server Compatibility
PlayerPoints is compatible with [Spigot](https://www.spigotmc.org/) and any forks.  We recommend using [Paper](https://papermc.io/) to run your server.  CraftBukkit servers will not be supported.

We support Minecraft versions 1.8.8 and newer.
