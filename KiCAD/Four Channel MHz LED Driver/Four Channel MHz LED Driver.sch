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
Text Label 1750 1650 2    50   ~ 0
Vin
Text Label 2900 1650 0    50   ~ 0
12V
$Comp
L Custom_parts:DPBW06F-05 U3
U 1 1 5F35D26E
P 4200 1300
F 0 "U3" H 4250 1435 50  0000 C CNN
F 1 "DPBW06F-05" H 4250 1344 50  0000 C CNN
F 2 "Custom Footprints:DPBW06F-05_with_header" H 4200 1300 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Mean%20Well%20PDF's/SPBW06,DPBW06_Ds.pdf" H 4200 1300 50  0001 C CNN
F 4 "MEAN WELL USA Inc." H 4200 1300 50  0001 C CNN "Manufacturer"
F 5 "DPBW06F-05" H 4200 1300 50  0001 C CNN "Part #"
	1    4200 1300
	1    0    0    -1  
$EndComp
NoConn ~ 3750 1600
$Comp
L power:GND #PWR0103
U 1 1 5F3602CD
P 3750 1400
F 0 "#PWR0103" H 3750 1150 50  0001 C CNN
F 1 "GND" V 3755 1272 50  0000 R CNN
F 2 "" H 3750 1400 50  0001 C CNN
F 3 "" H 3750 1400 50  0001 C CNN
	1    3750 1400
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0104
U 1 1 5F36457B
P 5200 1500
F 0 "#PWR0104" H 5200 1250 50  0001 C CNN
F 1 "GND" V 5200 1400 50  0000 R CNN
F 2 "" H 5200 1500 50  0001 C CNN
F 3 "" H 5200 1500 50  0001 C CNN
	1    5200 1500
	0    -1   -1   0   
$EndComp
$Comp
L pspice:INDUCTOR L1
U 1 1 5F3651AC
P 3300 1650
F 0 "L1" H 3300 1865 50  0000 C CNN
F 1 "10uH" H 3300 1774 50  0000 C CNN
F 2 "Inductor_SMD:L_1210_3225Metric" H 3300 1650 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_automotive_power_tfm322512alma_en.pdf?ref_disty=digikey" H 3300 1650 50  0001 C CNN
F 4 "TDK Corporation" H 3300 1650 50  0001 C CNN "Manufacturer"
F 5 "TFM322512ALMA100MTAA" H 3300 1650 50  0001 C CNN "Part #"
	1    3300 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1650 3550 1500
Wire Wire Line
	3550 1500 3750 1500
Wire Wire Line
	4150 1850 3550 1850
Wire Wire Line
	3550 1850 3550 1650
Connection ~ 3550 1650
Wire Wire Line
	4350 1850 4750 1850
$Comp
L Device:C_Small C12
U 1 1 5F36C3BB
P 4250 1050
F 0 "C12" V 4350 1050 50  0000 C CNN
F 1 "2200pF" V 4300 1250 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4250 1050 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 4250 1050 50  0001 C CNN
F 4 "KEMET" H 4250 1050 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 4250 1050 50  0001 C CNN "Part #"
	1    4250 1050
	0    1    -1   0   
$EndComp
Wire Wire Line
	3750 1400 3750 1050
Wire Wire Line
	3750 1050 4150 1050
Connection ~ 3750 1400
Wire Wire Line
	4750 1400 4750 1300
Wire Wire Line
	4750 1050 4350 1050
$Comp
L Device:C_Small C14
U 1 1 5F370F72
P 4950 1400
F 0 "C14" H 5042 1446 50  0000 L CNN
F 1 "47uF" H 5042 1355 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4950 1400 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 4950 1400 50  0001 C CNN
F 4 "Murata Electronics" H 4950 1400 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4950 1400 50  0001 C CNN "Part #"
	1    4950 1400
	1    0    0    -1  
$EndComp
Connection ~ 4750 1300
Wire Wire Line
	4750 1300 4750 1050
Text Label 4800 1700 0    50   ~ 0
5V
Text Label 4750 1300 0    50   ~ 0
-5V
Connection ~ 4950 1500
Wire Wire Line
	4750 1500 4950 1500
Wire Wire Line
	4750 1300 4950 1300
Text Notes 2450 2750 0    59   ~ 0
LDO: 12V to clean 5V for analog circuits
Text Notes 3450 900  0    59   ~ 0
ISOLATED: 12V to split +/- 5V
Text Notes 1550 650  0    59   ~ 0
Boost - Vin (3V - 12V) to 12V DC
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
Wire Wire Line
	4650 6850 4650 6900
Wire Wire Line
	4650 6950 5400 6950
Wire Wire Line
	5400 6950 5400 6850
Wire Wire Line
	5400 6550 5450 6550
Wire Wire Line
	5450 6750 5400 6750
Text Label 5450 6550 0    50   ~ 0
internal_analog
Text Label 5450 6750 0    50   ~ 0
external_analog
Connection ~ 4750 1700
Wire Wire Line
	4750 1700 4750 1600
Wire Wire Line
	4750 1850 4750 1700
Wire Wire Line
	4950 1500 5200 1500
Text Label 5450 1900 2    50   ~ 0
-0.25V_analog
$Comp
L power:GND #PWR0110
U 1 1 5F3D013F
P 5550 2200
F 0 "#PWR0110" H 5550 1950 50  0001 C CNN
F 1 "GND" H 5750 2100 50  0000 R CNN
F 2 "" H 5550 2200 50  0001 C CNN
F 3 "" H 5550 2200 50  0001 C CNN
	1    5550 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1700 4950 1700
$Comp
L Device:C_Small C15
U 1 1 5F37216A
P 4950 1600
F 0 "C15" H 5042 1646 50  0000 L CNN
F 1 "47uF" H 5042 1555 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4950 1600 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 4950 1600 50  0001 C CNN
F 4 "Murata Electronics" H 4950 1600 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4950 1600 50  0001 C CNN "Part #"
	1    4950 1600
	1    0    0    -1  
$EndComp
Connection ~ 4950 1300
Text Label 4650 6550 2    50   ~ 0
-0.25V_analog
Text Label 3900 6150 2    50   ~ 0
5V
Text Label 2150 6850 0    50   ~ 0
external_analog
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 5F4FA1F9
P 800 1750
F 0 "J1" H 857 2067 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 857 1976 50  0000 C CNN
F 2 "Custom Footprints:CUI_PJ1-022-SMT-TR" H 850 1710 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/pj1-022-smt-tr.pdf" H 850 1710 50  0001 C CNN
F 4 "CUI Devices" H 800 1750 50  0001 C CNN "Manufacturer"
F 5 "PJ1-022-SMT-TR" H 800 1750 50  0001 C CNN "Part #"
	1    800  1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0112
U 1 1 5F5035F8
P 1100 1850
F 0 "#PWR0112" H 1100 1600 50  0001 C CNN
F 1 "GND" H 1300 1750 50  0000 R CNN
F 2 "" H 1100 1850 50  0001 C CNN
F 3 "" H 1100 1850 50  0001 C CNN
	1    1100 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J2
U 1 1 5F50593C
P 850 1150
F 0 "J2" H 700 1250 50  0000 L CNN
F 1 "Conn_01x02_Female" H 400 950 50  0000 L CNN
F 2 "Custom Footprints:Wire_Pad" H 850 1150 50  0001 C CNN
F 3 "~" H 850 1150 50  0001 C CNN
	1    850  1150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1100 1750 1100 1850
Connection ~ 1100 1850
$Comp
L power:GND #PWR0113
U 1 1 5F518EFF
P 1050 1150
F 0 "#PWR0113" H 1050 900 50  0001 C CNN
F 1 "GND" V 1055 1022 50  0000 R CNN
F 2 "" H 1050 1150 50  0001 C CNN
F 3 "" H 1050 1150 50  0001 C CNN
	1    1050 1150
	0    -1   -1   0   
$EndComp
Text Label 13100 1000 0    50   ~ 0
5V
Text Label 10800 2400 2    50   ~ 0
3.3V
Text Label 13100 1200 0    50   ~ 0
3.3V
$Comp
L power:GND #PWR0118
U 1 1 5F3EF0B8
P 10800 1000
F 0 "#PWR0118" H 10800 750 50  0001 C CNN
F 1 "GND" V 10800 850 50  0000 R CNN
F 2 "" H 10800 1000 50  0001 C CNN
F 3 "" H 10800 1000 50  0001 C CNN
	1    10800 1000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F3DEA30
P 13100 1100
F 0 "#PWR0119" H 13100 850 50  0001 C CNN
F 1 "GND" V 13100 950 50  0000 R CNN
F 2 "" H 13100 1100 50  0001 C CNN
F 3 "" H 13100 1100 50  0001 C CNN
	1    13100 1100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F3F47A9
P 13100 2400
F 0 "#PWR0120" H 13100 2150 50  0001 C CNN
F 1 "GND" V 13100 2250 50  0000 R CNN
F 2 "" H 13100 2400 50  0001 C CNN
F 3 "" H 13100 2400 50  0001 C CNN
	1    13100 2400
	0    -1   -1   0   
$EndComp
$Comp
L Custom_parts:Teensy3.6 U14
U 1 1 5F413A64
P 11950 3150
F 0 "U14" H 11950 5587 60  0000 C CNN
F 1 "Teensy3.6" H 11950 5481 60  0000 C CNN
F 2 "Custom Footprints:Teensy_3_6_with_headers" H 11950 3200 60  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sparkfun%20PDFs/DEV-14058_Web.pdf" H 11950 5481 60  0001 C CNN
F 4 "SparkFun Electronics" H 11950 3150 50  0001 C CNN "Manufacturer"
F 5 "DEV-14058" H 11950 3150 50  0001 C CNN "Part #"
	1    11950 3150
	1    0    0    -1  
$EndComp
NoConn ~ 10800 3400
NoConn ~ 10800 3500
NoConn ~ 10800 3600
NoConn ~ 10800 3700
NoConn ~ 10800 3800
NoConn ~ 10800 3900
NoConn ~ 10800 4000
NoConn ~ 10800 4100
NoConn ~ 10800 4200
NoConn ~ 10800 4350
NoConn ~ 10800 4450
NoConn ~ 10800 4550
NoConn ~ 10800 4650
NoConn ~ 10800 4750
NoConn ~ 10800 4850
NoConn ~ 10800 4950
NoConn ~ 10800 5050
NoConn ~ 10800 5150
NoConn ~ 10800 5250
NoConn ~ 13100 3450
NoConn ~ 13100 3550
NoConn ~ 13100 3650
NoConn ~ 13100 3750
NoConn ~ 13100 3850
NoConn ~ 13100 3950
NoConn ~ 13100 4050
NoConn ~ 13100 4150
NoConn ~ 13100 4250
NoConn ~ 13100 4350
NoConn ~ 13100 4450
NoConn ~ 13100 4550
NoConn ~ 13100 4650
NoConn ~ 13100 4750
NoConn ~ 13100 4850
NoConn ~ 13100 4950
NoConn ~ 13100 5050
NoConn ~ 13100 5150
NoConn ~ 13100 5250
Text Label 2650 1200 2    50   ~ 0
Vin
Text Label 2000 1000 0    50   ~ 0
12V
$Comp
L power:GND #PWR0123
U 1 1 5F56462A
P 2550 1100
F 0 "#PWR0123" H 2550 850 50  0001 C CNN
F 1 "GND" V 2450 1050 50  0000 R CNN
F 2 "" H 2550 1100 50  0001 C CNN
F 3 "" H 2550 1100 50  0001 C CNN
	1    2550 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 6650 5400 6650
Text Notes 2200 7350 0    59   ~ 0
Current sense voltage ouput
Text Notes 4600 6150 0    59   ~ 0
Op-amp input mux
Text Notes 850  8950 1    59   ~ 0
I/O maximum voltage: +30V/-27V (160mW)\nNiDaq PCI-6110 is +/- 10V 5mA\n∴ minimum impedance is 2000 Ohms
Text Notes 3900 10400 0    59   ~ 0
4-channel analog/digital IO with 0-3.3V clamp
$Comp
L power:GND #PWR0124
U 1 1 5F48EF1A
P 6150 11150
F 0 "#PWR0124" H 6150 10900 50  0001 C CNN
F 1 "GND" V 6250 11100 50  0000 R CNN
F 2 "" H 6150 11150 50  0001 C CNN
F 3 "" H 6150 11150 50  0001 C CNN
	1    6150 11150
	0    -1   -1   0   
