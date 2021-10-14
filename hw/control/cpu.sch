EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 13
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "CPU Interface"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR?
U 1 1 614A2C71
P 5950 5200
AR Path="/614A2C71" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C71" Ref="#PWR0314"  Part="1" 
F 0 "#PWR0314" H 5950 4950 50  0001 C CNN
F 1 "GND" H 5955 5027 50  0000 C CNN
F 2 "" H 5950 5200 50  0001 C CNN
F 3 "" H 5950 5200 50  0001 C CNN
	1    5950 5200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 614A2C87
P 6000 2100
AR Path="/614A2C87" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C87" Ref="#PWR0310"  Part="1" 
F 0 "#PWR0310" H 6000 1950 50  0001 C CNN
F 1 "+5V" H 6015 2273 50  0000 C CNN
F 2 "" H 6000 2100 50  0001 C CNN
F 3 "" H 6000 2100 50  0001 C CNN
	1    6000 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 614A2C91
P 7000 2100
AR Path="/614A2C91" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C91" Ref="#PWR0311"  Part="1" 
F 0 "#PWR0311" H 7000 1950 50  0001 C CNN
F 1 "+3.3V" H 7015 2273 50  0000 C CNN
F 2 "" H 7000 2100 50  0001 C CNN
F 3 "" H 7000 2100 50  0001 C CNN
	1    7000 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 614A2C9B
P 9750 1550
AR Path="/614A2C9B" Ref="J?"  Part="1" 
AR Path="/6148E1AC/614A2C9B" Ref="J301"  Part="1" 
F 0 "J301" H 9800 1967 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 9800 1876 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x05_P2.54mm_Vertical" H 9750 1550 50  0001 C CNN
F 3 "~" H 9750 1550 50  0001 C CNN
	1    9750 1550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 614A2CA1
P 10300 1000
AR Path="/614A2CA1" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CA1" Ref="#PWR0302"  Part="1" 
F 0 "#PWR0302" H 10300 850 50  0001 C CNN
F 1 "+5V" H 10315 1173 50  0000 C CNN
F 2 "" H 10300 1000 50  0001 C CNN
F 3 "" H 10300 1000 50  0001 C CNN
	1    10300 1000
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 614A2CA7
P 9150 1050
AR Path="/614A2CA7" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CA7" Ref="#PWR0303"  Part="1" 
F 0 "#PWR0303" H 9150 900 50  0001 C CNN
F 1 "+3.3V" H 9165 1223 50  0000 C CNN
F 2 "" H 9150 1050 50  0001 C CNN
F 3 "" H 9150 1050 50  0001 C CNN
	1    9150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	10300 1000 10300 1350
Wire Wire Line
	10300 1350 10050 1350
Wire Wire Line
	10050 1450 10300 1450
Wire Wire Line
	10300 1450 10300 1350
Connection ~ 10300 1350
Wire Wire Line
	9550 1350 9150 1350
Wire Wire Line
	9150 1350 9150 1050
$Comp
L power:GND #PWR?
U 1 1 614A2CB4
P 9800 2150
AR Path="/614A2CB4" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CB4" Ref="#PWR0312"  Part="1" 
F 0 "#PWR0312" H 9800 1900 50  0001 C CNN
F 1 "GND" H 9805 1977 50  0000 C CNN
F 2 "" H 9800 2150 50  0001 C CNN
F 3 "" H 9800 2150 50  0001 C CNN
	1    9800 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1550 10050 1550
Wire Wire Line
	10600 2100 9800 2100
Wire Wire Line
	9800 2100 9800 2150
Wire Wire Line
	9800 2100 9200 2100
Wire Wire Line
	9200 2100 9200 1750
Wire Wire Line
	9200 1750 9550 1750
Connection ~ 9800 2100
Wire Wire Line
	5500 3850 5700 3850
Wire Wire Line
	5500 3950 5700 3950
Text HLabel 8300 4900 3    50   Output ~ 0
LED_DATA0
Text HLabel 8000 4900 3    50   Output ~ 0
LED_DATA1
Text HLabel 5500 3850 0    50   Output ~ 0
LED_PWR_EN0
Text HLabel 5500 3950 0    50   Output ~ 0
LED_PWR_EN1
$Comp
L power:GND #PWR0313
U 1 1 6146B045
P 4100 2450
F 0 "#PWR0313" H 4100 2200 50  0001 C CNN
F 1 "GND" H 4105 2277 50  0000 C CNN
F 2 "" H 4100 2450 50  0001 C CNN
F 3 "" H 4100 2450 50  0001 C CNN
	1    4100 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 2400 4100 2450
