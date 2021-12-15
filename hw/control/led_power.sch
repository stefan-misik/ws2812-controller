EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 8 15
Title "WS2812 Controller"
Date "2021-10-10"
Rev "1"
Comp "Stefan Misik"
Comment1 "LED Power Supply"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2100 2300 0    50   Input ~ 0
VIN
Text HLabel 9750 2500 2    50   Output ~ 0
VOUT
$Comp
L my:LM2678T-ADJ U801
U 1 1 6145ECF0
P 5400 2400
AR Path="/614AB031/6145ECF0" Ref="U801"  Part="1" 
AR Path="/614AE8DA/6145ECF0" Ref="U1101"  Part="1" 
F 0 "U801" H 5550 2750 50  0000 C CNN
F 1 "LM2678T-ADJ" H 5650 2650 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-7_P2.54x3.7mm_StaggerOdd_Lead3.8mm_Vertical" H 5450 2150 50  0001 L CIN
F 3 "https://www.ti.com/lit/ds/symlink/lm2678.pdf" H 5400 2400 50  0001 C CNN
	1    5400 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C802
U 1 1 6145FC0F
P 6150 2300
AR Path="/614AB031/6145FC0F" Ref="C802"  Part="1" 
AR Path="/614AE8DA/6145FC0F" Ref="C1102"  Part="1" 
F 0 "C802" V 5898 2300 50  0000 C CNN
F 1 "10n 50V" V 5989 2300 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6188 2150 50  0001 C CNN
F 3 "~" H 6150 2300 50  0001 C CNN
	1    6150 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 2300 6000 2300
Wire Wire Line
	5900 2500 6500 2500
Wire Wire Line
	6500 2500 6500 2300
Wire Wire Line
	6500 2300 6300 2300
$Comp
L power:GND #PWR0802
U 1 1 61460B18
P 4500 3400
AR Path="/614AB031/61460B18" Ref="#PWR0802"  Part="1" 
AR Path="/614AE8DA/61460B18" Ref="#PWR01102"  Part="1" 
F 0 "#PWR0802" H 4500 3150 50  0001 C CNN
F 1 "GND" H 4505 3227 50  0000 C CNN
F 2 "" H 4500 3400 50  0001 C CNN
F 3 "" H 4500 3400 50  0001 C CNN
	1    4500 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3400 4500 3200
$Comp
L Device:D_Schottky D1102
U 1 1 61461C6E
P 6500 2750
AR Path="/614AE8DA/61461C6E" Ref="D1102"  Part="1" 
AR Path="/614AB031/61461C6E" Ref="D802"  Part="1" 
F 0 "D802" V 6454 2830 50  0000 L CNN
F 1 "SL84-3G" V 6545 2830 50  0000 L CNN
F 2 "Diode_SMD:D_SMC_Handsoldering" H 6500 2750 50  0001 C CNN
F 3 "~" H 6500 2750 50  0001 C CNN
	1    6500 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	6500 3200 5400 3200
Connection ~ 5400 3200
Wire Wire Line
	6500 2600 6500 2500
Connection ~ 6500 2500
$Comp
L Device:L L1101
U 1 1 61462D51
P 6800 2500
AR Path="/614AE8DA/61462D51" Ref="L1101"  Part="1" 
AR Path="/614AB031/61462D51" Ref="L801"  Part="1" 
F 0 "L801" V 6990 2500 50  0000 C CNN
F 1 "47uH" V 6899 2500 50  0000 C CNN
F 2 "Inductor_THT:L_Toroid_Vertical_L22.4mm_W10.2mm_P7.90mm_Vishay_TJ4" H 6800 2500 50  0001 C CNN
F 3 "~" H 6800 2500 50  0001 C CNN
	1    6800 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6500 2500 6650 2500
$Comp
L Device:CP C1108
U 1 1 61463CC3
P 7200 2750
AR Path="/614AE8DA/61463CC3" Ref="C1108"  Part="1" 
AR Path="/614AB031/61463CC3" Ref="C808"  Part="1" 
F 0 "C808" H 7318 2796 50  0000 L CNN
F 1 "220u" H 7318 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 7238 2600 50  0001 C CNN
F 3 "~" H 7200 2750 50  0001 C CNN
	1    7200 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1109
