EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 9
Title "WS2812 Controller"
Date "2021-09-21"
Rev "1"
Comp "Stefan Misik"
Comment1 "LED Power Supply"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 2700 2300 0    50   Input ~ 0
VIN
Text HLabel 2700 5750 0    50   Input ~ 0
EN_3V3
Text HLabel 8200 2500 2    50   Output ~ 0
VOUT
$Comp
L my:LM2678T-ADJ U401
U 1 1 6145ECF0
P 5400 2400
AR Path="/614AB031/6145ECF0" Ref="U401"  Part="1" 
AR Path="/614AE8DA/6145ECF0" Ref="U601"  Part="1" 
F 0 "U401" H 5550 2750 50  0000 C CNN
F 1 "LM2678T-ADJ" H 5650 2650 50  0000 C CNN
F 2 "Package_TO_SOT_THT:TO-220-7_P2.54x3.7mm_StaggerOdd_Lead3.8mm_Vertical" H 5450 2150 50  0001 L CIN
F 3 "https://www.ti.com/lit/ds/symlink/lm2678.pdf" H 5400 2400 50  0001 C CNN
	1    5400 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:C C405
U 1 1 6145FC0F
P 6150 2300
AR Path="/614AB031/6145FC0F" Ref="C405"  Part="1" 
AR Path="/614AE8DA/6145FC0F" Ref="C605"  Part="1" 
F 0 "C405" V 5898 2300 50  0000 C CNN
F 1 "10n 50V" V 5989 2300 50  0000 C CNN
F 2 "" H 6188 2150 50  0001 C CNN
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
L power:GND #PWR0403
U 1 1 61460B18
P 4550 3400
AR Path="/614AB031/61460B18" Ref="#PWR0403"  Part="1" 
AR Path="/614AE8DA/61460B18" Ref="#PWR0603"  Part="1" 
F 0 "#PWR0403" H 4550 3150 50  0001 C CNN
F 1 "GND" H 4555 3227 50  0000 C CNN
F 2 "" H 4550 3400 50  0001 C CNN
F 3 "" H 4550 3400 50  0001 C CNN
	1    4550 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 3400 4550 3200
$Comp
L Device:D_Schottky D601
U 1 1 61461C6E
P 6500 2750
AR Path="/614AE8DA/61461C6E" Ref="D601"  Part="1" 
AR Path="/614AB031/61461C6E" Ref="D401"  Part="1" 
F 0 "D401" V 6454 2830 50  0000 L CNN
F 1 "???" V 6545 2830 50  0000 L CNN
F 2 "" H 6500 2750 50  0001 C CNN
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
L Device:L L601
U 1 1 61462D51
P 6800 2500
AR Path="/614AE8DA/61462D51" Ref="L601"  Part="1" 
AR Path="/614AB031/61462D51" Ref="L401"  Part="1" 
F 0 "L401" V 6990 2500 50  0000 C CNN
F 1 "22uH" V 6899 2500 50  0000 C CNN
F 2 "" H 6800 2500 50  0001 C CNN
F 3 "~" H 6800 2500 50  0001 C CNN
	1    6800 2500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6500 2500 6650 2500
$Comp
L Device:CP C606
U 1 1 61463CC3
P 7200 2750
AR Path="/614AE8DA/61463CC3" Ref="C606"  Part="1" 
AR Path="/614AB031/61463CC3" Ref="C406"  Part="1" 
F 0 "C406" H 7318 2796 50  0000 L CNN
F 1 "220u" H 7318 2705 50  0000 L CNN
F 2 "" H 7238 2600 50  0001 C CNN
F 3 "~" H 7200 2750 50  0001 C CNN
	1    7200 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C607
U 1 1 6146511A
P 7650 2750
AR Path="/614AE8DA/6146511A" Ref="C607"  Part="1" 
AR Path="/614AB031/6146511A" Ref="C407"  Part="1" 
F 0 "C407" H 7768 2796 50  0000 L CNN
F 1 "220u" H 7768 2705 50  0000 L CNN
F 2 "" H 7688 2600 50  0001 C CNN
F 3 "~" H 7650 2750 50  0001 C CNN
	1    7650 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C603
