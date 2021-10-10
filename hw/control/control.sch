EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 13
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "Main Conectors"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 3850 3150 1350 600 
U 6147396B
F0 "Main Power" 50
F1 "main_power.sch" 50
F2 "VIN" I L 3850 3350 50 
F3 "VOUT" O R 5200 3350 50 
$EndSheet
$Sheet
S 7250 2350 1300 1700
U 6148E1AC
F0 "CPU" 50
F1 "cpu.sch" 50
F2 "LED_DATA0" O L 7250 2800 50 
F3 "LED_DATA1" O L 7250 2900 50 
F4 "LED_PWR_EN0" O L 7250 2550 50 
F5 "LED_PWR_EN1" O L 7250 2650 50 
F6 "LED_DATA_~EN~0" O L 7250 3050 50 
F7 "LED_DATA_~EN~1" O L 7250 3150 50 
$EndSheet
$Comp
L power:+5V #PWR0102
U 1 1 614A9497
P 5550 3200
F 0 "#PWR0102" H 5550 3050 50  0001 C CNN
F 1 "+5V" H 5565 3373 50  0000 C CNN
F 2 "" H 5550 3200 50  0001 C CNN
F 3 "" H 5550 3200 50  0001 C CNN
	1    5550 3200
	1    0    0    -1  
$EndComp
$Sheet
S 3850 4150 1350 550 
U 614AB031
F0 "LED0 Power" 50
F1 "led_power.sch" 50
F2 "VIN" I L 3850 4300 50 
F3 "EN_3V3" I R 5200 4550 50 
F4 "VOUT" O R 5200 4300 50 
$EndSheet
$Sheet
S 2000 2450 1100 400 
U 614ACFF9
F0 "Input Protection" 50
F1 "input_protection.sch" 50
F2 "V_A" I L 2000 2550 50 
F3 "V_B" I L 2000 2750 50 
F4 "VOUT" O R 3100 2550 50 
F5 "GND" O R 3100 2750 50 
$EndSheet
Wire Wire Line
	3650 3350 3850 3350
Wire Wire Line
	3650 3350 3650 4300
Wire Wire Line
	3650 4300 3850 4300
$Sheet
S 3850 5050 1350 550 
U 614AE8DA
F0 "LED1 Power" 50
F1 "led_power.sch" 50
F2 "VIN" I L 3850 5200 50 
F3 "EN_3V3" I R 5200 5450 50 
F4 "VOUT" O R 5200 5200 50 
$EndSheet
Connection ~ 3650 4300
$Sheet
S 7250 4450 1350 600 
U 614B1933
F0 "LED Driver" 50
F1 "led_driver.sch" 50
F2 "DATA_3V3_0" I L 7250 4850 50 
F3 "DATA_3V3_1" I L 7250 4950 50 
F4 "DATA_OUT0" O R 8600 4650 50 
F5 "DATA_OUT1" O R 8600 4850 50 
F6 "~EN~_3V3_0" I L 7250 4550 50 
F7 "~EN~_3V3_1" I L 7250 4650 50 
$EndSheet
$Comp
L Connector:Screw_Terminal_01x03 J102
U 1 1 614B315B
P 9200 4400
F 0 "J102" H 9280 4442 50  0000 L CNN
F 1 "Screw_Terminal_01x03" H 9280 4351 50  0000 L CNN
F 2 "" H 9200 4400 50  0001 C CNN
F 3 "~" H 9200 4400 50  0001 C CNN
	1    9200 4400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Screw_Terminal_01x03 J103
U 1 1 614B768A
P 9200 5100
F 0 "J103" H 9350 5050 50  0000 C CNN
F 1 "Screw_Terminal_01x03" H 9700 5200 50  0000 C CNN
F 2 "" H 9200 5100 50  0001 C CNN
F 3 "~" H 9200 5100 50  0001 C CNN
	1    9200 5100
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 614C271E
P 9650 4750
F 0 "#PWR0103" H 9650 4500 50  0001 C CNN
F 1 "GND" H 9655 4577 50  0000 C CNN
F 2 "" H 9650 4750 50  0001 C CNN
F 3 "" H 9650 4750 50  0001 C CNN
	1    9650 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 614F1177
P 3300 2900
F 0 "#PWR0101" H 3300 2650 50  0001 C CNN
F 1 "GND" H 3305 2727 50  0000 C CNN
F 2 "" H 3300 2900 50  0001 C CNN
F 3 "" H 3300 2900 50  0001 C CNN
	1    3300 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 2900 3300 2750
