# !/bin/bash

# Get the current IP address for the active network interface
# This script handles both WiFi and wired connections

# Update for Mac Sequoia 15.6+, ipconfig getsummary dont show NetworkID and SSID anymore
# https://github.com/noperator/wifi-unredactor

update_ip() {
  # Get the active network interface (the one with default route)
  ACTIVE_INTERFACE=$(route -n get default | grep interface | awk '{print $2}')
  # If no active interface found, show disconnected
	if [ -z "$ACTIVE_INTERFACE" ]; then
    	NETWORK_NAME="Disconnected"
    	#IP_ADDRESS="Disconnected"
  	else
  # Try to get the WiFi SSID using ipconfig getsummary
    #NETWORK_NAME=$(ipconfig getsummary "$ACTIVE_INTERFACE" | grep ' SSID ' | awk -F' : ' '{print $2}' | tr -d '"')
    	NETWORK_NAME=$(~/Applications/wifi-unredactor.app/Contents/MacOS/wifi-unredactor | grep '"ssid" :' | awk -F' : ' '{print $2}' | tr -d '",')
    	IP_ADDRESS=$(ipconfig getifaddr "$ACTIVE_INTERFACE")

    # If no SSID found, assume wired connection
		if [ -z "$NETWORK_NAME" ]; then
			NETWORK_NAME="Wired"
		fi
		if [ -z "$IP_ADDRESS" ]; then
			IP_ADDRESS="No IP"
		fi
	fi

	sketchybar --set "$NAME" icon="􀙇" label="$NETWORK_NAME"
	# sketchybar --set "$NAME" icon="􀙇" label="$IP_ADDRESS"
}

# Main logic for sketchybar events
case "$SENDER" in
"wifi_change") update_ip ;;
"routine") update_ip ;;
"forced") update_ip ;;
*) update_ip ;;
esac