U 1 1 6146511A
P 7650 2750
AR Path="/614AE8DA/6146511A" Ref="C1109"  Part="1" 
AR Path="/614AB031/6146511A" Ref="C809"  Part="1" 
F 0 "C809" H 7768 2796 50  0000 L CNN
F 1 "220u" H 7768 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 7688 2600 50  0001 C CNN
F 3 "~" H 7650 2750 50  0001 C CNN
	1    7650 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1105
U 1 1 61465477
P 3550 2750
AR Path="/614AE8DA/61465477" Ref="C1105"  Part="1" 
AR Path="/614AB031/61465477" Ref="C805"  Part="1" 
F 0 "C805" H 3668 2796 50  0000 L CNN
F 1 "47u" H 3668 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3588 2600 50  0001 C CNN
F 3 "~" H 3550 2750 50  0001 C CNN
	1    3550 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1104
U 1 1 614679D1
P 3100 2750
AR Path="/614AE8DA/614679D1" Ref="C1104"  Part="1" 
AR Path="/614AB031/614679D1" Ref="C804"  Part="1" 
F 0 "C804" H 3218 2796 50  0000 L CNN
F 1 "47u" H 3218 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 3138 2600 50  0001 C CNN
F 3 "~" H 3100 2750 50  0001 C CNN
	1    3100 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1103
U 1 1 61467CFC
P 2650 2750
AR Path="/614AE8DA/61467CFC" Ref="C1103"  Part="1" 
AR Path="/614AB031/61467CFC" Ref="C803"  Part="1" 
F 0 "C803" H 2768 2796 50  0000 L CNN
F 1 "47u" H 2768 2705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D8.0mm_P3.50mm" H 2688 2600 50  0001 C CNN
F 3 "~" H 2650 2750 50  0001 C CNN
	1    2650 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C1107
U 1 1 614681BF
P 4500 2750
AR Path="/614AE8DA/614681BF" Ref="C1107"  Part="1" 
AR Path="/614AB031/614681BF" Ref="C807"  Part="1" 
F 0 "C807" H 4615 2796 50  0000 L CNN
F 1 "470n" H 4615 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4538 2600 50  0001 C CNN
F 3 "~" H 4500 2750 50  0001 C CNN
	1    4500 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2650 2900 2650 3200
Wire Wire Line
	2100 2300 2650 2300
Wire Wire Line
	2650 2600 2650 2300
Connection ~ 2650 2300
Wire Wire Line
	2650 2300 3100 2300
Wire Wire Line
	3100 2600 3100 2300
Connection ~ 3100 2300
Wire Wire Line
	3100 2300 3550 2300
Wire Wire Line
	3550 2600 3550 2300
Wire Wire Line
	4500 2600 4500 2300
Wire Wire Line
	4500 2300 4900 2300
Wire Wire Line
	6500 3200 7200 3200
Connection ~ 6500 3200
Connection ~ 7200 3200
Wire Wire Line
	7200 3200 7650 3200
Wire Wire Line
	6950 2500 7200 2500
Wire Wire Line
	7200 2500 7200 2600
Wire Wire Line
	2650 3200 3100 3200
Wire Wire Line
	3100 2900 3100 3200
Connection ~ 3100 3200
Wire Wire Line
	3100 3200 3550 3200
Wire Wire Line
	3550 2900 3550 3200
Wire Wire Line
	4500 2900 4500 3200
Connection ~ 4500 3200
Wire Wire Line
	4500 3200 5400 3200
Wire Wire Line
	5400 2700 5400 3200
Wire Wire Line
	6500 2900 6500 3200
Wire Wire Line
	7200 2900 7200 3200
Wire Wire Line
	7650 3200 7650 2900
$Comp
L Device:R R1102
U 1 1 6147393D
P 5750 1900
AR Path="/614AE8DA/6147393D" Ref="R1102"  Part="1" 
AR Path="/614AB031/6147393D" Ref="R802"  Part="1" 
F 0 "R802" V 5543 1900 50  0000 C CNN
F 1 "4.3K" V 5634 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5680 1900 50  0001 C CNN
F 3 "~" H 5750 1900 50  0001 C CNN
	1    5750 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	5900 1900 7200 1900
