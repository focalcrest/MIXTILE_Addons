#!/usr/bin/with-contenv bashio
# 定义颜色
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color


echo -e "${GREEN}MIXTILE${NC}"

# 检查设备路径
if bashio::config.has_value 'device'; then
    echo -e "${GREEN}Flashing device:$(bashio::config 'device')${NC}"
else
    echo -e "${RED}Error:Device path error,Program terminated${NC}"
    exit 1
fi
#检查波特率 此插件无用
if bashio::config.has_value 'bootloader_baudrate'; then
    echo -e "${GREEN}Bootloader baudrate:$(bashio::config 'bootloader_baudrate')${NC}"
else
    echo -e "${RED}Error:Bootloader baudrate error,Program terminated${NC}"
    exit 1
fi
#检查地区
if bashio::config.has_value 'rf_region'; then
    echo -e "${GREEN}Rf Region:$(bashio::config 'rf_region')${NC}"
else
    echo -e "${RED}Error:}Rf Region error,Program terminated${NC}"
    exit 1
fi
echo -e "${GREEN}Setting Rf Region,Please Wait about 10 second${NC}"

if [ "$(bashio::config 'rf_region')" == "Europe" ]; then
    my_var="0105000B4000B1"
    echo -e "${GREEN}Europe code${NC}"
elif [ "$(bashio::config 'rf_region')" == "US" ]; then
    my_var="0105000B4001B0"
    echo -e "${GREEN}US code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Australia/New Zealand" ]; then
    my_var="0105000B4002B3"
    echo -e "${GREEN}Australia/New Zealand code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Hong Kong" ]; then
    my_var="0105000B4003B2"
    echo -e "${GREEN}Hong Kong code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Malaysia" ]; then
    my_var="0105000B4004B5"
    echo -e "${GREEN}Malaysia code${NC}"
elif [ "$(bashio::config 'rf_region')" == "India" ]; then
    my_var="0105000B4005B4"
    echo -e "${GREEN}India code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Isarel" ]; then
    my_var="0105000B4006B7"
    echo -e "${GREEN}Isarel code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Russia" ]; then
    my_var="0105000B4007B6"
    echo -e "${GREEN}Russia code${NC}"
elif [ "$(bashio::config 'rf_region')" == "China" ]; then
    my_var="0105000B4008B9"
    echo -e "${GREEN}China code${NC}"
elif [ "$(bashio::config 'rf_region')" == "US LongRange" ]; then
    my_var="0105000B4009B8"
    echo -e "${GREEN}US LongRange code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Japan" ]; then
    my_var="0105000B402091"
    echo -e "${GREEN}Japan code${NC}"
elif [ "$(bashio::config 'rf_region')" == "Korea" ]; then
    echo -e "${GREEN}Korea code${NC}"
    my_var="0105000B402190"
else
    my_var="0105000B4000B1"
    echo -e "${RED}Default code${NC}"
fi


python3 setregion.py $(bashio::config 'device') $my_var

#EU
# 0105000B4000B1
#US
# 0105000B4001B0
#ANZ
# 0105000B4002B3
#HK
# 0105000B4003B2
#Malaysia
# 0105000B4004B5
#India
# 0105000B4005B4
#Israel
# 0105000B4006B7
#Russia
# 0105000B4007B6
#China
# 0105000B4008B9
#US LR
# 0105000B4009B8
#Japan
# 0105000B402091
#Korea
# 0105000B402190