Wire Wire Line
	5350 2400 5350 2850
Wire Wire Line
	5350 2850 5700 2850
Wire Wire Line
	5700 2750 5450 2750
$Comp
L Device:R R302
U 1 1 614713BB
P 4700 2400
F 0 "R302" V 4493 2400 50  0000 C CNN
F 1 "33R" V 4584 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4630 2400 50  0001 C CNN
F 3 "~" H 4700 2400 50  0001 C CNN
	1    4700 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R R301
U 1 1 614731F6
P 4700 2050
F 0 "R301" V 4493 2050 50  0000 C CNN
F 1 "33R" V 4584 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4630 2050 50  0001 C CNN
F 3 "~" H 4700 2050 50  0001 C CNN
	1    4700 2050
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 2200 4350 2050
Wire Wire Line
	4350 2050 4550 2050
Wire Wire Line
	4350 2300 4350 2400
Wire Wire Line
	4350 2400 4550 2400
Wire Wire Line
	5350 2400 4850 2400
Wire Wire Line
	4850 2050 4950 2050
Wire Wire Line
	4950 2050 4950 2300
Wire Wire Line
	4950 2300 5450 2300
Wire Wire Line
	5450 2300 5450 2750
$Comp
L Connector:Micro_SD_Card J?
U 1 1 61490BF2
P 3200 6700
AR Path="/61490BF2" Ref="J?"  Part="1" 
AR Path="/6148E1AC/61490BF2" Ref="J304"  Part="1" 
F 0 "J304" H 3150 7417 50  0000 C CNN
F 1 "Micro_SD_Card" H 3150 7326 50  0000 C CNN
F 2 "my:micro_sd_card" H 4350 7000 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 3200 6700 50  0001 C CNN
	1    3200 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R304
U 1 1 614928AE
P 1500 6600
F 0 "R304" H 1430 6554 50  0000 R CNN
F 1 "33R" H 1430 6645 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1430 6600 50  0001 C CNN
F 3 "~" H 1500 6600 50  0001 C CNN
	1    1500 6600
	0    1    1    0   
$EndComp
$Comp
L Device:R R305
U 1 1 61493F1C
P 1150 6800
F 0 "R305" H 1220 6846 50  0000 L CNN
F 1 "33R" H 1220 6755 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1080 6800 50  0001 C CNN
F 3 "~" H 1150 6800 50  0001 C CNN
	1    1150 6800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 1450 9450 1450
Wire Wire Line
	9550 1550 9450 1550
Wire Wire Line
	7450 3150 7300 3150
Wire Wire Line
	7450 4150 7300 4150
Wire Wire Line
	7450 3950 7300 3950
Wire Wire Line
	7300 3850 7450 3850
Wire Wire Line
	7300 4050 7450 4050
$Comp
L power:+3.3V #PWR0315
U 1 1 614C61E8
P 2100 5300
F 0 "#PWR0315" H 2100 5150 50  0001 C CNN
F 1 "+3.3V" H 2115 5473 50  0000 C CNN
F 2 "" H 2100 5300 50  0001 C CNN
F 3 "" H 2100 5300 50  0001 C CNN
	1    2100 5300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C307
U 1 1 614C7B6C
P 2400 5650
F 0 "C307" H 2515 5696 50  0000 L CNN
F 1 "100n" H 2515 5605 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2438 5500 50  0001 C CNN
F 3 "~" H 2400 5650 50  0001 C CNN
	1    2400 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0316
U 1 1 614CAAF2
P 2400 5900
F 0 "#PWR0316" H 2400 5650 50  0001 C CNN
F 1 "GND" H 2405 5727 50  0000 C CNN
F 2 "" H 2400 5900 50  0001 C CNN
F 3 "" H 2400 5900 50  0001 C CNN
	1    2400 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 5800 2400 5900
Wire Wire Line
	2400 5500 2400 5400
Wire Wire Line
	2400 5400 2100 5400
Wire Wire Line
	2100 5400 2100 5300
Wire Wire Line
	2100 6700 2300 6700
$Comp
L power:GND #PWR0321
U 1 1 614D028A
P 2100 7400
F 0 "#PWR0321" H 2100 7150 50  0001 C CNN
F 1 "GND" H 2105 7227 50  0000 C CNN
F 2 "" H 2100 7400 50  0001 C CNN
F 3 "" H 2100 7400 50  0001 C CNN
	1    2100 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6900 2100 6900