$EndComp
Text Label 6150 10950 0    50   ~ 0
3.3V
Text Label 5400 10950 2    50   ~ 0
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
L Custom_parts:BAT54SDW D4
U 1 1 5F48EF0C
P 5600 10850
F 0 "D4" H 5775 11197 60  0000 C CNN
F 1 "BAT54SDW" H 5775 11091 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 5800 11050 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 5800 11150 60  0001 L CNN
F 4 "Diodes Incorporated" H 5600 10850 50  0001 C CNN "Manufacturer"
F 5 "BAT54SDW-7-F" H 5600 10850 50  0001 C CNN "Part #"
	1    5600 10850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0126
U 1 1 5F47759A
P 4500 11100
F 0 "#PWR0126" H 4500 10850 50  0001 C CNN
F 1 "GND" V 4600 11050 50  0000 R CNN
F 2 "" H 4500 11100 50  0001 C CNN
F 3 "" H 4500 11100 50  0001 C CNN
	1    4500 11100
	0    -1   -1   0   
$EndComp
Text Label 4500 10900 0    50   ~ 0
3.3V
Text Notes 14200 3100 1    50   ~ 0
--ADC1--
Text Notes 14250 2500 2    50   ~ 0
ADC1
Text Notes 14250 2600 2    50   ~ 0
ADC0
Text Notes 14200 2200 1    50   ~ 0
-------ADC0------
Text Notes 14250 3200 2    50   ~ 0
ADC0
Text Notes 14250 3300 2    50   ~ 0
ADC0
Text Notes 9850 3200 2    50   ~ 0
ADC1
Text Notes 9850 3300 2    50   ~ 0
ADC1
Text Notes 14400 3700 1    50   ~ 0
https://forum.pjrc.com/attachment.php?attachmentid=10666&d=1495536536
$Comp
L Device:CP1_Small C1
U 1 1 5F41CA67
P 1150 3600
F 0 "C1" H 1100 3900 50  0000 L CNN
F 1 "7500uF" H 950 3800 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_18x22" H 1150 3600 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDE0000/ABA0000C1247.pdf" H 1150 3600 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 1150 3600 50  0001 C CNN "Manufacturer"
F 5 "EEE-FK1C752SM" H 1150 3600 50  0001 C CNN "Part #"
	1    1150 3600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0127
U 1 1 5F41E64F
P 1150 3700
F 0 "#PWR0127" H 1150 3450 50  0001 C CNN
F 1 "GND" H 1150 3700 50  0000 R CNN
F 2 "" H 1150 3700 50  0001 C CNN
F 3 "" H 1150 3700 50  0001 C CNN
	1    1150 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0128
U 1 1 5F422559
P 1150 4250
F 0 "#PWR0128" H 1150 4000 50  0001 C CNN
F 1 "GND" H 1150 4250 50  0000 R CNN
F 2 "" H 1150 4250 50  0001 C CNN
F 3 "" H 1150 4250 50  0001 C CNN
	1    1150 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 5F437161
P 1400 3600
F 0 "C5" H 1400 3300 50  0000 C CNN
F 1 "47uF" H 1400 3400 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1400 3600 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1400 3600 50  0001 C CNN
F 4 "Murata Electronics" H 1400 3600 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1400 3600 50  0001 C CNN "Part #"
	1    1400 3600
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0129
U 1 1 5F45FB13
P 1150 4800
F 0 "#PWR0129" H 1150 4550 50  0001 C CNN
F 1 "GND" H 1150 4800 50  0000 R CNN
F 2 "" H 1150 4800 50  0001 C CNN
F 3 "" H 1150 4800 50  0001 C CNN
	1    1150 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0131
U 1 1 5F47CF6E
P 1400 3700
F 0 "#PWR0131" H 1400 3450 50  0001 C CNN
F 1 "GND" H 1400 3700 50  0000 R CNN
F 2 "" H 1400 3700 50  0001 C CNN
F 3 "" H 1400 3700 50  0001 C CNN
	1    1400 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 5F47E382
P 1400 4150
F 0 "C6" H 1400 3850 50  0000 C CNN
F 1 "47uF" H 1400 3950 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1400 4150 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1400 4150 50  0001 C CNN
F 4 "Murata Electronics" H 1400 4150 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1400 4150 50  0001 C CNN "Part #"
	1    1400 4150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0132
U 1 1 5F47E388
P 1400 4250
F 0 "#PWR0132" H 1400 4000 50  0001 C CNN
F 1 "GND" H 1400 4250 50  0000 R CNN
F 2 "" H 1400 4250 50  0001 C CNN
F 3 "" H 1400 4250 50  0001 C CNN
	1    1400 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 5F488538
P 1400 4700
F 0 "C7" H 1400 4400 50  0000 C CNN
F 1 "47uF" H 1400 4500 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1400 4700 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1400 4700 50  0001 C CNN
F 4 "Murata Electronics" H 1400 4700 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1400 4700 50  0001 C CNN "Part #"
	1    1400 4700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0133
U 1 1 5F48853E
P 1400 4800
F 0 "#PWR0133" H 1400 4550 50  0001 C CNN
F 1 "GND" H 1400 4800 50  0000 R CNN
F 2 "" H 1400 4800 50  0001 C CNN
F 3 "" H 1400 4800 50  0001 C CNN
	1    1400 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 5F48D56B
P 1400 5250
F 0 "C8" H 1400 4950 50  0000 C CNN
F 1 "47uF" H 1400 5050 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 1400 5250 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 1400 5250 50  0001 C CNN
F 4 "Murata Electronics" H 1400 5250 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 1400 5250 50  0001 C CNN "Part #"
	1    1400 5250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0134
U 1 1 5F48D571
P 1400 5350
F 0 "#PWR0134" H 1400 5100 50  0001 C CNN
F 1 "GND" H 1400 5350 50  0000 R CNN
F 2 "" H 1400 5350 50  0001 C CNN
F 3 "" H 1400 5350 50  0001 C CNN
	1    1400 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3500 1150 3500
Wire Wire Line
	850  5150 850  4600
Wire Wire Line
	850  3500 1150 3500
Connection ~ 1150 3500
Connection ~ 850  4050
Wire Wire Line
	850  4050 850  3500
Connection ~ 850  4600
Wire Wire Line
	850  4600 850  4050
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5F4EBD0C
P 1850 3500
F 0 "JP1" H 1850 3600 50  0000 C CNN
F 1 "LED wire" H 1850 3700 50  0000 C CNN
F 2 "Custom Footprints:Wire_Pad" H 1850 3500 50  0001 C CNN
F 3 "~" H 1850 3500 50  0001 C CNN
	1    1850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 3500 1400 3500
Connection ~ 1400 3500
Wire Wire Line
	1750 4050 1400 4050
Wire Wire Line
	1750 4600 1400 4600
Wire Wire Line
	1750 5150 1400 5150
Connection ~ 1400 4050
Connection ~ 1400 4600
Connection ~ 1400 5150
Text Label 700  3500 2    50   ~ 0
Vin
Wire Wire Line
	700  3500 850  3500
Connection ~ 850  3500
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
L Custom_parts:ADP7182AUJZ-1.8-R7 U5
U 1 1 5F402E6A
P 6300 1150
F 0 "U5" H 6850 1357 60  0000 C CNN
F 1 "ADP7182AUJZ-1.8-R7" H 6850 1251 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-5" H 7100 1390 60  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADP7182.pdf" H 6850 1251 60  0001 C CNN
F 4 "Analog Devices Inc." H 6300 1150 50  0001 C CNN "Manufacturer"
F 5 "ADP7182AUJZ-1.8-R7" H 6300 1150 50  0001 C CNN "Part #"
	1    6300 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 1300 6150 1300
$Comp
L power:GND #PWR0155
U 1 1 5F40DAE4
P 6300 1200
F 0 "#PWR0155" H 6300 950 50  0001 C CNN
F 1 "GND" V 6200 1200 50  0000 R CNN
F 2 "" H 6300 1200 50  0001 C CNN
F 3 "" H 6300 1200 50  0001 C CNN
	1    6300 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	6300 1400 6300 1300
Connection ~ 6300 1300
$Comp
L Device:C_Small C17
U 1 1 5F414F68
P 6150 1400
F 0 "C17" H 6200 1350 50  0000 L CNN
F 1 "2.2uF" H 6200 1250 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 6150 1400 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 6150 1400 50  0001 C CNN
F 4 "Taiyo Yuden" H 6150 1400 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 6150 1400 50  0001 C CNN "Part #"
	1    6150 1400
	1    0    0    -1  
$EndComp
Connection ~ 6150 1300
Text Label 7400 1200 0    50   ~ 0
-1.8V-analog
$Comp
L Device:R_Small R2
U 1 1 5F417AA2
P 5800 1300
F 0 "R2" V 6000 1300 50  0000 L CNN
F 1 "12" V 5900 1250 50  0000 L CNN
F 2 "Resistor_SMD:R_1210_3225Metric" H 5800 1300 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 5800 1300 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 5800 1300 50  0001 C CNN "Manufacturer"
F 5 "RMCF1210JT12R0" H 5800 1300 50  0001 C CNN "Part #"
	1    5800 1300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0156
U 1 1 5F419542
P 6150 1500
F 0 "#PWR0156" H 6150 1250 50  0001 C CNN
F 1 "GND" H 6250 1350 50  0000 R CNN
F 2 "" H 6150 1500 50  0001 C CNN
F 3 "" H 6150 1500 50  0001 C CNN
	1    6150 1500
	1    0    0    -1  
$EndComp
Connection ~ 4650 6900
Wire Wire Line
	4650 6900 4650 6950
$Comp
L Custom_parts:BDJ0GA5WEFJ-E2 U4
U 1 1 5F46185F
P 6100 2000
F 0 "U4" H 6800 2257 60  0000 C CNN
F 1 "BDJ0GA5WEFJ-E2" H 6800 2151 60  0000 C CNN
F 2 "Custom Footprints:BDJ0GA5WEFJ-E2" H 6850 2240 60  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/ic/power/linear_regulator/bdxxga5wefj-e.pdf" H 6800 2151 60  0001 C CNN
F 4 "Rohm Semiconductor" H 6100 2000 50  0001 C CNN "Manufacturer"
F 5 "BDJ0GA5WEFJ-E2" H 6100 2000 50  0001 C CNN "Part #"
	1    6100 2000
	1    0    0    -1  
$EndComp
Text Label 7550 1800 0    50   ~ 0
12V
Wire Wire Line
	7500 2300 7550 2300
Wire Wire Line
	7550 2300 7550 2000
Wire Wire Line
	7550 2000 7500 2000
Text Label 6050 1800 0    50   ~ 0
10V-analog
Wire Wire Line
	6100 2000 6050 2000
NoConn ~ 6100 2100
Wire Wire Line
	6750 2650 6350 2650
Wire Wire Line
	6050 2650 6050 2200
Wire Wire Line
	6050 2200 6100 2200
$Comp
L power:GND #PWR0159
U 1 1 5F4C5626
P 6350 2650
F 0 "#PWR0159" H 6350 2400 50  0001 C CNN
F 1 "GND" H 6400 2500 50  0000 R CNN
F 2 "" H 6350 2650 50  0001 C CNN
F 3 "" H 6350 2650 50  0001 C CNN
	1    6350 2650
	1    0    0    -1  
$EndComp
Connection ~ 6350 2650
Wire Wire Line
	6350 2650 6050 2650
$Comp
L Device:Q_NMOS_GDS Q2
U 1 1 5F44DFD5
P 11250 7550
F 0 "Q2" H 11454 7596 50  0000 L CNN
F 1 "SUM70060E" H 11454 7505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 11450 7650 50  0001 C CNN
F 3 "https://www.vishay.com/docs/65383/sum70060e.pdf" H 11250 7550 50  0001 C CNN
F 4 "Vishay Siliconix" H 11250 7550 50  0001 C CNN "Manufacturer"
F 5 "SUM70060E-GE3" H 11250 7550 50  0001 C CNN "Part #"
	1    11250 7550
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:LT6200CS8-10 U10
U 1 1 5F4636E7
P 9650 7550
F 0 "U10" H 9994 7596 50  0000 L CNN
F 1 "LT6200CS8-10" H 9850 7450 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9700 7600 50  0001 C CNN
F 3 "http://www.linear.com/docs/3869" H 9700 7700 50  0001 C CNN
F 4 "Analog Devices Inc." H 9650 7550 50  0001 C CNN "Manufacturer"
F 5 "LT6200CS8-10#PBF" H 9650 7550 50  0001 C CNN "Part #"
	1    9650 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	9950 7550 10450 7550
