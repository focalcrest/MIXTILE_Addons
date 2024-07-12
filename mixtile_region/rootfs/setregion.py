
import serial
import time
import sys

def main(baudrate):
    if len(sys.argv) != 3:
        print("Usage: python example_sys_argv.py <arg1> <arg2>")
        sys.exit(1)
    try:
        arg1 = sys.argv[1]
        arg2 = sys.argv[2]
        print(f"PATH      : {arg1}")
        print(f"REGION    : {arg2}")
        
        # 打开串口
        ser = serial.Serial(arg1, baudrate, timeout=1)
        print(f"Opened port {arg1} at baudrate {baudrate}")

        # 将十六进制字符串转换为字节数据
        hex_data = bytes.fromhex(arg2)
        reset_data = bytes.fromhex(hex_string2)
        check_data = bytes.fromhex(hex_string1)

        # 发送数据
        #set region
        ser.write(hex_data)
        # print(f"set region: {arg2}")
        print(f"set region")
        response = ser.read(1024)  # 读取最多1024字节的数据
        if response:
            # print(f"Received2 data: {response.hex()}")
            print("data received")
        else:
            print("No data received")
        time.sleep(2)
        #set region
        ser.write(hex_data)
        # print(f"set region: {arg2}")
        print(f"set region")
        response = ser.read(1024)  # 读取最多1024字节的数据
        if response:
            # print(f"Received2 data: {response.hex()}")
            print("data received")
        else:
            print("No data received")
        time.sleep(2)
        #reset
        ser.write(reset_data)
        print(f"reset: {hex_string2}")
        print(f"reset")
        response1 = ser.read(1024)  # 读取最多1024字节的数据
        if response1:
            # print(f"Received3 data: {response1.hex()}")
            print("data received")
        else:
            print("No data received")
        time.sleep(3)
        attempts = 0
        while True:
            ser.write(check_data)
            print(f"check")
            # print(f"check: {hex_string1}")
            response2 = ser.read(1024)  # 读取最多1024字节的数据
            # print(f"Received data: {response2.hex()}")
            print(f"Received data")
            value1 = response2[-4]
            value2 = response2[-3]
            value3 = response2[-2]
            if value1 == 0x0b and value2 == 0x20:
                print("Read Region")
                if value3 == hex_data[-2]:
                    print("\033[0;32mset Region succ\033[0m")
                else:
                    print("\033[0;31mset Region faild,please retry\033[0m")
                break
            else:
                time.sleep(2)

            attempts += 1
            if attempts > 4:
                print("\033[0;31mset Region faild,please retry\033[0m")
                break



    finally:
        # 关闭串口
        ser.close()
        print(f"Closed port {arg1}")



        




if __name__ == "__main__":
    # 配置串口参数
    baudrate = 115200      # 根据实际情况修改波特率
    hex_string1 ='0104000B20D0'  # 要发送的十六进制数据
    hex_string2= '01030008F4'  # 要发送的十六进制数据

    main(baudrate)