U 1 1 61465477
P 4150 2750
AR Path="/614AE8DA/61465477" Ref="C603"  Part="1" 
AR Path="/614AB031/61465477" Ref="C403"  Part="1" 
F 0 "C403" H 4268 2796 50  0000 L CNN
F 1 "15u" H 4268 2705 50  0000 L CNN
F 2 "" H 4188 2600 50  0001 C CNN
F 3 "~" H 4150 2750 50  0001 C CNN
	1    4150 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C602
U 1 1 614679D1
P 3700 2750
AR Path="/614AE8DA/614679D1" Ref="C602"  Part="1" 
AR Path="/614AB031/614679D1" Ref="C402"  Part="1" 
F 0 "C402" H 3818 2796 50  0000 L CNN
F 1 "15u" H 3818 2705 50  0000 L CNN
F 2 "" H 3738 2600 50  0001 C CNN
F 3 "~" H 3700 2750 50  0001 C CNN
	1    3700 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C601
U 1 1 61467CFC
P 3250 2750
AR Path="/614AE8DA/61467CFC" Ref="C601"  Part="1" 
AR Path="/614AB031/61467CFC" Ref="C401"  Part="1" 
F 0 "C401" H 3368 2796 50  0000 L CNN
F 1 "15u" H 3368 2705 50  0000 L CNN
F 2 "" H 3288 2600 50  0001 C CNN
F 3 "~" H 3250 2750 50  0001 C CNN
	1    3250 2750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C604
U 1 1 614681BF
P 4550 2750
AR Path="/614AE8DA/614681BF" Ref="C604"  Part="1" 
AR Path="/614AB031/614681BF" Ref="C404"  Part="1" 
F 0 "C404" H 4665 2796 50  0000 L CNN
F 1 "470n" H 4665 2705 50  0000 L CNN
F 2 "" H 4588 2600 50  0001 C CNN
F 3 "~" H 4550 2750 50  0001 C CNN
	1    4550 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2900 3250 3200
Wire Wire Line
	2700 2300 3250 2300
Wire Wire Line
	3250 2600 3250 2300
Connection ~ 3250 2300
Wire Wire Line
	3250 2300 3700 2300
Wire Wire Line
	3700 2600 3700 2300
Connection ~ 3700 2300
Wire Wire Line
	3700 2300 4150 2300
Wire Wire Line
	4150 2600 4150 2300
Connection ~ 4150 2300
Wire Wire Line
	4150 2300 4550 2300
Wire Wire Line
	4550 2600 4550 2300
Connection ~ 4550 2300
Wire Wire Line
	4550 2300 4900 2300
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
	7200 2500 7650 2500
Wire Wire Line
	7650 2500 7650 2600
Connection ~ 7200 2500
Wire Wire Line
	3250 3200 3700 3200
Wire Wire Line
	3700 2900 3700 3200
Connection ~ 3700 3200
Wire Wire Line
	3700 3200 4150 3200
Wire Wire Line
	4150 2900 4150 3200
Connection ~ 4150 3200
Wire Wire Line
	4150 3200 4550 3200
Wire Wire Line
	4550 2900 4550 3200
Connection ~ 4550 3200
Wire Wire Line
	4550 3200 5400 3200
Wire Wire Line
	5400 2700 5400 3200
Wire Wire Line
	6500 2900 6500 3200
Wire Wire Line
	7200 2900 7200 3200
Wire Wire Line
	7650 3200 7650 2900
Wire Wire Line
	7650 2500 8200 2500
Connection ~ 7650 2500
$Comp
L Device:R R607
U 1 1 6147393D
P 5800 1650
AR Path="/614AE8DA/6147393D" Ref="R607"  Part="1" 
AR Path="/614AB031/6147393D" Ref="R407"  Part="1" 
F 0 "R407" V 5593 1650 50  0000 C CNN
F 1 "R" V 5684 1650 50  0000 C CNN
F 2 "" V 5730 1650 50  0001 C CNN
F 3 "~" H 5800 1650 50  0001 C CNN
	1    5800 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	5950 1650 7650 1650
Wire Wire Line
	7650 1650 7650 2500
