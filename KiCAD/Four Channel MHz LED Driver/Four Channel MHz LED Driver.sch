EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
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
L power:GND #PWR0110
U 1 1 5F3D013F
P 5550 2600
F 0 "#PWR0110" H 5550 2350 50  0001 C CNN
F 1 "GND" H 5750 2500 50  0000 R CNN
F 2 "" H 5550 2600 50  0001 C CNN
F 3 "" H 5550 2600 50  0001 C CNN
	1    5550 2600
	1    0    0    -1  
$EndComp
Text Label 13450 1350 0    50   ~ 0
5V
Text Label 11150 2750 2    50   ~ 0
3.3V
$Comp
L power:GND #PWR0118
U 1 1 5F3EF0B8
P 11150 1350
F 0 "#PWR0118" H 11150 1100 50  0001 C CNN
F 1 "GND" V 11150 1200 50  0000 R CNN
F 2 "" H 11150 1350 50  0001 C CNN
F 3 "" H 11150 1350 50  0001 C CNN
	1    11150 1350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F3DEA30
P 13450 1450
F 0 "#PWR0119" H 13450 1200 50  0001 C CNN
F 1 "GND" V 13450 1300 50  0000 R CNN
F 2 "" H 13450 1450 50  0001 C CNN
F 3 "" H 13450 1450 50  0001 C CNN
	1    13450 1450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F3F47A9
P 13450 2750
F 0 "#PWR0120" H 13450 2500 50  0001 C CNN
F 1 "GND" V 13450 2600 50  0000 R CNN
F 2 "" H 13450 2750 50  0001 C CNN
F 3 "" H 13450 2750 50  0001 C CNN
	1    13450 2750
	0    -1   -1   0   
$EndComp
$Comp
L Custom_parts:Teensy3.6 U14
U 1 1 5F413A64
P 12300 3500
F 0 "U14" H 12300 5937 60  0000 C CNN
F 1 "Teensy3.6" H 12300 5831 60  0000 C CNN
F 2 "Custom Footprints:Teensy_3_6_with_headers" H 12300 3550 60  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sparkfun%20PDFs/DEV-14058_Web.pdf" H 12300 5831 60  0001 C CNN
F 4 "SparkFun Electronics" H 12300 3500 50  0001 C CNN "Manufacturer"
F 5 "DEV-14058" H 12300 3500 50  0001 C CNN "Part #"
	1    12300 3500
	1    0    0    -1  
$EndComp
NoConn ~ 11150 3750
NoConn ~ 11150 3850
NoConn ~ 11150 3950
NoConn ~ 11150 4050
NoConn ~ 11150 4150
NoConn ~ 11150 4250
NoConn ~ 11150 4350
NoConn ~ 11150 4450
NoConn ~ 11150 4550
NoConn ~ 11150 4700
NoConn ~ 11150 4800
NoConn ~ 11150 4900
NoConn ~ 11150 5000
NoConn ~ 11150 5100
NoConn ~ 11150 5200
NoConn ~ 11150 5300
NoConn ~ 11150 5400
NoConn ~ 11150 5500
NoConn ~ 11150 5600
NoConn ~ 13450 3800
NoConn ~ 13450 3900
NoConn ~ 13450 4000
NoConn ~ 13450 4100
NoConn ~ 13450 4200
NoConn ~ 13450 4300
NoConn ~ 13450 4400
NoConn ~ 13450 4500
NoConn ~ 13450 4600
NoConn ~ 13450 4700
NoConn ~ 13450 4800
NoConn ~ 13450 4900
NoConn ~ 13450 5000
NoConn ~ 13450 5100
NoConn ~ 13450 5200
NoConn ~ 13450 5300
NoConn ~ 13450 5400
NoConn ~ 13450 5500
NoConn ~ 13450 5600
Text Notes 3900 10350 0    59   ~ 0
4-channel analog/digital IO with 0-3.3V clamp
Text Label 6150 10950 0    50   ~ 0
3.3V
Text Label 6150 11150 0    50   ~ 0
3.3V
$Comp
L power:GND #PWR0125
U 1 1 5F48EF12
P 5400 10750
F 0 "#PWR0125" H 5400 10500 50  0001 C CNN
F 1 "GND" V 5300 10700 50  0000 R CNN
F 2 "" H 5400 10750 50  0001 C CNN
F 3 "" H 5400 10750 50  0001 C CNN
	1    5400 10750
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:BAT54BRW D3
U 1 1 5F48EF0C
P 5600 10850
F 0 "D3" H 5775 11197 60  0000 C CNN
F 1 "BAT54BRW" H 5775 11091 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5800 11050 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 5800 11150 60  0001 L CNN
F 4 "Diodes Incorporated" H 5600 10850 50  0001 C CNN "Manufacturer"
F 5 "BAT54BRW-7-F" H 5600 10850 50  0001 C CNN "Part #"
	1    5600 10850
	1    0    0    -1  
$EndComp
Text Notes 14550 3450 1    50   ~ 0
--ADC1--
Text Notes 14600 2850 2    50   ~ 0
ADC1
Text Notes 14600 2950 2    50   ~ 0
ADC0
Text Notes 14550 2550 1    50   ~ 0
-------ADC0------
Text Notes 14600 3550 2    50   ~ 0
ADC0
Text Notes 14600 3650 2    50   ~ 0
ADC0
Text Notes 10200 3550 2    50   ~ 0
ADC1
Text Notes 10200 3650 2    50   ~ 0
ADC1
Text Notes 14750 4050 1    50   ~ 0
https://forum.pjrc.com/attachment.php?attachmentid=10666&d=1495536536
$Comp
L Device:CP1_Small C1
U 1 1 5F41CA67
P 950 2900
F 0 "C1" H 900 3200 50  0000 L CNN
F 1 "7500uF" H 750 3100 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_18x22" H 950 2900 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDE0000/ABA0000C1247.pdf" H 950 2900 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 950 2900 50  0001 C CNN "Manufacturer"
F 5 "EEE-FK1C752SM" H 950 2900 50  0001 C CNN "Part #"
	1    950  2900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5F41E64F
P 950 3000
F 0 "#PWR0127" H 950 2750 50  0001 C CNN
F 1 "GND" H 950 3000 50  0000 R CNN
F 2 "" H 950 3000 50  0001 C CNN
F 3 "" H 950 3000 50  0001 C CNN
	1    950  3000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5F422559
P 950 3550
F 0 "#PWR0128" H 950 3300 50  0001 C CNN
F 1 "GND" H 950 3550 50  0000 R CNN
F 2 "" H 950 3550 50  0001 C CNN
F 3 "" H 950 3550 50  0001 C CNN
	1    950  3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5F437161
P 1200 2900
F 0 "C4" H 1200 2600 50  0000 C CNN
F 1 "47uF" H 1200 2700 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1200 2900 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1200 2900 50  0001 C CNN
F 4 "Murata Electronics" H 1200 2900 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1200 2900 50  0001 C CNN "Part #"
	1    1200 2900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5F45FB13
P 950 4100
F 0 "#PWR0129" H 950 3850 50  0001 C CNN
F 1 "GND" H 950 4100 50  0000 R CNN
F 2 "" H 950 4100 50  0001 C CNN
F 3 "" H 950 4100 50  0001 C CNN
	1    950  4100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5F47CF6E
P 1200 3000
F 0 "#PWR0131" H 1200 2750 50  0001 C CNN
F 1 "GND" H 1200 3000 50  0000 R CNN
F 2 "" H 1200 3000 50  0001 C CNN
F 3 "" H 1200 3000 50  0001 C CNN
	1    1200 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5F47E382
P 1200 3450
F 0 "C5" H 1200 3150 50  0000 C CNN
F 1 "47uF" H 1200 3250 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1200 3450 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1200 3450 50  0001 C CNN
F 4 "Murata Electronics" H 1200 3450 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1200 3450 50  0001 C CNN "Part #"
	1    1200 3450
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5F47E388
P 1200 3550
F 0 "#PWR0132" H 1200 3300 50  0001 C CNN
F 1 "GND" H 1200 3550 50  0000 R CNN
F 2 "" H 1200 3550 50  0001 C CNN
F 3 "" H 1200 3550 50  0001 C CNN
	1    1200 3550
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5F488538
P 1200 4000
F 0 "C6" H 1200 3700 50  0000 C CNN
F 1 "47uF" H 1200 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1200 4000 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1200 4000 50  0001 C CNN
F 4 "Murata Electronics" H 1200 4000 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1200 4000 50  0001 C CNN "Part #"
	1    1200 4000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5F48853E
P 1200 4100
F 0 "#PWR0133" H 1200 3850 50  0001 C CNN
F 1 "GND" H 1200 4100 50  0000 R CNN
F 2 "" H 1200 4100 50  0001 C CNN
F 3 "" H 1200 4100 50  0001 C CNN
	1    1200 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5F48D56B
P 1200 4550
F 0 "C8" H 1200 4250 50  0000 C CNN
F 1 "47uF" H 1200 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1200 4550 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1200 4550 50  0001 C CNN
F 4 "Murata Electronics" H 1200 4550 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1200 4550 50  0001 C CNN "Part #"
	1    1200 4550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5F48D571
P 1200 4650
F 0 "#PWR0134" H 1200 4400 50  0001 C CNN
F 1 "GND" H 1200 4650 50  0000 R CNN
F 2 "" H 1200 4650 50  0001 C CNN
F 3 "" H 1200 4650 50  0001 C CNN
	1    1200 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1200 2800 950  2800
Wire Wire Line
	650  4450 650  3900
Wire Wire Line
	650  2800 950  2800
Connection ~ 950  2800
Connection ~ 650  3350
Wire Wire Line
	650  3350 650  2800
Connection ~ 650  3900
Wire Wire Line
	650  3900 650  3350
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5F4EBD0C
P 1650 2800
F 0 "JP1" H 1650 2900 50  0000 C CNN
F 1 "LED wire" H 1650 3000 50  0000 C CNN
F 2 "Custom Footprints:L-Wire_Pad" H 1650 2800 50  0001 C CNN
F 3 "~" H 1650 2800 50  0001 C CNN
	1    1650 2800
	1    0    0    -1  
$EndComp
Connection ~ 1200 2800
Wire Wire Line
	1550 3350 1200 3350
Wire Wire Line
	1550 3900 1200 3900
Wire Wire Line
	1550 4450 1200 4450
Connection ~ 1200 3350
Connection ~ 1200 3900
Connection ~ 1200 4450
Text Label 7400 1600 0    50   ~ 0
-1.8V-analog
Text Label 7550 2200 0    50   ~ 0
12V
Wire Wire Line
	7500 2700 7550 2700
Wire Wire Line
	7550 2700 7550 2400
Wire Wire Line
	7550 2400 7500 2400
Wire Wire Line
	6100 2400 6050 2400
NoConn ~ 6100 2500
Wire Wire Line
	6750 3050 6350 3050
Wire Wire Line
	6050 3050 6050 2600
Wire Wire Line
	6050 2600 6100 2600
$Comp
L power:GND #PWR0159
U 1 1 5F4C5626
P 6350 3050
F 0 "#PWR0159" H 6350 2800 50  0001 C CNN
F 1 "GND" H 6400 2900 50  0000 R CNN
F 2 "" H 6350 3050 50  0001 C CNN
F 3 "" H 6350 3050 50  0001 C CNN
	1    6350 3050
	1    0    0    -1  
$EndComp
Connection ~ 6350 3050
Wire Wire Line
	6350 3050 6050 3050
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5F44DFD5
P 9650 8050
F 0 "Q2" H 9854 8096 50  0000 L CNN
F 1 "SUM70060E" H 9854 8005 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 9850 8150 50  0001 C CNN
F 3 "https://www.vishay.com/docs/65383/sum70060e.pdf" H 9650 8050 50  0001 C CNN
F 4 "Vishay Siliconix" H 9650 8050 50  0001 C CNN "Manufacturer"
F 5 "SUM70060E-GE3" H 9650 8050 50  0001 C CNN "Part #"
	1    9650 8050
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:LT6200CS8-10 U10
U 1 1 5F4636E7
P 8050 8050
F 0 "U10" H 8394 8096 50  0000 L CNN
F 1 "LT6200CS8-10" H 8250 7950 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 8100 8100 50  0001 C CNN
F 3 "http://www.linear.com/docs/3869" H 8100 8200 50  0001 C CNN
F 4 "Analog Devices Inc." H 8050 8050 50  0001 C CNN "Manufacturer"
F 5 "LT6200CS8-10#PBF" H 8050 8050 50  0001 C CNN "Part #"
	1    8050 8050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8350 8050 8850 8050
Text Label 7750 7950 2    50   ~ 0
OA_input
$Comp
L Device:C_Small C21
U 1 1 5F4739EC
P 8850 8250
F 0 "C21" H 9000 8250 50  0000 C CNN
F 1 "2200pF" H 9000 8150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 8850 8250 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 8850 8250 50  0001 C CNN
F 4 "KEMET" H 8850 8250 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 8850 8250 50  0001 C CNN "Part #"
	1    8850 8250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8850 8050 8850 8150
Connection ~ 8850 8050
NoConn ~ 8050 8350
$Comp
L Device:C_Small C18
U 1 1 5F487FD4
P 8050 8450
F 0 "C18" V 8250 8400 50  0000 L CNN
F 1 "2.2uF" V 8150 8350 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 8050 8450 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 8050 8450 50  0001 C CNN
F 4 "Taiyo Yuden" H 8050 8450 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 8050 8450 50  0001 C CNN "Part #"
	1    8050 8450
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C17
U 1 1 5F489B13
P 8050 7650
F 0 "C17" V 8250 7600 50  0000 L CNN
F 1 "2.2uF" V 8150 7550 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 8050 7650 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 8050 7650 50  0001 C CNN
F 4 "Taiyo Yuden" H 8050 7650 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 8050 7650 50  0001 C CNN "Part #"
	1    8050 7650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7950 8350 7950 8450
