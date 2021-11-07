EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 15
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3950 3900 0    50   Input ~ 0
EN_3V3
$Comp
L Device:R R?
U 1 1 618976F6
P 4500 3900
AR Path="/614AE8DA/618976F6" Ref="R?"  Part="1" 
AR Path="/614AB031/618976F6" Ref="R?"  Part="1" 
AR Path="/614AB031/618915A5/618976F6" Ref="R903"  Part="1" 
AR Path="/614AE8DA/618915A5/618976F6" Ref="R1203"  Part="1" 
F 0 "R1203" V 4293 3900 50  0000 C CNN
F 1 "R" V 4384 3900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4430 3900 50  0001 C CNN
F 3 "~" H 4500 3900 50  0001 C CNN
	1    4500 3900
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 618976FC
P 5000 3900
AR Path="/614AE8DA/618976FC" Ref="Q?"  Part="1" 
AR Path="/614AB031/618976FC" Ref="Q?"  Part="1" 
AR Path="/614AB031/618915A5/618976FC" Ref="Q902"  Part="1" 
AR Path="/614AE8DA/618915A5/618976FC" Ref="Q1202"  Part="1" 
F 0 "Q1202" H 5191 3946 50  0000 L CNN
F 1 "BC817" H 5191 3855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5200 4000 50  0001 C CNN
F 3 "~" H 5000 3900 50  0001 C CNN
	1    5000 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 3900 4800 3900
$Comp
L Device:Q_PNP_BEC Q?
U 1 1 61897703
P 5600 3050
AR Path="/614AE8DA/61897703" Ref="Q?"  Part="1" 
AR Path="/614AB031/61897703" Ref="Q?"  Part="1" 
AR Path="/614AB031/618915A5/61897703" Ref="Q901"  Part="1" 
AR Path="/614AE8DA/618915A5/61897703" Ref="Q1201"  Part="1" 
F 0 "Q1201" H 5791 3004 50  0000 L CNN
F 1 "BC807" H 5791 3095 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5800 3150 50  0001 C CNN
F 3 "~" H 5600 3050 50  0001 C CNN
	1    5600 3050
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 61897709
P 5100 3350
AR Path="/614AE8DA/61897709" Ref="R?"  Part="1" 
AR Path="/614AB031/61897709" Ref="R?"  Part="1" 
AR Path="/614AB031/618915A5/61897709" Ref="R902"  Part="1" 
AR Path="/614AE8DA/618915A5/61897709" Ref="R1202"  Part="1" 
F 0 "R1202" H 5170 3396 50  0000 L CNN
F 1 "R" H 5170 3305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5030 3350 50  0001 C CNN
F 3 "~" H 5100 3350 50  0001 C CNN
	1    5100 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6189770F
P 5100 2750
AR Path="/614AE8DA/6189770F" Ref="R?"  Part="1" 
AR Path="/614AB031/6189770F" Ref="R?"  Part="1" 
AR Path="/614AB031/618915A5/6189770F" Ref="R901"  Part="1" 
AR Path="/614AE8DA/618915A5/6189770F" Ref="R1201"  Part="1" 
F 0 "R1201" H 5170 2796 50  0000 L CNN
F 1 "R" H 5170 2705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5030 2750 50  0001 C CNN
F 3 "~" H 5100 2750 50  0001 C CNN
	1    5100 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61897715
P 5100 4400
AR Path="/614AE8DA/61897715" Ref="#PWR?"  Part="1" 
AR Path="/614AB031/61897715" Ref="#PWR?"  Part="1" 
AR Path="/614AB031/618915A5/61897715" Ref="#PWR0902"  Part="1" 
AR Path="/614AE8DA/618915A5/61897715" Ref="#PWR01202"  Part="1" 
F 0 "#PWR01202" H 5100 4150 50  0001 C CNN
F 1 "GND" H 5105 4227 50  0000 C CNN
F 2 "" H 5100 4400 50  0001 C CNN
F 3 "" H 5100 4400 50  0001 C CNN
	1    5100 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3700 5100 3500
Wire Wire Line
	5100 3200 5100 3050
$Comp
L power:+5V #PWR?
U 1 1 6189771D
P 5700 2300
AR Path="/614AE8DA/6189771D" Ref="#PWR?"  Part="1" 
AR Path="/614AB031/6189771D" Ref="#PWR?"  Part="1" 
AR Path="/614AB031/618915A5/6189771D" Ref="#PWR0901"  Part="1" 
AR Path="/614AE8DA/618915A5/6189771D" Ref="#PWR01201"  Part="1" 
F 0 "#PWR01201" H 5700 2150 50  0001 C CNN
F 1 "+5V" H 5715 2473 50  0000 C CNN
F 2 "" H 5700 2300 50  0001 C CNN
F 3 "" H 5700 2300 50  0001 C CNN
	1    5700 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 2300 5700 2400
Wire Wire Line
	5100 2600 5100 2400
Wire Wire Line
	5100 2400 5700 2400
Connection ~ 5700 2400
Wire Wire Line
	5700 2400 5700 2850
Wire Wire Line
	5400 3050 5100 3050
Connection ~ 5100 3050
Wire Wire Line
	5100 3050 5100 2900
Wire Wire Line
	5700 3400 5700 3250
$Comp
L Device:R R?
U 1 1 61897733
P 4850 5050
AR Path="/614AE8DA/61897733" Ref="R?"  Part="1" 
AR Path="/614AB031/61897733" Ref="R?"  Part="1" 
AR Path="/614AB031/618915A5/61897733" Ref="R904"  Part="1" 
AR Path="/614AE8DA/618915A5/61897733" Ref="R1204"  Part="1" 
F 0 "R1204" V 4643 5050 50  0000 C CNN
F 1 "R" V 4734 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4780 5050 50  0001 C CNN
F 3 "~" H 4850 5050 50  0001 C CNN
	1    4850 5050
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 5050 5700 5050
Wire Wire Line
	5700 5050 5700 3400
Connection ~ 5700 3400
Wire Wire Line
	3950 3900 4150 3900
Wire Wire Line
	4700 5050 4150 5050
Wire Wire Line
	4150 5050 4150 3900
Connection ~ 4150 3900
Wire Wire Line
	4150 3900 4350 3900
Text Notes 5300 5450 2    50   ~ 0
Alternative\nNot mounted
Wire Notes Line
	4350 4700 4350 5500
Wire Notes Line
	4350 5500 5350 5500
Wire Notes Line
	5350 5500 5350 4700
Wire Notes Line
	5350 4700 4350 4700
Text Notes 6450 3800 0    50   ~ 0
ON/OFF Is pulled high by 45uA current source.\nThe controller is fully turned off when pulled below 0.8V =>\nRpd = U/I = 0.8V/45uA = 8.888kOhm
Wire Wire Line
	5100 4100 5100 4400
Text HLabel 6500 3400 2    50   Output ~ 0
EN
Wire Wire Line
	5700 3400 6500 3400
$EndSCHEMATC