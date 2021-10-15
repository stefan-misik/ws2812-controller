EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 9 13
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "Input Protection"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3500 3500 0    50   Input ~ 0
V_A
Text HLabel 3450 4500 0    50   Input ~ 0
V_B
Text HLabel 6850 3500 2    50   Output ~ 0
VOUT
Text HLabel 6850 4500 2    50   Output ~ 0
GND
Wire Wire Line
	3450 4500 3750 4500
$Comp
L my:Q_PMOS_SSSGDDDD Q901
U 1 1 614E912B
P 5150 3600
F 0 "Q901" V 5700 3600 50  0000 C CNN
F 1 "AOSP21357" V 5600 3600 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 5350 3700 50  0001 C CNN
F 3 "~" H 5150 3600 50  0001 C CNN
	1    5150 3600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3500 3500 3750 3500
Wire Wire Line
	4850 3500 4850 3400
Wire Wire Line
	4850 3400 4950 3400
Connection ~ 4850 3500
Wire Wire Line
	4850 3500 4950 3500
Wire Wire Line
	4850 3400 4850 3300
Wire Wire Line
	4850 3300 4950 3300
Connection ~ 4850 3400
Wire Wire Line
	4850 3300 4850 3200
Wire Wire Line
	4850 3200 4950 3200
Connection ~ 4850 3300
Wire Wire Line
	5350 3500 5450 3500
Wire Wire Line
	5450 3500 5450 3400
Wire Wire Line
	5450 3400 5350 3400
Connection ~ 5450 3500
Wire Wire Line
	5450 3400 5450 3300
Wire Wire Line
	5450 3300 5350 3300
Connection ~ 5450 3400
$Comp
L Device:R R901
U 1 1 614EC7F7
P 5150 4200
F 0 "R901" H 5220 4246 50  0000 L CNN
F 1 "10K" H 5220 4155 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5080 4200 50  0001 C CNN
F 3 "~" H 5150 4200 50  0001 C CNN
	1    5150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 4350 5150 4500
Connection ~ 5150 4500
Wire Wire Line
	5150 4500 6450 4500
Wire Wire Line
	5150 4050 5150 3900
$Comp
L Device:D_Zener D901
U 1 1 614ED589
P 5650 3750
F 0 "D901" V 5604 3830 50  0000 L CNN
F 1 "D_Zener 10V" V 5695 3830 50  0000 L CNN
F 2 "Diode_SMD:D_MiniMELF_Handsoldering" H 5650 3750 50  0001 C CNN
F 3 "~" H 5650 3750 50  0001 C CNN
	1    5650 3750
	0    1    1    0   
$EndComp
Wire Wire Line
	5650 3900 5150 3900
Connection ~ 5150 3900
Wire Wire Line
	5150 3900 5150 3800
Wire Wire Line
	5650 3600 5650 3500
Connection ~ 5650 3500
Wire Wire Line
	5650 3500 6450 3500
Wire Wire Line
	3750 3800 3750 3500
Connection ~ 3750 3500
Wire Wire Line
	3750 3500 4200 3500
Wire Wire Line
	3750 4100 3750 4500
Connection ~ 3750 4500
Wire Wire Line
	3750 4500 4200 4500
Wire Wire Line
	4200 3500 4200 3800
Connection ~ 4200 3500
Wire Wire Line
	4200 4100 4200 4500
Connection ~ 4200 4500
Wire Wire Line
	4200 4500 5150 4500
$Comp
L Device:D_TVS D902
U 1 1 6148FC75
P 3750 3950
F 0 "D902" V 3704 4030 50  0000 L CNN
F 1 "D_TVS" V 3795 4030 50  0000 L CNN
F 2 "Diode_SMD:D_SMB-SMC_Universal_Handsoldering" H 3750 3950 50  0001 C CNN
F 3 "~" H 3750 3950 50  0001 C CNN
	1    3750 3950
	0    1    1    0   
$EndComp
$Comp
L Device:C C901
U 1 1 61464907
P 4200 3950
F 0 "C901" H 4315 3996 50  0000 L CNN
F 1 "470n" H 4315 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4238 3800 50  0001 C CNN
F 3 "~" H 4200 3950 50  0001 C CNN
	1    4200 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:C C902
U 1 1 6162C1F8
P 6450 3950
F 0 "C902" H 6565 3996 50  0000 L CNN
F 1 "470n" H 6565 3905 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6488 3800 50  0001 C CNN
F 3 "~" H 6450 3950 50  0001 C CNN
	1    6450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3800 6450 3500
Connection ~ 6450 3500
Wire Wire Line
	6450 3500 6850 3500
Wire Wire Line
	6450 4100 6450 4500
Connection ~ 6450 4500
Wire Wire Line
	6450 4500 6850 4500
Wire Wire Line
	4700 3800 5150 3800
Connection ~ 5150 3800
Wire Wire Line
	5150 3800 5150 3750
Text Notes 4700 2250 0    50   ~ 0
Alternative\nNot mounted
Wire Notes Line
	4650 2850 5650 2850
Wire Notes Line
	5650 2850 5650 2050
Wire Notes Line
	5650 2050 4650 2050
Wire Notes Line
	4650 2050 4650 2850
$Comp
L Transistor_FET:IRF4905 Q902
U 1 1 616A4BE0
P 5150 2650
F 0 "Q902" V 5492 2650 50  0000 C CNN
F 1 "IRF4905" V 5401 2650 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 5350 2575 50  0001 L CIN
F 3 "http://www.infineon.com/dgdl/irf4905.pdf?fileId=5546d462533600a4015355e32165197c" H 5150 2650 50  0001 L CNN
	1    5150 2650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5450 3500 5650 3500
Wire Wire Line
	4200 3500 4850 3500
Wire Wire Line
	5350 2550 5450 2550
Wire Wire Line
	5450 2550 5450 3300
Connection ~ 5450 3300
Wire Wire Line
	4950 2550 4850 2550
Wire Wire Line
	4850 2550 4850 3200
Connection ~ 4850 3200
Wire Wire Line
	5150 2850 5150 2900
Wire Wire Line
	5150 2900 4700 2900
Wire Wire Line
	4700 2900 4700 3800
$EndSCHEMATC