$Comp
L Device:R R606
U 1 1 61475A47
P 4900 1650
AR Path="/614AE8DA/61475A47" Ref="R606"  Part="1" 
AR Path="/614AB031/61475A47" Ref="R406"  Part="1" 
F 0 "R406" V 4693 1650 50  0000 C CNN
F 1 "R" V 4784 1650 50  0000 C CNN
F 2 "" V 4830 1650 50  0001 C CNN
F 3 "~" H 4900 1650 50  0001 C CNN
	1    4900 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 1650 5350 1650
$Comp
L power:GND #PWR0604
U 1 1 61477A40
P 4600 1800
AR Path="/614AE8DA/61477A40" Ref="#PWR0604"  Part="1" 
AR Path="/614AB031/61477A40" Ref="#PWR0404"  Part="1" 
F 0 "#PWR0404" H 4600 1550 50  0001 C CNN
F 1 "GND" H 4605 1627 50  0000 C CNN
F 2 "" H 4600 1800 50  0001 C CNN
F 3 "" H 4600 1800 50  0001 C CNN
	1    4600 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1800 4600 1650
Wire Wire Line
	4600 1650 4750 1650
Wire Wire Line
	5350 2100 5350 1650
Connection ~ 5350 1650
Wire Wire Line
	5350 1650 5650 1650
Text Notes 6100 1600 0    50   ~ 0
Keep feedback wiring\naway from inductor flux
Text Notes 4800 3500 0    50   ~ 0
Capacitors, diode and groud must be connected\nto the regulator with short leads and traces,\nuse ground plane construction 
$Comp
L Device:R R601
U 1 1 6147DB7E
P 3250 5750
AR Path="/614AE8DA/6147DB7E" Ref="R601"  Part="1" 
AR Path="/614AB031/6147DB7E" Ref="R401"  Part="1" 
F 0 "R401" V 3043 5750 50  0000 C CNN
F 1 "R" V 3134 5750 50  0000 C CNN
F 2 "" V 3180 5750 50  0001 C CNN
F 3 "~" H 3250 5750 50  0001 C CNN
	1    3250 5750
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NPN_BEC Q601
U 1 1 6147EFCD
P 3750 5750
AR Path="/614AE8DA/6147EFCD" Ref="Q601"  Part="1" 
AR Path="/614AB031/6147EFCD" Ref="Q401"  Part="1" 
F 0 "Q401" H 3941 5796 50  0000 L CNN
F 1 "BC817" H 3941 5705 50  0000 L CNN
F 2 "" H 3950 5850 50  0001 C CNN
F 3 "~" H 3750 5750 50  0001 C CNN
	1    3750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5750 3550 5750
$Comp
L Device:Q_PNP_BEC Q602
U 1 1 61480A0D
P 4350 4900
AR Path="/614AE8DA/61480A0D" Ref="Q602"  Part="1" 
AR Path="/614AB031/61480A0D" Ref="Q402"  Part="1" 
F 0 "Q402" H 4541 4854 50  0000 L CNN
F 1 "BC807" H 4541 4945 50  0000 L CNN
F 2 "" H 4550 5000 50  0001 C CNN
F 3 "~" H 4350 4900 50  0001 C CNN
	1    4350 4900
	1    0    0    1   
$EndComp
$Comp
L Device:R R604
U 1 1 6148128F
P 3850 5200
AR Path="/614AE8DA/6148128F" Ref="R604"  Part="1" 
AR Path="/614AB031/6148128F" Ref="R404"  Part="1" 
F 0 "R404" H 3920 5246 50  0000 L CNN
F 1 "R" H 3920 5155 50  0000 L CNN
F 2 "" V 3780 5200 50  0001 C CNN
F 3 "~" H 3850 5200 50  0001 C CNN
	1    3850 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R603
U 1 1 614817B0
P 3850 4600
AR Path="/614AE8DA/614817B0" Ref="R603"  Part="1" 
AR Path="/614AB031/614817B0" Ref="R403"  Part="1" 
F 0 "R403" H 3920 4646 50  0000 L CNN
F 1 "R" H 3920 4555 50  0000 L CNN
F 2 "" V 3780 4600 50  0001 C CNN
F 3 "~" H 3850 4600 50  0001 C CNN
	1    3850 4600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0601
