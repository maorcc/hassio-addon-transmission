#!/usr/bin/with-contenv bashio

readonly config_dir="$(bashio::config 'config_dir')"
readonly settings_file="$config_dir/settings.json"

bashio::log.info "Transmission configuration direcotry: $config_dir"
if ! bashio::fs.file_exists "$settings_file"; then
    bashio::log.info 'First run! Initializing configuration.'

    mkdir -p "$config_dir"
    cat > "$settings_file" <<'EOF'
{
    "rpc-whitelist": "172.30.32.2",
    "download-dir": "/share/download"
}
EOF
    bashio::log.info 'Setting initial whitelist to allow access to web UI from local network.'
fi


bashio::log.info 'Starting Transmission Daemon'
/usr/bin/transmission-daemon -g "$config_dir" -f
bashio::log.info 'Transmission Daemon stopped running.'
