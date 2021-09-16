EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Raspberry_Pi_2_3 J?
U 1 1 614A2C6B
P 4200 3950
AR Path="/614A2C6B" Ref="J?"  Part="1" 
AR Path="/6148E1AC/614A2C6B" Ref="J?"  Part="1" 
F 0 "J?" H 4200 5431 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 4200 5340 50  0000 C CNN
F 2 "" H 4200 3950 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 4200 3950 50  0001 C CNN
	1    4200 3950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614A2C71
P 3650 5500
AR Path="/614A2C71" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C71" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 3650 5250 50  0001 C CNN
F 1 "GND" H 3655 5327 50  0000 C CNN
F 2 "" H 3650 5500 50  0001 C CNN
F 3 "" H 3650 5500 50  0001 C CNN
	1    3650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 5500 3650 5250
Wire Wire Line
	3650 5250 3800 5250
Wire Wire Line
	3800 5250 3900 5250
Connection ~ 3800 5250
Wire Wire Line
	3900 5250 4000 5250
Connection ~ 3900 5250
Wire Wire Line
	4000 5250 4100 5250
Connection ~ 4000 5250
Wire Wire Line
	4100 5250 4200 5250
Connection ~ 4100 5250
Wire Wire Line
	4200 5250 4300 5250
Connection ~ 4200 5250
Wire Wire Line
	4300 5250 4400 5250
Connection ~ 4300 5250
Wire Wire Line
	4400 5250 4500 5250
Connection ~ 4400 5250
$Comp
L power:+5V #PWR?
U 1 1 614A2C87
P 3700 2400
AR Path="/614A2C87" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C87" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 3700 2250 50  0001 C CNN
F 1 "+5V" H 3715 2573 50  0000 C CNN
F 2 "" H 3700 2400 50  0001 C CNN
F 3 "" H 3700 2400 50  0001 C CNN
	1    3700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2400 3700 2650
Wire Wire Line
	3700 2650 4000 2650
Wire Wire Line
	4000 2650 4100 2650
Connection ~ 4000 2650
$Comp
L power:+3.3V #PWR?
U 1 1 614A2C91
P 4700 2400
AR Path="/614A2C91" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C91" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 4700 2250 50  0001 C CNN
F 1 "+3.3V" H 4715 2573 50  0000 C CNN
F 2 "" H 4700 2400 50  0001 C CNN
F 3 "" H 4700 2400 50  0001 C CNN
	1    4700 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2400 4700 2650
Wire Wire Line
	4700 2650 4400 2650
Wire Wire Line
	4300 2650 4400 2650
Connection ~ 4400 2650
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 614A2C9B
P 7050 3450
AR Path="/614A2C9B" Ref="J?"  Part="1" 
AR Path="/6148E1AC/614A2C9B" Ref="J?"  Part="1" 
F 0 "J?" H 7100 3867 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 7100 3776 50  0000 C CNN
F 2 "" H 7050 3450 50  0001 C CNN
F 3 "~" H 7050 3450 50  0001 C CNN
	1    7050 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 614A2CA1
P 7600 2900
AR Path="/614A2CA1" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CA1" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 7600 2750 50  0001 C CNN
F 1 "+5V" H 7615 3073 50  0000 C CNN
F 2 "" H 7600 2900 50  0001 C CNN
F 3 "" H 7600 2900 50  0001 C CNN
	1    7600 2900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 614A2CA7
P 6450 2950
AR Path="/614A2CA7" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CA7" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 6450 2800 50  0001 C CNN
F 1 "+3.3V" H 6465 3123 50  0000 C CNN
F 2 "" H 6450 2950 50  0001 C CNN
F 3 "" H 6450 2950 50  0001 C CNN
	1    6450 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 2900 7600 3250
Wire Wire Line
	7600 3250 7350 3250
Wire Wire Line
	7350 3350 7600 3350
Wire Wire Line
	7600 3350 7600 3250
Connection ~ 7600 3250
Wire Wire Line
	6850 3250 6450 3250
Wire Wire Line
	6450 3250 6450 2950
$Comp
L power:GND #PWR?
U 1 1 614A2CB4
P 7100 4050
AR Path="/614A2CB4" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CB4" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 7100 3800 50  0001 C CNN
F 1 "GND" H 7105 3877 50  0000 C CNN
F 2 "" H 7100 4050 50  0001 C CNN
F 3 "" H 7100 4050 50  0001 C CNN
	1    7100 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 4000 7650 3450
Wire Wire Line
	7650 3450 7350 3450
Wire Wire Line
	7650 4000 7100 4000
Wire Wire Line
	7100 4000 7100 4050
Wire Wire Line
	7100 4000 6500 4000
Wire Wire Line
	6500 4000 6500 3650
Wire Wire Line
	6500 3650 6850 3650
Connection ~ 7100 4000
Wire Wire Line
	5200 4750 5000 4750
Wire Wire Line
	5200 4650 5000 4650
Wire Wire Line
	3200 4150 3400 4150
Wire Wire Line
	3200 4250 3400 4250
Text HLabel 5200 4650 2    50   Output ~ 0
LED0
Text HLabel 5200 4750 2    50   Output ~ 0
LED1
Text HLabel 3200 4150 0    50   Output ~ 0
LED_EN0
Text HLabel 3200 4250 0    50   Output ~ 0
LED_EN1
Wire Wire Line
	5000 3350 6850 3350
Wire Wire Line
	5000 3450 6850 3450
Text HLabel 9450 5000 2    50   Output ~ 0
RS232_TX
Text HLabel 9450 5100 2    50   Input ~ 0
RS232_RX
$EndSCHEMATC