Wire Wire Line
	3300 2750 3100 2750
Wire Wire Line
	3650 3350 3650 2550
Wire Wire Line
	3650 2550 3100 2550
Connection ~ 3650 3350
Entry Wire Line
	6250 3000 6350 2900
Entry Wire Line
	6250 2900 6350 2800
Entry Wire Line
	6250 4750 6350 4850
Entry Wire Line
	6250 4850 6350 4950
Text Label 6250 3350 1    50   ~ 0
LED_DATA[0..1]
Text Label 6400 2900 0    50   ~ 0
LED_DATA1
Text Label 6400 2800 0    50   ~ 0
LED_DATA0
Text Label 6400 4850 0    50   ~ 0
LED_DATA0
Text Label 6400 4950 0    50   ~ 0
LED_DATA1
Wire Wire Line
	6350 2800 7250 2800
Wire Wire Line
	6350 2900 7250 2900
Entry Wire Line
	5950 2650 6050 2550
Entry Wire Line
	5950 2750 6050 2650
Wire Wire Line
	6050 2550 7250 2550
Wire Wire Line
	6050 2650 7250 2650
Text Label 6100 2650 0    50   ~ 0
LED_PWR_EN1
Text Label 6100 2550 0    50   ~ 0
LED_PWR_EN0
Entry Wire Line
	5850 4550 5950 4450
Entry Wire Line
	5850 5450 5950 5350
Wire Wire Line
	5200 4550 5850 4550
Text Label 5800 4550 2    50   ~ 0
LED_PWR_EN0
Text Label 5800 5450 2    50   ~ 0
LED_PWR_EN1
Wire Wire Line
	5200 4300 9000 4300
Text Label 5950 3250 1    50   ~ 0
LED_PWR_EN[0..1]
Wire Wire Line
	3650 5200 3850 5200
Wire Wire Line
	3650 4300 3650 5200
Wire Wire Line
	5850 5450 5200 5450
Wire Wire Line
	9650 4750 9000 4750
Wire Wire Line
	9000 4750 9000 4500
Wire Wire Line
	9000 4750 9000 5000
Connection ~ 9000 4750
Wire Wire Line
	8600 4650 8800 4650
Wire Wire Line
	8800 4650 8800 4400
Wire Wire Line
	8800 4400 9000 4400
Wire Wire Line
	8600 4850 8800 4850
Wire Wire Line
	8800 4850 8800 5100
Wire Wire Line
	8800 5100 9000 5100
Wire Wire Line
	5200 5200 9000 5200
$Comp
L Connector:Screw_Terminal_01x02 J101
U 1 1 615338F7
P 1350 2600
F 0 "J101" H 1268 2817 50  0000 C CNN
F 1 "Screw_Terminal_01x02" H 1268 2726 50  0000 C CNN
F 2 "" H 1350 2600 50  0001 C CNN
F 3 "~" H 1350 2600 50  0001 C CNN
	1    1350 2600
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1650 2550 1650 2600
Wire Wire Line
	1650 2600 1550 2600
Wire Wire Line
	1650 2550 2000 2550
Wire Wire Line
	1650 2750 1650 2700
Wire Wire Line
	1650 2700 1550 2700
Wire Wire Line
	1650 2750 2000 2750
Wire Wire Line
	5550 3350 5550 3200
Wire Wire Line
	5200 3350 5550 3350
Wire Wire Line
	6350 4950 7250 4950
Wire Wire Line
	6350 4850 7250 4850
Text Label 6350 3750 1    50   ~ 0
LED_DATA_~EN~[0..1]
Entry Wire Line
	6350 3150 6450 3050
Entry Wire Line
	6350 3250 6450 3150
Wire Wire Line
	6450 3050 7250 3050
Wire Wire Line
	6450 3150 7250 3150
Text Label 6500 3050 0    50   ~ 0
LED_DATA_~EN~0
Text Label 6500 3150 0    50   ~ 0
LED_DATA_~EN~1
Entry Wire Line
	6350 4550 6450 4650
Entry Wire Line
	6350 4450 6450 4550
Wire Wire Line
	6450 4550 7250 4550
Wire Wire Line
	6450 4650 7250 4650
Text Label 6500 4550 0    50   ~ 0
LED_DATA_~EN~0
Text Label 6500 4650 0    50   ~ 0
LED_DATA_~EN~1
Wire Bus Line
	6350 3000 6350 4750
Wire Bus Line
	5950 2500 5950 5500
Wire Bus Line
	6250 2750 6250 5050
$EndSCHEMATC
