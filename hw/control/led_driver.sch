EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 13 15
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "LED Data Driver"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2750 4150 0    50   Input ~ 0
DATA_3V3_0
Text HLabel 2750 4500 0    50   Input ~ 0
DATA_3V3_1
Text HLabel 9100 3250 2    50   Output ~ 0
DATA_OUT0
Text HLabel 9100 3950 2    50   Output ~ 0
DATA_OUT1
$Comp
L SN74AHCT125D:SN74AHCT125D U1101
U 1 1 6146F060
P 6300 3950
F 0 "U1101" H 6300 4820 50  0000 C CNN
F 1 "SN74AHCT125D" H 6300 4729 50  0000 C CNN
F 2 "Package_SO:SO-14_3.9x8.65mm_P1.27mm" H 6300 3950 50  0001 L BNN
F 3 "SOIC-14 Texas Instruments" H 6300 3950 50  0001 L BNN
F 4 "Buffer-line Driver 4 Channel Non-Inverting 3 State CMOS 14-Pin SOIC Tube" H 6300 3950 50  0001 L BNN "Field4"
F 5 "None" H 6300 3950 50  0001 L BNN "Field5"
F 6 "Unavailable" H 6300 3950 50  0001 L BNN "Field6"
F 7 "Texas Instruments" H 6300 3950 50  0001 L BNN "Field7"
F 8 "SN74AHCT125D" H 6300 3950 50  0001 L BNN "Field8"
	1    6300 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5600 4250 5450 4250
Wire Wire Line
	5450 4250 5450 4150
Connection ~ 5450 4150
Wire Wire Line
	5450 4150 5600 4150
Wire Wire Line
	5600 4450 5450 4450
Wire Wire Line
	5450 4450 5450 4350
Connection ~ 5450 4350
Wire Wire Line
	5450 4350 5600 4350
$Comp
L power:+5V #PWR01101
U 1 1 61473D10
P 5350 2350
F 0 "#PWR01101" H 5350 2200 50  0001 C CNN
F 1 "+5V" H 5365 2523 50  0000 C CNN
F 2 "" H 5350 2350 50  0001 C CNN
F 3 "" H 5350 2350 50  0001 C CNN
	1    5350 2350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2350 5350 2450
Wire Wire Line
	5350 3450 5600 3450
$Comp
L Device:C C1102
U 1 1 6147522C
P 4900 2700
F 0 "C1102" H 5015 2746 50  0000 L CNN
F 1 "10u" H 5015 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric_Pad1.33x1.80mm_HandSolder" H 4938 2550 50  0001 C CNN
F 3 "~" H 4900 2700 50  0001 C CNN
	1    4900 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1101
U 1 1 61475C06
P 4300 2700
F 0 "C1101" H 4415 2746 50  0000 L CNN
F 1 "100n" H 4415 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4338 2550 50  0001 C CNN
F 3 "~" H 4300 2700 50  0001 C CNN
	1    4300 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 2550 4300 2450
Wire Wire Line
	4300 2450 4900 2450
Wire Wire Line
	4900 2550 4900 2450
Connection ~ 4900 2450
Wire Wire Line
	4900 2450 5350 2450
$Comp
L power:GND #PWR01102
U 1 1 61476844
P 4300 3100
F 0 "#PWR01102" H 4300 2850 50  0001 C CNN
F 1 "GND" H 4305 2927 50  0000 C CNN
F 2 "" H 4300 3100 50  0001 C CNN
F 3 "" H 4300 3100 50  0001 C CNN
	1    4300 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4300 3100 4300 2950
Wire Wire Line
	4900 2850 4900 2950
Wire Wire Line
	4900 2950 4300 2950
Connection ~ 4300 2950
Wire Wire Line
	4300 2950 4300 2850
$Comp
L Device:R R1108
U 1 1 6147BD41
P 5150 4700
F 0 "R1108" H 5220 4746 50  0000 L CNN
F 1 "10K" H 5220 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5080 4700 50  0001 C CNN
F 3 "~" H 5150 4700 50  0001 C CNN
	1    5150 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1107
U 1 1 6147C52A
P 4750 4700
F 0 "R1107" H 4820 4746 50  0000 L CNN
F 1 "10K" H 4820 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4680 4700 50  0001 C CNN
F 3 "~" H 4750 4700 50  0001 C CNN
	1    4750 4700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4550 4750 4150
$Comp
L power:GND #PWR01103
U 1 1 6147D2D2
P 4750 5100
F 0 "#PWR01103" H 4750 4850 50  0001 C CNN
F 1 "GND" H 4755 4927 50  0000 C CNN
F 2 "" H 4750 5100 50  0001 C CNN
F 3 "" H 4750 5100 50  0001 C CNN
	1    4750 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5100 4750 4950
Wire Wire Line
	4750 4950 5150 4950
Wire Wire Line
	5150 4950 5150 4850
Connection ~ 4750 4950
Wire Wire Line
	4750 4950 4750 4850
Wire Wire Line
	4750 4150 5450 4150
Wire Wire Line
	5150 4550 5150 4350
Wire Wire Line
	5150 4350 5450 4350
Wire Wire Line
	5150 4950 5500 4950
Wire Wire Line
	5500 4950 5500 4650
Wire Wire Line
	5500 4650 5600 4650
Connection ~ 5150 4950
Wire Wire Line
	5600 3750 5450 3750
