EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 12 13
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "LED Driver Output Stage"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 614A3B39
P 4950 3750
AR Path="/614B1933/614A3B39" Ref="R?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B39" Ref="R1202"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B39" Ref="R1302"  Part="1" 
F 0 "R1202" V 4743 3750 50  0000 C CNN
F 1 "22R 0.25W" V 4834 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4880 3750 50  0001 C CNN
F 3 "~" H 4950 3750 50  0001 C CNN
	1    4950 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 614A3B3F
P 6750 3750
AR Path="/614B1933/614A3B3F" Ref="R?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B3F" Ref="R1203"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B3F" Ref="R1303"  Part="1" 
F 0 "R1203" V 6543 3750 50  0000 C CNN
F 1 "22R 0.25W" V 6634 3750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 6680 3750 50  0001 C CNN
F 3 "~" H 6750 3750 50  0001 C CNN
	1    6750 3750
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 614A3B45
P 4950 4450
AR Path="/614B1933/614A3B45" Ref="R?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B45" Ref="R1204"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B45" Ref="R1304"  Part="1" 
F 0 "R1204" V 4743 4450 50  0000 C CNN
F 1 "22R 0.25W" V 4834 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 4880 4450 50  0001 C CNN
F 3 "~" H 4950 4450 50  0001 C CNN
	1    4950 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R R?
U 1 1 614A3B4B
P 6750 4450
AR Path="/614B1933/614A3B4B" Ref="R?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B4B" Ref="R1205"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B4B" Ref="R1305"  Part="1" 
F 0 "R1205" V 6543 4450 50  0000 C CNN
F 1 "22R 0.25W" V 6634 4450 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric_Pad1.30x1.75mm_HandSolder" V 6680 4450 50  0001 C CNN
F 3 "~" H 6750 4450 50  0001 C CNN
	1    6750 4450
	0    1    1    0   
$EndComp
$Comp
L my:BAV199TP D?
U 1 1 614A3B51
P 5850 3400
AR Path="/614B1933/614A3B51" Ref="D?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B51" Ref="D1201"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B51" Ref="D1301"  Part="1" 
F 0 "D1201" H 5850 3617 50  0000 C CNN
F 1 "BAV199TP" H 5850 3526 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5850 2900 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30232.pdf" H 5850 3400 50  0001 C CNN
	1    5850 3400
	1    0    0    -1  
$EndComp
$Comp
L my:BAV199TP D?
U 1 1 614A3B57
P 5850 4150
AR Path="/614B1933/614A3B57" Ref="D?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B57" Ref="D1202"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B57" Ref="D1302"  Part="1" 
F 0 "D1202" H 5850 4367 50  0000 C CNN
F 1 "BAV199TP" H 5850 4276 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5850 3650 50  0001 C CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30232.pdf" H 5850 4150 50  0001 C CNN
	1    5850 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4450 5850 4450
Wire Wire Line
	5850 4350 5850 4450
Connection ~ 5850 4450
Wire Wire Line
	5850 4450 6600 4450
Wire Wire Line
	5100 3750 5850 3750
Wire Wire Line
	5850 3600 5850 3750
Connection ~ 5850 3750
Wire Wire Line
	5850 3750 6600 3750
Wire Wire Line
	6900 4450 7100 4450
Wire Wire Line
	7100 4450 7100 4050
Wire Wire Line
	7100 3750 6900 3750
Wire Wire Line
	7350 4050 7100 4050
Connection ~ 7100 4050
Wire Wire Line
	7100 4050 7100 3750
Wire Wire Line
	4200 4450 4400 4450
$Comp
L power:+5V #PWR?
U 1 1 614A3B70
P 6350 3200
AR Path="/614B1933/614A3B70" Ref="#PWR?"  Part="1" 
AR Path="/614B1933/614A1815/614A3B70" Ref="#PWR01201"  Part="1" 
AR Path="/614B1933/614AD8B5/614A3B70" Ref="#PWR01301"  Part="1" 
F 0 "#PWR01301" H 6350 3050 50  0001 C CNN
F 1 "+5V" H 6365 3373 50  0000 C CNN
F 2 "" H 6350 3200 50  0001 C CNN
F 3 "" H 6350 3200 50  0001 C CNN
	1    6350 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3200 6350 3400