$Comp
L Device:R R1101
U 1 1 61475A47
P 4850 1900
AR Path="/614AE8DA/61475A47" Ref="R1101"  Part="1" 
AR Path="/614AB031/61475A47" Ref="R801"  Part="1" 
F 0 "R801" V 4643 1900 50  0000 C CNN
F 1 "1K" V 4734 1900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4780 1900 50  0001 C CNN
F 3 "~" H 4850 1900 50  0001 C CNN
	1    4850 1900
	0    1    1    0   
$EndComp
Wire Wire Line
	5000 1900 5350 1900
$Comp
L power:GND #PWR01101
U 1 1 61477A40
P 4600 2050
AR Path="/614AE8DA/61477A40" Ref="#PWR01101"  Part="1" 
AR Path="/614AB031/61477A40" Ref="#PWR0801"  Part="1" 
F 0 "#PWR0801" H 4600 1800 50  0001 C CNN
F 1 "GND" H 4605 1877 50  0000 C CNN
F 2 "" H 4600 2050 50  0001 C CNN
F 3 "" H 4600 2050 50  0001 C CNN
	1    4600 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 2050 4600 1900
Wire Wire Line
	4600 1900 4700 1900
Wire Wire Line
	5350 2100 5350 1900
Connection ~ 5350 1900
Wire Wire Line
	5350 1900 5600 1900
Text Notes 6100 1850 0    50   ~ 0
Keep feedback wiring\naway from inductor flux
Text Notes 5350 3500 0    50   ~ 0
Capacitors, diode and groud must be connected\nto the regulator with short leads and traces,\nuse ground plane construction 
Text Notes 7250 4250 0    50   ~ 0
Vin,max = 24 V\nVout = 6.5 V\nVsat = Rds,on * I = 0.14 Ohm * 5 A = 0.7V\nVd = 0.7 V ??? (shotky diode drop)\n\nE * T = (Vin,max - Vout - Vsat) * (Vout + Vd)/(Vin,max - Vsat + Vd) * 1000/260 = \n=  16.8 * 7.2 / 24 * 1000/260 = 19.38 V*us => 22 uH coil (see datasheet p. 18)
$Comp
L Device:C C811
U 1 1 6169A3CC
P 8750 2750
AR Path="/614AB031/6169A3CC" Ref="C811"  Part="1" 
AR Path="/614AE8DA/6169A3CC" Ref="C1111"  Part="1" 
F 0 "C811" H 8865 2796 50  0000 L CNN
F 1 "100n" H 8865 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8788 2600 50  0001 C CNN
F 3 "~" H 8750 2750 50  0001 C CNN
	1    8750 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8750 2600 8750 2500
Wire Wire Line
	8750 2500 9250 2500
Wire Wire Line
	7650 3200 8200 3200
Wire Wire Line
	8750 3200 8750 2900
$Comp
L Device:C C801
U 1 1 616AD78A
P 5750 1550
AR Path="/614AB031/616AD78A" Ref="C801"  Part="1" 
AR Path="/614AE8DA/616AD78A" Ref="C1101"  Part="1" 
F 0 "C801" V 5498 1550 50  0000 C CNN
F 1 "C" V 5589 1550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 5788 1400 50  0001 C CNN
F 3 "~" H 5750 1550 50  0001 C CNN
	1    5750 1550
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 1550 5350 1550
Wire Wire Line
	5350 1550 5350 1900
Wire Wire Line
	5900 1550 7200 1550
Wire Wire Line
	7200 1550 7200 1900
$Comp
L Diode:1.5KExxA D803
U 1 1 616C4247
P 9250 2750
AR Path="/614AB031/616C4247" Ref="D803"  Part="1" 
AR Path="/614AE8DA/616C4247" Ref="D1103"  Part="1" 
F 0 "D803" V 9204 2830 50  0000 L CNN
F 1 "TVS" V 9295 2830 50  0000 L CNN
F 2 "Diode_SMD:D_SMA_Handsoldering" H 9250 2550 50  0001 C CNN
F 3 "https://www.vishay.com/docs/88301/15ke.pdf" H 9200 2750 50  0001 C CNN
	1    9250 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	8750 3200 9250 3200