Wire Wire Line
	5450 3750 5450 3650
Wire Wire Line
	5450 3650 5600 3650
Wire Wire Line
	5600 3850 5450 3850
Wire Wire Line
	5600 3950 5450 3950
Wire Wire Line
	5450 3950 5450 3850
$Comp
L Device:R R1103
U 1 1 614BACD3
P 3200 4150
F 0 "R1103" V 3407 4150 50  0000 C CNN
F 1 "33R" V 3316 4150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3130 4150 50  0001 C CNN
F 3 "~" H 3200 4150 50  0001 C CNN
	1    3200 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1104
U 1 1 614BBB41
P 3200 4500
F 0 "R1104" V 2993 4500 50  0000 C CNN
F 1 "33R" V 3084 4500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3130 4500 50  0001 C CNN
F 3 "~" H 3200 4500 50  0001 C CNN
	1    3200 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	2750 4150 3050 4150
Wire Wire Line
	3350 4150 4750 4150
Wire Wire Line
	2750 4500 3050 4500
Wire Wire Line
	3350 4500 3650 4500
Wire Wire Line
	3650 4500 3650 4350
$Sheet
S 7600 3000 1200 500 
U 614A1815
F0 "LED Driver Output 0" 50
F1 "led_driver_output.sch" 50
F2 "IN_B" I L 7600 3350 50 
F3 "IN_A" I L 7600 3150 50 
F4 "OUT" O R 8800 3250 50 
$EndSheet
$Sheet
S 7600 3700 1200 500 
U 614AD8B5
F0 "LED Driver Output 1" 50
F1 "led_driver_output.sch" 50
F2 "IN_B" I L 7600 4050 50 
F3 "IN_A" I L 7600 3850 50 
F4 "OUT" O R 8800 3950 50 
$EndSheet
Wire Wire Line
	7000 3650 7350 3650
Wire Wire Line
	7350 3650 7350 3850
Wire Wire Line
	7350 3850 7600 3850
Wire Wire Line
	7000 3750 7250 3750
Wire Wire Line
	7250 3750 7250 4050
Wire Wire Line
	7250 4050 7600 4050
Wire Wire Line
	7000 3550 7350 3550
Wire Wire Line
	7350 3550 7350 3350
Wire Wire Line
	7350 3350 7600 3350
Wire Wire Line
	7000 3450 7250 3450
Wire Wire Line
	7250 3450 7250 3150
Wire Wire Line
	7250 3150 7600 3150
Wire Wire Line
	8800 3950 9100 3950
Wire Wire Line
	8800 3250 9100 3250
$Comp
L Device:R R1102
U 1 1 6163E3A9
P 3200 3800
F 0 "R1102" V 2993 3800 50  0000 C CNN
F 1 "33R" V 3084 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3130 3800 50  0001 C CNN
F 3 "~" H 3200 3800 50  0001 C CNN
	1    3200 3800
	0    1    1    0   
$EndComp
$Comp
L Device:R R1101
U 1 1 6163F388
P 3200 3450
F 0 "R1101" V 2993 3450 50  0000 C CNN
F 1 "33R" V 3084 3450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3130 3450 50  0001 C CNN
F 3 "~" H 3200 3450 50  0001 C CNN
	1    3200 3450
	0    1    1    0   
$EndComp
Wire Wire Line
	3350 3800 3650 3800
Wire Wire Line
	3650 3800 3650 3850
Wire Wire Line
	3650 3850 4350 3850
Wire Wire Line
	3350 3450 3650 3450
Wire Wire Line
	3650 3450 3650 3650
Wire Wire Line
	3650 3650 3950 3650
Text HLabel 2750 3450 0    50   Input ~ 0
~EN~_3V3_0
Text HLabel 2750 3800 0    50   Input ~ 0
~EN~_3V3_1
Wire Wire Line
	2750 3800 3050 3800
Wire Wire Line
	2750 3450 3050 3450
Wire Wire Line
	3650 4350 5150 4350
Wire Wire Line
	5350 3450 5350 2450
Connection ~ 5350 2450
$Comp
L Device:R R1106
U 1 1 6165B6E9
P 4350 4700
F 0 "R1106" H 4420 4746 50  0000 L CNN
F 1 "10K" H 4420 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4280 4700 50  0001 C CNN
F 3 "~" H 4350 4700 50  0001 C CNN
	1    4350 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1105
U 1 1 6165BF36
P 3950 4700
F 0 "R1105" H 4020 4746 50  0000 L CNN
F 1 "10K" H 4020 4655 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3880 4700 50  0001 C CNN
F 3 "~" H 3950 4700 50  0001 C CNN
	1    3950 4700
	1    0    0    -1  
$EndComp
Connection ~ 5450 3650
Connection ~ 5450 3850
Connection ~ 4750 4150
Connection ~ 5150 4350
Wire Wire Line
	3950 4550 3950 3650
Connection ~ 3950 3650
Wire Wire Line
	3950 3650 5450 3650
Wire Wire Line
	4350 4550 4350 3850
Connection ~ 4350 3850
Wire Wire Line
	4350 3850 5450 3850
Wire Wire Line
	4750 4950 4350 4950
Wire Wire Line
	4350 4950 4350 4850
Wire Wire Line
	4350 4950 3950 4950
Wire Wire Line
	3950 4950 3950 4850
Connection ~ 4350 4950
$EndSCHEMATC