Wire Wire Line
	7950 7750 7950 7650
$Comp
L power:GND #PWR0160
U 1 1 5F49D727
P 8150 7650
F 0 "#PWR0160" H 8150 7400 50  0001 C CNN
F 1 "GND" V 8150 7550 50  0000 R CNN
F 2 "" H 8150 7650 50  0001 C CNN
F 3 "" H 8150 7650 50  0001 C CNN
	1    8150 7650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 5F49E51E
P 8150 8450
F 0 "#PWR0161" H 8150 8200 50  0001 C CNN
F 1 "GND" V 8150 8350 50  0000 R CNN
F 2 "" H 8150 8450 50  0001 C CNN
F 3 "" H 8150 8450 50  0001 C CNN
	1    8150 8450
	0    -1   -1   0   
$EndComp
Text Label 7950 8450 2    50   ~ 0
-1.8V-analog
Text Label 7950 7650 2    50   ~ 0
10V-analog
Wire Wire Line
	7750 8150 7400 8150
Wire Wire Line
	7400 8150 7400 8700
Wire Wire Line
	7400 8700 8850 8700
Wire Wire Line
	8850 8700 8850 8350
$Comp
L Device:D_Zener_Small_ALT D4
U 1 1 5F4AC07B
P 10400 8050
F 0 "D4" V 10354 8120 50  0000 L CNN
F 1 "TVS_Diode" V 10445 8120 50  0000 L CNN
F 2 "Custom Footprints:DO-214AA" V 10400 8050 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/824520581.pdf" V 10400 8050 50  0001 C CNN
F 4 "Würth Elektronik" V 10400 8050 50  0001 C CNN "Manufacturer"
F 5 "824520581" V 10400 8050 50  0001 C CNN "Part #"
	1    10400 8050
	0    1    1    0   
$EndComp
Wire Wire Line
	9750 7850 10400 7850
Wire Wire Line
	10400 7850 10400 7950
Wire Wire Line
	10400 8150 10400 8250
Wire Wire Line
	10400 8250 9750 8250
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5F4EFFEC
P 9300 8200
F 0 "RV1" V 9185 8200 50  0000 C CNN
F 1 "R_POT_TRIM" V 9094 8200 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 9300 8200 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 9300 8200 50  0001 C CNN
F 4 "Bourns Inc." V 9300 8200 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 9300 8200 50  0001 C CNN "Part #"
	1    9300 8200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9450 8050 9300 8050
Wire Wire Line
	9150 8200 9150 8050
Wire Wire Line
	8850 8050 9150 8050
Wire Wire Line
	9150 8700 8850 8700
Connection ~ 8850 8700
Wire Wire Line
	9300 8550 9750 8550
Connection ~ 9750 8250
$Comp
L Device:R_POT_TRIM RV2
U 1 1 5F538265
P 9300 8700
F 0 "RV2" V 9185 8700 50  0000 C CNN
F 1 "R_POT_TRIM" V 9094 8700 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 9300 8700 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 9300 8700 50  0001 C CNN
F 4 "Bourns Inc." V 9300 8700 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 9300 8700 50  0001 C CNN "Part #"
	1    9300 8700
	0    -1   -1   0   
$EndComp
NoConn ~ 9450 8200
NoConn ~ 9450 8700
Text Label 9750 8450 0    50   ~ 0
Isense
$Comp
L power:GND #PWR0169
U 1 1 5F599BFF
P 9750 8750
F 0 "#PWR0169" H 9750 8500 50  0001 C CNN
F 1 "GND" H 9800 8600 50  0000 R CNN
F 2 "" H 9750 8750 50  0001 C CNN
F 3 "" H 9750 8750 50  0001 C CNN
	1    9750 8750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R1
U 1 1 5F599BF8
P 9750 8650
F 0 "R1" H 9800 8700 50  0000 L CNN
F 1 "5" H 9800 8600 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 9750 8650 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 9750 8650 50  0001 C CNN
F 4 "Ohmite" H 9750 8650 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 9750 8650 50  0001 C CNN "Part #"
	1    9750 8650
	-1   0    0    -1  
$EndComp
Text Notes 5200 3150 0    50   ~ 0
small negative \nreference voltage \nso that LED turns \noff with op-amp \ninput bias
$Comp
L power:GND #PWR0178
U 1 1 5F42FF36
P 7700 10750
F 0 "#PWR0178" H 7700 10500 50  0001 C CNN
F 1 "GND" H 7750 10600 50  0000 R CNN
F 2 "" H 7700 10750 50  0001 C CNN
F 3 "" H 7700 10750 50  0001 C CNN
	1    7700 10750
	1    0    0    -1  
$EndComp
Text Label 7700 10250 0    50   ~ 0
12V
Wire Wire Line
	5450 2600 5550 2600
Connection ~ 5550 2600
Wire Wire Line
	5550 2600 5650 2600
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 1 1 5F5922AC
P 9350 5900
F 0 "J3" H 9400 6550 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 9700 6450 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 9350 5925 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 9350 5925 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 9350 5900 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 9350 5900 50  0001 C CNN "Part #"
	1    9350 5900
	-1   0    0    -1  
$EndComp
Text Label 11150 1850 2    50   ~ 0
Interline_PWM
Text Label 11150 2450 2    50   ~ 0
Analog_select
Text Label 13450 1650 0    50   ~ 0
Internal_fan_PWM
Text Label 11150 3650 2    50   ~ 0
Over_temp_alarm1
Text Label 13450 3250 0    50   ~ 0
A-D_input_1
Text Label 13450 3350 0    50   ~ 0
A-D_input_2
Text Label 3750 11150 2    50   ~ 0
A-D_input_1
Text Label 5400 11150 2    50   ~ 0
A-D_input_2
Text Label 4500 10750 0    50   ~ 0
A-D_input_3
Text Label 13450 3650 0    50   ~ 0
LED_pot
Text Label 13450 2450 0    50   ~ 0
MOSFET_temp
Text Label 13450 2550 0    50   ~ 0
Resistor_temp
Text Label 11150 2650 2    50   ~ 0
Toggle_switch
$Comp
L Device:C_Small C14
U 1 1 5FFBC02D
P 5450 2500
F 0 "C14" H 5500 2600 50  0000 L CNN
F 1 "2.2uF" H 5500 2400 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5450 2500 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5450 2500 50  0001 C CNN
F 4 "Taiyo Yuden" H 5450 2500 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5450 2500 50  0001 C CNN "Part #"
	1    5450 2500
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 5FFC2163
P 7550 2800
F 0 "C13" H 7400 2900 50  0000 L CNN
F 1 "2.2uF" H 7300 2700 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 7550 2800 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 7550 2800 50  0001 C CNN
F 4 "Taiyo Yuden" H 7550 2800 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 7550 2800 50  0001 C CNN "Part #"
	1    7550 2800
	-1   0    0    -1  
$EndComp
Connection ~ 7550 2700
$Comp
L power:GND #PWR018
U 1 1 5FFC4572
P 7550 2900
F 0 "#PWR018" H 7550 2650 50  0001 C CNN
F 1 "GND" H 7600 2750 50  0000 R CNN
F 2 "" H 7550 2900 50  0001 C CNN
F 3 "" H 7550 2900 50  0001 C CNN
	1    7550 2900
	1    0    0    -1  
$EndComp
Text Label 11150 2550 2    50   ~ 0
Over_temp_alarm2
Text Label 11100 10850 2    50   ~ 0
Over_temp_alarm1
Text Label 11100 10950 2    50   ~ 0
Over_temp_alarm2
$Comp
L power:GND #PWR0107
U 1 1 5F4A54DD
P 4900 8600
F 0 "#PWR0107" H 4900 8350 50  0001 C CNN
F 1 "GND" V 4900 8500 50  0000 R CNN
F 2 "" H 4900 8600 50  0001 C CNN
F 3 "" H 4900 8600 50  0001 C CNN
	1    4900 8600
	0    -1   -1   0   
$EndComp
Text Label 4600 8600 2    50   ~ 0
3.3V
Text Label 4750 8800 0    50   ~ 0
LED_pot
Text Notes 10650 10700 0    59   ~ 0
Overheat alarm
Text Notes 4150 9100 0    59   ~ 0
Manual/Auto toggle switch
Wire Wire Line
	13450 3650 14200 3650
Wire Wire Line
	13450 3550 14200 3550
Wire Wire Line
	13450 3450 14200 3450
Wire Wire Line
	13450 3350 14200 3350
Wire Wire Line
	13450 3250 14200 3250
Wire Wire Line
	13450 2950 14200 2950
Wire Wire Line
	13450 2850 14200 2850
$Comp
L power:GND #PWR0186
U 1 1 5F8BB481
P 14200 2750
F 0 "#PWR0186" H 14200 2500 50  0001 C CNN
F 1 "GND" V 14200 2600 50  0000 R CNN
F 2 "" H 14200 2750 50  0001 C CNN
F 3 "" H 14200 2750 50  0001 C CNN
	1    14200 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	13450 2650 14200 2650
Wire Wire Line
	13450 2550 14200 2550
Wire Wire Line
	13450 2450 14200 2450
Wire Wire Line
	13450 2350 14200 2350
Wire Wire Line
	13450 2250 14200 2250
Wire Wire Line
	13450 2150 14200 2150
$Comp
L power:GND #PWR0187
U 1 1 5F835110
P 14200 1450
F 0 "#PWR0187" H 14200 1200 50  0001 C CNN
F 1 "GND" V 14200 1300 50  0000 R CNN
F 2 "" H 14200 1450 50  0001 C CNN
F 3 "" H 14200 1450 50  0001 C CNN
	1    14200 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	13450 2050 14200 2050
Wire Wire Line
	13450 1950 14200 1950
Wire Wire Line
	13450 1850 14200 1850
Wire Wire Line
	13450 1750 14200 1750
Wire Wire Line
	13450 1650 14200 1650
Wire Wire Line
	13450 1550 14200 1550
Wire Wire Line
	13450 1350 14200 1350
$Comp
L Custom_parts:Conn_01x24_Female J7
U 1 1 5F74378D
P 14400 2450
F 0 "J7" H 14250 3600 50  0000 L CNN
F 1 "Conn_01x24_Female" H 13650 1200 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 14400 2450 50  0001 C CNN
F 3 "https://www.samtec.com/partnumber/ssm-124-l-sv-lc?vendor=digikey" H 14400 2450 50  0001 C CNN
F 4 "Samtec Inc." H 14400 2450 50  0001 C CNN "Manufacturer"
F 5 "SSM-124-L-SV-LC" H 14400 2450 50  0001 C CNN "Part #"
	1    14400 2450
	1    0    0    -1  
$EndComp
Text Label 13450 2350 0    50   ~ 0
External_thermistor
Wire Wire Line
	11150 3650 10400 3650
Wire Wire Line
	11150 3550 10400 3550
Wire Wire Line
	11150 3450 10400 3450
Wire Wire Line
	11150 3350 10400 3350
Wire Wire Line
	11150 3250 10400 3250
Wire Wire Line
	11150 3150 10400 3150
Wire Wire Line
	11150 3050 10400 3050
Wire Wire Line
	11150 2950 10400 2950
Wire Wire Line
	11150 2850 10400 2850
Wire Wire Line
	11150 2650 10400 2650
Wire Wire Line
	11150 2550 10400 2550
Wire Wire Line
	11150 2450 10400 2450
Wire Wire Line
	11150 2350 10400 2350
Wire Wire Line
	11150 2250 10400 2250
Wire Wire Line
	11150 2150 10400 2150
$Comp
L power:GND #PWR0188
U 1 1 5F9E5C9F
P 10400 1350
F 0 "#PWR0188" H 10400 1100 50  0001 C CNN
F 1 "GND" V 10400 1200 50  0000 R CNN
F 2 "" H 10400 1350 50  0001 C CNN
F 3 "" H 10400 1350 50  0001 C CNN
	1    10400 1350
	0    -1   1    0   
$EndComp
Wire Wire Line
	11150 2050 10400 2050
Wire Wire Line
	11150 1950 10400 1950
Wire Wire Line
	11150 1850 10400 1850
Wire Wire Line
	11150 1750 10400 1750
Wire Wire Line
	11150 1650 10400 1650
Wire Wire Line
	11150 1550 10400 1550
Wire Wire Line
	11150 1450 10400 1450
Wire Wire Line
	11150 2750 10400 2750
$Comp
L Custom_parts:Conn_01x24_Female J5
U 1 1 5FA9391A
P 10200 2450
F 0 "J5" H 10050 3600 50  0000 L CNN
F 1 "Conn_01x24_Female" H 9450 1200 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 10200 2450 50  0001 C CNN
F 3 "https://www.samtec.com/partnumber/ssm-124-l-sv-lc?vendor=digikey" H 10200 2450 50  0001 C CNN
F 4 "Samtec Inc." H 10200 2450 50  0001 C CNN "Manufacturer"
F 5 "SSM-124-L-SV-LC" H 10200 2450 50  0001 C CNN "Part #"
	1    10200 2450
	-1   0    0    -1  
$EndComp
$Comp
L Custom_parts:CPT-2016-75-SMT-TR BZ1
U 1 1 5FE01F50
P 11200 10950
F 0 "BZ1" H 11200 11150 60  0000 L CNN
F 1 "CPT-2016-75-SMT-TR" H 10500 10850 60  0000 L CNN
F 2 "Custom Footprints:SMT-0940-T-3V-R_9x9_alarm" H 11400 11150 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Projects%20Unlimited%20PDFs/SMT_09_Series_DS.pdf" H 11400 11250 60  0001 L CNN
F 4 "PUI Audio, Inc." H 11200 10950 50  0001 C CNN "Manufacturer"
F 5 "SMT-0940-T-3V-R" H 11200 10950 50  0001 C CNN "Part #"
	1    11200 10950
	1    0    0    -1  
$EndComp
Text Label 13450 1950 0    50   ~ 0
External_5V_PWM3
$Comp
L Mechanical:Heatsink HS2
U 1 1 602A56B6
P 9350 11100
F 0 "HS2" H 9250 11400 50  0000 L CNN
F 1 "HS-PCB" H 9200 11300 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 9362 11100 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 9362 11100 50  0001 C CNN
F 4 "Wakefield-Vette" H 9350 11100 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 9350 11100 50  0001 C CNN "Part #"
	1    9350 11100
	1    0    0    -1  
$EndComp
Text Label 7300 10650 2    50   ~ 0
5V_fan_PWM
Wire Wire Line
	7300 10650 7400 10650
NoConn ~ 7400 10450
Connection ~ 9750 8550
Wire Wire Line
	9750 8250 9750 8550
Text Notes 9300 10650 0    59   ~ 0
Heatsinks
$Comp
L Device:R_Small R2
U 1 1 5F57BF27
P 9950 8650
F 0 "R2" H 10000 8700 50  0000 L CNN
F 1 "5" H 10000 8600 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 9950 8650 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 9950 8650 50  0001 C CNN
F 4 "Ohmite" H 9950 8650 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 9950 8650 50  0001 C CNN "Part #"
	1    9950 8650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5F57C598
P 10150 8650
F 0 "R3" H 10200 8700 50  0000 L CNN
F 1 "5" H 10200 8600 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 10150 8650 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 10150 8650 50  0001 C CNN
F 4 "Ohmite" H 10150 8650 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 10150 8650 50  0001 C CNN "Part #"
	1    10150 8650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5F57CB17
P 10350 8650
F 0 "R4" H 10400 8700 50  0000 L CNN
F 1 "5" H 10400 8600 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 10350 8650 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 10350 8650 50  0001 C CNN
F 4 "Ohmite" H 10350 8650 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 10350 8650 50  0001 C CNN "Part #"
	1    10350 8650
	-1   0    0    -1  
$EndComp
Text Label 8950 5600 2    50   ~ 0
Vin
$Comp
L power:GND #PWR0101
U 1 1 5F6F3BA1
P 9350 6400
F 0 "#PWR0101" H 9350 6150 50  0001 C CNN
F 1 "GND" H 9600 6350 50  0000 R CNN
F 2 "" H 9350 6400 50  0001 C CNN
F 3 "" H 9350 6400 50  0001 C CNN
	1    9350 6400
	1    0    0    -1  
$EndComp
Text Label 8950 5800 2    50   ~ 0
Vin
Text Label 8950 6000 2    50   ~ 0
Vin
Text Label 8950 6200 2    50   ~ 0
Vin
$Comp
L Mechanical:Heatsink HS1
U 1 1 5F785F9D
P 9050 11100
F 0 "HS1" H 8950 11400 50  0000 L CNN
F 1 "HS-PCB" H 8900 11300 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 9062 11100 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 9062 11100 50  0001 C CNN
F 4 "Wakefield-Vette" H 9050 11100 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 9050 11100 50  0001 C CNN "Part #"
	1    9050 11100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS3
U 1 1 5F7863E9
P 9650 11100
F 0 "HS3" H 9550 11400 50  0000 L CNN
F 1 "HS-PCB" H 9500 11300 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 9662 11100 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 9662 11100 50  0001 C CNN
F 4 "Wakefield-Vette" H 9650 11100 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 9650 11100 50  0001 C CNN "Part #"
	1    9650 11100
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS4
U 1 1 5F786851
P 9950 11100
F 0 "HS4" H 9850 11400 50  0000 L CNN
F 1 "HS-PCB" H 9800 11300 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 9962 11100 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 9962 11100 50  0001 C CNN
F 4 "Wakefield-Vette" H 9950 11100 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 9950 11100 50  0001 C CNN "Part #"
	1    9950 11100
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:ASSR-1218 U2
U 1 1 5F827B60
P 8100 5550
F 0 "U2" H 8100 5875 50  0000 C CNN
F 1 "ASSR-1218" H 8100 5784 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 7900 5350 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 8100 5550 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 8100 5550 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 8100 5550 50  0001 C CNN "Part #"
	1    8100 5550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 4450 1550 3900
Connection ~ 1550 2800
Connection ~ 1550 3350
Wire Wire Line
	1550 3350 1550 2800
Connection ~ 1550 3900
Wire Wire Line
	1550 3900 1550 3350
Text Label 8400 5650 0    50   ~ 0
LED-
Text Label 8400 5950 0    50   ~ 0
LED-
Text Label 8400 6250 0    50   ~ 0
LED-
Text Label 8400 6550 0    50   ~ 0
LED-
Wire Wire Line
	8950 5500 8400 5500
Wire Wire Line
	8400 5500 8400 5450
Wire Wire Line
	8950 5700 8400 5700
Wire Wire Line
	8400 5700 8400 5750
Wire Wire Line
	8950 5900 8650 5900
Wire Wire Line
	8650 5900 8650 6050
Wire Wire Line
	8650 6050 8400 6050
Wire Wire Line
	8400 6350 8650 6350
Wire Wire Line
	8650 6350 8650 6100
Wire Wire Line
	8650 6100 8950 6100
Text Label 1750 2800 0    50   ~ 0
LED-
Text Label 9750 7850 0    50   ~ 0
LED-
$Comp
L Relay_SolidState:ASSR-1218 U7
U 1 1 5F89A743
P 8100 5850
F 0 "U7" H 8100 6175 50  0000 C CNN
F 1 "ASSR-1218" H 8100 6084 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 7900 5650 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 8100 5850 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 8100 5850 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 8100 5850 50  0001 C CNN "Part #"
	1    8100 5850
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:ASSR-1218 U8
U 1 1 5F89BDE1
P 8100 6150
F 0 "U8" H 8100 6475 50  0000 C CNN
F 1 "ASSR-1218" H 8100 6384 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 7900 5950 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 8100 6150 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 8100 6150 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 8100 6150 50  0001 C CNN "Part #"
	1    8100 6150
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:ASSR-1218 U9
U 1 1 5F89CB25
P 8100 6450
F 0 "U9" H 8100 6775 50  0000 C CNN
F 1 "ASSR-1218" H 8100 6684 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 7900 6250 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 8100 6450 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 8100 6450 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 8100 6450 50  0001 C CNN "Part #"
	1    8100 6450
	1    0    0    -1  
$EndComp
Text Label 2650 10750 0    50   ~ 0
external_analog
Wire Wire Line
	650  3350 950  3350
Wire Wire Line
	650  3900 950  3900
$Comp
L Device:CP1_Small C2
U 1 1 5F939007
P 950 3450
F 0 "C2" H 900 3750 50  0000 L CNN
F 1 "7500uF" H 750 3650 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_18x22" H 950 3450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDE0000/ABA0000C1247.pdf" H 950 3450 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 950 3450 50  0001 C CNN "Manufacturer"
F 5 "EEE-FK1C752SM" H 950 3450 50  0001 C CNN "Part #"
	1    950  3450
	1    0    0    -1  
$EndComp
Connection ~ 950  3350
Wire Wire Line
	950  3350 1200 3350
$Comp
L Device:CP1_Small C3
U 1 1 5F9399C1
P 950 4000
F 0 "C3" H 900 4300 50  0000 L CNN
F 1 "7500uF" H 750 4200 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_18x22" H 950 4000 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDE0000/ABA0000C1247.pdf" H 950 4000 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 950 4000 50  0001 C CNN "Manufacturer"
F 5 "EEE-FK1C752SM" H 950 4000 50  0001 C CNN "Part #"
	1    950  4000
	1    0    0    -1  
$EndComp
Connection ~ 950  3900
Wire Wire Line
	950  3900 1200 3900
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW2
U 1 1 5F4E0761
P 950 5750
F 0 "SW2" H 950 6235 50  0000 C CNN
F 1 "Pushbutton_with_LED" H 950 6144 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 950 6200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 950 5950 50  0001 C CNN
F 4 "C&K" H 950 5750 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 950 5750 50  0001 C CNN "Part #"
	1    950  5750
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW3
U 1 1 5F4EC2A1
P 2550 5750
F 0 "SW3" H 2550 6235 50  0000 C CNN
F 1 "Pushbutton_with_LED" H 2550 6144 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 2550 6200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 2550 5950 50  0001 C CNN
F 4 "C&K" H 2550 5750 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 2550 5750 50  0001 C CNN "Part #"
	1    2550 5750
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW4
U 1 1 5F4ED2BD
P 4150 5750
F 0 "SW4" H 4150 6235 50  0000 C CNN
F 1 "Pushbutton_with_LED" H 4150 6144 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 4150 6200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 4150 5950 50  0001 C CNN
F 4 "C&K" H 4150 5750 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 4150 5750 50  0001 C CNN "Part #"
	1    4150 5750
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW5
U 1 1 5F4EEFFE
P 5750 5750
F 0 "SW5" H 5750 6235 50  0000 C CNN
F 1 "Pushbutton_with_LED" H 5750 6144 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 5750 6200 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 5750 5950 50  0001 C CNN
F 4 "C&K" H 5750 5750 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 5750 5750 50  0001 C CNN "Part #"
	1    5750 5750
	1    0    0    -1  
$EndComp
Text Label 11150 1450 2    50   ~ 0
Relay1
Text Label 11150 1550 2    50   ~ 0
Relay2
Text Label 11150 1650 2    50   ~ 0
Relay3
Text Label 11150 1750 2    50   ~ 0
Relay4
Text Label 7000 5800 2    50   ~ 0
Relay1
Text Label 7000 5900 2    50   ~ 0
Relay2
Text Label 7000 6000 2    50   ~ 0
Relay3
Text Label 7000 6100 2    50   ~ 0
Relay4
$Comp
L power:GND #PWR0105
U 1 1 5F5748CA
P 7800 6550
F 0 "#PWR0105" H 7800 6300 50  0001 C CNN
F 1 "GND" H 7900 6400 50  0000 R CNN
F 2 "" H 7800 6550 50  0001 C CNN
F 3 "" H 7800 6550 50  0001 C CNN
	1    7800 6550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F57606F
P 7800 6250
F 0 "#PWR0111" H 7800 6000 50  0001 C CNN
F 1 "GND" H 7900 6100 50  0000 R CNN
F 2 "" H 7800 6250 50  0001 C CNN
F 3 "" H 7800 6250 50  0001 C CNN
	1    7800 6250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F5763E2
P 7800 5950
F 0 "#PWR0115" H 7800 5700 50  0001 C CNN
F 1 "GND" H 7900 5800 50  0000 R CNN
F 2 "" H 7800 5950 50  0001 C CNN
F 3 "" H 7800 5950 50  0001 C CNN
	1    7800 5950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5F576860
P 7800 5650
F 0 "#PWR0116" H 7800 5400 50  0001 C CNN
F 1 "GND" H 7900 5500 50  0000 R CNN
F 2 "" H 7800 5650 50  0001 C CNN
F 3 "" H 7800 5650 50  0001 C CNN
	1    7800 5650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN4
U 1 1 5F577F14
P 7200 6000
F 0 "RN4" V 6783 6000 50  0000 C CNN
F 1 "R_Pack04" V 6874 6000 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 7475 6000 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 7200 6000 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 7200 6000 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 7200 6000 50  0001 C CNN "Part #"
	1    7200 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	7400 5900 7600 5900
Wire Wire Line
	7600 5900 7600 5750
Wire Wire Line
	7600 5750 7800 5750
Wire Wire Line
	7400 6000 7600 6000
Wire Wire Line
	7600 6000 7600 6050
Wire Wire Line
	7600 6050 7800 6050
Wire Wire Line
	7400 6100 7400 6350
Wire Wire Line
	7400 6350 7800 6350
Wire Wire Line
	7400 5800 7400 5450
Wire Wire Line
	7400 5450 7800 5450
$Comp
L Switch:SW_SPDT SW1
U 1 1 5F6733E8
P 4700 9500
F 0 "SW1" H 4700 9785 50  0000 C CNN
F 1 "SW_SPDT" H 4700 9694 50  0000 C CNN
F 2 "Custom Footprints:1x5_header_SSM-105-L-SV-BE-LC" H 4700 9500 50  0001 C CNN
F 3 "https://sten-eswitch-13110800-production.s3.amazonaws.com/system/asset/product_line/data_sheet/131/200.pdf" H 4700 9500 50  0001 C CNN
F 4 "E-Switch" H 4700 9500 50  0001 C CNN "Manufacturer"
F 5 "200MSP1T1B1M7QE" H 4700 9500 50  0001 C CNN "Part #"
	1    4700 9500
	1    0    0    -1  
$EndComp
Text Label 5750 9450 2    50   ~ 0
Toggle_switch
$Comp
L power:GND #PWR0117
U 1 1 5F678CF5
P 4900 9400
F 0 "#PWR0117" H 4900 9150 50  0001 C CNN
F 1 "GND" V 4900 9300 50  0000 R CNN
F 2 "" H 4900 9400 50  0001 C CNN
F 3 "" H 4900 9400 50  0001 C CNN
	1    4900 9400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 5F68BFE7
P 5750 9350
F 0 "#PWR0135" H 5750 9100 50  0001 C CNN
F 1 "GND" V 5750 9250 50  0000 R CNN
F 2 "" H 5750 9350 50  0001 C CNN
F 3 "" H 5750 9350 50  0001 C CNN
	1    5750 9350
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:Conn_01x05_Female J4
U 1 1 5F6C332D
P 5950 9550
F 0 "J4" H 5850 9800 50  0000 L CNN
F 1 "Conn_01x05_Female" H 5400 9250 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 5950 9550 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/prints/ssm-1xx-xxx-xx-xx-xx-x-xx-footprint.pdf" H 5950 9550 50  0001 C CNN
F 4 "Samtec Inc." H 5950 9550 50  0001 C CNN "Manufacturer"
F 5 "SSM-105-L-SV-BE-LC-TR" H 5950 9550 50  0001 C CNN "Part #"
	1    5950 9550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT RV3
U 1 1 5F6EC7F7
P 4750 8600
F 0 "RV3" V 4543 8600 50  0000 C CNN
F 1 "R_POT" V 4634 8600 50  0000 C CNN
F 2 "Custom Footprints:Pot_with_header" H 4750 8600 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3310.pdf" H 4750 8600 50  0001 C CNN
F 4 "Bourns Inc." V 4750 8600 50  0001 C CNN "Manufacturer"
F 5 "3310C-101-102L" V 4750 8600 50  0001 C CNN "Part #"
	1    4750 8600
	0    -1   1    0   
$EndComp
Wire Wire Line
	4750 8800 4750 8750
Text Notes 4150 8250 0    59   ~ 0
Pot to adjust LED intensity
$Comp
L Custom_parts:Conn_01x03_Female J8
U 1 1 5F7439AD
P 5750 8600
F 0 "J8" H 5650 8750 50  0000 L CNN
F 1 "Conn_01x03_Female" H 5300 8400 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 5750 8600 50  0001 C CNN
F 3 "https://www.samtec.com/products/ssm-103-l-sv-lc" H 5750 8600 50  0001 C CNN
F 4 "Samtec Inc." H 5750 8600 50  0001 C CNN "Manufacturer"
F 5 "SSM-103-L-SV-LC" H 5750 8600 50  0001 C CNN "Part #"
	1    5750 8600
	1    0    0    -1  
$EndComp
Text Label 5550 8500 2    50   ~ 0
3.3V
Text Label 5550 8600 2    50   ~ 0
LED_pot
$Comp
L power:GND #PWR0136
U 1 1 5F746B26
P 5550 8700
F 0 "#PWR0136" H 5550 8450 50  0001 C CNN
F 1 "GND" V 5550 8600 50  0000 R CNN
F 2 "" H 5550 8700 50  0001 C CNN
F 3 "" H 5550 8700 50  0001 C CNN
	1    5550 8700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5F7A9456
P 2300 2550
F 0 "#PWR0121" H 2300 2300 50  0001 C CNN
F 1 "GND" H 2500 2450 50  0000 R CNN
F 2 "" H 2300 2550 50  0001 C CNN
F 3 "" H 2300 2550 50  0001 C CNN
	1    2300 2550
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Conn_01x08_Female J10
U 1 1 5F85E157
P 4300 2850
F 0 "J10" V 4373 2780 50  0000 C CNN
F 1 "Conn_01x08_Female" V 4464 2780 50  0000 C CNN
F 2 "Custom Footprints:Ref_only" H 4300 2850 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sullins%20PDFs/Female_Headers.100_DS.pdf" H 4300 2850 50  0001 C CNN
F 4 "Sullins Connector Solutions" V 4300 2850 50  0001 C CNN "Manufacturer"
F 5 "NPTC081KFXC-RC" V 4300 2850 50  0001 C CNN "Part #"
	1    4300 2850
	0    1    1    0   
$EndComp
Text Label 4000 2650 1    50   ~ 0
12V
NoConn ~ 4100 2650
NoConn ~ 4200 2650
Text Label 4600 2650 1    50   ~ 0
-5V
$Comp
L power:GND #PWR0137
U 1 1 5F860AA1
P 4500 2650
F 0 "#PWR0137" H 4500 2400 50  0001 C CNN
F 1 "GND" V 4505 2522 50  0000 R CNN
F 2 "" H 4500 2650 50  0001 C CNN
F 3 "" H 4500 2650 50  0001 C CNN
	1    4500 2650
	-1   0    0    1   
$EndComp
Text Label 4400 2650 1    50   ~ 0
5V
NoConn ~ 4300 2650
$Comp
L power:GND #PWR0138
U 1 1 5F890634
P 3900 2650
F 0 "#PWR0138" H 3900 2400 50  0001 C CNN
F 1 "GND" V 3905 2522 50  0000 R CNN
F 2 "" H 3900 2650 50  0001 C CNN
F 3 "" H 3900 2650 50  0001 C CNN
	1    3900 2650
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0149
U 1 1 5F8E6E1E
P 750 5850
F 0 "#PWR0149" H 750 5600 50  0001 C CNN
F 1 "GND" V 750 5750 50  0000 R CNN
F 2 "" H 750 5850 50  0001 C CNN
F 3 "" H 750 5850 50  0001 C CNN
	1    750  5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 5F8E7DFD
P 750 5550
F 0 "#PWR0150" H 750 5300 50  0001 C CNN
F 1 "GND" V 750 5450 50  0000 R CNN
F 2 "" H 750 5550 50  0001 C CNN
F 3 "" H 750 5550 50  0001 C CNN
	1    750  5550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0151
U 1 1 5F8E9368
P 3950 5850
F 0 "#PWR0151" H 3950 5600 50  0001 C CNN
F 1 "GND" V 3950 5750 50  0000 R CNN
F 2 "" H 3950 5850 50  0001 C CNN
F 3 "" H 3950 5850 50  0001 C CNN
	1    3950 5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 5F8EA535
P 4350 5650
F 0 "#PWR0152" H 4350 5400 50  0001 C CNN
F 1 "GND" V 4350 5550 50  0000 R CNN
F 2 "" H 4350 5650 50  0001 C CNN
F 3 "" H 4350 5650 50  0001 C CNN
	1    4350 5650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 5F8EB0EF
P 2350 5850
F 0 "#PWR0153" H 2350 5600 50  0001 C CNN
F 1 "GND" V 2350 5750 50  0000 R CNN
F 2 "" H 2350 5850 50  0001 C CNN
F 3 "" H 2350 5850 50  0001 C CNN
	1    2350 5850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0162
U 1 1 5F8EBC70
P 2750 5650
F 0 "#PWR0162" H 2750 5400 50  0001 C CNN
F 1 "GND" V 2750 5550 50  0000 R CNN
F 2 "" H 2750 5650 50  0001 C CNN
F 3 "" H 2750 5650 50  0001 C CNN
	1    2750 5650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 5F8EC60A
P 5950 5650
F 0 "#PWR0163" H 5950 5400 50  0001 C CNN
F 1 "GND" V 5950 5550 50  0000 R CNN
F 2 "" H 5950 5650 50  0001 C CNN
F 3 "" H 5950 5650 50  0001 C CNN
	1    5950 5650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 5F8ECFFA
P 5550 5850
F 0 "#PWR0164" H 5550 5600 50  0001 C CNN
F 1 "GND" V 5550 5750 50  0000 R CNN
F 2 "" H 5550 5850 50  0001 C CNN
F 3 "" H 5550 5850 50  0001 C CNN
	1    5550 5850
	0    1    1    0   
$EndComp
Text Label 11150 3150 2    50   ~ 0
Button1
Text Label 11150 2950 2    50   ~ 0
Button2
Text Label 11150 3050 2    50   ~ 0
Button3
Text Label 11150 3450 2    50   ~ 0
Button4
Text Label 1450 5450 0    50   ~ 0
Button1
Text Label 3050 5450 0    50   ~ 0
Button2
Text Label 4650 5450 0    50   ~ 0
Button3
Text Label 6250 5450 0    50   ~ 0
Button4
Text Label 11150 3350 2    50   ~ 0
LED1
Text Label 11150 2850 2    50   ~ 0
LED2
Text Label 11150 3250 2    50   ~ 0
LED3
Text Label 11150 3550 2    50   ~ 0
LED4
Text Label 1450 5850 0    50   ~ 0
LED1
Text Label 3050 5850 0    50   ~ 0
LED2
Text Label 4650 5850 0    50   ~ 0
LED3
Text Label 6250 5850 0    50   ~ 0
LED4
NoConn ~ 5750 9550
NoConn ~ 4900 9600
$Comp
L Device:R_Pack08_Split RN2
U 1 1 5F9E09BB
P 6100 5850
F 0 "RN2" V 6200 5850 50  0000 C CNN
F 1 "150" V 6100 5850 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 6375 5850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 6100 5850 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 6100 5850 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 6100 5850 50  0001 C CNN "Part #"
	1    6100 5850
	0    -1   -1   0   
$EndComp
Text Label 13450 2050 0    50   ~ 0
SCL0
Text Label 13450 2150 0    50   ~ 0
SDA0
Wire Wire Line
	650  4450 850  4450
Text Label 8950 5500 2    50   ~ 0
LED4-
Text Label 8950 6100 2    50   ~ 0
LED1-
Text Label 8950 5900 2    50   ~ 0
LED2-
Text Label 8950 5700 2    50   ~ 0
LED3-
Text Label 13450 2950 0    50   ~ 0
internal_analog
Connection ~ 9750 8750
Wire Wire Line
	9750 8550 9950 8550
Wire Wire Line
	9750 8750 9950 8750
Connection ~ 9950 8550
Connection ~ 9950 8750
Wire Wire Line
	9950 8550 10150 8550
Wire Wire Line
	9950 8750 10150 8750
Connection ~ 10150 8550
Wire Wire Line
	10150 8550 10350 8550
Connection ~ 10150 8750
Wire Wire Line
	10150 8750 10350 8750
$Comp
L Device:R_Small R6
U 1 1 5F6690CD
P 7550 2300
F 0 "R6" H 7600 2300 50  0000 L CNN
F 1 "12" V 7550 2250 50  0000 L CNN
F 2 "Resistor_SMD:R_1210_3225Metric" H 7550 2300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 7550 2300 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 7550 2300 50  0001 C CNN "Manufacturer"
F 5 "RMCF1210JT12R0" H 7550 2300 50  0001 C CNN "Part #"
	1    7550 2300
	1    0    0    -1  
$EndComp
Connection ~ 7550 2400
Text Label 13450 1850 0    50   ~ 0
External_5V_PWM2
Text Label 13450 1750 0    50   ~ 0
External_5V_PWM1
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5FACF30E
P 7400 10200
F 0 "H1" H 7200 10300 50  0000 L CNN
F 1 "MountingHole_Pad" H 7500 10158 50  0001 L CNN
F 2 "Custom Footprints:NF-A9_with_standoffs_and_bolts" H 7400 10200 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 7400 10200 50  0001 C CNN
F 4 "Keystone Electronics" H 7400 10200 50  0001 C CNN "Manufacturer"
F 5 "24354" H 7400 10200 50  0001 C CNN "Part #"
	1    7400 10200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0177
U 1 1 5FACF308
P 7400 10100
F 0 "#PWR0177" H 7400 9850 50  0001 C CNN
F 1 "GND" H 7500 9950 50  0000 R CNN
F 2 "" H 7400 10100 50  0001 C CNN
F 3 "" H 7400 10100 50  0001 C CNN
	1    7400 10100
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Small JP3
U 1 1 5FC8965B
P 9950 8850
F 0 "JP3" V 9950 8800 50  0000 R CNN
F 1 "Jumper_NC_Small" V 9905 8803 50  0001 R CNN
F 2 "Custom Footprints:20A_shunt_5104" H 9950 8850 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p54.pdf" H 9950 8850 50  0001 C CNN
F 4 "Keystone Electronics" V 9950 8850 50  0001 C CNN "Manufacturer"
F 5 "5104" V 9950 8850 50  0001 C CNN "Part #"
	1    9950 8850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0180
U 1 1 5FC8CF84
P 9950 8950
F 0 "#PWR0180" H 9950 8700 50  0001 C CNN
F 1 "GND" H 10000 8800 50  0000 R CNN
F 2 "" H 9950 8950 50  0001 C CNN
F 3 "" H 9950 8950 50  0001 C CNN
	1    9950 8950
	1    0    0    -1  
$EndComp
$Comp
L Motor:Fan_4pin M1
U 1 1 603842B5
P 7700 10550
F 0 "M1" H 7858 10646 50  0000 L CNN
F 1 "Fan_4pin" H 7858 10555 50  0000 L CNN
F 2 "Custom Footprints:4-pin_fan_SMD" H 7700 10560 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/tsm.pdf" H 7700 10560 50  0001 C CNN
F 4 "Samtec Inc." H 7700 10550 50  0001 C CNN "Manufacturer"
F 5 "TSM-104-02-L-SV" H 7700 10550 50  0001 C CNN "Part #"
	1    7700 10550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F5A6FC2
P 7250 10200
F 0 "H2" H 7350 10300 50  0000 L CNN
F 1 "MountingHole_Pad" H 7350 10158 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 7250 10200 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 7250 10200 50  0001 C CNN
F 4 "Keystone Electronics" H 7250 10200 50  0001 C CNN "Manufacturer"
F 5 "24354" H 7250 10200 50  0001 C CNN "Part #"
	1    7250 10200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0173
