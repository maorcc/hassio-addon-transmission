# Home Assistant Add-on: Transmission

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Settings** -> **Add-ons** -> **Add-on store**.
2. Add this github repository to your list of add-ons repositories
3. Find the "Transmission" add-on and click it.
4. Click on the "INSTALL" button.

## How to use

1. Start the add-on.
2. On first run, the add-on will create a Transmission config directory on /share.
3. By default the Transmission web UI runs on port 9091.
4. Use the samba addon (or alternatives) to edit the settings.json file.  See add-on log for exact location.
5. Restart the add-on.

## Configuration
All Transmission settings are stored in the `settings.json` file that is found in the config directory.

Most Transmission settings can be changed via its web UI.  On Transmission shutdown all the settings are saved to the settings.json file.
So remember to stop the add-on before making any manual changes to the settings.json file, or your manual changes may be lost.

You can change the location of the configuration directory in the add-on configuration page.  If you change the configuration directory after running the add-on, your old settings will not automatically move from the old to the new directory.  You may need to copy any configuration manually.

### Default Settings
This add-on uses transmission default settings except for the followings

1. `rpc-whitelist` and `rpc-host-whitelist` also includes local network values, so that the UI would be accessible by default from the local network.
2. `download-dir` is set by default to "/share/download"

## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository