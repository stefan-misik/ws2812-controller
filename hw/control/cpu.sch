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
P 4500 3550
AR Path="/614A2C6B" Ref="J?"  Part="1" 
AR Path="/6148E1AC/614A2C6B" Ref="J?"  Part="1" 
F 0 "J?" H 4500 5031 50  0000 C CNN
F 1 "Raspberry_Pi_2_3" H 4500 4940 50  0000 C CNN
F 2 "" H 4500 3550 50  0001 C CNN
F 3 "https://www.raspberrypi.org/documentation/hardware/raspberrypi/schematics/rpi_SCH_3bplus_1p0_reduced.pdf" H 4500 3550 50  0001 C CNN
	1    4500 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614A2C71
P 3950 5100
AR Path="/614A2C71" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C71" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 3950 4850 50  0001 C CNN
F 1 "GND" H 3955 4927 50  0000 C CNN
F 2 "" H 3950 5100 50  0001 C CNN
F 3 "" H 3950 5100 50  0001 C CNN
	1    3950 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 5100 3950 4850
Wire Wire Line
	3950 4850 4100 4850
Wire Wire Line
	4100 4850 4200 4850
Connection ~ 4100 4850
Wire Wire Line
	4200 4850 4300 4850
Connection ~ 4200 4850
Wire Wire Line
	4300 4850 4400 4850
Connection ~ 4300 4850
Wire Wire Line
	4400 4850 4500 4850
Connection ~ 4400 4850
Wire Wire Line
	4500 4850 4600 4850
Connection ~ 4500 4850
Wire Wire Line
	4600 4850 4700 4850
Connection ~ 4600 4850
Wire Wire Line
	4700 4850 4800 4850
Connection ~ 4700 4850
$Comp
L power:+5V #PWR?
U 1 1 614A2C87
P 4000 2000
AR Path="/614A2C87" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C87" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 4000 1850 50  0001 C CNN
F 1 "+5V" H 4015 2173 50  0000 C CNN
F 2 "" H 4000 2000 50  0001 C CNN
F 3 "" H 4000 2000 50  0001 C CNN
	1    4000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 2000 4000 2250
Wire Wire Line
	4000 2250 4300 2250
Wire Wire Line
	4300 2250 4400 2250
Connection ~ 4300 2250
$Comp
L power:+3.3V #PWR?
U 1 1 614A2C91
P 5000 2000
AR Path="/614A2C91" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2C91" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 5000 1850 50  0001 C CNN
F 1 "+3.3V" H 5015 2173 50  0000 C CNN
F 2 "" H 5000 2000 50  0001 C CNN
F 3 "" H 5000 2000 50  0001 C CNN
	1    5000 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5000 2000 5000 2250
Wire Wire Line
	5000 2250 4700 2250
Wire Wire Line
	4600 2250 4700 2250
Connection ~ 4700 2250
$Comp
L Connector_Generic:Conn_02x05_Odd_Even J?
U 1 1 614A2C9B
P 8000 1500
AR Path="/614A2C9B" Ref="J?"  Part="1" 
AR Path="/6148E1AC/614A2C9B" Ref="J?"  Part="1" 
F 0 "J?" H 8050 1917 50  0000 C CNN
F 1 "Conn_02x05_Odd_Even" H 8050 1826 50  0000 C CNN
F 2 "" H 8000 1500 50  0001 C CNN
F 3 "~" H 8000 1500 50  0001 C CNN
	1    8000 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 614A2CA1
P 8550 950
AR Path="/614A2CA1" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CA1" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 8550 800 50  0001 C CNN
F 1 "+5V" H 8565 1123 50  0000 C CNN
F 2 "" H 8550 950 50  0001 C CNN
F 3 "" H 8550 950 50  0001 C CNN
	1    8550 950 
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 614A2CA7
P 7400 1000
AR Path="/614A2CA7" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CA7" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 7400 850 50  0001 C CNN
F 1 "+3.3V" H 7415 1173 50  0000 C CNN
F 2 "" H 7400 1000 50  0001 C CNN
F 3 "" H 7400 1000 50  0001 C CNN
	1    7400 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 950  8550 1300
Wire Wire Line
	8550 1300 8300 1300
Wire Wire Line
	8300 1400 8550 1400
Wire Wire Line
	8550 1400 8550 1300
Connection ~ 8550 1300
Wire Wire Line
	7800 1300 7400 1300
Wire Wire Line
	7400 1300 7400 1000
$Comp
L power:GND #PWR?
U 1 1 614A2CB4
P 8050 2100
AR Path="/614A2CB4" Ref="#PWR?"  Part="1" 
AR Path="/6148E1AC/614A2CB4" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 8050 1850 50  0001 C CNN
F 1 "GND" H 8055 1927 50  0000 C CNN
F 2 "" H 8050 2100 50  0001 C CNN
F 3 "" H 8050 2100 50  0001 C CNN
	1    8050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2050 8600 1500
Wire Wire Line
	8600 1500 8300 1500
Wire Wire Line
	8600 2050 8050 2050
Wire Wire Line
	8050 2050 8050 2100
Wire Wire Line
	8050 2050 7450 2050
Wire Wire Line
	7450 2050 7450 1700
Wire Wire Line
	7450 1700 7800 1700
Connection ~ 8050 2050
Wire Wire Line
	5500 4350 5300 4350
Wire Wire Line
	5500 4250 5300 4250
Wire Wire Line
	3500 3750 3700 3750
Wire Wire Line
	3500 3850 3700 3850
Text HLabel 5500 4250 2    50   Output ~ 0
LED0
Text HLabel 5500 4350 2    50   Output ~ 0
LED1
Text HLabel 3500 3750 0    50   Output ~ 0
LED_EN0
Text HLabel 3500 3850 0    50   Output ~ 0
LED_EN1
$Comp
L Connector:Conn_01x03_Male J?
U 1 1 614671E5
P 1850 2200
F 0 "J?" H 1958 2481 50  0000 C CNN
F 1 "Conn_01x03_Male" H 1958 2390 50  0000 C CNN
F 2 "" H 1850 2200 50  0001 C CNN
F 3 "~" H 1850 2200 50  0001 C CNN
	1    1850 2200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6146B045
P 2100 2350
F 0 "#PWR?" H 2100 2100 50  0001 C CNN
F 1 "GND" H 2105 2177 50  0000 C CNN
F 2 "" H 2100 2350 50  0001 C CNN
F 3 "" H 2100 2350 50  0001 C CNN
	1    2100 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2300 2100 2300
Wire Wire Line
	2100 2300 2100 2350
Wire Wire Line
	3350 2300 3350 2750
Wire Wire Line
	3350 2750 3700 2750
Wire Wire Line
	3700 2650 3450 2650
$Comp
L Device:R R?
U 1 1 614713BB
P 2700 2300
F 0 "R?" V 2493 2300 50  0000 C CNN
F 1 "33R" V 2584 2300 50  0000 C CNN
F 2 "" V 2630 2300 50  0001 C CNN
F 3 "~" H 2700 2300 50  0001 C CNN
	1    2700 2300
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 614731F6
P 2700 1950
F 0 "R?" V 2493 1950 50  0000 C CNN
F 1 "33R" V 2584 1950 50  0000 C CNN
F 2 "" V 2630 1950 50  0001 C CNN
F 3 "~" H 2700 1950 50  0001 C CNN
	1    2700 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	2050 2100 2350 2100
Wire Wire Line
	2350 2100 2350 1950
Wire Wire Line
	2350 1950 2550 1950
Wire Wire Line
	2050 2200 2350 2200
Wire Wire Line
	2350 2200 2350 2300
Wire Wire Line
	2350 2300 2550 2300
Wire Wire Line
	3350 2300 2850 2300
Wire Wire Line
	2850 1950 2950 1950
Wire Wire Line
	2950 1950 2950 2200
Wire Wire Line
	2950 2200 3450 2200
Wire Wire Line
	3450 2200 3450 2650
$Comp
L Connector:Micro_SD_Card J?
U 1 1 61490BF2
P 8750 5550
AR Path="/61490BF2" Ref="J?"  Part="1" 
AR Path="/6148E1AC/61490BF2" Ref="J?"  Part="1" 
F 0 "J?" H 8700 6267 50  0000 C CNN
F 1 "Micro_SD_Card" H 8700 6176 50  0000 C CNN
F 2 "" H 9900 5850 50  0001 C CNN
F 3 "http://katalog.we-online.de/em/datasheet/693072010801.pdf" H 8750 5550 50  0001 C CNN
	1    8750 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 614928AE
P 6950 4750
F 0 "R?" H 6880 4704 50  0000 R CNN
F 1 "33R" H 6880 4795 50  0000 R CNN
F 2 "" V 6880 4750 50  0001 C CNN
F 3 "~" H 6950 4750 50  0001 C CNN
	1    6950 4750
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 61493F1C
P 6650 4750
F 0 "R?" H 6720 4796 50  0000 L CNN
F 1 "33R" H 6720 4705 50  0000 L CNN
F 2 "" V 6580 4750 50  0001 C CNN
F 3 "~" H 6650 4750 50  0001 C CNN
	1    6650 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 61494755
P 6350 4750
F 0 "R?" H 6420 4796 50  0000 L CNN
F 1 "33R" H 6420 4705 50  0000 L CNN
F 2 "" V 6280 4750 50  0001 C CNN
F 3 "~" H 6350 4750 50  0001 C CNN
	1    6350 4750
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6149705E
P 7250 4750
F 0 "R?" H 7320 4796 50  0000 L CNN
F 1 "33R" H 7320 4705 50  0000 L CNN
F 2 "" V 7180 4750 50  0001 C CNN
F 3 "~" H 7250 4750 50  0001 C CNN
	1    7250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5350 7250 5350
Wire Wire Line
	7250 5350 7250 4900
Wire Wire Line
	7850 5450 6950 5450
Wire Wire Line
	6950 5450 6950 4900
Wire Wire Line
	7850 5650 6650 5650
Wire Wire Line
	6650 5650 6650 4900
Wire Wire Line
	7850 5850 6350 5850
Wire Wire Line
	6350 5850 6350 4900
Wire Wire Line
	7800 1400 6300 1400
Wire Wire Line
	6300 1400 6300 2950
Wire Wire Line
	6300 2950 5300 2950
Wire Wire Line
	7800 1500 6400 1500
Wire Wire Line
	6400 1500 6400 3050
Wire Wire Line
	6400 3050 5300 3050
Wire Wire Line
	6650 4600 6650 4050
Wire Wire Line
	6650 4050 5300 4050
Wire Wire Line
	6350 4600 6350 3850
Wire Wire Line
	6350 3850 5300 3850
Wire Wire Line
	5300 3750 7250 3750
Wire Wire Line
	7250 3750 7250 4600
Wire Wire Line
	5300 3950 6950 3950
Wire Wire Line
	6950 3950 6950 4600
$Comp
L power:+3.3V #PWR?
U 1 1 614C61E8
P 7650 4050
F 0 "#PWR?" H 7650 3900 50  0001 C CNN
F 1 "+3.3V" H 7665 4223 50  0000 C CNN
F 2 "" H 7650 4050 50  0001 C CNN
F 3 "" H 7650 4050 50  0001 C CNN
	1    7650 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 614C7B6C
P 7950 4400
F 0 "C?" H 8065 4446 50  0000 L CNN
F 1 "100n" H 8065 4355 50  0000 L CNN
F 2 "" H 7988 4250 50  0001 C CNN
F 3 "~" H 7950 4400 50  0001 C CNN
	1    7950 4400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 614CAAF2
P 7950 4750
F 0 "#PWR?" H 7950 4500 50  0001 C CNN
F 1 "GND" H 7955 4577 50  0000 C CNN
F 2 "" H 7950 4750 50  0001 C CNN
F 3 "" H 7950 4750 50  0001 C CNN
	1    7950 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 4550 7950 4750
Wire Wire Line
	7950 4250 7950 4150
Wire Wire Line
	7950 4150 7650 4150
Wire Wire Line
	7650 4150 7650 4050
Wire Wire Line
	7650 4150 7650 5550
Wire Wire Line
	7650 5550 7850 5550
Connection ~ 7650 4150
$Comp
L power:GND #PWR?
U 1 1 614D028A
P 7650 6250
F 0 "#PWR?" H 7650 6000 50  0001 C CNN
F 1 "GND" H 7655 6077 50  0000 C CNN
F 2 "" H 7650 6250 50  0001 C CNN
F 3 "" H 7650 6250 50  0001 C CNN
	1    7650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5750 7650 5750
Wire Wire Line
	7650 5750 7650 6250
$Comp
L power:GND #PWR?
U 1 1 614D2941
P 9650 6250
F 0 "#PWR?" H 9650 6000 50  0001 C CNN
F 1 "GND" H 9655 6077 50  0000 C CNN
F 2 "" H 9650 6250 50  0001 C CNN
F 3 "" H 9650 6250 50  0001 C CNN
	1    9650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	9550 6150 9650 6150
Wire Wire Line
	9650 6150 9650 6250
$EndSCHEMATC
