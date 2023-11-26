#!/usr/bin/with-contenv bashio

readonly config_dir="/config"
readonly settings_file="$config_dir/settings.json"

if ! bashio::fs.file_exists "$settings_file"; then
    bashio::log.info 'First run! Initializing Transmission settings.json in the addon_configs folder.'

    cat > "$settings_file" <<'EOF'
{
    "rpc-whitelist": "172.30.32.2",
    "rpc-host-whitelist-enabled": false,
    "download-dir": "/share/download"
}
EOF
    bashio::log.info 'Setting initial whitelist to allow access to web UI from local network.'
fi

bashio::log.info 'Starting Transmission Daemon'
/usr/bin/transmission-daemon -g "$config_dir" -f
bashio::log.info 'Transmission Daemon stopped.'