U 1 1 5F5A6FC8
P 7250 10100
F 0 "#PWR0173" H 7250 9850 50  0001 C CNN
F 1 "GND" H 7350 9950 50  0000 R CNN
F 2 "" H 7250 10100 50  0001 C CNN
F 3 "" H 7250 10100 50  0001 C CNN
	1    7250 10100
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H16
U 1 1 5F5B6064
P 8150 10200
F 0 "H16" H 7950 10300 50  0000 L CNN
F 1 "MountingHole_Pad" H 8250 10158 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8150 10200 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8150 10200 50  0001 C CNN
F 4 "Keystone Electronics" H 8150 10200 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8150 10200 50  0001 C CNN "Part #"
	1    8150 10200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0174
U 1 1 5F5B606A
P 8150 10100
F 0 "#PWR0174" H 8150 9850 50  0001 C CNN
F 1 "GND" H 8250 9950 50  0000 R CNN
F 2 "" H 8150 10100 50  0001 C CNN
F 3 "" H 8150 10100 50  0001 C CNN
	1    8150 10100
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H14
U 1 1 5F5B6072
P 8000 10200
F 0 "H14" H 8100 10300 50  0000 L CNN
F 1 "MountingHole_Pad" H 8100 10158 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8000 10200 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8000 10200 50  0001 C CNN
F 4 "Keystone Electronics" H 8000 10200 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8000 10200 50  0001 C CNN "Part #"
	1    8000 10200
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0175
U 1 1 5F5B6078
P 8000 10100
F 0 "#PWR0175" H 8000 9850 50  0001 C CNN
F 1 "GND" H 8100 9950 50  0000 R CNN
F 2 "" H 8000 10100 50  0001 C CNN
F 3 "" H 8000 10100 50  0001 C CNN
	1    8000 10100
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5F5C58B1
P 7400 11000
F 0 "H4" H 7200 11100 50  0000 L CNN
F 1 "MountingHole_Pad" H 7500 10958 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 7400 11000 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 7400 11000 50  0001 C CNN
F 4 "Keystone Electronics" H 7400 11000 50  0001 C CNN "Manufacturer"
F 5 "24354" H 7400 11000 50  0001 C CNN "Part #"
	1    7400 11000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0182
U 1 1 5F5C58B7
P 7400 10900
F 0 "#PWR0182" H 7400 10650 50  0001 C CNN
F 1 "GND" H 7500 10750 50  0000 R CNN
F 2 "" H 7400 10900 50  0001 C CNN
F 3 "" H 7400 10900 50  0001 C CNN
	1    7400 10900
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5F5C58BF
P 7250 11000
F 0 "H3" H 7350 11100 50  0000 L CNN
F 1 "MountingHole_Pad" H 7350 10958 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 7250 11000 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 7250 11000 50  0001 C CNN
F 4 "Keystone Electronics" H 7250 11000 50  0001 C CNN "Manufacturer"
F 5 "24354" H 7250 11000 50  0001 C CNN "Part #"
	1    7250 11000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0183
U 1 1 5F5C58C5
P 7250 10900
F 0 "#PWR0183" H 7250 10650 50  0001 C CNN
F 1 "GND" H 7350 10750 50  0000 R CNN
F 2 "" H 7250 10900 50  0001 C CNN
F 3 "" H 7250 10900 50  0001 C CNN
	1    7250 10900
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H17
U 1 1 5F5D3AD4
P 8150 11000
F 0 "H17" H 7950 11100 50  0000 L CNN
F 1 "MountingHole_Pad" H 8250 10958 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8150 11000 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8150 11000 50  0001 C CNN
F 4 "Keystone Electronics" H 8150 11000 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8150 11000 50  0001 C CNN "Part #"
	1    8150 11000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0184
U 1 1 5F5D3ADA
P 8150 10900
F 0 "#PWR0184" H 8150 10650 50  0001 C CNN
F 1 "GND" H 8250 10750 50  0000 R CNN
F 2 "" H 8150 10900 50  0001 C CNN
F 3 "" H 8150 10900 50  0001 C CNN
	1    8150 10900
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H15
U 1 1 5F5D3AE2
P 8000 11000
F 0 "H15" H 8100 11100 50  0000 L CNN
F 1 "MountingHole_Pad" H 8100 10958 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8000 11000 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8000 11000 50  0001 C CNN
F 4 "Keystone Electronics" H 8000 11000 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8000 11000 50  0001 C CNN "Part #"
	1    8000 11000
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0185
U 1 1 5F5D3AE8
P 8000 10900
F 0 "#PWR0185" H 8000 10650 50  0001 C CNN
F 1 "GND" H 8100 10750 50  0000 R CNN
F 2 "" H 8000 10900 50  0001 C CNN
F 3 "" H 8000 10900 50  0001 C CNN
	1    8000 10900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5F7666A8
P 1150 5650
F 0 "#PWR0114" H 1150 5400 50  0001 C CNN
F 1 "GND" V 1150 5550 50  0000 R CNN
F 2 "" H 1150 5650 50  0001 C CNN
F 3 "" H 1150 5650 50  0001 C CNN
	1    1150 5650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 5F76982C
P 2350 5550
F 0 "#PWR0157" H 2350 5300 50  0001 C CNN
F 1 "GND" V 2350 5450 50  0000 R CNN
F 2 "" H 2350 5550 50  0001 C CNN
F 3 "" H 2350 5550 50  0001 C CNN
	1    2350 5550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 5F769EF2
P 5550 5550
F 0 "#PWR0158" H 5550 5300 50  0001 C CNN
F 1 "GND" V 5550 5450 50  0000 R CNN
F 2 "" H 5550 5550 50  0001 C CNN
F 3 "" H 5550 5550 50  0001 C CNN
	1    5550 5550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 5F76A90A
P 3950 5550
F 0 "#PWR0165" H 3950 5300 50  0001 C CNN
F 1 "GND" V 3950 5450 50  0000 R CNN
F 2 "" H 3950 5550 50  0001 C CNN
F 3 "" H 3950 5550 50  0001 C CNN
	1    3950 5550
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5F7E985C
P 850 4550
F 0 "C7" H 850 4250 50  0000 C CNN
F 1 "47uF" H 850 4350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 850 4550 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 850 4550 50  0001 C CNN
F 4 "Murata Electronics" H 850 4550 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 850 4550 50  0001 C CNN "Part #"
	1    850  4550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0166
U 1 1 5F7E9862
P 850 4650
F 0 "#PWR0166" H 850 4400 50  0001 C CNN
F 1 "GND" H 850 4650 50  0000 R CNN
F 2 "" H 850 4650 50  0001 C CNN
F 3 "" H 850 4650 50  0001 C CNN
	1    850  4650
	1    0    0    -1  
$EndComp
Connection ~ 850  4450
Wire Wire Line
	850  4450 1200 4450
$Comp
L Device:R_Pack08_Split RN2
U 6 1 5F84EDCC
P 2900 5450
F 0 "RN2" V 2800 5450 50  0000 C CNN
F 1 "150" V 2900 5450 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 3175 5450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2900 5450 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2900 5450 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 2900 5450 50  0001 C CNN "Part #"
	6    2900 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 4 1 5F84D0C7
P 4500 5450
F 0 "RN2" V 4400 5450 50  0000 C CNN
F 1 "150" V 4500 5450 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 4775 5450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 4500 5450 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 4500 5450 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 4500 5450 50  0001 C CNN "Part #"
	4    4500 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 2 1 5F84A713
P 6100 5450
F 0 "RN2" V 6000 5450 50  0000 C CNN
F 1 "150" V 6100 5450 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 6375 5450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 6100 5450 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 6100 5450 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 6100 5450 50  0001 C CNN "Part #"
	2    6100 5450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 7 1 5F849766
P 1300 5850
F 0 "RN2" V 1400 5850 50  0000 C CNN
F 1 "150" V 1300 5850 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 1575 5850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 1300 5850 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 1300 5850 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 1300 5850 50  0001 C CNN "Part #"
	7    1300 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 5 1 5F84849F
P 2900 5850
F 0 "RN2" V 3000 5850 50  0000 C CNN
F 1 "150" V 2900 5850 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 3175 5850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2900 5850 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2900 5850 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 2900 5850 50  0001 C CNN "Part #"
	5    2900 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 3 1 5F84664F
P 4500 5850
F 0 "RN2" V 4600 5850 50  0000 C CNN
F 1 "150" V 4500 5850 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 4775 5850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 4500 5850 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 4500 5850 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 4500 5850 50  0001 C CNN "Part #"
	3    4500 5850
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 8 1 5F84DE4B
P 1300 5450
F 0 "RN2" V 1200 5450 50  0000 C CNN
F 1 "150" V 1300 5450 50  0000 C CNN
F 2 "Custom Footprints:EXB-2HV151JV-1605x8" V 1575 5450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 1300 5450 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 1300 5450 50  0001 C CNN "Manufacturer"
F 5 "EXB-2HV151JV" V 1300 5450 50  0001 C CNN "Part #"
	8    1300 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 5450 4650 5450
Connection ~ 4350 5450
Wire Wire Line
	6250 5450 5950 5450
Connection ~ 5950 5450
Wire Wire Line
	3050 5450 2750 5450
Connection ~ 2750 5450
Wire Wire Line
	1450 5450 1150 5450
Connection ~ 1150 5450
Text Label 13450 2250 0    50   ~ 0
Isense_internal
$Comp
L power:GND #PWR0102
U 1 1 5F795ABB
P 5400 10950
F 0 "#PWR0102" H 5400 10700 50  0001 C CNN
F 1 "GND" V 5300 10900 50  0000 R CNN
F 2 "" H 5400 10950 50  0001 C CNN
F 3 "" H 5400 10950 50  0001 C CNN
	1    5400 10950
	0    1    1    0   
$EndComp
Text Label 4500 10950 0    50   ~ 0
3.3V
Text Label 4500 11150 0    50   ~ 0
3.3V
$Comp
L power:GND #PWR0124
U 1 1 5F7D0257
P 3750 10750
F 0 "#PWR0124" H 3750 10500 50  0001 C CNN
F 1 "GND" V 3650 10700 50  0000 R CNN
F 2 "" H 3750 10750 50  0001 C CNN
F 3 "" H 3750 10750 50  0001 C CNN
	1    3750 10750
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:BAT54BRW D2
U 1 1 5F7D025F
P 3950 10850
F 0 "D2" H 4125 11197 60  0000 C CNN
F 1 "BAT54BRW" H 4125 11091 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4150 11050 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 4150 11150 60  0001 L CNN
F 4 "Diodes Incorporated" H 3950 10850 50  0001 C CNN "Manufacturer"
F 5 "BAT54BRW-7-F" H 3950 10850 50  0001 C CNN "Part #"
	1    3950 10850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5F7D0267
P 3750 10950
F 0 "#PWR0126" H 3750 10700 50  0001 C CNN
F 1 "GND" V 3650 10900 50  0000 R CNN
F 2 "" H 3750 10950 50  0001 C CNN
F 3 "" H 3750 10950 50  0001 C CNN
	1    3750 10950
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:BAT54BRW D1
U 1 1 5F7E5C45
P 2100 10850
F 0 "D1" H 2275 11197 60  0000 C CNN
F 1 "BAT54BRW" H 2275 11091 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 2300 11050 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 2300 11150 60  0001 L CNN
F 4 "Diodes Incorporated" H 2100 10850 50  0001 C CNN "Manufacturer"
F 5 "BAT54BRW-7-F" H 2100 10850 50  0001 C CNN "Part #"
	1    2100 10850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0167
U 1 1 5F81886E
P 1900 10750
F 0 "#PWR0167" H 1900 10500 50  0001 C CNN
F 1 "GND" V 1800 10700 50  0000 R CNN
F 2 "" H 1900 10750 50  0001 C CNN
F 3 "" H 1900 10750 50  0001 C CNN
	1    1900 10750
	0    1    1    0   
$EndComp
Text Label 2850 10950 0    50   ~ 0
3.3V
Text Label 13450 3450 0    50   ~ 0
A-D_input_3
Text Label 13450 3550 0    50   ~ 0
A-D_input_4
$Comp
L power:GND #PWR0181
U 1 1 5F90041C
P 14200 3050
F 0 "#PWR0181" H 14200 2800 50  0001 C CNN
F 1 "GND" V 14200 2900 50  0000 R CNN
F 2 "" H 14200 3050 50  0001 C CNN
F 3 "" H 14200 3050 50  0001 C CNN
	1    14200 3050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0176
U 1 1 5F8FFE49
P 13450 3050
F 0 "#PWR0176" H 13450 2800 50  0001 C CNN
F 1 "GND" V 13450 2900 50  0000 R CNN
F 2 "" H 13450 3050 50  0001 C CNN
F 3 "" H 13450 3050 50  0001 C CNN
	1    13450 3050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13450 3150 14200 3150
Text Notes 13750 3100 0    98   ~ 20
**
Text Label 6150 10750 0    50   ~ 0
A-D_input_4
NoConn ~ 2650 11150
NoConn ~ 1900 10950
NoConn ~ 1900 11150
$Comp
L Device:Jumper_NC_Small JP5
U 1 1 5F698386
P 2750 10950
F 0 "JP5" H 2800 11050 50  0000 R CNN
F 1 "Jumper_NC_Small" V 2705 10903 50  0001 R CNN
F 2 "Custom Footprints:20A_shunt_5104" H 2750 10950 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p54.pdf" H 2750 10950 50  0001 C CNN
F 4 "Keystone Electronics" V 2750 10950 50  0001 C CNN "Manufacturer"
F 5 "5104" V 2750 10950 50  0001 C CNN "Part #"
	1    2750 10950
	1    0    0    -1  