Text Label 9350 7450 2    50   ~ 0
OA_input
$Comp
L Device:C_Small C13
U 1 1 5F47299E
P 4250 1850
F 0 "C13" V 4150 1850 50  0000 C CNN
F 1 "2200pF" V 4050 1850 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4250 1850 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 4250 1850 50  0001 C CNN
F 4 "KEMET" H 4250 1850 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 4250 1850 50  0001 C CNN "Part #"
	1    4250 1850
	0    1    -1   0   
$EndComp
$Comp
L Device:C_Small C23
U 1 1 5F4739EC
P 10450 7750
F 0 "C23" H 10600 7750 50  0000 C CNN
F 1 "2200pF" H 10600 7650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10450 7750 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 10450 7750 50  0001 C CNN
F 4 "KEMET" H 10450 7750 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 10450 7750 50  0001 C CNN "Part #"
	1    10450 7750
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10450 7550 10450 7650
Connection ~ 10450 7550
NoConn ~ 9650 7850
$Comp
L Device:C_Small C20
U 1 1 5F487FD4
P 9650 7950
F 0 "C20" V 9850 7900 50  0000 L CNN
F 1 "2.2uF" V 9750 7850 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 9650 7950 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 9650 7950 50  0001 C CNN
F 4 "Taiyo Yuden" H 9650 7950 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 9650 7950 50  0001 C CNN "Part #"
	1    9650 7950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C19
U 1 1 5F489B13
P 9650 7150
F 0 "C19" V 9850 7100 50  0000 L CNN
F 1 "2.2uF" V 9750 7050 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 9650 7150 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 9650 7150 50  0001 C CNN
F 4 "Taiyo Yuden" H 9650 7150 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 9650 7150 50  0001 C CNN "Part #"
	1    9650 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 7850 9550 7950
Wire Wire Line
	9550 7250 9550 7150
$Comp
L power:GND #PWR0160
U 1 1 5F49D727
P 9750 7150
F 0 "#PWR0160" H 9750 6900 50  0001 C CNN
F 1 "GND" V 9750 7050 50  0000 R CNN
F 2 "" H 9750 7150 50  0001 C CNN
F 3 "" H 9750 7150 50  0001 C CNN
	1    9750 7150
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0161
U 1 1 5F49E51E
P 9750 7950
F 0 "#PWR0161" H 9750 7700 50  0001 C CNN
F 1 "GND" V 9750 7850 50  0000 R CNN
F 2 "" H 9750 7950 50  0001 C CNN
F 3 "" H 9750 7950 50  0001 C CNN
	1    9750 7950
	0    -1   -1   0   
$EndComp
Text Label 9550 7950 2    50   ~ 0
-1.8V-analog
Text Label 9550 7150 2    50   ~ 0
10V-analog
Wire Wire Line
	9350 7650 9000 7650
Wire Wire Line
	9000 7650 9000 8200
Wire Wire Line
	9000 8200 10450 8200
Wire Wire Line
	10450 8200 10450 7850
$Comp
L Device:D_Zener_Small_ALT D11
U 1 1 5F4AC07B
P 12000 7550
F 0 "D11" V 11954 7620 50  0000 L CNN
F 1 "TVS_Diode" V 12045 7620 50  0000 L CNN
F 2 "Custom Footprints:DO-214AA" V 12000 7550 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/824520581.pdf" V 12000 7550 50  0001 C CNN
F 4 "Würth Elektronik" V 12000 7550 50  0001 C CNN "Manufacturer"
F 5 "824520581" V 12000 7550 50  0001 C CNN "Part #"
	1    12000 7550
	0    1    1    0   
$EndComp
Wire Wire Line
	11350 7350 12000 7350
Wire Wire Line
	12000 7350 12000 7450
Wire Wire Line
	12000 7650 12000 7750
Wire Wire Line
	12000 7750 11350 7750
$Comp
L Device:R_POT_TRIM RV1
U 1 1 5F4EFFEC
P 10900 7700
F 0 "RV1" V 10785 7700 50  0000 C CNN
F 1 "R_POT_TRIM" V 10694 7700 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 10900 7700 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 10900 7700 50  0001 C CNN
F 4 "Bourns Inc." V 10900 7700 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 10900 7700 50  0001 C CNN "Part #"
	1    10900 7700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11050 7550 10900 7550
Wire Wire Line
	10750 7700 10750 7550
Wire Wire Line
	10450 7550 10750 7550
Wire Wire Line
	10750 8200 10450 8200
Connection ~ 10450 8200
Wire Wire Line
	10900 8050 11350 8050
Connection ~ 11350 7750
$Comp
L Device:R_POT_TRIM RV2
U 1 1 5F538265
P 10900 8200
F 0 "RV2" V 10785 8200 50  0000 C CNN
F 1 "R_POT_TRIM" V 10694 8200 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 10900 8200 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 10900 8200 50  0001 C CNN
F 4 "Bourns Inc." V 10900 8200 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 10900 8200 50  0001 C CNN "Part #"
	1    10900 8200
	0    -1   -1   0   
$EndComp
NoConn ~ 11050 7700
NoConn ~ 11050 8200
Text Label 11350 7950 0    50   ~ 0
Isense
$Comp
L power:GND #PWR0169
U 1 1 5F599BFF
P 11350 8250
F 0 "#PWR0169" H 11350 8000 50  0001 C CNN
F 1 "GND" H 11400 8100 50  0000 R CNN
F 2 "" H 11350 8250 50  0001 C CNN
F 3 "" H 11350 8250 50  0001 C CNN
	1    11350 8250
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R5
U 1 1 5F599BF8
P 11350 8150
F 0 "R5" H 11400 8200 50  0000 L CNN
F 1 "5" H 11400 8100 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 11350 8150 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 11350 8150 50  0001 C CNN
F 4 "Ohmite" H 11350 8150 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 11350 8150 50  0001 C CNN "Part #"
	1    11350 8150
	-1   0    0    -1  
$EndComp
Text Notes 10950 6800 0    59   ~ 0
4-channel op-amp constant current LED driver
Wire Notes Line
	4500 2800 450  2800
Wire Notes Line
	8000 3550 8000 450 
Text Notes 5550 850  0    59   ~ 0
Op-amp split supply: 12V/-5V to clean 10V/-1.8V
Text Notes 5200 2750 0    50   ~ 0
small negative \nreference voltage \nso that LED turns \noff with op-amp \ninput bias
$Comp
L Custom_parts:BAT54SDW D2
U 1 1 5F46875C
P 3950 10800
F 0 "D2" H 4200 11100 60  0000 C CNN
F 1 "BAT54SDW" H 4200 11000 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 4150 11000 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30152.pdf" H 4150 11100 60  0001 L CNN
F 4 "Diodes Incorporated" H 3950 10800 50  0001 C CNN "Manufacturer"
F 5 "BAT54SDW-7-F" H 3950 10800 50  0001 C CNN "Part #"
	1    3950 10800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0176
U 1 1 5F475E13
P 3750 10700
F 0 "#PWR0176" H 3750 10450 50  0001 C CNN
F 1 "GND" V 3650 10700 50  0000 R CNN
F 2 "" H 3750 10700 50  0001 C CNN
F 3 "" H 3750 10700 50  0001 C CNN
	1    3750 10700
	0    1    1    0   
$EndComp
Text Label 3750 10900 2    50   ~ 0
3.3V
Wire Wire Line
	1100 1650 1350 1650
Connection ~ 1350 1650
$Comp
L power:GND #PWR0178
U 1 1 5F42FF36
P 8600 10600
F 0 "#PWR0178" H 8600 10350 50  0001 C CNN
F 1 "GND" H 8650 10450 50  0000 R CNN
F 2 "" H 8600 10600 50  0001 C CNN
F 3 "" H 8600 10600 50  0001 C CNN
	1    8600 10600
	1    0    0    -1  
$EndComp
Text Label 8600 10100 0    50   ~ 0
12V
Wire Wire Line
	1600 6650 1850 6650
Wire Wire Line
	3900 6450 3900 6900
$Comp
L Device:D_Zener D5
U 1 1 5F67F87E
P 5650 1450
F 0 "D5" V 5600 1500 50  0000 L CNN
F 1 "D_Zener" V 5695 1530 50  0001 L CNN
F 2 "Diode_SMD:D_SOD-323" H 5650 1450 50  0001 C CNN
F 3 "https://www.onsemi.com/pub/Collateral/MM3Z2V4ST1-D.PDF" H 5650 1450 50  0001 C CNN
F 4 "ON Semiconductor" V 5650 1450 50  0001 C CNN "Manufacturer"
F 5 "MM3Z4V7ST1G" V 5650 1450 50  0001 C CNN "Part #"
	1    5650 1450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4950 1300 5650 1300
Connection ~ 5650 1300
Wire Wire Line
	5650 1300 5700 1300
Wire Wire Line
	5450 2000 5450 1900
Wire Wire Line
	5450 1900 5650 1900
Wire Wire Line
	5450 2200 5550 2200
Connection ~ 5550 2200
Wire Wire Line
	5550 2200 5650 2200
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
U 1 1 5F5922AC
P 4550 4300
F 0 "J3" H 4600 4950 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 4900 4850 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 4550 4325 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 4550 4325 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 4550 4300 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 4550 4300 50  0001 C CNN "Part #"
	1    4550 4300
	-1   0    0    -1  
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
Text Label 9150 1150 2    50   ~ 0
Interline_PWM
Text Label 9000 1250 2    50   ~ 0
Analog_select
Text Label 4650 6450 2    50   ~ 0
Interline_PWM
Text Label 5400 6450 0    50   ~ 0
Analog_select
Text Label 13100 1300 0    50   ~ 0
Internal_fan_PWM
Wire Notes Line
	8750 6700 16050 6700
Text Label 8700 1600 0    50   ~ 0
Toggle_red_LED
Text Label 8600 1450 0    50   ~ 0
Toggle_green_LED
Text Label 10800 2600 2    50   ~ 0
Over_temp_alarm1
Text Label 10800 3200 2    50   ~ 0
A-D_input_1
Text Label 10800 3300 2    50   ~ 0
A-D_input_2
Text Label 13100 3300 0    50   ~ 0
A-D_input_3
Text Label 13100 3200 0    50   ~ 0
A-D_input_4
Text Label 2150 7750 0    50   ~ 0
A-D_input_1
Text Label 2150 7950 0    50   ~ 0
A-D_input_2
Text Label 2150 8150 0    50   ~ 0
A-D_input_3
Text Label 2150 8350 0    50   ~ 0
A-D_input_4
Text Label 4500 10700 0    50   ~ 0
A-D_input
Text Label 3750 11100 2    50   ~ 0
A-D_input_2
Text Label 6150 10750 0    50   ~ 0
A-D_input_3
Text Label 5400 11150 2    50   ~ 0
A-D_input_4
Text Label 13100 1900 0    50   ~ 0
LED_pot
Text Label 15050 2750 0    50   ~ 0
MOSFET_temp
Text Label 13100 3000 0    50   ~ 0
Resistor_temp
$Comp
L Device:Thermistor TH1
U 1 1 5F76C793
P 5100 7900
F 0 "TH1" V 5100 7850 50  0000 L CNN
F 1 "Thermistor" H 5205 7855 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5100 7900 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 5100 7900 50  0001 C CNN
F 4 "Murata Electronics" H 5100 7900 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 5100 7900 50  0001 C CNN "Part #"
	1    5100 7900
	0    -1   1    0   
$EndComp
Text Label 4200 8050 0    50   ~ 0
Resistor_temp
$Comp
L Device:Thermistor TH2
U 1 1 5F78EA16
P 5100 8050
F 0 "TH2" V 5100 8000 50  0000 L CNN
F 1 "Thermistor" H 5205 8005 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 5100 8050 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 5100 8050 50  0001 C CNN
F 4 "Murata Electronics" H 5100 8050 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 5100 8050 50  0001 C CNN "Part #"
	1    5100 8050
	0    -1   1    0   
$EndComp
Text Label 3900 8000 2    50   ~ 0
3.3V
$Comp
L power:GND #PWR017
U 1 1 5FAA68F2
P 5300 8050
F 0 "#PWR017" H 5300 7800 50  0001 C CNN
F 1 "GND" H 5350 7900 50  0000 R CNN
F 2 "" H 5300 8050 50  0001 C CNN
F 3 "" H 5300 8050 50  0001 C CNN
	1    5300 8050
	-1   0    0    -1  
$EndComp
Text Label 10800 2900 2    50   ~ 0
Toggle_switch
Text Label 13100 2200 0    50   ~ 0
Internal_Isense
Wire Wire Line
	4650 6900 3900 6900
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
L Device:C_Small C16
U 1 1 5FFBC02D
P 5450 2100
F 0 "C16" H 5500 2200 50  0000 L CNN
F 1 "2.2uF" H 5500 2000 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5450 2100 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5450 2100 50  0001 C CNN
F 4 "Taiyo Yuden" H 5450 2100 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5450 2100 50  0001 C CNN "Part #"
	1    5450 2100
	-1   0    0    -1  
$EndComp
$Comp
L Device:C_Small C34
U 1 1 5FFC2163
P 7550 2400
F 0 "C34" H 7400 2500 50  0000 L CNN
F 1 "2.2uF" H 7300 2300 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 7550 2400 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 7550 2400 50  0001 C CNN
F 4 "Taiyo Yuden" H 7550 2400 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 7550 2400 50  0001 C CNN "Part #"
	1    7550 2400
	-1   0    0    -1  
$EndComp
Connection ~ 7550 2300
$Comp
L power:GND #PWR018
U 1 1 5FFC4572
P 7550 2500
F 0 "#PWR018" H 7550 2250 50  0001 C CNN
F 1 "GND" H 7600 2350 50  0000 R CNN
F 2 "" H 7550 2500 50  0001 C CNN
F 3 "" H 7550 2500 50  0001 C CNN
	1    7550 2500
	1    0    0    -1  
$EndComp
Text Label 10800 2700 2    50   ~ 0
Over_temp_alarm2
Text Label 11300 10150 2    50   ~ 0
Over_temp_alarm1
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
Text Label 11300 10250 2    50   ~ 0
Over_temp_alarm2
Text Notes 1400 7600 0    59   ~ 0
Analog/digital inputs with 0-3.3V clamp
Text Notes 1400 6250 0    59   ~ 0
External analog inputs with 5.6V zener clamp
$Comp
L power:GND #PWR0107
U 1 1 5F4A54DD
P 7450 8000
F 0 "#PWR0107" H 7450 7750 50  0001 C CNN
F 1 "GND" V 7450 7900 50  0000 R CNN
F 2 "" H 7450 8000 50  0001 C CNN
F 3 "" H 7450 8000 50  0001 C CNN
	1    7450 8000
	0    -1   -1   0   
$EndComp
Text Label 7150 8000 2    50   ~ 0
3.3V
Text Label 7300 8200 0    50   ~ 0
LED_pot
Text Notes 3750 7700 0    59   ~ 0
Isense resistor and MOSFET\nthermitor temperature monitoring
Text Notes 10850 10000 0    59   ~ 0
Overheat alarm
Text Notes 6700 8500 0    59   ~ 0
Manual/Auto toggle switch
Wire Notes Line
	6750 11200 6750 9600
Wire Notes Line
	8750 6000 8750 9600
Wire Notes Line
	6750 9600 8750 9600
Wire Wire Line
	13100 3300 13850 3300
Wire Wire Line
	13100 3200 13850 3200
Wire Wire Line
	13100 3100 13850 3100
Wire Wire Line
	13100 3000 13850 3000
Wire Wire Line
	13100 2900 13850 2900
Wire Wire Line
	13100 2800 13850 2800
Wire Wire Line
	13100 2700 13850 2700
Wire Wire Line
	13100 2600 13850 2600
Wire Wire Line
	13100 2500 13850 2500
$Comp
L power:GND #PWR0186
U 1 1 5F8BB481
P 13850 2400
F 0 "#PWR0186" H 13850 2150 50  0001 C CNN
F 1 "GND" V 13850 2250 50  0000 R CNN
F 2 "" H 13850 2400 50  0001 C CNN
F 3 "" H 13850 2400 50  0001 C CNN
	1    13850 2400
	0    1    1    0   
$EndComp
Wire Wire Line
	13100 2300 13850 2300
Wire Wire Line
	13100 2200 13850 2200
Wire Wire Line
	13100 2100 13850 2100
Wire Wire Line
	13100 2000 13850 2000
Wire Wire Line
	13100 1900 13850 1900
Wire Wire Line
	13100 1800 13850 1800
$Comp
L power:GND #PWR0187
U 1 1 5F835110
P 13850 1100
F 0 "#PWR0187" H 13850 850 50  0001 C CNN
F 1 "GND" V 13850 950 50  0000 R CNN
F 2 "" H 13850 1100 50  0001 C CNN
F 3 "" H 13850 1100 50  0001 C CNN
	1    13850 1100
	0    1    1    0   
$EndComp
Wire Wire Line
	13100 1700 13850 1700
Wire Wire Line
	13100 1600 13850 1600
Wire Wire Line
	13100 1500 13850 1500
Wire Wire Line
	13100 1400 13850 1400
Wire Wire Line
	13100 1300 13850 1300
Wire Wire Line
	13100 1200 13850 1200
Wire Wire Line
	13100 1000 13850 1000
$Comp
L Custom_parts:Conn_01x24_Female J7
U 1 1 5F74378D
P 14050 2100
F 0 "J7" H 13900 3250 50  0000 L CNN
F 1 "Conn_01x24_Female" H 13300 850 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 14050 2100 50  0001 C CNN
F 3 "https://www.samtec.com/partnumber/ssm-124-l-sv-lc?vendor=digikey" H 14050 2100 50  0001 C CNN
F 4 "Samtec Inc." H 14050 2100 50  0001 C CNN "Manufacturer"
F 5 "SSM-124-L-SV-LC" H 14050 2100 50  0001 C CNN "Part #"
	1    14050 2100
	1    0    0    -1  
$EndComp
Text Label 13100 2500 0    50   ~ 0
External_thermistor
Wire Wire Line
	10800 3300 10050 3300
Wire Wire Line
	10800 3200 10050 3200
Wire Wire Line
	10800 3100 10050 3100
Wire Wire Line
	10800 3000 10050 3000
Wire Wire Line
	10800 2900 10050 2900
Wire Wire Line
	10800 2800 10050 2800
Wire Wire Line
	10800 2700 10050 2700
Wire Wire Line
	10800 2600 10050 2600
Wire Wire Line
	10800 2500 10050 2500
Wire Wire Line
	10800 2300 10050 2300
Wire Wire Line
	10800 2200 10050 2200
Wire Wire Line
	10800 2100 10050 2100
Wire Wire Line
	10800 2000 10050 2000
Wire Wire Line
	10800 1900 10050 1900
Wire Wire Line
	10800 1800 10050 1800
$Comp
L power:GND #PWR0188
U 1 1 5F9E5C9F
P 10050 1000
F 0 "#PWR0188" H 10050 750 50  0001 C CNN
F 1 "GND" V 10050 850 50  0000 R CNN
F 2 "" H 10050 1000 50  0001 C CNN
F 3 "" H 10050 1000 50  0001 C CNN
	1    10050 1000
	0    -1   1    0   
$EndComp
Wire Wire Line
	10800 1700 10050 1700
Wire Wire Line
	10800 1600 10050 1600
Wire Wire Line
	10800 1500 10050 1500
Wire Wire Line
	10800 1400 10050 1400
Wire Wire Line
	10800 1300 10050 1300
Wire Wire Line
	10800 1200 10050 1200
Wire Wire Line
	10800 1100 10050 1100
Wire Wire Line
	10800 2400 10050 2400
$Comp
L Custom_parts:Conn_01x24_Female J5
U 1 1 5FA9391A
P 9850 2100
F 0 "J5" H 9700 3250 50  0000 L CNN
F 1 "Conn_01x24_Female" H 9100 850 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 9850 2100 50  0001 C CNN
F 3 "https://www.samtec.com/partnumber/ssm-124-l-sv-lc?vendor=digikey" H 9850 2100 50  0001 C CNN
F 4 "Samtec Inc." H 9850 2100 50  0001 C CNN "Manufacturer"
F 5 "SSM-124-L-SV-LC" H 9850 2100 50  0001 C CNN "Part #"
	1    9850 2100
	-1   0    0    -1  
$EndComp
Text Label 4200 7900 0    50   ~ 0
MOSFET_temp
$Comp
L Custom_parts:CPT-2016-75-SMT-TR BZ1
U 1 1 5FE01F50
P 11400 10250
F 0 "BZ1" H 11400 10450 60  0000 L CNN
F 1 "CPT-2016-75-SMT-TR" H 10700 10150 60  0000 L CNN
F 2 "Custom Footprints:SMT-0940-T-3V-R_9x9_alarm" H 11600 10450 60  0001 L CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Projects%20Unlimited%20PDFs/SMT_09_Series_DS.pdf" H 11600 10550 60  0001 L CNN
F 4 "PUI Audio, Inc." H 11400 10250 50  0001 C CNN "Manufacturer"
F 5 "SMT-0940-T-3V-R" H 11400 10250 50  0001 C CNN "Part #"
	1    11400 10250
	1    0    0    -1  
$EndComp
Text Label 13100 1400 0    50   ~ 0
External_5V_PWM3
$Comp
L Mechanical:Heatsink HS2
U 1 1 602A56B6
P 9900 11150
F 0 "HS2" H 9800 11450 50  0000 L CNN
F 1 "HS-PCB" H 9750 11350 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 9912 11150 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 9912 11150 50  0001 C CNN
F 4 "Wakefield-Vette" H 9900 11150 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 9900 11150 50  0001 C CNN "Part #"
	1    9900 11150
	1    0    0    -1  
$EndComp
Text Label 8200 10500 2    50   ~ 0
5V_fan_PWM
Wire Wire Line
	8200 10500 8300 10500
NoConn ~ 8300 10300
$Comp
L Device:R_Pack08_Split RN3
U 1 1 5F607B24
P 2000 7750
F 0 "RN3" V 1900 7750 50  0000 C CNN
F 1 "4.7k" V 2000 7750 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 7750 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 7750 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 7750 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 7750 50  0001 C CNN "Part #"
	1    2000 7750
	0    -1   1    0   
$EndComp
Text Label 13100 2800 0    50   ~ 0
Pushbutton_LED
Connection ~ 11350 8050
Wire Wire Line
	11350 7750 11350 8050
Text Notes 10500 10700 0    59   ~ 0
Heatsinks
$Comp
L Device:R_Small R1
U 1 1 5F57BF27
P 11550 8150
F 0 "R1" H 11600 8200 50  0000 L CNN
F 1 "5" H 11600 8100 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 11550 8150 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 11550 8150 50  0001 C CNN
F 4 "Ohmite" H 11550 8150 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 11550 8150 50  0001 C CNN "Part #"
	1    11550 8150
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5F57C598
P 11750 8150
F 0 "R3" H 11800 8200 50  0000 L CNN
F 1 "5" H 11800 8100 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 11750 8150 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 11750 8150 50  0001 C CNN
F 4 "Ohmite" H 11750 8150 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 11750 8150 50  0001 C CNN "Part #"
	1    11750 8150
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Small R4
U 1 1 5F57CB17
P 11950 8150
F 0 "R4" H 12000 8200 50  0000 L CNN
F 1 "5" H 12000 8100 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 11950 8150 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 11950 8150 50  0001 C CNN
F 4 "Ohmite" H 11950 8150 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 11950 8150 50  0001 C CNN "Part #"
	1    11950 8150
	-1   0    0    -1  
$EndComp
Wire Notes Line
	500  6000 8750 6000
Text Label 13100 2900 0    50   ~ 0
Resistor_temp_2
Text Label 4150 4000 2    50   ~ 0
Vin
$Comp
L power:GND #PWR0101
U 1 1 5F6F3BA1
P 4550 4800
F 0 "#PWR0101" H 4550 4550 50  0001 C CNN
F 1 "GND" H 4800 4750 50  0000 R CNN
F 2 "" H 4550 4800 50  0001 C CNN
F 3 "" H 4550 4800 50  0001 C CNN
	1    4550 4800
	1    0    0    -1  