Wire Wire Line
	6350 3400 6150 3400
Wire Wire Line
	6350 3400 6350 4150
Wire Wire Line
	6350 4150 6150 4150
Connection ~ 6350 3400
Wire Wire Line
	5350 4900 5350 4150
Wire Wire Line
	5350 4150 5550 4150
Wire Wire Line
	5350 4150 5350 3400
Wire Wire Line
	5350 3400 5550 3400
Connection ~ 5350 4150
$Comp
L power:GND #PWR01203
U 1 1 614A4F14
P 5350 4900
AR Path="/614B1933/614A1815/614A4F14" Ref="#PWR01203"  Part="1" 
AR Path="/614B1933/614AD8B5/614A4F14" Ref="#PWR01303"  Part="1" 
F 0 "#PWR01303" H 5350 4650 50  0001 C CNN
F 1 "GND" H 5355 4727 50  0000 C CNN
F 2 "" H 5350 4900 50  0001 C CNN
F 3 "" H 5350 4900 50  0001 C CNN
	1    5350 4900
	1    0    0    -1  
$EndComp
Text HLabel 4200 4450 0    50   Input ~ 0
IN_B
Text HLabel 4200 3750 0    50   Input ~ 0
IN_A
Text HLabel 7350 4050 2    50   Output ~ 0
OUT
Wire Wire Line
	4200 3750 4400 3750
$Comp
L Device:R R1201
U 1 1 616363D2
P 4400 3450
AR Path="/614B1933/614A1815/616363D2" Ref="R1201"  Part="1" 
AR Path="/614B1933/614AD8B5/616363D2" Ref="R1301"  Part="1" 
F 0 "R1201" H 4470 3496 50  0000 L CNN
F 1 "10K" H 4470 3405 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4330 3450 50  0001 C CNN
F 3 "~" H 4400 3450 50  0001 C CNN
	1    4400 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1206
U 1 1 61637113
P 4400 4750
AR Path="/614B1933/614A1815/61637113" Ref="R1206"  Part="1" 
AR Path="/614B1933/614AD8B5/61637113" Ref="R1306"  Part="1" 
F 0 "R1206" H 4470 4796 50  0000 L CNN
F 1 "10K" H 4470 4705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4330 4750 50  0001 C CNN
F 3 "~" H 4400 4750 50  0001 C CNN
	1    4400 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01202
U 1 1 61637D81
P 4200 3300
AR Path="/614B1933/614A1815/61637D81" Ref="#PWR01202"  Part="1" 
AR Path="/614B1933/614AD8B5/61637D81" Ref="#PWR01302"  Part="1" 
F 0 "#PWR01302" H 4200 3050 50  0001 C CNN
F 1 "GND" H 4205 3127 50  0000 C CNN
F 2 "" H 4200 3300 50  0001 C CNN
F 3 "" H 4200 3300 50  0001 C CNN
	1    4200 3300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01204
U 1 1 6163895E
P 4400 5050
AR Path="/614B1933/614A1815/6163895E" Ref="#PWR01204"  Part="1" 
AR Path="/614B1933/614AD8B5/6163895E" Ref="#PWR01304"  Part="1" 
F 0 "#PWR01304" H 4400 4800 50  0001 C CNN
F 1 "GND" H 4405 4877 50  0000 C CNN
F 2 "" H 4400 5050 50  0001 C CNN
F 3 "" H 4400 5050 50  0001 C CNN
	1    4400 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 4900 4400 5050
Wire Wire Line
	4400 4600 4400 4450
Connection ~ 4400 4450
Wire Wire Line
	4400 4450 4800 4450
Wire Wire Line
	4400 3600 4400 3750
Connection ~ 4400 3750
Wire Wire Line
	4400 3750 4800 3750
Wire Wire Line
	4400 3300 4400 3150
Wire Wire Line
	4400 3150 4200 3150
Wire Wire Line
	4200 3150 4200 3300
$EndSCHEMATC