U 1 1 61483286
P 3850 6250
AR Path="/614AE8DA/61483286" Ref="#PWR0601"  Part="1" 
AR Path="/614AB031/61483286" Ref="#PWR0401"  Part="1" 
F 0 "#PWR0401" H 3850 6000 50  0001 C CNN
F 1 "GND" H 3855 6077 50  0000 C CNN
F 2 "" H 3850 6250 50  0001 C CNN
F 3 "" H 3850 6250 50  0001 C CNN
	1    3850 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6250 3850 6100
Wire Wire Line
	3850 5550 3850 5350
Wire Wire Line
	3850 5050 3850 4900
$Comp
L power:+5V #PWR0602
U 1 1 61486663
P 4450 4150
AR Path="/614AE8DA/61486663" Ref="#PWR0602"  Part="1" 
AR Path="/614AB031/61486663" Ref="#PWR0402"  Part="1" 
F 0 "#PWR0402" H 4450 4000 50  0001 C CNN
F 1 "+5V" H 4465 4323 50  0000 C CNN
F 2 "" H 4450 4150 50  0001 C CNN
F 3 "" H 4450 4150 50  0001 C CNN
	1    4450 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4150 4450 4250
Wire Wire Line
	3850 4450 3850 4250
Wire Wire Line
	3850 4250 4450 4250
Connection ~ 4450 4250
Wire Wire Line
	4450 4250 4450 4700
Wire Wire Line
	4150 4900 3850 4900
Connection ~ 3850 4900
Wire Wire Line
	3850 4900 3850 4750
$Comp
L Device:R R605
U 1 1 6148D73D
P 4450 5500
AR Path="/614AE8DA/6148D73D" Ref="R605"  Part="1" 
AR Path="/614AB031/6148D73D" Ref="R405"  Part="1" 
F 0 "R405" H 4520 5546 50  0000 L CNN
F 1 "R" H 4520 5455 50  0000 L CNN
F 2 "" V 4380 5500 50  0001 C CNN
F 3 "~" H 4450 5500 50  0001 C CNN
	1    4450 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 6100 4450 6100
Wire Wire Line
	4450 6100 4450 5650
Connection ~ 3850 6100
Wire Wire Line
	3850 6100 3850 5950
Wire Wire Line
	4450 5350 4450 5250
Wire Wire Line
	4450 5250 4850 5250
Connection ~ 4450 5250
Wire Wire Line
	4450 5250 4450 5100
Text Label 5050 5250 0    50   ~ 0
ENABLE
Text Label 5000 2750 0    50   ~ 0
ENABLE
Wire Wire Line
	5000 2750 4850 2750
Wire Wire Line
	4850 2750 4850 2500
Wire Wire Line
	4850 2500 4900 2500
$Comp
L Device:R R602
U 1 1 614CC1BE
P 3600 6700
AR Path="/614AE8DA/614CC1BE" Ref="R602"  Part="1" 
AR Path="/614AB031/614CC1BE" Ref="R402"  Part="1" 
F 0 "R402" V 3393 6700 50  0000 C CNN
F 1 "R" V 3484 6700 50  0000 C CNN
F 2 "" V 3530 6700 50  0001 C CNN
F 3 "~" H 3600 6700 50  0001 C CNN
	1    3600 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	3750 6700 4850 6700
Wire Wire Line
	4850 6700 4850 5250
Connection ~ 4850 5250
Wire Wire Line
	4850 5250 5050 5250
Text Notes 3450 6850 0    50   ~ 0
not fitted
Wire Wire Line
	2700 5750 2900 5750
Wire Wire Line
	3450 6700 2900 6700
Wire Wire Line
	2900 6700 2900 5750
Connection ~ 2900 5750
Wire Wire Line
	2900 5750 3100 5750
Text Notes 6750 4650 0    50   ~ 0
Vin,max = 24 V\nVout = 6.5 V\nVsat = Rds,on * I = 0.14 Ohm * 5 A = 0.7V\nVd = 0.7 V ??? (shotky diode drop)\n\nE * T = (Vin,max - Vout - Vsat) * (Vout + Vd)/(Vin,max - Vsat + Vd) * 1000/260 = \n=  16.8 * 7.2 / 24 * 1000/260 = 19.38 V*us => 22 uH coil (see datasheet p. 18)
$EndSCHEMATC