$EndComp
Text Label 4150 4200 2    50   ~ 0
Vin
Text Label 4150 4400 2    50   ~ 0
Vin
Text Label 4150 4600 2    50   ~ 0
Vin
$Comp
L Mechanical:Heatsink HS1
U 1 1 5F785F9D
P 10200 11150
F 0 "HS1" H 10100 11450 50  0000 L CNN
F 1 "HS-PCB" H 10050 11350 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 10212 11150 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 10212 11150 50  0001 C CNN
F 4 "Wakefield-Vette" H 10200 11150 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 10200 11150 50  0001 C CNN "Part #"
	1    10200 11150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS3
U 1 1 5F7863E9
P 10500 11150
F 0 "HS3" H 10400 11450 50  0000 L CNN
F 1 "HS-PCB" H 10350 11350 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 10512 11150 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 10512 11150 50  0001 C CNN
F 4 "Wakefield-Vette" H 10500 11150 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 10500 11150 50  0001 C CNN "Part #"
	1    10500 11150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink HS4
U 1 1 5F786851
P 10800 11150
F 0 "HS4" H 10700 11450 50  0000 L CNN
F 1 "HS-PCB" H 10650 11350 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 10812 11150 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 10812 11150 50  0001 C CNN
F 4 "Wakefield-Vette" H 10800 11150 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 10800 11150 50  0001 C CNN "Part #"
	1    10800 11150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 7900 5300 8050
Wire Wire Line
	4900 8050 4200 8050
Wire Wire Line
	4200 7900 4900 7900
Connection ~ 5300 8050
Wire Wire Line
	3900 7900 3900 8050
$Comp
L Relay_SolidState:ASSR-1218 U2
U 1 1 5F827B60
P 3300 3950
F 0 "U2" H 3300 4275 50  0000 C CNN
F 1 "ASSR-1218" H 3300 4184 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 3100 3750 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 3300 3950 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 3300 3950 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 3300 3950 50  0001 C CNN "Part #"
	1    3300 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5150 1750 4600
Connection ~ 1750 3500
Connection ~ 1750 4050
Wire Wire Line
	1750 4050 1750 3500
Connection ~ 1750 4600
Wire Wire Line
	1750 4600 1750 4050
Text Label 3600 4050 0    50   ~ 0
LED-
Text Label 3600 4350 0    50   ~ 0
LED-
Text Label 3600 4650 0    50   ~ 0
LED-
Text Label 3600 4950 0    50   ~ 0
LED-
Wire Wire Line
	4150 3900 3600 3900
Wire Wire Line
	3600 3900 3600 3850
Wire Wire Line
	4150 4100 3600 4100
Wire Wire Line
	3600 4100 3600 4150
Wire Wire Line
	4150 4300 3850 4300
Wire Wire Line
	3850 4300 3850 4450
Wire Wire Line
	3850 4450 3600 4450
Wire Wire Line
	3600 4750 3850 4750
Wire Wire Line
	3850 4750 3850 4500
Wire Wire Line
	3850 4500 4150 4500
Text Label 1950 3500 0    50   ~ 0
LED-
Text Label 11350 7350 0    50   ~ 0
LED-
Text Label 5500 6650 0    50   ~ 0
OA_input
$Comp
L Relay_SolidState:ASSR-1218 U7
U 1 1 5F89A743
P 3300 4250
F 0 "U7" H 3300 4575 50  0000 C CNN
F 1 "ASSR-1218" H 3300 4484 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 3100 4050 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 3300 4250 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 3300 4250 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 3300 4250 50  0001 C CNN "Part #"
	1    3300 4250
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:ASSR-1218 U8
U 1 1 5F89BDE1
P 3300 4550
F 0 "U8" H 3300 4875 50  0000 C CNN
F 1 "ASSR-1218" H 3300 4784 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 3100 4350 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 3300 4550 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 3300 4550 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 3300 4550 50  0001 C CNN "Part #"
	1    3300 4550
	1    0    0    -1  
$EndComp
$Comp
L Relay_SolidState:ASSR-1218 U9
U 1 1 5F89CB25
P 3300 4850
F 0 "U9" H 3300 5175 50  0000 C CNN
F 1 "ASSR-1218" H 3300 5084 50  0000 C CNN
F 2 "Custom Footprints:SSR-SO-4_7.6x3.6mm_P2.54mm" H 3100 4650 50  0001 L CIN
F 3 "https://toshiba.semicon-storage.com/info/docget.jsp?did=61844&prodName=TLP3555A" H 3300 4850 50  0001 L CNN
F 4 "Toshiba Semiconductor and Storage" H 3300 4850 50  0001 C CNN "Manufacturer"
F 5 "TLP3555A(TP1,F" H 3300 4850 50  0001 C CNN "Part #"
	1    3300 4850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F8E6B11
P 3000 11050
F 0 "#PWR0102" H 3000 10800 50  0001 C CNN
F 1 "GND" V 3100 11000 50  0000 R CNN
F 2 "" H 3000 11050 50  0001 C CNN
F 3 "" H 3000 11050 50  0001 C CNN
	1    3000 11050
	0    -1   -1   0   
$EndComp
Text Label 3000 10850 0    50   ~ 0
3.3V
$Comp
L Custom_parts:BAT54SDW D7
U 1 1 5F8E6B1A
P 2450 10750
F 0 "D7" H 2700 11050 60  0000 C CNN
F 1 "BAT54SDW" H 2700 10950 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 2650 10950 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30152.pdf" H 2650 11050 60  0001 L CNN
F 4 "Diodes Incorporated" H 2450 10750 50  0001 C CNN "Manufacturer"
F 5 "BAT54SDW-7-F" H 2450 10750 50  0001 C CNN "Part #"
	1    2450 10750
	1    0    0    -1  
$EndComp
Text Label 2250 11050 2    50   ~ 0
external_analog
Text Label 2150 7050 0    50   ~ 0
Isense
Wire Wire Line
	850  4050 1150 4050
Wire Wire Line
	850  4600 1150 4600
$Comp
L Device:CP1_Small C2
U 1 1 5F939007
P 1150 4150
F 0 "C2" H 1100 4450 50  0000 L CNN
F 1 "7500uF" H 950 4350 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_18x22" H 1150 4150 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDE0000/ABA0000C1247.pdf" H 1150 4150 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 1150 4150 50  0001 C CNN "Manufacturer"
F 5 "EEE-FK1C752SM" H 1150 4150 50  0001 C CNN "Part #"
	1    1150 4150
	1    0    0    -1  
$EndComp
Connection ~ 1150 4050
Wire Wire Line
	1150 4050 1400 4050
$Comp
L Device:CP1_Small C3
U 1 1 5F9399C1
P 1150 4700
F 0 "C3" H 1100 5000 50  0000 L CNN
F 1 "7500uF" H 950 4900 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_18x22" H 1150 4700 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/RDE0000/ABA0000C1247.pdf" H 1150 4700 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 1150 4700 50  0001 C CNN "Manufacturer"
F 5 "EEE-FK1C752SM" H 1150 4700 50  0001 C CNN "Part #"
	1    1150 4700
	1    0    0    -1  
$EndComp
Connection ~ 1150 4600
Wire Wire Line
	1150 4600 1400 4600
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW2
U 1 1 5F4E0761
P 7850 4200
F 0 "SW2" H 7850 4685 50  0000 C CNN
F 1 "Pushbutton_with_LED_-_ELUMOATHQ3C12" H 7850 4594 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 7850 4650 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 7850 4400 50  0001 C CNN
F 4 "C&K" H 7850 4200 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 7850 4200 50  0001 C CNN "Part #"
	1    7850 4200
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW3
U 1 1 5F4EC2A1
P 7850 4950
F 0 "SW3" H 7850 5435 50  0000 C CNN
F 1 "Pushbutton_with_LED_-_ELUMOATHQ3C12" H 7850 5344 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 7850 5400 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 7850 5150 50  0001 C CNN
F 4 "C&K" H 7850 4950 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 7850 4950 50  0001 C CNN "Part #"
	1    7850 4950
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW4
U 1 1 5F4ED2BD
P 9450 4200
F 0 "SW4" H 9450 4685 50  0000 C CNN
F 1 "Pushbutton_with_LED_-_ELUMOATHQ3C12" H 9450 4594 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 9450 4650 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 9450 4400 50  0001 C CNN
F 4 "C&K" H 9450 4200 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 9450 4200 50  0001 C CNN "Part #"
	1    9450 4200
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Pushbutton_with_LED_-_ELUMOATHQ3C12 SW5
U 1 1 5F4EEFFE
P 9450 4950
F 0 "SW5" H 9450 5435 50  0000 C CNN
F 1 "Pushbutton_with_LED_-_ELUMOATHQ3C12" H 9450 5344 50  0000 C CNN
F 2 "Custom Footprints:Pushbutton_LED-ELUMOATHQ3C12" H 9450 5400 50  0001 C CNN
F 3 "https://www.ckswitches.com/media/1405/elum.pdf" H 9450 5150 50  0001 C CNN
F 4 "C&K" H 9450 4950 50  0001 C CNN "Manufacturer"
F 5 "ELUMOASAQ5C12" H 9450 4950 50  0001 C CNN "Part #"
	1    9450 4950
	1    0    0    -1  
$EndComp
Text Label 10800 1100 2    50   ~ 0
Relay1
Text Label 10800 1200 2    50   ~ 0
Relay2
Text Label 10800 1300 2    50   ~ 0
Relay3
Text Label 10800 1400 2    50   ~ 0
Relay4
Text Label 2200 4200 2    50   ~ 0
Relay1
Text Label 2200 4300 2    50   ~ 0
Relay2
Text Label 2200 4400 2    50   ~ 0
Relay3
Text Label 2200 4500 2    50   ~ 0
Relay4
$Comp
L power:GND #PWR0105
U 1 1 5F5748CA
P 3000 4950
F 0 "#PWR0105" H 3000 4700 50  0001 C CNN
F 1 "GND" H 3100 4800 50  0000 R CNN
F 2 "" H 3000 4950 50  0001 C CNN
F 3 "" H 3000 4950 50  0001 C CNN
	1    3000 4950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0111
U 1 1 5F57606F
P 3000 4650
F 0 "#PWR0111" H 3000 4400 50  0001 C CNN
F 1 "GND" H 3100 4500 50  0000 R CNN
F 2 "" H 3000 4650 50  0001 C CNN
F 3 "" H 3000 4650 50  0001 C CNN
	1    3000 4650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F5763E2
P 3000 4350
F 0 "#PWR0115" H 3000 4100 50  0001 C CNN
F 1 "GND" H 3100 4200 50  0000 R CNN
F 2 "" H 3000 4350 50  0001 C CNN
F 3 "" H 3000 4350 50  0001 C CNN
	1    3000 4350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5F576860
P 3000 4050
F 0 "#PWR0116" H 3000 3800 50  0001 C CNN
F 1 "GND" H 3100 3900 50  0000 R CNN
F 2 "" H 3000 4050 50  0001 C CNN
F 3 "" H 3000 4050 50  0001 C CNN
	1    3000 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04 RN4
U 1 1 5F577F14
P 2400 4400
F 0 "RN4" V 1983 4400 50  0000 C CNN
F 1 "R_Pack04" V 2074 4400 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2675 4400 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2400 4400 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2400 4400 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 2400 4400 50  0001 C CNN "Part #"
	1    2400 4400
	0    1    1    0   
$EndComp
Wire Wire Line
	2600 4300 2800 4300
Wire Wire Line
	2800 4300 2800 4150
Wire Wire Line
	2800 4150 3000 4150
Wire Wire Line
	2600 4400 2800 4400
Wire Wire Line
	2800 4400 2800 4450
Wire Wire Line
	2800 4450 3000 4450
Wire Wire Line
	2600 4500 2600 4750
Wire Wire Line
	2600 4750 3000 4750
Wire Wire Line
	2600 4200 2600 3850
Wire Wire Line
	2600 3850 3000 3850
$Comp
L Device:R_Pack04_Split RN1
U 3 1 5F5FBFA1
P 2000 6850
F 0 "RN1" V 1900 6850 50  0000 C CNN
F 1 "150" V 2000 6850 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2275 6850 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2000 6850 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2000 6850 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 2000 6850 50  0001 C CNN "Part #"
	3    2000 6850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 2 1 5F6407AE
