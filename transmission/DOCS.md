# Home Assistant Add-on: Transmission

## Installation

Regular steps for installing an add-on:

1. Add this repository to your Add-on Store.  The easy way is to click this **[ link ](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fmaorcc%2Fhassio-addon-transmission)** that will open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled. Alternatively you can manually add the repository `https://github.com/maorcc/hassio-addon-transmission` to your Home Assistant add-ons repositories list.

2. Go to the Home Asistant **Add-on store**.

3. Find the "Transmission" add-on and click on it.

4. Click on the "INSTALL" button.

5. Turn on the **Show in sidebar** and **Start on boot** options.


## Configuration

### Confguration directory (aka `config-dir``)

In the add-on **Configuration** page you can specify the *config-dir*. Default=**/config/transmission**

The config-dir contains files and subdirectories that are used as the "database" of Transmission.  Transmission reads this folder content on startup and saves it on shutdown.

If the config-dir empty or does not exist, the add-on will create it and fill it with its default settings.

You can change the config-dir folder location in the add-on configuration page.  But if you change it after running the add-on, your settings will not automatically move from the old to the new location.  If you want your old configuration then you need to copy the relevant files manually.

### The Settings.json file

The Transmission settings are stored in the `settings.json` file that is located in the config-dir.

Two ways to change Transmission settings:

1. Most Transmission settings can be changed via the Transmission web UI. (Recommended)

2. Edit the settings.json file manually but only while the add-on is not running. Because on Transmission shutdown all the settings are automatically saved from memory.  (Security related settings cannot be changed in the web UI.) 

For full documentation on Transmission settings see the [Transmission Docs].

> <big>⚠️ IMPORTANT</big>
>
> Changes to the `settings.json` file should only be done when the add-on is stopped.  Otherwise your changes will be discarded.

### The default settings

This add-on sets transmission default settings in settings.json as described in the official [Transmission Docs], except for the followings:

1. `rpc-whitelist`="172.30.32.2".  This is an internal docker IP address. Do not change this value.

2. `rpc-host-whitelist-enabled`=false. You can enable this if you also set the "rpc-host-whitelist" option to your Home Assistant host name.

3. `download-dir`="/share/download". This is where Transmission will put the files it downloadeds.  You can set it to any directory name either under "/media" or under "/share".


## How to Use

The "Transmission" easy to use web UI is available on the Home Assistant sidebar.

If you do not see it on the sidebar, make sure the addon is running and that you turned on the "Show in sidebar" option in the Add-on page.

If you like this add-on, please ⭐ it on [github](https://github.com/maorcc/hassio-addon-transmission). Thank you! 🙏


## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/9H9uwXXEhJ
[forum]: https://community.home-assistant.io
[issue]: https://github.com/maorcc/hassio-addon-transmission/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/maorcc/hassio-addon-transmission
[Transmission Docs]: https://github.com/transmission/transmission/blob/main/docs/Editing-Configuration-Files.md#options