Wire Wire Line
	2100 6900 2100 7400
$Comp
L power:GND #PWR0322
U 1 1 614D2941
P 4100 7400
F 0 "#PWR0322" H 4100 7150 50  0001 C CNN
F 1 "GND" H 4105 7227 50  0000 C CNN
F 2 "" H 4100 7400 50  0001 C CNN
F 3 "" H 4100 7400 50  0001 C CNN
	1    4100 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 7300 4100 7300
Wire Wire Line
	4100 7300 4100 7400
$Comp
L Device:C C302
U 1 1 6147066F
P 1400 1200
F 0 "C302" H 1515 1246 50  0000 L CNN
F 1 "100n" H 1515 1155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 1438 1050 50  0001 C CNN
F 3 "~" H 1400 1200 50  0001 C CNN
	1    1400 1200
	1    0    0    -1  
$EndComp
$Comp
L Device:C C301
U 1 1 61472982
P 950 1200
F 0 "C301" H 1065 1246 50  0000 L CNN
F 1 "100n" H 1065 1155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 988 1050 50  0001 C CNN
F 3 "~" H 950 1200 50  0001 C CNN
	1    950  1200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0301
U 1 1 61473572
P 950 800
F 0 "#PWR0301" H 950 650 50  0001 C CNN
F 1 "+5V" H 965 973 50  0000 C CNN
F 2 "" H 950 800 50  0001 C CNN
F 3 "" H 950 800 50  0001 C CNN
	1    950  800 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0306
U 1 1 61474A2C
P 950 1600
F 0 "#PWR0306" H 950 1350 50  0001 C CNN
F 1 "GND" H 955 1427 50  0000 C CNN
F 2 "" H 950 1600 50  0001 C CNN
F 3 "" H 950 1600 50  0001 C CNN
	1    950  1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  1600 950  1450
Wire Wire Line
	950  1450 1400 1450
Wire Wire Line
	1400 1450 1400 1350
Connection ~ 950  1450
Wire Wire Line
	950  1450 950  1350
Wire Wire Line
	950  800  950  950 
Wire Wire Line
	950  950  1400 950 
Wire Wire Line
	1400 950  1400 1050
Connection ~ 950  950 
Wire Wire Line
	950  950  950  1050
$Comp
L my:Raspberry_Pi_0_2_3 J303
U 1 1 614A89DF
P 6500 3650
F 0 "J303" H 6900 2250 50  0000 C CNN
F 1 "Raspberry_Pi_0_2_3" H 7200 2350 50  0000 C CNN
F 2 "my:Raspberry_Pi_Zero_Socketed_THT_FaceDown_MountingHoles_No_Courtyard" H 6500 3650 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 6500 3650 50  0001 C CNN
	1    6500 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 5200 5950 5050
Wire Wire Line
	5950 5050 6100 5050
Wire Wire Line
	6100 5050 6100 4950
Wire Wire Line
	6100 5050 6200 5050
Wire Wire Line
	6800 5050 6800 4950
Connection ~ 6100 5050
Wire Wire Line
	6200 5050 6200 4950
Connection ~ 6200 5050
Wire Wire Line
	6200 5050 6300 5050
Wire Wire Line
	6300 5050 6300 4950
Connection ~ 6300 5050
Wire Wire Line
	6300 5050 6400 5050
Wire Wire Line
	6400 5050 6400 4950
Connection ~ 6400 5050
Wire Wire Line
	6400 5050 6500 5050
Wire Wire Line
	6500 5050 6500 4950
Connection ~ 6500 5050
Wire Wire Line
	6500 5050 6600 5050
Wire Wire Line
	6600 5050 6600 4950
Connection ~ 6600 5050
Wire Wire Line
	6600 5050 6700 5050
Wire Wire Line
	6700 5050 6700 4950
Connection ~ 6700 5050
Wire Wire Line
	6700 5050 6800 5050
Wire Wire Line
	6400 2350 6400 2250
Wire Wire Line
	6400 2250 6300 2250
Wire Wire Line
	6000 2250 6000 2100
Wire Wire Line
	6300 2350 6300 2250
Connection ~ 6300 2250
Wire Wire Line
	6300 2250 6000 2250
Wire Wire Line
	6600 2350 6600 2250
Wire Wire Line
	6600 2250 6700 2250
Wire Wire Line
	7000 2250 7000 2100
Wire Wire Line
	6700 2350 6700 2250