$EndComp
Text Label 11150 1950 2    50   ~ 0
NC1
Text Label 11150 2050 2    50   ~ 0
NC2
Text Label 11150 2150 2    50   ~ 0
NC3
Text Label 11150 2250 2    50   ~ 0
NC4
Text Label 11150 2350 2    50   ~ 0
NC5
Text Label 13450 2650 0    50   ~ 0
NC6
Text Label 13450 2850 0    50   ~ 0
NC7
Text Label 13450 3150 0    50   ~ 0
NC8
Wire Wire Line
	1600 6850 1850 6850
Wire Wire Line
	1600 7050 2150 7050
$Comp
L Device:R_Pack04_Split RN1
U 2 1 5F5FBFA1
P 2000 6850
F 0 "RN1" V 2100 6850 50  0000 C CNN
F 1 "150" V 2000 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2275 6850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2000 6850 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2000 6850 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 2000 6850 50  0001 C CNN "Part #"
	2    2000 6850
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 1 1 5F9CC36C
P 2300 7050
F 0 "RN1" V 2400 7050 50  0000 C CNN
F 1 "150" V 2300 7050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2575 7050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2300 7050 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2300 7050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 2300 7050 50  0001 C CNN "Part #"
	1    2300 7050
	0    1    -1   0   
$EndComp
Text Label 1600 7050 0    50   ~ 0
Isense_internal
$Comp
L Device:R_Pack08_Split RN3
U 6 1 5F641B3C
P 4600 7650
F 0 "RN3" V 4700 7650 50  0000 C CNN
F 1 "4.7k" V 4600 7650 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 5075 7650 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 4600 7650 50  0001 C CNN
F 4 "CTS Resistor Products" V 4600 7650 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 4600 7650 50  0001 C CNN "Part #"
	6    4600 7650
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 7 1 5F642C83
P 4600 7500
F 0 "RN3" V 4500 7500 50  0000 C CNN
F 1 "4.7k" V 4600 7500 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 5075 7500 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 4600 7500 50  0001 C CNN
F 4 "CTS Resistor Products" V 4600 7500 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 4600 7500 50  0001 C CNN "Part #"
	7    4600 7500
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 3 1 5F6410FE
P 2000 7950
F 0 "RN3" V 1900 7950 50  0000 C CNN
F 1 "4.7k" V 2000 7950 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 7950 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 7950 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 7950 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 7950 50  0001 C CNN "Part #"
	3    2000 7950
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 2 1 5F6407AE
P 2000 8150
F 0 "RN3" V 1900 8150 50  0000 C CNN
F 1 "4.7k" V 2000 8150 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 8150 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 8150 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 8150 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 8150 50  0001 C CNN "Part #"
	2    2000 8150
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 5 1 5F648A31
P 4600 7850
F 0 "RN3" V 4700 7850 50  0000 C CNN
F 1 "4.7k" V 4600 7850 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 5075 7850 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 4600 7850 50  0001 C CNN
F 4 "CTS Resistor Products" V 4600 7850 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 4600 7850 50  0001 C CNN "Part #"
	5    4600 7850
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 1 1 5F607B24
P 2000 8350
F 0 "RN3" V 1900 8350 50  0000 C CNN
F 1 "4.7k" V 2000 8350 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 8350 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 8350 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 8350 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 8350 50  0001 C CNN "Part #"
	1    2000 8350
	0    1    -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 4 1 5F6416DB
P 2000 7750
F 0 "RN3" V 1900 7750 50  0000 C CNN
F 1 "4.7k" V 2000 7750 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 7750 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 7750 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 7750 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 7750 50  0001 C CNN "Part #"
	4    2000 7750
	0    1    -1   0   
$EndComp
Connection ~ 4450 7850
Connection ~ 4750 7850
Wire Wire Line
	4450 7850 4750 7850
$Comp
L power:GND #PWR0170
U 1 1 5F8F5E2F
P 4450 7850
F 0 "#PWR0170" H 4450 7600 50  0001 C CNN
F 1 "GND" V 4450 7750 50  0000 R CNN
F 2 "" H 4450 7850 50  0001 C CNN
F 3 "" H 4450 7850 50  0001 C CNN
	1    4450 7850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 5F8F520E
P 4750 7850
F 0 "#PWR0168" H 4750 7600 50  0001 C CNN
F 1 "GND" V 4750 7750 50  0000 R CNN
F 2 "" H 4750 7850 50  0001 C CNN
F 3 "" H 4750 7850 50  0001 C CNN
	1    4750 7850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4350 6750 4650 6750
Wire Wire Line
	4350 6550 4350 6750
Wire Wire Line
	4650 6550 4350 6550
Connection ~ 5400 6850
$Comp
L Device:C_Small C15
U 1 1 5F730CC6
P 5500 6850
F 0 "C15" V 5550 6900 50  0000 L CNN
F 1 "2.2uF" V 5400 6800 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5500 6850 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5500 6850 50  0001 C CNN
F 4 "Taiyo Yuden" H 5500 6850 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5500 6850 50  0001 C CNN "Part #"
	1    5500 6850
	0    1    -1   0   
$EndComp
Wire Wire Line
	1600 8350 1850 8350
Wire Wire Line
	1600 8150 1850 8150
Wire Wire Line
	1600 7950 1850 7950
Wire Wire Line
	1600 7750 1850 7750
Text Label 1850 6650 0    50   ~ 0
SDA0
Text Label 1850 6450 0    50   ~ 0
SCL0
Wire Wire Line
	1600 6450 1850 6450
Text Label 4500 9500 2    50   ~ 0
Toggle_switch
Text Label 2450 7050 0    50   ~ 0
Isense
Text Label 5500 6650 0    50   ~ 0
OA_input
Wire Wire Line
	4450 7500 4450 7650
Connection ~ 5850 7650
Wire Wire Line
	4750 7500 5450 7500
Wire Wire Line
	5450 7650 4750 7650
Wire Wire Line
	5850 7500 5850 7650
Text Label 4750 7500 0    50   ~ 0
MOSFET_temp
Text Notes 4300 7300 0    59   ~ 0
Isense resistor and MOSFET\nthermitor temperature monitoring
Text Notes 1400 6250 0    59   ~ 0
External analog input with 3.3V zener clamp
Text Notes 1400 7600 0    59   ~ 0
Analog/digital inputs with 0-3.3V clamp
$Comp
L power:GND #PWR013
U 1 1 5FFBBB01
P 5600 6850
F 0 "#PWR013" H 5600 6600 50  0001 C CNN
F 1 "GND" V 5600 6750 50  0000 R CNN
F 2 "" H 5600 6850 50  0001 C CNN
F 3 "" H 5600 6850 50  0001 C CNN
	1    5600 6850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5FFB8A0F
P 4650 6650
F 0 "#PWR09" H 4650 6400 50  0001 C CNN
F 1 "GND" V 4650 6550 50  0000 R CNN
F 2 "" H 4650 6650 50  0001 C CNN
F 3 "" H 4650 6650 50  0001 C CNN
	1    4650 6650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR017
U 1 1 5FAA68F2
P 5850 7650
F 0 "#PWR017" H 5850 7400 50  0001 C CNN
F 1 "GND" H 5900 7500 50  0000 R CNN
F 2 "" H 5850 7650 50  0001 C CNN
F 3 "" H 5850 7650 50  0001 C CNN
	1    5850 7650
	-1   0    0    -1  
$EndComp
Text Label 4450 7600 2    50   ~ 0
3.3V
$Comp
L Device:Thermistor TH2
U 1 1 5F78EA16
P 5650 7650
F 0 "TH2" V 5650 7600 50  0000 L CNN
F 1 "Thermistor" H 5755 7605 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5650 7650 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 5650 7650 50  0001 C CNN
F 4 "Murata Electronics" H 5650 7650 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 5650 7650 50  0001 C CNN "Part #"
	1    5650 7650
	0    -1   1    0   
$EndComp
Text Label 4750 7650 0    50   ~ 0
Resistor_temp
$Comp
L Device:Thermistor TH1
U 1 1 5F76C793
P 5650 7500
F 0 "TH1" V 5650 7450 50  0000 L CNN
F 1 "Thermistor" H 5755 7455 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5650 7500 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 5650 7500 50  0001 C CNN
F 4 "Murata Electronics" H 5650 7500 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 5650 7500 50  0001 C CNN "Part #"
	1    5650 7500
	0    -1   1    0   
$EndComp
Text Label 2150 8350 0    50   ~ 0
A-D_input_4
Text Label 2150 8150 0    50   ~ 0
A-D_input_3
Text Label 2150 7950 0    50   ~ 0
A-D_input_2
Text Label 2150 7750 0    50   ~ 0
A-D_input_1
Text Label 5400 6450 0    50   ~ 0
Analog_select
Text Label 4650 6450 2    50   ~ 0
Interline_PWM
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 4 1 5F58DBB9
P 1200 8050
F 0 "J3" H 1350 7600 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 8600 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 8075 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 8075 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 8050 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 8050 50  0001 C CNN "Part #"
	4    1200 8050
	1    0    0    1   
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 3 1 5F57B5E3
P 1200 6750
F 0 "J3" H 1350 6300 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 7300 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 6775 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 6775 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 6750 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 6750 50  0001 C CNN "Part #"
	3    1200 6750
	1    0    0    1   
$EndComp
Wire Wire Line
	1600 6650 1850 6650
$Comp
L power:GND #PWR0148
U 1 1 5F61F25B
P 1600 8450
F 0 "#PWR0148" H 1600 8200 50  0001 C CNN
F 1 "GND" V 1600 8350 50  0000 R CNN
F 2 "" H 1600 8450 50  0001 C CNN
F 3 "" H 1600 8450 50  0001 C CNN
	1    1600 8450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0147
U 1 1 5F61EEEF
P 1600 8250
F 0 "#PWR0147" H 1600 8000 50  0001 C CNN
F 1 "GND" V 1600 8150 50  0000 R CNN
F 2 "" H 1600 8250 50  0001 C CNN
F 3 "" H 1600 8250 50  0001 C CNN
	1    1600 8250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0146
U 1 1 5F61EC78
P 1600 8050
F 0 "#PWR0146" H 1600 7800 50  0001 C CNN
F 1 "GND" V 1600 7950 50  0000 R CNN
F 2 "" H 1600 8050 50  0001 C CNN
F 3 "" H 1600 8050 50  0001 C CNN
	1    1600 8050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0145
U 1 1 5F61E491
P 1600 7850
F 0 "#PWR0145" H 1600 7600 50  0001 C CNN
F 1 "GND" V 1600 7750 50  0000 R CNN
F 2 "" H 1600 7850 50  0001 C CNN
F 3 "" H 1600 7850 50  0001 C CNN
	1    1600 7850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0144
U 1 1 5F6083B9
P 1600 7150
F 0 "#PWR0144" H 1600 6900 50  0001 C CNN
F 1 "GND" V 1600 7050 50  0000 R CNN
F 2 "" H 1600 7150 50  0001 C CNN
F 3 "" H 1600 7150 50  0001 C CNN
	1    1600 7150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0143
U 1 1 5F60812B
P 1600 6950
F 0 "#PWR0143" H 1600 6700 50  0001 C CNN
F 1 "GND" V 1600 6850 50  0000 R CNN
F 2 "" H 1600 6950 50  0001 C CNN
F 3 "" H 1600 6950 50  0001 C CNN
	1    1600 6950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0142
U 1 1 5F607DFB
P 1600 6750
F 0 "#PWR0142" H 1600 6500 50  0001 C CNN
F 1 "GND" V 1600 6650 50  0000 R CNN
F 2 "" H 1600 6750 50  0001 C CNN
F 3 "" H 1600 6750 50  0001 C CNN
	1    1600 6750
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0141
U 1 1 5F606C36
P 1600 6550
F 0 "#PWR0141" H 1600 6300 50  0001 C CNN
F 1 "GND" V 1600 6450 50  0000 R CNN
F 2 "" H 1600 6550 50  0001 C CNN
F 3 "" H 1600 6550 50  0001 C CNN
	1    1600 6550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0140
U 1 1 5F601BD9
P 1200 7550
F 0 "#PWR0140" H 1200 7300 50  0001 C CNN
F 1 "GND" H 1450 7500 50  0000 R CNN
F 2 "" H 1200 7550 50  0001 C CNN
F 3 "" H 1200 7550 50  0001 C CNN
	1    1200 7550
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0139
U 1 1 5F5F2844
P 1200 6250
F 0 "#PWR0139" H 1200 6000 50  0001 C CNN
F 1 "GND" H 1450 6200 50  0000 R CNN
F 2 "" H 1200 6250 50  0001 C CNN
F 3 "" H 1200 6250 50  0001 C CNN
	1    1200 6250
	-1   0    0    1   
$EndComp
Text Notes 850  8950 1    59   ~ 0
I/O maximum voltage: +30V/-27V (160mW)\nNiDaq PCI-6110 is +/- 10V 5mA\n∴ minimum impedance is 2000 Ohms
Text Notes 4500 6150 0    59   ~ 0
Op-amp input 4x1 mux
Text Notes 2200 7350 0    59   ~ 0
Current sense voltage ouput
Wire Wire Line
	5500 6650 5400 6650
Text Label 2150 6850 0    50   ~ 0
external_analog
Text Label 4650 6900 2    50   ~ 0
5V
Text Label 4650 6550 2    50   ~ 0
-0.25V_analog
Text Label 5450 6750 0    50   ~ 0
external_analog
Text Label 5450 6550 0    50   ~ 0
internal_analog
Wire Wire Line
	5450 6750 5400 6750
Wire Wire Line
	5400 6550 5450 6550
Wire Wire Line
	5400 6950 5400 6850
Wire Wire Line
	4650 6950 5400 6950
