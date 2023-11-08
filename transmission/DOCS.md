# Home Assistant Add-on: Transmission

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Settings** -> **Add-ons** -> **Add-on store**.
2. Click the three dots on the top right corner and select **Repositories**.
2. Add the repository `https://github.com/maorcc/hassio-addon-transmission` to your list of add-ons repositories.
3. Exit back to the **Add-on store**.
3. Find the "Transmission" add-on and click it.
4. Click on the "INSTALL" button.

## Configuration
### Confguration directory
In the add-on **Configuration** page you can specify the location of the Transmission Configuration directory.
That configuration directory contains files and subdirectories that are used as the "database" of Transmission.  Transmission reads this folder on startup and saves it on shutdown.  You can change the settings using the Transmission web UI or by editing the files while the Transmission add-on is stopped.

As said, you can change the location of the configuration directory in the add-on configuration page.  But if you change the configuration directory after running the add-on, your old settings will not automatically move from the old to the new configuration directory.  If you want your old configuration then you need to copy the relevant files manually.


### The Settings.json file
Most Transmission settings are stored in the `settings.json` file that is found in the configuration directory.

Two ways to change Transmission settings:
1. Most Transmission settings can be changed via its web UI. (Recommended)
2. Edit the settings.json file manually but only while the add-on is not running. Because on Transmission shutdown all the settings are automatically saved from memory.  (Security related settings cannot be changed using the web UI.) 

For full documentation on Transmission options see the [Transmission Docs].

### Modified Default Settings
This add-on uses transmission default settings as described in the [Transmission Docs], except for the followings:
1. `rpc-whitelist` and `rpc-host-whitelist` also includes local network values, so that the UI would be accessible by default from the local network. You can change these settings only by manually editing the settings.json file.
2. `download-dir` is set by default to "/share/download".  This can be changed using the web UI.

## How to use

1. Start the add-on.
2. On first run, the add-on will create a Transmission Config Directory and fill it up with the default settings.
3. Access the Transmission Web UI clicking the "OPEN WEB UI" button on the add-on page.

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/maorcc/hassio-addon-transmission/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/maorcc/hassio-addon-transmission
[Transmission Docs]: https://github.com/transmission/transmission/blob/main/docs/Editing-Configuration-Files.md#options