P 2000 7950
F 0 "RN3" V 1900 7950 50  0000 C CNN
F 1 "4.7k" V 2000 7950 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 7950 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 7950 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 7950 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 7950 50  0001 C CNN "Part #"
	2    2000 7950
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 3 1 5F6410FE
P 2000 8150
F 0 "RN3" V 1900 8150 50  0000 C CNN
F 1 "4.7k" V 2000 8150 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 8150 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 8150 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 8150 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 8150 50  0001 C CNN "Part #"
	3    2000 8150
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 4 1 5F6416DB
P 2000 8350
F 0 "RN3" V 1900 8350 50  0000 C CNN
F 1 "4.7k" V 2000 8350 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 2475 8350 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2000 8350 50  0001 C CNN
F 4 "CTS Resistor Products" V 2000 8350 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2000 8350 50  0001 C CNN "Part #"
	4    2000 8350
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 7 1 5F642C83
P 4050 7900
F 0 "RN3" V 3950 7900 50  0000 C CNN
F 1 "4.7k" V 4050 7900 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 4525 7900 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 4050 7900 50  0001 C CNN
F 4 "CTS Resistor Products" V 4050 7900 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 4050 7900 50  0001 C CNN "Part #"
	7    4050 7900
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 8 1 5F643BA8
P 4050 8050
F 0 "RN3" V 4150 8050 50  0000 C CNN
F 1 "4.7k" V 4050 8050 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 4525 8050 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 4050 8050 50  0001 C CNN
F 4 "CTS Resistor Products" V 4050 8050 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 4050 8050 50  0001 C CNN "Part #"
	8    4050 8050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 5 1 5F648A31
P 3900 6300
F 0 "RN3" V 3800 6300 50  0000 C CNN
F 1 "4.7k" V 3900 6300 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 4375 6300 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 3900 6300 50  0001 C CNN
F 4 "CTS Resistor Products" V 3900 6300 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 3900 6300 50  0001 C CNN "Part #"
	5    3900 6300
	-1   0    0    -1  
$EndComp
$Comp
L Switch:SW_SPDT SW1
U 1 1 5F6733E8
P 7250 8900
F 0 "SW1" H 7250 9185 50  0000 C CNN
F 1 "SW_SPDT" H 7250 9094 50  0000 C CNN
F 2 "Custom Footprints:1x5_header_SSM-105-L-SV-BE-LC" H 7250 8900 50  0001 C CNN
F 3 "https://sten-eswitch-13110800-production.s3.amazonaws.com/system/asset/product_line/data_sheet/131/200.pdf" H 7250 8900 50  0001 C CNN
F 4 "E-Switch" H 7250 8900 50  0001 C CNN "Manufacturer"
F 5 "200MSP1T1B1M7QE" H 7250 8900 50  0001 C CNN "Part #"
	1    7250 8900
	1    0    0    -1  
$EndComp
Text Label 8300 8850 2    50   ~ 0
Toggle_switch
$Comp
L power:GND #PWR0117
U 1 1 5F678CF5
P 7450 8800
F 0 "#PWR0117" H 7450 8550 50  0001 C CNN
F 1 "GND" V 7450 8700 50  0000 R CNN
F 2 "" H 7450 8800 50  0001 C CNN
F 3 "" H 7450 8800 50  0001 C CNN
	1    7450 8800
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0135
U 1 1 5F68BFE7
P 8300 8750
F 0 "#PWR0135" H 8300 8500 50  0001 C CNN
F 1 "GND" V 8300 8650 50  0000 R CNN
F 2 "" H 8300 8750 50  0001 C CNN
F 3 "" H 8300 8750 50  0001 C CNN
	1    8300 8750
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:Conn_01x05_Female J4
U 1 1 5F6C332D
P 8500 8950
F 0 "J4" H 8400 9200 50  0000 L CNN
F 1 "Conn_01x05_Female" H 7950 8650 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 8500 8950 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/prints/ssm-1xx-xxx-xx-xx-xx-x-xx-footprint.pdf" H 8500 8950 50  0001 C CNN
F 4 "Samtec Inc." H 8500 8950 50  0001 C CNN "Manufacturer"
F 5 "SSM-105-L-SV-BE-LC-TR" H 8500 8950 50  0001 C CNN "Part #"
	1    8500 8950
	1    0    0    -1  
$EndComp
Text Label 7050 8900 2    50   ~ 0
Toggle_switch
$Comp
L Device:R_POT RV3
U 1 1 5F6EC7F7
P 7300 8000
F 0 "RV3" V 7093 8000 50  0000 C CNN
F 1 "R_POT" V 7184 8000 50  0000 C CNN
F 2 "Custom Footprints:Pot_with_header" H 7300 8000 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3310.pdf" H 7300 8000 50  0001 C CNN
F 4 "Bourns Inc." V 7300 8000 50  0001 C CNN "Manufacturer"
F 5 "3310C-101-102L" V 7300 8000 50  0001 C CNN "Part #"
	1    7300 8000
	0    -1   1    0   
$EndComp
Wire Wire Line
	7300 8200 7300 8150
Text Notes 6700 7650 0    59   ~ 0
Pot to adjust LED intensity
$Comp
L Custom_parts:Conn_01x03_Female J8
U 1 1 5F7439AD
P 8300 8000
F 0 "J8" H 8200 8150 50  0000 L CNN
F 1 "Conn_01x03_Female" H 7850 7800 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 8300 8000 50  0001 C CNN
F 3 "https://www.samtec.com/products/ssm-103-l-sv-lc" H 8300 8000 50  0001 C CNN
F 4 "Samtec Inc." H 8300 8000 50  0001 C CNN "Manufacturer"
F 5 "SSM-103-L-SV-LC" H 8300 8000 50  0001 C CNN "Part #"
	1    8300 8000
	1    0    0    -1  
$EndComp
Text Label 8100 7900 2    50   ~ 0
3.3V
Text Label 8100 8000 2    50   ~ 0
LED_pot
$Comp
L power:GND #PWR0136
U 1 1 5F746B26
P 8100 8100
F 0 "#PWR0136" H 8100 7850 50  0001 C CNN
F 1 "GND" V 8100 8000 50  0000 R CNN
F 2 "" H 8100 8100 50  0001 C CNN
F 3 "" H 8100 8100 50  0001 C CNN
	1    8100 8100
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 1250 1350 1250
Wire Wire Line
	1350 1250 1350 1650
$Comp
L Regulator_Switching:R-78B1.2-2.0 U1
U 1 1 5F77BF57
P 2300 1650
F 0 "U1" H 2300 1892 50  0000 C CNN
F 1 "12V boost" H 2300 1801 50  0000 C CNN
F 2 "Custom Footprints:12V_DC-DC_with_header_2117" H 2350 1400 50  0001 L CIN
F 3 "https://www.pololu.com/product-info-merged/2117" H 2300 1650 50  0001 C CNN
F 4 "Pololu Corporation" H 2300 1650 50  0001 C CNN "Manufacturer"
F 5 "2117" H 2300 1650 50  0001 C CNN "Part #"
	1    2300 1650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0121
U 1 1 5F7A9456
P 2300 2150
F 0 "#PWR0121" H 2300 1900 50  0001 C CNN
F 1 "GND" H 2500 2050 50  0000 R CNN
F 2 "" H 2300 2150 50  0001 C CNN
F 3 "" H 2300 2150 50  0001 C CNN
	1    2300 2150
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Conn_01x03_Female J9
U 1 1 5F7AA12C
P 2850 1100
F 0 "J9" H 2750 1250 50  0000 L CNN
F 1 "Conn_01x03_Female" H 2400 900 50  0000 L CNN
F 2 "Custom Footprints:Ref_only" H 2850 1100 50  0001 C CNN
F 3 "https://www.samtec.com/products/ssm-103-l-sv-lc" H 2850 1100 50  0001 C CNN
F 4 "Samtec Inc." H 2850 1100 50  0001 C CNN "Manufacturer"
F 5 "SSM-103-L-SV" H 2850 1100 50  0001 C CNN "Part #"
	1    2850 1100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0122
U 1 1 5F7F0B00
P 2100 1100
F 0 "#PWR0122" H 2100 850 50  0001 C CNN
F 1 "GND" V 2200 1050 50  0000 R CNN
F 2 "" H 2100 1100 50  0001 C CNN
F 3 "" H 2100 1100 50  0001 C CNN
	1    2100 1100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2550 1100 2650 1100
$Comp
L Custom_parts:Conn_01x03_Male J6
U 1 1 5F80DD63
P 1800 1100
F 0 "J6" H 1900 1250 50  0000 C CNN
F 1 "Conn_01x03_Male" H 2050 900 50  0000 C CNN
F 2 "Custom Footprints:Ref_only" H 1800 1100 50  0001 C CNN
F 3 "http://www.adam-tech.com/downloader.php?p=PH1RB-XX-UA.pdf" H 1800 1100 50  0001 C CNN
F 4 "Adam Tech" H 1800 1100 50  0001 C CNN "Manufacturer"
F 5 "PH1RB-03-UA" H 1800 1100 50  0001 C CNN "Part #"
	1    1800 1100
	1    0    0    -1  
$EndComp
Text Label 2000 1200 0    50   ~ 0
Vin
Wire Wire Line
	2100 1100 2000 1100
Text Label 2650 1000 2    50   ~ 0
12V
$Comp
L Custom_parts:Conn_01x08_Female J10
U 1 1 5F85E157
P 4300 2450
F 0 "J10" V 4373 2380 50  0000 C CNN
F 1 "Conn_01x08_Female" V 4464 2380 50  0000 C CNN
F 2 "Custom Footprints:Ref_only" H 4300 2450 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sullins%20PDFs/Female_Headers.100_DS.pdf" H 4300 2450 50  0001 C CNN
F 4 "Sullins Connector Solutions" V 4300 2450 50  0001 C CNN "Manufacturer"
F 5 "NPTC081KFXC-RC" V 4300 2450 50  0001 C CNN "Part #"
	1    4300 2450
	0    1    1    0   
$EndComp
Text Label 4000 2250 1    50   ~ 0
12V
NoConn ~ 4100 2250
NoConn ~ 4200 2250
Text Label 4600 2250 1    50   ~ 0
-5V
$Comp
L power:GND #PWR0137
U 1 1 5F860AA1
P 4500 2250
F 0 "#PWR0137" H 4500 2000 50  0001 C CNN
F 1 "GND" V 4505 2122 50  0000 R CNN
F 2 "" H 4500 2250 50  0001 C CNN
F 3 "" H 4500 2250 50  0001 C CNN
	1    4500 2250
	-1   0    0    1   
$EndComp
Text Label 4400 2250 1    50   ~ 0
5V
NoConn ~ 4300 2250
$Comp
L power:GND #PWR0138
U 1 1 5F890634
P 3900 2250
F 0 "#PWR0138" H 3900 2000 50  0001 C CNN
F 1 "GND" V 3905 2122 50  0000 R CNN
F 2 "" H 3900 2250 50  0001 C CNN
F 3 "" H 3900 2250 50  0001 C CNN
	1    3900 2250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0149
U 1 1 5F8E6E1E
P 7650 4300
F 0 "#PWR0149" H 7650 4050 50  0001 C CNN
F 1 "GND" V 7650 4200 50  0000 R CNN
F 2 "" H 7650 4300 50  0001 C CNN
F 3 "" H 7650 4300 50  0001 C CNN
	1    7650 4300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 5F8E7DFD
P 8050 4100
F 0 "#PWR0150" H 8050 3850 50  0001 C CNN
F 1 "GND" V 8050 4000 50  0000 R CNN
F 2 "" H 8050 4100 50  0001 C CNN
F 3 "" H 8050 4100 50  0001 C CNN
	1    8050 4100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0151
U 1 1 5F8E9368
P 9250 4300
F 0 "#PWR0151" H 9250 4050 50  0001 C CNN
F 1 "GND" V 9250 4200 50  0000 R CNN
F 2 "" H 9250 4300 50  0001 C CNN
F 3 "" H 9250 4300 50  0001 C CNN
	1    9250 4300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 5F8EA535
P 9650 4100
F 0 "#PWR0152" H 9650 3850 50  0001 C CNN
F 1 "GND" V 9650 4000 50  0000 R CNN
F 2 "" H 9650 4100 50  0001 C CNN
F 3 "" H 9650 4100 50  0001 C CNN
	1    9650 4100
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 5F8EB0EF
P 7650 5050
F 0 "#PWR0153" H 7650 4800 50  0001 C CNN
F 1 "GND" V 7650 4950 50  0000 R CNN
F 2 "" H 7650 5050 50  0001 C CNN
F 3 "" H 7650 5050 50  0001 C CNN
	1    7650 5050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0162
U 1 1 5F8EBC70
P 8050 4850
F 0 "#PWR0162" H 8050 4600 50  0001 C CNN
F 1 "GND" V 8050 4750 50  0000 R CNN
F 2 "" H 8050 4850 50  0001 C CNN
F 3 "" H 8050 4850 50  0001 C CNN
	1    8050 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0163
U 1 1 5F8EC60A
P 9650 4850
F 0 "#PWR0163" H 9650 4600 50  0001 C CNN
F 1 "GND" V 9650 4750 50  0000 R CNN
F 2 "" H 9650 4850 50  0001 C CNN
F 3 "" H 9650 4850 50  0001 C CNN
	1    9650 4850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 5F8ECFFA
P 9250 5050
F 0 "#PWR0164" H 9250 4800 50  0001 C CNN
F 1 "GND" V 9250 4950 50  0000 R CNN
F 2 "" H 9250 5050 50  0001 C CNN
F 3 "" H 9250 5050 50  0001 C CNN
	1    9250 5050
	0    1    1    0   
$EndComp
Text Label 9100 2200 2    50   ~ 0
Button1
Text Label 9100 2300 2    50   ~ 0
Button2
Text Label 9100 2400 2    50   ~ 0
Button3
Text Label 9100 2500 2    50   ~ 0
Button4
Text Label 7650 4000 2    50   ~ 0
Button1
Text Label 7650 4750 2    50   ~ 0
Button2
Text Label 9250 4000 2    50   ~ 0
Button3
Text Label 9250 4750 2    50   ~ 0
Button4
Text Label 9100 2650 2    50   ~ 0
LED1
Text Label 9100 2750 2    50   ~ 0
LED2
Text Label 9100 2850 2    50   ~ 0
LED3
Text Label 9100 2950 2    50   ~ 0
LED4
Text Label 8350 4300 0    50   ~ 0
LED1
Text Label 8350 5050 0    50   ~ 0
LED2
Text Label 9950 4300 0    50   ~ 0
LED3
Text Label 9950 5050 0    50   ~ 0
LED4
NoConn ~ 8050 3900
NoConn ~ 8050 4650
NoConn ~ 9650 3900
NoConn ~ 9650 4650
NoConn ~ 8300 8950
NoConn ~ 7450 9000
$Comp
L Device:R_Pack04_Split RN1
U 4 1 5F9CC36C
P 2000 7050
F 0 "RN1" V 1900 7050 50  0000 C CNN
F 1 "150" V 2000 7050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 2275 7050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 2000 7050 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 2000 7050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 2000 7050 50  0001 C CNN "Part #"
	4    2000 7050
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 6450 1850 6450
$Comp
L Device:R_Pack04_Split RN1
U 1 1 5F9DAD99
P 5650 1750
F 0 "RN1" H 5500 1750 50  0000 C CNN
F 1 "150" V 5650 1750 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5925 1750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 5650 1750 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 5650 1750 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 5650 1750 50  0001 C CNN "Part #"
	1    5650 1750
	-1   0    0    1   
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 2 1 5F9DEBDC
P 5650 2050
F 0 "RN1" H 5800 2050 50  0000 C CNN
F 1 "150" V 5650 2050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5925 2050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 5650 2050 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 5650 2050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 5650 2050 50  0001 C CNN "Part #"
	2    5650 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04_Split RN2
U 1 1 5F9E09BB
P 9800 5050
F 0 "RN2" V 9900 5050 50  0000 C CNN
F 1 "150" V 9800 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 10075 5050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 9800 5050 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 9800 5050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 9800 5050 50  0001 C CNN "Part #"
	1    9800 5050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack04_Split RN2
U 2 1 5F9E5ED4
P 9800 4300
F 0 "RN2" V 9900 4300 50  0000 C CNN
F 1 "150" V 9800 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 10075 4300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 9800 4300 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 9800 4300 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 9800 4300 50  0001 C CNN "Part #"
	2    9800 4300
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack04_Split RN2
U 3 1 5F9E7B6F
P 8200 5050
F 0 "RN2" V 8300 5050 50  0000 C CNN
F 1 "150" V 8200 5050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 8475 5050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 8200 5050 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 8200 5050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 8200 5050 50  0001 C CNN "Part #"
	3    8200 5050
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack04_Split RN2
U 4 1 5F9E8C0F
P 8200 4300
F 0 "RN2" V 8300 4300 50  0000 C CNN
F 1 "150" V 8200 4300 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 8475 4300 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 8200 4300 50  0001 C CNN
F 4 "Panasonic Electronic Components" V 8200 4300 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" V 8200 4300 50  0001 C CNN "Part #"
	4    8200 4300
	0    -1   -1   0   
$EndComp
Text Label 13100 1700 0    50   ~ 0
SCL0
Text Label 13100 1800 0    50   ~ 0
SDA0
Text Label 1850 6450 0    50   ~ 0
SCL0
Text Label 1850 6650 0    50   ~ 0
SDA0
Wire Wire Line
	1850 6850 1600 6850
Wire Wire Line
	1850 7050 1600 7050
Wire Wire Line
	850  5150 1400 5150
Text Notes 1700 3200 0    59   ~ 0
LED bypass capacitors and connectors\nFor high current supplies use an in-line\ncapacitor with the power supply such as:\nUnited Chemi-Con E32D500HPN104MDA5M
Text Label 4150 3900 2    50   ~ 0
LED4-
Text Label 4150 4500 2    50   ~ 0
LED1-
Text Label 4150 4300 2    50   ~ 0
LED2-
Text Label 4150 4100 2    50   ~ 0
LED3-
Text Label 13100 2600 0    50   ~ 0
internal_analog
$Comp
L Device:C_Small C4
U 1 1 5FB0146B
P 2850 1750
F 0 "C4" H 2850 1450 50  0000 C CNN
F 1 "47uF" H 2850 1550 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2850 1750 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 2850 1750 50  0001 C CNN
F 4 "Murata Electronics" H 2850 1750 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 2850 1750 50  0001 C CNN "Part #"
	1    2850 1750
	-1   0    0    1   
$EndComp
Connection ~ 2850 1650
Wire Wire Line
	2850 1650 3050 1650
$Comp
L power:GND #PWR0130
U 1 1 5FB03225
P 2850 1850
F 0 "#PWR0130" H 2850 1600 50  0001 C CNN
F 1 "GND" H 2950 1700 50  0000 R CNN
F 2 "" H 2850 1850 50  0001 C CNN
F 3 "" H 2850 1850 50  0001 C CNN
	1    2850 1850
	1    0    0    -1  
$EndComp
Text Notes 4550 -50  0    118  ~ 0
See if there is a bigger zener set for D6 or split to 2 parts\n\nGND via - 9410-3ML and TIPS#15X1\n\nAdd shunt from Isense to fan post - https://www.digikey.com/product-detail/en/keystone-electronics/5104/36-5104-ND/4780769
Wire Wire Line
	1350 1650 2000 1650
Wire Wire Line
	2600 1650 2850 1650
Connection ~ 11350 8250
Wire Wire Line
	11350 8050 11550 8050
Wire Wire Line
	11350 8250 11550 8250
Connection ~ 11550 8050
Connection ~ 11550 8250
Wire Wire Line
	11550 8050 11750 8050
Wire Wire Line
	11550 8250 11750 8250
Connection ~ 11750 8050
Wire Wire Line
	11750 8050 11950 8050
Connection ~ 11750 8250
Wire Wire Line
	11750 8250 11950 8250
Connection ~ 5650 1900
Wire Wire Line
	1600 7750 1850 7750
Wire Wire Line
	1600 7950 1850 7950
Wire Wire Line
	1600 8150 1850 8150
Wire Wire Line
	1600 8350 1850 8350
$Comp
L Device:Jumper_NC_Small JP2
U 1 1 5F56E8CF
P 2300 2050
F 0 "JP2" V 2450 2100 50  0000 R CNN
F 1 "Jumper_NC_Small" V 2255 2003 50  0001 R CNN
F 2 "Resistor_SMD:R_1206_3216Metric" H 2300 2050 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p54.pdf" H 2300 2050 50  0001 C CNN
F 4 "Keystone Electronics" V 2300 2050 50  0001 C CNN "Manufacturer"
F 5 "5108" V 2300 2050 50  0001 C CNN "Part #"
	1    2300 2050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0165
U 1 1 5F581B5A
P 600 2600
F 0 "#PWR0165" H 600 2350 50  0001 C CNN
F 1 "GND" H 700 2450 50  0000 R CNN
F 2 "" H 600 2600 50  0001 C CNN
F 3 "" H 600 2600 50  0001 C CNN
	1    600  2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 1300 6150 1300
Wire Wire Line
	6050 1800 6050 2000
NoConn ~ 2250 10850
NoConn ~ 2250 10650
NoConn ~ 3000 10650
$Comp
L Device:R_Small R6
U 1 1 5F6690CD
P 7550 1900
F 0 "R6" V 7750 1900 50  0000 L CNN
F 1 "12" V 7650 1850 50  0000 L CNN
F 2 "Resistor_SMD:R_1210_3225Metric" H 7550 1900 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rmcf_rmcp.pdf" H 7550 1900 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 7550 1900 50  0001 C CNN "Manufacturer"
F 5 "RMCF1210JT12R0" H 7550 1900 50  0001 C CNN "Part #"
	1    7550 1900
	1    0    0    -1  
$EndComp
Connection ~ 7550 2000
$Comp
L Device:C_Small C9
U 1 1 5F730CC6
P 5500 6850
F 0 "C9" V 5550 6900 50  0000 L CNN
F 1 "2.2uF" V 5400 6800 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5500 6850 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5500 6850 50  0001 C CNN
F 4 "Taiyo Yuden" H 5500 6850 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5500 6850 50  0001 C CNN "Part #"
	1    5500 6850
	0    1    -1   0   
$EndComp
Connection ~ 5400 6850
Wire Wire Line
	4650 6550 4350 6550
Wire Wire Line
	4350 6550 4350 6750
Wire Wire Line
	4350 6750 4650 6750
Text Notes 1450 8900 0    59   ~ 0
External thermistor and 3x 5V/16mA digital outputs\nOpen jumper for DAC output instead
Wire Wire Line
	1800 9800 1600 9800
Wire Wire Line
	1800 9900 1800 9800
Wire Wire Line
	2200 9900 1800 9900
Text Label 3050 10100 0    50   ~ 0
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
Text Label 3050 9700 0    50   ~ 0
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
L Device:C_Small C37
U 1 1 5FC38687
P 2100 9400
F 0 "C37" V 2050 9200 50  0000 L CNN
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
$Comp
L Device:R_Pack08_Split RN3
U 6 1 5F641B3C
P 2750 9200
F 0 "RN3" V 2650 9200 50  0000 C CNN
F 1 "4.7k" V 2750 9200 50  0000 C CNN
F 2 "Custom Footprints:2506_8x_R-pack" V 3225 9200 50  0001 C CNN
F 3 "https://www.ctscorp.com/wp-content/uploads/74x.pdf" H 2750 9200 50  0001 C CNN
F 4 "CTS Resistor Products" V 2750 9200 50  0001 C CNN "Manufacturer"
F 5 "742C163472JP" V 2750 9200 50  0001 C CNN "Part #"
	6    2750 9200
	0    -1   1    0   
$EndComp
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
Text Label 13100 1500 0    50   ~ 0
External_5V_PWM2
Text Label 13100 1600 0    50   ~ 0
External_5V_PWM1
$Comp
L Mechanical:MountingHole_Pad H5
U 1 1 5FA26710
P 600 2500
F 0 "H5" H 550 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 700 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 600 2500 50  0001 C CNN
F 3 "~" H 600 2500 50  0001 C CNN
	1    600  2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5FA5209D
P 800 2600
F 0 "#PWR0114" H 800 2350 50  0001 C CNN
F 1 "GND" H 900 2450 50  0000 R CNN
F 2 "" H 800 2600 50  0001 C CNN
F 3 "" H 800 2600 50  0001 C CNN
	1    800  2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H6
U 1 1 5FA520A3
P 800 2500
F 0 "H6" H 750 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 900 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 800 2500 50  0001 C CNN
F 3 "~" H 800 2500 50  0001 C CNN
	1    800  2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0157
U 1 1 5FA5EACA
P 1000 2600
F 0 "#PWR0157" H 1000 2350 50  0001 C CNN
F 1 "GND" H 1100 2450 50  0000 R CNN
F 2 "" H 1000 2600 50  0001 C CNN
F 3 "" H 1000 2600 50  0001 C CNN
	1    1000 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H7
U 1 1 5FA5EAD0
P 1000 2500
F 0 "H7" H 950 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 1100 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 1000 2500 50  0001 C CNN
F 3 "~" H 1000 2500 50  0001 C CNN
	1    1000 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 5FA6B549
P 1200 2600
F 0 "#PWR0158" H 1200 2350 50  0001 C CNN
F 1 "GND" H 1300 2450 50  0000 R CNN
F 2 "" H 1200 2600 50  0001 C CNN
F 3 "" H 1200 2600 50  0001 C CNN
	1    1200 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H8
U 1 1 5FA6B54F
P 1200 2500
F 0 "H8" H 1150 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 1300 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 1200 2500 50  0001 C CNN
F 3 "~" H 1200 2500 50  0001 C CNN
	1    1200 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0166
U 1 1 5FA77F30
P 1400 2600
F 0 "#PWR0166" H 1400 2350 50  0001 C CNN
F 1 "GND" H 1500 2450 50  0000 R CNN
F 2 "" H 1400 2600 50  0001 C CNN
F 3 "" H 1400 2600 50  0001 C CNN
	1    1400 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H9
U 1 1 5FA77F36
P 1400 2500
F 0 "H9" H 1350 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 1500 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 1400 2500 50  0001 C CNN
F 3 "~" H 1400 2500 50  0001 C CNN
	1    1400 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0167
U 1 1 5FA84A05
P 1600 2600
F 0 "#PWR0167" H 1600 2350 50  0001 C CNN
F 1 "GND" H 1700 2450 50  0000 R CNN
F 2 "" H 1600 2600 50  0001 C CNN
F 3 "" H 1600 2600 50  0001 C CNN
	1    1600 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H10
U 1 1 5FA84A0B
P 1600 2500
F 0 "H10" H 1550 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 1700 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 1600 2500 50  0001 C CNN
F 3 "~" H 1600 2500 50  0001 C CNN
	1    1600 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 5FA91550
P 1800 2600
F 0 "#PWR0168" H 1800 2350 50  0001 C CNN
F 1 "GND" H 1900 2450 50  0000 R CNN
F 2 "" H 1800 2600 50  0001 C CNN
F 3 "" H 1800 2600 50  0001 C CNN
	1    1800 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H11
U 1 1 5FA91556
P 1800 2500
F 0 "H11" H 1750 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 1900 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 1800 2500 50  0001 C CNN
F 3 "~" H 1800 2500 50  0001 C CNN
	1    1800 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0170
U 1 1 5FA9DF11
P 2000 2600
F 0 "#PWR0170" H 2000 2350 50  0001 C CNN
F 1 "GND" H 2100 2450 50  0000 R CNN
F 2 "" H 2000 2600 50  0001 C CNN
F 3 "" H 2000 2600 50  0001 C CNN
	1    2000 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H12
U 1 1 5FA9DF17
P 2000 2500
F 0 "H12" H 1950 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 2100 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 2000 2500 50  0001 C CNN
F 3 "~" H 2000 2500 50  0001 C CNN
	1    2000 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0171
U 1 1 5FAAAA28
P 2200 2600
F 0 "#PWR0171" H 2200 2350 50  0001 C CNN
F 1 "GND" H 2300 2450 50  0000 R CNN
F 2 "" H 2200 2600 50  0001 C CNN
F 3 "" H 2200 2600 50  0001 C CNN
	1    2200 2600
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H13
U 1 1 5FAAAA2E
P 2200 2500
F 0 "H13" H 2150 2700 50  0000 L CNN
F 1 "MountingHole_Pad" H 2300 2458 50  0001 L CNN
F 2 "Custom Footprints:Ground_Via" H 2200 2500 50  0001 C CNN
F 3 "~" H 2200 2500 50  0001 C CNN
	1    2200 2500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5FACF30E
P 8300 10050
F 0 "H1" H 8100 10150 50  0000 L CNN
F 1 "MountingHole_Pad" H 8400 10008 50  0001 L CNN
F 2 "Custom Footprints:NF-A9_with_standoffs_and_bolts" H 8300 10050 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8300 10050 50  0001 C CNN
F 4 "Keystone Electronics" H 8300 10050 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8300 10050 50  0001 C CNN "Part #"
	1    8300 10050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0177
U 1 1 5FACF308
P 8300 9950
F 0 "#PWR0177" H 8300 9700 50  0001 C CNN
F 1 "GND" H 8400 9800 50  0000 R CNN
F 2 "" H 8300 9950 50  0001 C CNN
F 3 "" H 8300 9950 50  0001 C CNN
	1    8300 9950
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper_NC_Small JP3
U 1 1 5FC8965B
P 11550 8350
F 0 "JP3" V 11550 8300 50  0000 R CNN
F 1 "Jumper_NC_Small" V 11505 8303 50  0001 R CNN
F 2 "Custom Footprints:20A_shunt_5104" H 11550 8350 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p54.pdf" H 11550 8350 50  0001 C CNN
F 4 "Keystone Electronics" V 11550 8350 50  0001 C CNN "Manufacturer"
F 5 "5104" V 11550 8350 50  0001 C CNN "Part #"
	1    11550 8350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0180
U 1 1 5FC8CF84
P 11550 8450
F 0 "#PWR0180" H 11550 8200 50  0001 C CNN
F 1 "GND" H 11600 8300 50  0000 R CNN
F 2 "" H 11550 8450 50  0001 C CNN
F 3 "" H 11550 8450 50  0001 C CNN
	1    11550 8450
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper_NC_Small JP4
U 1 1 5FC8D4A9
P 11950 8350
F 0 "JP4" V 11950 8300 50  0000 R CNN
F 1 "Jumper_NC_Small" V 11905 8303 50  0001 R CNN
F 2 "Custom Footprints:20A_shunt_5104" H 11950 8350 50  0001 C CNN
F 3 "https://www.keyelco.com/userAssets/file/M65p54.pdf" H 11950 8350 50  0001 C CNN
F 4 "Keystone Electronics" V 11950 8350 50  0001 C CNN "Manufacturer"
F 5 "5104" V 11950 8350 50  0001 C CNN "Part #"
	1    11950 8350
	0    -1   -1   0   
$EndComp
Connection ~ 11950 8250
$Comp
L power:GND #PWR0181
U 1 1 5FC8DFD5
P 11950 8450
F 0 "#PWR0181" H 11950 8200 50  0001 C CNN
F 1 "GND" H 12000 8300 50  0000 R CNN
F 2 "" H 11950 8450 50  0001 C CNN
F 3 "" H 11950 8450 50  0001 C CNN
	1    11950 8450
	1    0    0    -1  
$EndComp
$Comp
L Motor:Fan_4pin M1
U 1 1 603842B5
P 8600 10400
F 0 "M1" H 8758 10496 50  0000 L CNN
F 1 "Fan_4pin" H 8758 10405 50  0000 L CNN
F 2 "Custom Footprints:4-pin_fan_SMD" H 8600 10410 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/tsm.pdf" H 8600 10410 50  0001 C CNN
F 4 "Samtec Inc." H 8600 10400 50  0001 C CNN "Manufacturer"
F 5 "TSM-104-02-L-SV" H 8600 10400 50  0001 C CNN "Part #"
	1    8600 10400
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F5A6FC2
P 8150 10050
F 0 "H2" H 8250 10150 50  0000 L CNN
F 1 "MountingHole_Pad" H 8250 10008 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8150 10050 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8150 10050 50  0001 C CNN
F 4 "Keystone Electronics" H 8150 10050 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8150 10050 50  0001 C CNN "Part #"
	1    8150 10050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0173
U 1 1 5F5A6FC8
P 8150 9950
F 0 "#PWR0173" H 8150 9700 50  0001 C CNN
F 1 "GND" H 8250 9800 50  0000 R CNN
F 2 "" H 8150 9950 50  0001 C CNN
F 3 "" H 8150 9950 50  0001 C CNN
	1    8150 9950
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H16
U 1 1 5F5B6064
P 9050 10050
F 0 "H16" H 8850 10150 50  0000 L CNN
F 1 "MountingHole_Pad" H 9150 10008 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 9050 10050 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 9050 10050 50  0001 C CNN
F 4 "Keystone Electronics" H 9050 10050 50  0001 C CNN "Manufacturer"
F 5 "24354" H 9050 10050 50  0001 C CNN "Part #"
	1    9050 10050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0174
U 1 1 5F5B606A
P 9050 9950
F 0 "#PWR0174" H 9050 9700 50  0001 C CNN
F 1 "GND" H 9150 9800 50  0000 R CNN
F 2 "" H 9050 9950 50  0001 C CNN
F 3 "" H 9050 9950 50  0001 C CNN
	1    9050 9950
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H14
U 1 1 5F5B6072
P 8900 10050
F 0 "H14" H 9000 10150 50  0000 L CNN
F 1 "MountingHole_Pad" H 9000 10008 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8900 10050 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8900 10050 50  0001 C CNN
F 4 "Keystone Electronics" H 8900 10050 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8900 10050 50  0001 C CNN "Part #"
	1    8900 10050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0175
U 1 1 5F5B6078
P 8900 9950
F 0 "#PWR0175" H 8900 9700 50  0001 C CNN
F 1 "GND" H 9000 9800 50  0000 R CNN
F 2 "" H 8900 9950 50  0001 C CNN
F 3 "" H 8900 9950 50  0001 C CNN
	1    8900 9950
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5F5C58B1
P 8300 10850
F 0 "H4" H 8100 10950 50  0000 L CNN
F 1 "MountingHole_Pad" H 8400 10808 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8300 10850 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8300 10850 50  0001 C CNN
F 4 "Keystone Electronics" H 8300 10850 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8300 10850 50  0001 C CNN "Part #"
	1    8300 10850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0182
U 1 1 5F5C58B7
P 8300 10750
F 0 "#PWR0182" H 8300 10500 50  0001 C CNN
F 1 "GND" H 8400 10600 50  0000 R CNN
F 2 "" H 8300 10750 50  0001 C CNN
F 3 "" H 8300 10750 50  0001 C CNN
	1    8300 10750
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5F5C58BF
P 8150 10850
F 0 "H3" H 8250 10950 50  0000 L CNN
F 1 "MountingHole_Pad" H 8250 10808 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8150 10850 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8150 10850 50  0001 C CNN
F 4 "Keystone Electronics" H 8150 10850 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8150 10850 50  0001 C CNN "Part #"
	1    8150 10850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0183
U 1 1 5F5C58C5
P 8150 10750
F 0 "#PWR0183" H 8150 10500 50  0001 C CNN
F 1 "GND" H 8250 10600 50  0000 R CNN
F 2 "" H 8150 10750 50  0001 C CNN
F 3 "" H 8150 10750 50  0001 C CNN
	1    8150 10750
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H17
U 1 1 5F5D3AD4
P 9050 10850
F 0 "H17" H 8850 10950 50  0000 L CNN
F 1 "MountingHole_Pad" H 9150 10808 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 9050 10850 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 9050 10850 50  0001 C CNN
F 4 "Keystone Electronics" H 9050 10850 50  0001 C CNN "Manufacturer"
F 5 "24354" H 9050 10850 50  0001 C CNN "Part #"
	1    9050 10850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0184
U 1 1 5F5D3ADA
P 9050 10750
F 0 "#PWR0184" H 9050 10500 50  0001 C CNN
F 1 "GND" H 9150 10600 50  0000 R CNN
F 2 "" H 9050 10750 50  0001 C CNN
F 3 "" H 9050 10750 50  0001 C CNN
	1    9050 10750
	-1   0    0    1   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H15
U 1 1 5F5D3AE2
P 8900 10850
F 0 "H15" H 9000 10950 50  0000 L CNN
F 1 "MountingHole_Pad" H 9000 10808 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 8900 10850 50  0001 C CNN
F 3 "http://www.keyelco.com/product-pdf.cfm?p=4559" H 8900 10850 50  0001 C CNN
F 4 "Keystone Electronics" H 8900 10850 50  0001 C CNN "Manufacturer"
F 5 "24354" H 8900 10850 50  0001 C CNN "Part #"
	1    8900 10850
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0185
U 1 1 5F5D3AE8
P 8900 10750
F 0 "#PWR0185" H 8900 10500 50  0001 C CNN
F 1 "GND" H 9000 10600 50  0000 R CNN
F 2 "" H 8900 10750 50  0001 C CNN
F 3 "" H 8900 10750 50  0001 C CNN
	1    8900 10750
	-1   0    0    1   
$EndComp
$EndSCHEMATC