$Comp
L Custom_parts:TMUX1204DGSR U6
U 1 1 5F3BA201
P 4850 6400
F 0 "U6" H 5025 6565 50  0000 C CNN
F 1 "TMUX1204DGSR" H 5025 6474 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 4850 7400 50  0001 L BNN
F 3 "https://www.ti.com/lit/ds/symlink/tmux1204.pdf?ts=1598255085911&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FTMUX1204" H 4850 6400 50  0001 C CNN
F 4 "Texas Instruments" H 4850 6400 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 4850 6400 50  0001 C CNN "Part #"
	1    4850 6400
	1    0    0    -1  
$EndComp
Text Notes 8500 9500 0    118  ~ 0
Thermal Management\n
Text Notes 7300 9850 0    59   ~ 0
4-pin 92mm fan
Wire Notes Line
	11800 9300 6700 9300
Text Notes 2600 4950 0    118  ~ 0
Inputs and Outputs\n
Text Notes 7000 7400 0    118  ~ 0
Constant Current LED Driver with Compensation\n\n
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 2 1 5F589234
P 1200 9500
F 0 "J3" H 1350 9050 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 10050 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 9525 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 9525 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 9500 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 9500 50  0001 C CNN "Part #"
	2    1200 9500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F59943B
P 1200 10000
F 0 "#PWR01" H 1200 9750 50  0001 C CNN
F 1 "GND" H 1450 9950 50  0000 R CNN
F 2 "" H 1200 10000 50  0001 C CNN
F 3 "" H 1200 10000 50  0001 C CNN
	1    1200 10000
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F5CDB2E
P 1600 9500
F 0 "#PWR03" H 1600 9250 50  0001 C CNN
F 1 "GND" V 1600 9400 50  0000 R CNN
F 2 "" H 1600 9500 50  0001 C CNN
F 3 "" H 1600 9500 50  0001 C CNN
	1    1600 9500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F5CDB34
P 1600 9700
F 0 "#PWR04" H 1600 9450 50  0001 C CNN
F 1 "GND" V 1600 9600 50  0000 R CNN
F 2 "" H 1600 9700 50  0001 C CNN
F 3 "" H 1600 9700 50  0001 C CNN
	1    1600 9700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F5CDB3A
P 1600 9100
F 0 "#PWR05" H 1600 8850 50  0001 C CNN
F 1 "GND" V 1500 9100 50  0000 R CNN
F 2 "" H 1600 9100 50  0001 C CNN
F 3 "" H 1600 9100 50  0001 C CNN
	1    1600 9100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F6B2779
P 1600 9300
F 0 "#PWR02" H 1600 9050 50  0001 C CNN
F 1 "GND" V 1600 9200 50  0000 R CNN
F 2 "" H 1600 9300 50  0001 C CNN
F 3 "" H 1600 9300 50  0001 C CNN
	1    1600 9300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1800 9800 1600 9800
Wire Wire Line
	1800 9900 1800 9800
Wire Wire Line
	2200 9900 1800 9900
Text Label 3050 9700 0    50   ~ 0
External_5V_PWM3
Text Label 2200 9800 2    50   ~ 0
5V_fan_PWM
$Comp
L power:GND #PWR0172
U 1 1 6037B5F8
P 3050 10000
F 0 "#PWR0172" H 3050 9750 50  0001 C CNN
F 1 "GND" V 3050 9900 50  0000 R CNN
F 2 "" H 3050 10000 50  0001 C CNN
F 3 "" H 3050 10000 50  0001 C CNN
	1    3050 10000
	0    -1   1    0   
$EndComp
Text Label 3050 10100 0    50   ~ 0
External_5V_PWM1
Wire Wire Line
	1850 9700 2200 9700
$Comp
L power:GND #PWR0179
U 1 1 5FC646F4
P 2000 9400
F 0 "#PWR0179" H 2000 9150 50  0001 C CNN
F 1 "GND" H 2050 9250 50  0000 R CNN
F 2 "" H 2000 9400 50  0001 C CNN
F 3 "" H 2000 9400 50  0001 C CNN
	1    2000 9400
	1    0    0    1   
$EndComp
Connection ~ 2200 9400
Wire Wire Line
	2200 9300 2200 9400
$Comp
L Device:C_Small C16
U 1 1 5FC38687
P 2100 9400
F 0 "C16" V 2050 9200 50  0000 L CNN
F 1 "2.2uF" V 2050 9450 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 2100 9400 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 2100 9400 50  0001 C CNN
F 4 "Taiyo Yuden" H 2100 9400 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 2100 9400 50  0001 C CNN "Part #"
	1    2100 9400
	0    1    -1   0   
$EndComp
$Comp
L power:GND #PWR0154
U 1 1 5FB6EE63
P 3050 9400
F 0 "#PWR0154" H 3050 9150 50  0001 C CNN
F 1 "GND" V 3050 9300 50  0000 R CNN
F 2 "" H 3050 9400 50  0001 C CNN
F 3 "" H 3050 9400 50  0001 C CNN
	1    3050 9400
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0109
U 1 1 5FB6EAAA
P 3050 9600
F 0 "#PWR0109" H 3050 9350 50  0001 C CNN
F 1 "GND" V 3050 9500 50  0000 R CNN
F 2 "" H 3050 9600 50  0001 C CNN
F 3 "" H 3050 9600 50  0001 C CNN
	1    3050 9600
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR0108
U 1 1 5FB6E536
P 3050 9800
F 0 "#PWR0108" H 3050 9550 50  0001 C CNN
F 1 "GND" V 3050 9700 50  0000 R CNN
F 2 "" H 3050 9800 50  0001 C CNN
F 3 "" H 3050 9800 50  0001 C CNN
	1    3050 9800
	0    -1   1    0   
$EndComp
Text Label 3050 9500 0    50   ~ 0
External_5V_PWM2
$Comp
L power:GND #PWR0106
U 1 1 5FB26F71
P 2200 10100
F 0 "#PWR0106" H 2200 9850 50  0001 C CNN
F 1 "GND" V 2200 10000 50  0000 R CNN
F 2 "" H 2200 10100 50  0001 C CNN
F 3 "" H 2200 10100 50  0001 C CNN
	1    2200 10100
	0    1    -1   0   
$EndComp
$Comp
L Custom_parts:SN74LV4T125PWR U16
U 1 1 5FB230D1
P 2350 9800
F 0 "U16" H 2250 10300 50  0000 C CNN
F 1 "SN74LV4T125PWR" H 1750 10300 50  0000 C CNN
F 2 "Custom Footprints:SN74LV4T125" H 1900 9350 50  0001 L BNN
F 3 "https://www.ti.com/lit/ds/symlink/sn74lv4t125.pdf?HQS=TI-null-null-digikeymode-df-pf-null-wwe&ts=1598425470784" H 2400 9800 50  0001 C CNN
F 4 "Texas Instruments" H 2350 9800 50  0001 C CNN "Manufacturer"
F 5 "SN74LV4T125PWR" H 2350 9800 50  0001 C CNN "Part #"
	1    2350 9800
	-1   0    0    -1  
$EndComp
Text Label 2200 9300 2    50   ~ 0
5V
Text Label 3050 9900 0    50   ~ 0
Internal_fan_PWM
Wire Wire Line
	1600 9200 2600 9200
Text Label 2900 9200 0    50   ~ 0
3.3V
Text Label 1850 9200 0    50   ~ 0
External_thermistor
Wire Wire Line
	1600 9600 2200 9600
Wire Wire Line
	1850 9700 1850 9400
Wire Wire Line
	1850 9400 1600 9400
$Comp
L Device:R_Pack08_Split RN3
U 8 1 5F643BA8
P 2750 9200
F 0 "RN3" V 2850 9200 50  0000 C CNN
F 1 "4.7k" V 2750 9200 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 3225 9200 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2750 9200 50  0001 C CNN
F 4 "CTS Resistor Products" V 2750 9200 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2750 9200 50  0001 C CNN "Part #"
	8    2750 9200
	0    1    -1   0   
$EndComp
Text Notes 1450 8900 0    59   ~ 0
External thermistor and 3x 5V/16mA digital outputs\n
Text Notes 1750 10450 0    59   ~ 0
3.3V clamp for external analog\nMax voltage: +6V/-3V
Text Notes 2400 5200 0    59   ~ 0
4x momentary pushbuttons with indicator LEDs
Wire Notes Line
	6700 4750 6700 11200
Wire Notes Line
	11800 11200 11800 7000
Wire Notes Line
	11800 7000 6700 7000
Text Notes 6800 5150 0    118  ~ 0
LED Solid-State Relay 4x1 Mux\n\n
Text Notes 10850 750  0    118  ~ 0
Teensy 3.6 180 MHz Microcontroller
Wire Notes Line
	9800 7000 9800 4750
Wire Notes Line
	9800 4750 500  4750
Wire Wire Line
	1200 2800 1550 2800
Text Label 650  2800 2    50   ~ 0
Vin
Text Notes 600  2550 0    50   ~ 0
LED bypass capacitor array
Wire Wire Line
	1350 2050 2000 2050
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 5F56E8CF
P 2300 2450
F 0 "JP2" V 2300 2450 50  0000 R CNN
F 1 "Jumper_NC_Small" V 2255 2403 50  0001 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 2300 2450 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p54.pdf" H 2300 2450 50  0001 C CNN
F 4 "Keystone Electronics" V 2300 2450 50  0001 C CNN "Manufacturer"
F 5 "5108" V 2300 2450 50  0001 C CNN "Part #"
	1    2300 2450
	0    -1   -1   0   
$EndComp
Connection ~ 2300 2350
Text Notes 2400 1700 0    50   ~ 0
Optional bypass jumper
Connection ~ 2600 2050
Wire Wire Line
	2600 1700 2600 2050
Wire Wire Line
	2400 1700 2600 1700
Connection ~ 2000 2050
Wire Wire Line
	2000 1700 2000 2050
Wire Wire Line
	2200 1700 2000 1700
$Comp
L Device:Jumper_NO_Small JP4
U 1 1 5F9F89CD
P 2300 1700
F 0 "JP4" H 2350 1650 50  0000 R CNN
F 1 "Jumper_NC_Small" V 2255 1653 50  0001 R CNN
F 2 "Resistor_SMD:R_2010_5025Metric" H 2300 1700 50  0001 C CNN
F 3 "http://www.koaspeer.com/pdfs/RK73Z.pdf" H 2300 1700 50  0001 C CNN
F 4 "KOA Speer Electronics, Inc." V 2300 1700 50  0001 C CNN "Manufacturer"
F 5 "RK73Z2HTTE" V 2300 1700 50  0001 C CNN "Part #"
	1    2300 1700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0171
U 1 1 5FAAAA28
P 2300 2350
F 0 "#PWR0171" H 2300 2100 50  0001 C CNN
F 1 "GND" H 2400 2200 50  0000 R CNN
F 2 "" H 2300 2350 50  0001 C CNN
F 3 "" H 2300 2350 50  0001 C CNN
	1    2300 2350
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6050 2200 6050 2400
Wire Wire Line
	5900 1700 6150 1700
Connection ~ 5650 2300
Wire Wire Line
	2600 2050 2850 2050
$Comp
L power:GND #PWR0130
U 1 1 5FB03225
P 2850 2250
F 0 "#PWR0130" H 2850 2000 50  0001 C CNN
F 1 "GND" H 2950 2100 50  0000 R CNN
F 2 "" H 2850 2250 50  0001 C CNN
F 3 "" H 2850 2250 50  0001 C CNN
	1    2850 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2050 3050 2050
Connection ~ 2850 2050
$Comp
L Device:C_Small C9
U 1 1 5FB0146B
P 2850 2150
F 0 "C9" H 2850 1850 50  0000 C CNN
F 1 "47uF" H 2850 1950 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2850 2150 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 2850 2150 50  0001 C CNN
F 4 "Murata Electronics" H 2850 2150 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 2850 2150 50  0001 C CNN "Part #"
	1    2850 2150
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 3 1 5F9DEBDC
P 5650 2450
F 0 "RN1" H 5800 2450 50  0000 C CNN
F 1 "150" V 5650 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5925 2450 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 5650 2450 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 5650 2450 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 5650 2450 50  0001 C CNN "Part #"
	3    5650 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 4 1 5F9DAD99
P 5650 2150
F 0 "RN1" H 5500 2150 50  0000 C CNN
F 1 "150" V 5650 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5925 2150 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 5650 2150 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 5650 2150 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 5650 2150 50  0001 C CNN "Part #"
	4    5650 2150
	-1   0    0    1   
$EndComp
Text Label 2600 1200 2    50   ~ 0
12V
Wire Wire Line
	2050 1300 1950 1300
Text Label 1950 1400 0    50   ~ 0
Vin
$Comp
L Custom_parts:Conn_01x03_Male J6
U 1 1 5F80DD63
P 1750 1300
F 0 "J6" H 1850 1450 50  0000 C CNN
F 1 "Conn_01x03_Male" H 2000 1100 50  0000 C CNN
F 2 "Custom Footprints:Ref_only" H 1750 1300 50  0001 C CNN
F 3 "http://www.adam-tech.com/downloader.php?p=PH1RB-XX-UA.pdf" H 1750 1300 50  0001 C CNN
F 4 "Adam Tech" H 1750 1300 50  0001 C CNN "Manufacturer"
F 5 "PH1RB-03-UA" H 1750 1300 50  0001 C CNN "Part #"
	1    1750 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 1300 2600 1300
$Comp
L power:GND #PWR0122
U 1 1 5F7F0B00
P 2050 1300
F 0 "#PWR0122" H 2050 1050 50  0001 C CNN
F 1 "GND" V 2150 1250 50  0000 R CNN
F 2 "" H 2050 1300 50  0001 C CNN
F 3 "" H 2050 1300 50  0001 C CNN
	1    2050 1300
	0    -1   -1   0   
