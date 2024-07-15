# Home Assistant Add-on: Silicon Labs Flasher Add-on

## Installation

Follow these steps to get the add-on installed on your system:

1. Navigate in your Home Assistant frontend to **Settings** -> **Add-ons, Backup & Supervisor** -> **Add-on Store**.
2. Find the "Silicon Labs Flasher" add-on and click it.
3. Click on the "INSTALL" button.

## Get Firmware

All the edge2 firmware will update on https://github.com/focalcrest/Mixtile-EDGE2-Firmware.Choose 
Select the firmware that suits you and just copy the RAW link.


## How to use

1. Select the correct `device` in the add-on configuration tab.
2. Get the required firmware link on GitHub,paste the link into the Firmware URL.
3. Press Save.
2. Start the add-on.

## Configuration

Add-on configuration:

| Configuration      | Description                                            |
|--------------------|--------------------------------------------------------|
| device (mandatory) | Serial service where the Silicon Labs radio is attached |
| baudrate           | Serial port baudrate (depends on firmware)   |
| flow_control       | If hardware flow control should be enabled (depends on firmware) |
| firmware_url       | Custom URL to flash firmware from                      |

## Support

In case you've found a bug, please [open an issue on our GitHub][issue].

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues
