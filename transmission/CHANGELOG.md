
# Change Log
All notable changes to this project are documented in this file.
 
The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).
 
## [1.2.4] - 2024-02-08
  
Upgrade Transmission from v4.0.4 to v4.0.5.

## [1.2.3] - 2023-11-27
  
Use docker images for faster and more reliable installations of this addon.

### changes
None.


## [1.2.0] - 2023-11-26
  
Removed the option to configure the Transmission config-dir. This parameter is now hard coded to be the new
`addon_config` folder. 

### Breaking Changes
If you upgrade from a previous version, you may need to copy your old configuration from its previous location.  
By default the location was at `/config/transmission`

### changes
There is no option to change the config-dir anymore.


## [1.1.0] - 2023-11-26
  
Use "/addon_config" instead of "/config" as the default location of Transmission's config-dir.

This change is the result of the recent Home Assistant changes published here: https://developers.home-assistant.io/blog/2023/11/06/public-addon-config/

### Breaking Changes
If you upgrade from v1.0.0 then you need to change the config-dir in the addon configuration from the old
default value 

### changes
1. This addon no longer has access to the "/config" folder. Use "/addon_config" instead
2. Minimum version of Home Assistant for this addon is "2023.11.3".

  

## [1.0.0] - 2023-11-25
  
Initial release, with Transmission v4.0.4

### Added
Fully functional Transmission daemon add-on, including its easy to use web UI inside the Home Assistant.

### Changed
  