$EndComp
$Comp
L Custom_parts:Conn_01x03_Female J9
U 1 1 5F7AA12C
P 2800 1300
F 0 "J9" H 2700 1450 50  0000 L CNN
F 1 "Conn_01x03_Female" H 2350 1100 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 2800 1300 50  0001 C CNN
F 3 "https://www.samtec.com/products/ssm-103-l-sv-lc" H 2800 1300 50  0001 C CNN
F 4 "Samtec Inc." H 2800 1300 50  0001 C CNN "Manufacturer"
F 5 "SSM-103-L-SV" H 2800 1300 50  0001 C CNN "Part #"
	1    2800 1300
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:R-78B1.2-2.0 U1
U 1 1 5F77BF57
P 2300 2050
F 0 "U1" H 2300 2292 50  0000 C CNN
F 1 "12V boost" H 2300 2201 50  0000 C CNN
F 2 "Custom Footprints:12V_DC-DC_with_header_2117" H 2350 1800 50  0001 L CIN
F 3 "https://www.pololu.com/product-info-merged/2117" H 2300 2050 50  0001 C CNN
F 4 "Pololu Corporation" H 2300 2050 50  0001 C CNN "Manufacturer"
F 5 "2117" H 2300 2050 50  0001 C CNN "Part #"
	1    2300 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	1350 1650 1350 2050
Wire Wire Line
	1050 1650 1350 1650
Wire Wire Line
	5450 2300 5650 2300
Wire Wire Line
	5450 2400 5450 2300
Wire Wire Line
	5650 1700 5700 1700
Connection ~ 5650 1700
Wire Wire Line
	4950 1700 5650 1700
$Comp
L Device:D_Zener D5
U 1 1 5F67F87E
P 5650 1850
F 0 "D5" V 5600 1900 50  0000 L CNN
F 1 "D_Zener" V 5695 1930 50  0001 L CNN
F 2 "Diode_SMD:D_SOD-323" H 5650 1850 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/MM3Z2V4ST1-D.PDF" H 5650 1850 50  0001 C CNN
F 4 "ON Semiconductor" V 5650 1850 50  0001 C CNN "Manufacturer"
F 5 "MM3Z4V7ST1G" V 5650 1850 50  0001 C CNN "Part #"
	1    5650 1850
	0    -1   -1   0   
$EndComp
Connection ~ 1350 2050
Wire Wire Line
	1100 2050 1350 2050
Text Notes 6100 1250 0    59   ~ 0
Op-amp linear reagulator split supply: \n12V/-5V to clean 10V/-1.8V
$Comp
L Device:C_Small C20
U 1 1 5F47299E
P 4250 2250
F 0 "C20" V 4150 2250 50  0000 C CNN
F 1 "2200pF" V 4050 2250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4250 2250 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 4250 2250 50  0001 C CNN
F 4 "KEMET" H 4250 2250 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 4250 2250 50  0001 C CNN "Part #"
	1    4250 2250
	0    1    -1   0   
$EndComp
Text Label 6050 2200 0    50   ~ 0
10V-analog
$Comp
L Custom_parts:BDJ0GA5WEFJ-E2 U4
U 1 1 5F46185F
P 6100 2400
F 0 "U4" H 6800 2657 60  0000 C CNN
F 1 "BDJ0GA5WEFJ-E2" H 6800 2551 60  0000 C CNN
F 2 "Custom Footprints:BDJ0GA5WEFJ-E2" H 6850 2640 60  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/ic/power/linear_regulator/bdxxga5wefj-e.pdf" H 6800 2551 60  0001 C CNN
F 4 "Rohm Semiconductor" H 6100 2400 50  0001 C CNN "Manufacturer"
F 5 "BDJ0GA5WEFJ-E2" H 6100 2400 50  0001 C CNN "Part #"
	1    6100 2400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0156
U 1 1 5F419542
P 6150 1900
F 0 "#PWR0156" H 6150 1650 50  0001 C CNN
F 1 "GND" H 6250 1750 50  0000 R CNN
F 2 "" H 6150 1900 50  0001 C CNN
F 3 "" H 6150 1900 50  0001 C CNN
	1    6150 1900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F417AA2
P 5800 1700
F 0 "R5" V 5900 1650 50  0000 L CNN
F 1 "12" V 5800 1650 50  0000 L CNN
F 2 "Resistor_SMD:R_1210_3225Metric" H 5800 1700 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 5800 1700 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 5800 1700 50  0001 C CNN "Manufacturer"
F 5 "RMCF1210JT12R0" H 5800 1700 50  0001 C CNN "Part #"
	1    5800 1700
	0    -1   -1   0   
$EndComp
Connection ~ 6150 1700
$Comp
L Device:C_Small C12
U 1 1 5F414F68
P 6150 1800
F 0 "C12" H 6200 1750 50  0000 L CNN
F 1 "2.2uF" H 6200 1650 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 6150 1800 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 6150 1800 50  0001 C CNN
F 4 "Taiyo Yuden" H 6150 1800 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 6150 1800 50  0001 C CNN "Part #"
	1    6150 1800
	1    0    0    -1  
$EndComp
Connection ~ 6300 1700
Wire Wire Line
	6300 1800 6300 1700
$Comp
L power:GND #PWR0155
U 1 1 5F40DAE4
P 6300 1600
F 0 "#PWR0155" H 6300 1350 50  0001 C CNN
F 1 "GND" V 6200 1600 50  0000 R CNN
F 2 "" H 6300 1600 50  0001 C CNN
F 3 "" H 6300 1600 50  0001 C CNN
	1    6300 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 1700 6150 1700
$Comp
L Custom_parts:ADP7182AUJZ-1.8-R7 U5
U 1 1 5F402E6A
P 6300 1550
F 0 "U5" H 6850 1757 60  0000 C CNN
F 1 "ADP7182AUJZ-1.8-R7" H 6850 1651 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 7100 1790 60  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADP7182.pdf" H 6850 1651 60  0001 C CNN
F 4 "Analog Devices Inc." H 6300 1550 50  0001 C CNN "Manufacturer"
F 5 "ADP7182AUJZ-1.8-R7" H 6300 1550 50  0001 C CNN "Part #"
	1    6300 1550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0123
U 1 1 5F56462A
P 2500 1300
F 0 "#PWR0123" H 2500 1050 50  0001 C CNN
F 1 "GND" V 2400 1250 50  0000 R CNN
F 2 "" H 2500 1300 50  0001 C CNN
F 3 "" H 2500 1300 50  0001 C CNN
	1    2500 1300
	0    1    1    0   
$EndComp
Text Label 1950 1200 0    50   ~ 0
12V
Text Label 2600 1400 2    50   ~ 0
Vin
$Comp
L power:GND #PWR0113
U 1 1 5F518EFF
P 1050 1550
F 0 "#PWR0113" H 1050 1300 50  0001 C CNN
F 1 "GND" V 1055 1422 50  0000 R CNN
F 2 "" H 1050 1550 50  0001 C CNN
F 3 "" H 1050 1550 50  0001 C CNN
	1    1050 1550
	0    -1   -1   0   
$EndComp
Connection ~ 1100 2250
Wire Wire Line
	1100 2150 1100 2250
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5F50593C
P 850 1550
F 0 "J2" H 700 1650 50  0000 L CNN
F 1 "Conn_01x02_Female" H 400 1350 50  0000 L CNN
F 2 "Custom Footprints:Wire_Pad" H 850 1550 50  0001 C CNN
F 3 "~" H 850 1550 50  0001 C CNN
	1    850  1550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5F5035F8
P 1100 2250
F 0 "#PWR0112" H 1100 2000 50  0001 C CNN
F 1 "GND" H 1300 2150 50  0000 R CNN
F 2 "" H 1100 2250 50  0001 C CNN
F 3 "" H 1100 2250 50  0001 C CNN
	1    1100 2250
	1    0    0    -1  
$EndComp
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 5F4FA1F9
P 800 2150
F 0 "J1" H 857 2467 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 857 2376 50  0000 C CNN
F 2 "Custom Footprints:CUI_PJ1-022-SMT-TR" H 850 2110 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/pj1-022-smt-tr.pdf" H 850 2110 50  0001 C CNN
F 4 "CUI Devices" H 800 2150 50  0001 C CNN "Manufacturer"
F 5 "PJ1-022-SMT-TR" H 800 2150 50  0001 C CNN "Part #"
	1    800  2150
	1    0    0    -1  
$EndComp
Connection ~ 4950 1700
$Comp
L Device:C_Small C11
U 1 1 5F37216A
P 4950 2000
F 0 "C11" H 5042 2046 50  0000 L CNN
F 1 "47uF" H 5042 1955 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4950 2000 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 4950 2000 50  0001 C CNN
F 4 "Murata Electronics" H 4950 2000 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4950 2000 50  0001 C CNN "Part #"
	1    4950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2100 4950 2100
Text Label 5450 2300 2    50   ~ 0
-0.25V_analog
Wire Wire Line
	4950 1900 5200 1900
Wire Wire Line
	4750 2250 4750 2100
Wire Wire Line
	4750 2100 4750 2000
Connection ~ 4750 2100
Text Notes 1550 1050 0    59   ~ 0
Boost - Vin (3V - 12V) to 12V DC
Text Notes 3450 1300 0    59   ~ 0
ISOLATED: 12V to split +/- 5V
Wire Wire Line
	4750 1700 4950 1700
Wire Wire Line
	4750 1900 4950 1900
Connection ~ 4950 1900
Text Label 4750 1700 0    50   ~ 0
-5V
Text Label 4800 2100 0    50   ~ 0
5V
Wire Wire Line
	4750 1700 4750 1450
Connection ~ 4750 1700
$Comp
L Device:C_Small C10
U 1 1 5F370F72
P 4950 1800
F 0 "C10" H 5042 1846 50  0000 L CNN
F 1 "47uF" H 5042 1755 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4950 1800 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 4950 1800 50  0001 C CNN
F 4 "Murata Electronics" H 4950 1800 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4950 1800 50  0001 C CNN "Part #"
	1    4950 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1450 4350 1450
Wire Wire Line
	4750 1800 4750 1700
Connection ~ 3750 1800
Wire Wire Line
	3750 1450 4150 1450
Wire Wire Line
	3750 1800 3750 1450
$Comp
L Device:C_Small C19
U 1 1 5F36C3BB
P 4250 1450
F 0 "C19" V 4350 1450 50  0000 C CNN
F 1 "2200pF" V 4300 1650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4250 1450 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 4250 1450 50  0001 C CNN
F 4 "KEMET" H 4250 1450 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 4250 1450 50  0001 C CNN "Part #"
	1    4250 1450
	0    1    -1   0   
$EndComp
Wire Wire Line
	4350 2250 4750 2250
Connection ~ 3550 2050
Wire Wire Line
	3550 2250 3550 2050
Wire Wire Line
	4150 2250 3550 2250
Wire Wire Line
	3550 1900 3750 1900
Wire Wire Line
	3550 2050 3550 1900
$Comp
L pspice:INDUCTOR L1
U 1 1 5F3651AC
P 3300 2050
F 0 "L1" H 3300 2265 50  0000 C CNN
F 1 "10uH" H 3300 2174 50  0000 C CNN
F 2 "Inductor_SMD:L_1210_3225Metric" H 3300 2050 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_automotive_power_tfm322512alma_en.pdf?ref_disty=digikey" H 3300 2050 50  0001 C CNN
F 4 "TDK Corporation" H 3300 2050 50  0001 C CNN "Manufacturer"
F 5 "TFM322512ALMA100MTAA" H 3300 2050 50  0001 C CNN "Part #"
	1    3300 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5F36457B
P 5200 1900
F 0 "#PWR0104" H 5200 1650 50  0001 C CNN
F 1 "GND" V 5200 1800 50  0000 R CNN
F 2 "" H 5200 1900 50  0001 C CNN
F 3 "" H 5200 1900 50  0001 C CNN
	1    5200 1900
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0103
U 1 1 5F3602CD
P 3750 1800
F 0 "#PWR0103" H 3750 1550 50  0001 C CNN
F 1 "GND" V 3755 1672 50  0000 R CNN
F 2 "" H 3750 1800 50  0001 C CNN
F 3 "" H 3750 1800 50  0001 C CNN
	1    3750 1800
	0    1    1    0   
$EndComp
NoConn ~ 3750 2000
$Comp
L Custom_parts:DPBW06F-05 U3
U 1 1 5F35D26E
P 4200 1700
F 0 "U3" H 4250 1835 50  0000 C CNN
F 1 "DPBW06F-05" H 4250 1744 50  0000 C CNN
F 2 "Custom Footprints:DPBW06F-05_with_header" H 4200 1700 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Mean%20Well%20PDF's/SPBW06,DPBW06_Ds.pdf" H 4200 1700 50  0001 C CNN
F 4 "MEAN WELL USA Inc." H 4200 1700 50  0001 C CNN "Manufacturer"
F 5 "DPBW06F-05" H 4200 1700 50  0001 C CNN "Part #"
	1    4200 1700
	1    0    0    -1  
$EndComp
Text Label 2900 2050 0    50   ~ 0
12V
Text Label 1750 2050 2    50   ~ 0
Vin
Text Notes 2200 950  0    118  ~ 0
Voltage Rails: 12V, 10V, 5V, -0.25V, -1.8V, -5V\n\n
Wire Notes Line
	8000 500  8000 4750
Wire Wire Line
	4650 6850 4650 6950
$EndSCHEMATC