Connection ~ 6700 2250
Wire Wire Line
	6700 2250 7000 2250
NoConn ~ 2300 6400
NoConn ~ 2300 7100
$Comp
L power:+3.3V #PWR0317
U 1 1 6164D788
P 4950 6300
F 0 "#PWR0317" H 4950 6150 50  0001 C CNN
F 1 "+3.3V" H 4965 6473 50  0000 C CNN
F 2 "" H 4950 6300 50  0001 C CNN
F 3 "" H 4950 6300 50  0001 C CNN
	1    4950 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6300 4950 6500
Wire Wire Line
	4950 6500 5350 6500
$Comp
L power:GND #PWR0320
U 1 1 6166C611
P 4750 6950
F 0 "#PWR0320" H 4750 6700 50  0001 C CNN
F 1 "GND" H 4755 6777 50  0000 C CNN
F 2 "" H 4750 6950 50  0001 C CNN
F 3 "" H 4750 6950 50  0001 C CNN
	1    4750 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 6800 5350 6800
Text Label 5250 6600 2    50   ~ 0
SPI0_CS1
Text Label 5250 6700 2    50   ~ 0
SPI0_MISO
Wire Wire Line
	5250 6600 5350 6600
Wire Wire Line
	5250 6700 5350 6700
Text Label 5250 7000 2    50   ~ 0
SPI0_MOSI
Wire Wire Line
	5250 7000 5350 7000
Text Label 5250 6900 2    50   ~ 0
SPI0_CLK
Wire Wire Line
	5250 6900 5350 6900
Text Label 5050 2300 0    50   ~ 0
UART_TXD
Text Label 5000 2400 0    50   ~ 0
UART_RXD
Text Label 10150 1650 0    50   ~ 0
UART_TXD
Text Label 10150 1750 0    50   ~ 0
UART_RXD
Wire Wire Line
	10050 1650 10150 1650
Wire Wire Line
	10050 1750 10150 1750
Text Label 7450 3350 0    50   ~ 0
GPIO4
Wire Wire Line
	7300 3350 7450 3350
Text Label 9450 1650 2    50   ~ 0
GPIO4
Wire Wire Line
	9450 1650 9550 1650
$Comp
L Connector_Generic:Conn_01x04 J302
U 1 1 617F5333
P 3650 2200
F 0 "J302" H 3568 2517 50  0000 C CNN
F 1 "Conn_01x04" H 3568 2426 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3650 2200 50  0001 C CNN
F 3 "~" H 3650 2200 50  0001 C CNN
	1    3650 2200
	-1   0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0309
U 1 1 61801CAF
P 4050 2000
F 0 "#PWR0309" H 4050 1850 50  0001 C CNN
F 1 "+3.3V" H 4065 2173 50  0000 C CNN
F 2 "" H 4050 2000 50  0001 C CNN
F 3 "" H 4050 2000 50  0001 C CNN
	1    4050 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 2000 4050 2100
Wire Wire Line
	4050 2100 3850 2100
Wire Wire Line
	3850 2200 4350 2200
Wire Wire Line
	3850 2300 4350 2300
Wire Wire Line
	3850 2400 4100 2400
$Sheet
S 3900 3950 500  200 
U 6182662F
F0 "Status LED 0" 50
F1 "cpu_status_led.sch" 50
F2 "IN_3V3" I R 4400 4050 50 
$EndSheet
$Sheet
S 3900 4350 500  200 
U 61831583
F0 "Status LED 1" 50
F1 "cpu_status_led.sch" 50
F2 "IN_3V3" I R 4400 4450 50 
$EndSheet
$Sheet
S 3900 4750 500  200 
U 61836CD9
F0 "Status LED 2" 50
F1 "cpu_status_led.sch" 50
F2 "IN_3V3" I R 4400 4850 50 
$EndSheet
$Sheet
S 3900 5150 500  200 
U 61844B10
F0 "Status LED 3" 50
F1 "cpu_status_led.sch" 50
F2 "IN_3V3" I R 4400 5250 50 
$EndSheet
Wire Wire Line
	4400 4050 5700 4050
Wire Wire Line
	5700 4150 4850 4150
Wire Wire Line
	4850 4150 4850 4450
Wire Wire Line
	4850 4450 4400 4450
Wire Wire Line
	5700 4250 4950 4250
Wire Wire Line
	4950 4250 4950 4850
Wire Wire Line
	4950 4850 4400 4850
Wire Wire Line
	5700 4350 5050 4350
