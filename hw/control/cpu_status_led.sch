EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 13
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "CPU Status LED"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4550 4000 0    50   Input ~ 0
IN_3V3
$Comp
L power:+5V #PWR0401
U 1 1 6182751A
P 5500 2700
AR Path="/6148E1AC/6182662F/6182751A" Ref="#PWR0401"  Part="1" 
AR Path="/6148E1AC/61831583/6182751A" Ref="#PWR0501"  Part="1" 
AR Path="/6148E1AC/61836CD9/6182751A" Ref="#PWR0601"  Part="1" 
AR Path="/6148E1AC/61844B10/6182751A" Ref="#PWR0701"  Part="1" 
F 0 "#PWR0701" H 5500 2550 50  0001 C CNN
F 1 "+5V" H 5515 2873 50  0000 C CNN
F 2 "" H 5500 2700 50  0001 C CNN
F 3 "" H 5500 2700 50  0001 C CNN
	1    5500 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6182D735
P 4900 4000
AR Path="/614AE8DA/6182D735" Ref="R?"  Part="1" 
AR Path="/614AB031/6182D735" Ref="R?"  Part="1" 
AR Path="/6148E1AC/6182662F/6182D735" Ref="R403"  Part="1" 
AR Path="/6148E1AC/61831583/6182D735" Ref="R503"  Part="1" 
AR Path="/6148E1AC/61836CD9/6182D735" Ref="R603"  Part="1" 
AR Path="/6148E1AC/61844B10/6182D735" Ref="R703"  Part="1" 
F 0 "R403" V 4693 4000 50  0000 C CNN
F 1 "R" V 4784 4000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4830 4000 50  0001 C CNN
F 3 "~" H 4900 4000 50  0001 C CNN
	1    4900 4000
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BEC Q?
U 1 1 6182D73B
P 5400 4000
AR Path="/614AE8DA/6182D73B" Ref="Q?"  Part="1" 
AR Path="/614AB031/6182D73B" Ref="Q?"  Part="1" 
AR Path="/6148E1AC/6182662F/6182D73B" Ref="Q401"  Part="1" 
AR Path="/6148E1AC/61831583/6182D73B" Ref="Q501"  Part="1" 
AR Path="/6148E1AC/61836CD9/6182D73B" Ref="Q601"  Part="1" 
AR Path="/6148E1AC/61844B10/6182D73B" Ref="Q701"  Part="1" 
F 0 "Q401" H 5591 4046 50  0000 L CNN
F 1 "BC817" H 5591 3955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23_Handsoldering" H 5600 4100 50  0001 C CNN
F 3 "~" H 5400 4000 50  0001 C CNN
	1    5400 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 4000 5200 4000
Wire Wire Line
	5500 3800 5500 3600
$Comp
L Device:LED D401
U 1 1 6182D99B
P 5500 2950
AR Path="/6148E1AC/6182662F/6182D99B" Ref="D401"  Part="1" 
AR Path="/6148E1AC/61831583/6182D99B" Ref="D501"  Part="1" 
AR Path="/6148E1AC/61836CD9/6182D99B" Ref="D601"  Part="1" 
AR Path="/6148E1AC/61844B10/6182D99B" Ref="D701"  Part="1" 
F 0 "D401" V 5539 2832 50  0000 R CNN
F 1 "LED" V 5448 2832 50  0000 R CNN
F 2 "LED_SMD:LED_0805_2012Metric_Pad1.15x1.40mm_HandSolder" H 5500 2950 50  0001 C CNN
F 3 "~" H 5500 2950 50  0001 C CNN
	1    5500 2950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R402
U 1 1 6182E435
P 5500 3450
AR Path="/6148E1AC/6182662F/6182E435" Ref="R402"  Part="1" 
AR Path="/6148E1AC/61831583/6182E435" Ref="R502"  Part="1" 
AR Path="/6148E1AC/61836CD9/6182E435" Ref="R602"  Part="1" 
AR Path="/6148E1AC/61844B10/6182E435" Ref="R702"  Part="1" 
F 0 "R402" H 5570 3496 50  0000 L CNN
F 1 "1K" H 5570 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5430 3450 50  0001 C CNN
F 3 "~" H 5500 3450 50  0001 C CNN
	1    5500 3450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0402
U 1 1 6182FC68
P 5500 4350
AR Path="/6148E1AC/6182662F/6182FC68" Ref="#PWR0402"  Part="1" 
AR Path="/6148E1AC/61831583/6182FC68" Ref="#PWR0502"  Part="1" 
AR Path="/6148E1AC/61836CD9/6182FC68" Ref="#PWR0602"  Part="1" 
AR Path="/6148E1AC/61844B10/6182FC68" Ref="#PWR0702"  Part="1" 
F 0 "#PWR0702" H 5500 4100 50  0001 C CNN
F 1 "GND" H 5505 4177 50  0000 C CNN
F 2 "" H 5500 4350 50  0001 C CNN
F 3 "" H 5500 4350 50  0001 C CNN
	1    5500 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 4200 5500 4350
Wire Wire Line
	5500 2700 5500 2800
Wire Wire Line
	5500 3100 5500 3300
Wire Wire Line
	4550 4000 4750 4000
$EndSCHEMATC
