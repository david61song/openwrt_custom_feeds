#!/bin/sh

# Check if ultari is running
if ndsctl status &> /dev/null; then
  if [ "$(uci -q get ultari.@ultari[0].fwhook_enabled)" = "1" ]; then
    /etc/init.d/ultari restart
  fi
fi