Wire Wire Line
	5050 4350 5050 5250
Wire Wire Line
	5050 5250 4400 5250
NoConn ~ 7300 2750
NoConn ~ 7300 2850
NoConn ~ 7300 3450
NoConn ~ 7300 3550
Text HLabel 5500 3250 0    50   Output ~ 0
LED_DATA_~EN~0
Wire Wire Line
	5500 3250 5700 3250
Text HLabel 5500 3150 0    50   Output ~ 0
LED_DATA_~EN~1
Wire Wire Line
	5500 3150 5700 3150
Text Label 5550 3550 2    50   ~ 0
ALT_LED_DATA
Wire Wire Line
	5550 3550 5700 3550
Text Label 7450 3850 0    50   ~ 0
SPI0_CS0
Text Label 7450 3750 0    50   ~ 0
SPI0_CS1
Wire Wire Line
	7300 3750 7450 3750
Wire Wire Line
	2100 5400 2100 6700
Connection ~ 2100 5400
Wire Wire Line
	2000 6500 2300 6500
Text Label 1700 6500 1    50   ~ 0
SPI0_CS0
$Comp
L Device:R R303
U 1 1 6149705E
P 1850 6500
F 0 "R303" H 1920 6546 50  0000 L CNN
F 1 "33R" H 1920 6455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 1780 6500 50  0001 C CNN
F 3 "~" H 1850 6500 50  0001 C CNN
	1    1850 6500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1650 6600 2300 6600
Text Label 1350 6600 1    50   ~ 0
SPI0_MOSI
Wire Wire Line
	1300 6800 2300 6800
Text Label 1000 6800 1    50   ~ 0
SPI0_CLK
$Comp
L Device:R R306
U 1 1 61494755
P 800 7000
F 0 "R306" H 870 7046 50  0000 L CNN
F 1 "33R" H 870 6955 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 730 7000 50  0001 C CNN
F 3 "~" H 800 7000 50  0001 C CNN
	1    800  7000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	950  7000 2300 7000
Text Label 650  7000 1    50   ~ 0
SPI0_MISO
Text Label 7450 3950 0    50   ~ 0
SPI0_MISO
Text Label 7450 4050 0    50   ~ 0
SPI0_MOSI
Text Label 7450 4150 0    50   ~ 0
SPI0_CLK
$Comp
L Connector_Generic:Conn_01x06 J305
U 1 1 61801594
P 5550 6700
F 0 "J305" H 5630 6692 50  0000 L CNN
F 1 "Conn_01x06" H 5630 6601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x06_P2.54mm_Vertical" H 5550 6700 50  0001 C CNN
F 3 "~" H 5550 6700 50  0001 C CNN
	1    5550 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 6950 4750 6800
Text Label 7450 3050 0    50   ~ 0
IIC0_SDA
Text Label 7450 3150 0    50   ~ 0
IIC0_SCL
Wire Wire Line
	7300 3050 7450 3050
Text Label 9450 1450 2    50   ~ 0
IIC0_SDA
Text Label 9450 1550 2    50   ~ 0
IIC0_SCL
Text Notes 9450 1050 0    50   ~ 0
RPi RTC connector
Text Notes 6000 6600 2    50   ~ 0
SPI Flash\nModule
$Comp
L Jumper:SolderJumper_3_Bridged12 JP301
U 1 1 618DF05E
P 8300 4200
F 0 "JP301" H 8300 4405 50  0000 C CNN
F 1 "Jumper" H 8300 4314 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm_NumberLabels" H 8300 4200 50  0001 C CNN
F 3 "~" H 8300 4200 50  0001 C CNN
	1    8300 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	8300 4350 8300 4900
Text Label 8650 4400 0    50   ~ 0
ALT_LED_DATA
$Comp
L Jumper:SolderJumper_3_Bridged12 JP302
U 1 1 618F9BF0
P 8000 4600
F 0 "JP302" H 8000 4805 50  0000 C CNN
F 1 "Jumper" H 8000 4714 50  0000 C CNN
F 2 "Jumper:SolderJumper-3_P1.3mm_Bridged12_RoundedPad1.0x1.5mm_NumberLabels" H 8000 4600 50  0001 C CNN
F 3 "~" H 8000 4600 50  0001 C CNN
	1    8000 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8000 4900 8000 4750
Wire Wire Line
	7800 4450 7800 4600
Wire Wire Line
	8200 4600 8550 4600
Wire Wire Line
	8550 4600 8550 4400