Wire Wire Line
	9250 3200 9250 2900
Connection ~ 8750 3200
Wire Wire Line
	9250 2600 9250 2500
Connection ~ 9250 2500
Wire Wire Line
	9250 1200 9250 2500
Wire Wire Line
	9250 2500 9750 2500
Wire Wire Line
	2650 1200 2650 2300
Wire Wire Line
	7200 2500 7650 2500
Wire Wire Line
	7650 2500 7650 2600
Connection ~ 7200 2500
Wire Wire Line
	7650 2500 8200 2500
Connection ~ 8750 2500
Wire Wire Line
	7200 1900 7200 2500
Connection ~ 7200 1900
$Comp
L Device:C C810
U 1 1 617136B8
P 8200 2750
AR Path="/614AB031/617136B8" Ref="C810"  Part="1" 
AR Path="/614AE8DA/617136B8" Ref="C1110"  Part="1" 
F 0 "C810" H 8315 2796 50  0000 L CNN
F 1 "10u" H 8315 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 8238 2600 50  0001 C CNN
F 3 "~" H 8200 2750 50  0001 C CNN
	1    8200 2750
	1    0    0    -1  
$EndComp
Connection ~ 7650 2500
Connection ~ 7650 3200
Wire Wire Line
	8200 2900 8200 3200
Connection ~ 8200 3200
Wire Wire Line
	8200 3200 8750 3200
Wire Wire Line
	8200 2600 8200 2500
Connection ~ 8200 2500
Wire Wire Line
	8200 2500 8750 2500
$Comp
L Device:C C806
U 1 1 61725C25
P 4050 2750
AR Path="/614AB031/61725C25" Ref="C806"  Part="1" 
AR Path="/614AE8DA/61725C25" Ref="C1106"  Part="1" 
F 0 "C806" H 4165 2796 50  0000 L CNN
F 1 "10u" H 4165 2705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1210_3225Metric_Pad1.33x2.70mm_HandSolder" H 4088 2600 50  0001 C CNN
F 3 "~" H 4050 2750 50  0001 C CNN
	1    4050 2750
	1    0    0    -1  
$EndComp
Connection ~ 4500 2300
Wire Wire Line
	4050 2600 4050 2300
Wire Wire Line
	4050 2900 4050 3200
Wire Wire Line
	4050 2300 4500 2300
Wire Wire Line
	4050 3200 4500 3200
Wire Wire Line
	3550 2300 4050 2300
Connection ~ 3550 2300
Connection ~ 4050 2300
Wire Wire Line
	3550 3200 4050 3200
Connection ~ 3550 3200
Connection ~ 4050 3200
$Comp
L Device:D_Schottky D801
U 1 1 616C93E8
P 6300 1200
AR Path="/614AB031/616C93E8" Ref="D801"  Part="1" 
AR Path="/614AE8DA/616C93E8" Ref="D1101"  Part="1" 
F 0 "D801" H 6300 1417 50  0000 C CNN
F 1 "SS14" H 6300 1326 50  0000 C CNN
F 2 "Diode_SMD:D_SMA-SMB_Universal_Handsoldering" H 6300 1200 50  0001 C CNN
F 3 "~" H 6300 1200 50  0001 C CNN
	1    6300 1200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 1200 9250 1200
Wire Wire Line
	2650 1200 6150 1200
$Sheet
S 2600 3800 1050 400 
U 618915A5
F0 "LED Power Enable" 50
F1 "led_power_enable.sch" 50
F2 "EN_3V3" I L 2600 4000 50 
F3 "EN" O R 3650 4000 50 
$EndSheet
Text HLabel 2100 4000 0    50   Input ~ 0
EN_3V3
Wire Wire Line
	2100 4000 2600 4000
Wire Wire Line
	4900 2500 4900 4000
Wire Wire Line
	3650 4000 4900 4000
Text Notes 7450 1900 0    50   ~ 0
Vout = 1.21V * (1 + Rx02/Rx01)\nRx02 = Rx01 * (Vout/1.21V - 1)\nRx02 = 1K * (6.5V/1.21V - 1)\nRx02 = 4.37K
Text Notes 4250 1550 0    50   ~ 0
Alt. 1.2K and 4.7K (1%)
$EndSCHEMATC
