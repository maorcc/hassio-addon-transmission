# Home Assistant Add-on: Transmission

## Installation

Like other addons:

1. Add this repository to your Add-on Store using the link below. (Or manually add the repository `https://github.com/maorcc/hassio-addon-transmission` to your Home Assistant add-ons repositories list.)

[![Open your Home Assistant instance and show the add add-on repository dialog with a specific repository URL pre-filled.](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fmaorcc%2Fhassio-addon-transmission)

2. Find the "Transmission" add-on in the Home Assistant Add-on Store. Click on it, and click on the "INSTALL" button.

3. Turn on the **Show in sidebar** and **Start on boot** options.


## Configuration

### The Settings.json file

The Transmission settings are stored in the `settings.json` file that is located in the addon_config directory.

Two ways to change Transmission settings:

1. Most Transmission settings can be modified via the Transmission web UI. (Recommended)

2. Edit the settings.json file manually but only while the add-on is not running. Because on Transmission shutdown all the settings are automatically saved from memory.  (Security related settings cannot be changed in the web UI.) 

For full documentation on Transmission settings see the [Transmission Docs].

> <big>⚠️ IMPORTANT</big>
>
> Changes to the `settings.json` file should only be done when the add-on is stopped.  Otherwise your changes will be discarded.

### The default settings

Transmission would work fine with the default settings. But you can change the settings to your needs.

The default values in settings.json are similar to the default values that are described in the official [Transmission Docs], except for the following defaults:

1. `rpc-whitelist`="172.30.32.2". Do not change this value as this is the internal home assistant docker IP address.

2. `rpc-host-whitelist-enabled`=false. You can enable this if you also set the "rpc-host-whitelist" option to your Home Assistant host name.

3. `download-dir`="/share/download". This is where Transmission will put the files it downloads.  You can set it to any directory either under "/media" or under "/share".


## How to Use

The "Transmission" easy-to-use web UI is available on the Home Assistant sidebar.

If you do not see it on the sidebar, make sure the addon is running and that you have turned on the "Show in sidebar" option on the Add-on page.

You will find the files you downloaded with Transmission in "/share/download" (That is unless you have changed the `download-dir` settings) 

If you like this add-on, please ⭐ it on [github](https://github.com/maorcc/hassio-addon-transmission). Thank you! 🙏


## Support

Got questions?

You have several options to get them answered:

- The [Home Assistant Discord Chat Server][discord].
- The Home Assistant [Community Forum][forum].
- Join the [Reddit subreddit][reddit] in [/r/homeassistant][reddit]

In case you've found a bug, please [open an issue on our GitHub][issue].

To check what is the latest version of Transmission that can be supported by this addon, check what is the latest [Alpine version that is supported by Home Assistant Docker-Base](https://github.com/home-assistant/docker-base/pkgs/container/aarch64-base#base-images), then check in [alpinelinux.org](https://pkgs.alpinelinux.org/packages?name=transmission&branch=edge&repo=&arch=x86_64&origin=&flagged=&maintainer=) what version of Transmission is supported by that Alpine.

[discord]: https://discord.gg/9H9uwXXEhJ
[forum]: https://community.home-assistant.io
[issue]: https://github.com/maorcc/hassio-addon-transmission/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/maorcc/hassio-addon-transmission
[Transmission Docs]: https://github.com/transmission/transmission/blob/main/docs/Editing-Configuration-Files.md#options