Wire Wire Line
	8550 4400 8650 4400
NoConn ~ 5700 3650
NoConn ~ 5700 3450
Wire Wire Line
	7800 4350 7800 4200
Wire Wire Line
	7800 4200 8100 4200
Wire Wire Line
	8500 4200 8550 4200
Wire Wire Line
	8550 4200 8550 4400
Connection ~ 8550 4400
Wire Wire Line
	7300 4350 7800 4350
Wire Wire Line
	7300 4450 7800 4450
NoConn ~ 5700 3050
Text Notes 3450 2600 1    50   ~ 0
Terminal Connector
$Comp
L power:PWR_FLAG #FLG0301
U 1 1 61666440
P 6700 2250
F 0 "#FLG0301" H 6700 2325 50  0001 C CNN
F 1 "PWR_FLAG" H 6700 2423 50  0000 C CNN
F 2 "" H 6700 2250 50  0001 C CNN
F 3 "~" H 6700 2250 50  0001 C CNN
	1    6700 2250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C308
U 1 1 61666109
P 4500 6600
F 0 "C308" H 4615 6646 50  0000 L CNN
F 1 "100n" H 4615 6555 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4538 6450 50  0001 C CNN
F 3 "~" H 4500 6600 50  0001 C CNN
	1    4500 6600
	-1   0    0    1   
$EndComp
$Comp
L Device:C C306
U 1 1 6166B8E9
P 8800 1550
F 0 "C306" H 8915 1596 50  0000 L CNN
F 1 "100n" H 8915 1505 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8838 1400 50  0001 C CNN
F 3 "~" H 8800 1550 50  0001 C CNN
	1    8800 1550
	-1   0    0    1   
$EndComp
$Comp
L Device:C C305
U 1 1 61671F8B
P 10850 1500
F 0 "C305" H 10965 1546 50  0000 L CNN
F 1 "100n" H 10965 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 10888 1350 50  0001 C CNN
F 3 "~" H 10850 1500 50  0001 C CNN
	1    10850 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8800 1400 8800 1300
Wire Wire Line
	8800 1700 8800 1800
$Comp
L power:GND #PWR0319
U 1 1 6168F7F5
P 4500 6850
F 0 "#PWR0319" H 4500 6600 50  0001 C CNN
F 1 "GND" H 4505 6677 50  0000 C CNN
F 2 "" H 4500 6850 50  0001 C CNN
F 3 "" H 4500 6850 50  0001 C CNN
	1    4500 6850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0318
U 1 1 6169033D
P 4500 6350
F 0 "#PWR0318" H 4500 6200 50  0001 C CNN
F 1 "+3.3V" H 4515 6523 50  0000 C CNN
F 2 "" H 4500 6350 50  0001 C CNN
F 3 "" H 4500 6350 50  0001 C CNN
	1    4500 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 6350 4500 6450
Wire Wire Line
	4500 6750 4500 6850
$Comp
L power:+3.3V #PWR0305
U 1 1 616B37CF
P 8800 1300
F 0 "#PWR0305" H 8800 1150 50  0001 C CNN
F 1 "+3.3V" H 8815 1473 50  0000 C CNN
F 2 "" H 8800 1300 50  0001 C CNN
F 3 "" H 8800 1300 50  0001 C CNN
	1    8800 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0308
U 1 1 616B9C8D
P 8800 1800
F 0 "#PWR0308" H 8800 1550 50  0001 C CNN
F 1 "GND" H 8805 1627 50  0000 C CNN
F 2 "" H 8800 1800 50  0001 C CNN
F 3 "" H 8800 1800 50  0001 C CNN
	1    8800 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 1550 10600 2100
$Comp
L power:GND #PWR0307
U 1 1 616BFE51
P 10850 1750
F 0 "#PWR0307" H 10850 1500 50  0001 C CNN
F 1 "GND" H 10855 1577 50  0000 C CNN
F 2 "" H 10850 1750 50  0001 C CNN
F 3 "" H 10850 1750 50  0001 C CNN
	1    10850 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1750 10850 1650
$Comp
L power:+5V #PWR0304
U 1 1 616C6A93
P 10850 1250
F 0 "#PWR0304" H 10850 1100 50  0001 C CNN
F 1 "+5V" H 10865 1423 50  0000 C CNN
F 2 "" H 10850 1250 50  0001 C CNN
F 3 "" H 10850 1250 50  0001 C CNN
	1    10850 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	10850 1250 10850 1350
$EndSCHEMATC
