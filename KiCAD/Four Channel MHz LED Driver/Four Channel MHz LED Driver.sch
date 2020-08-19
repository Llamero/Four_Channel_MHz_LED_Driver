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
L Custom_parts:DAC084S085 U?
U 1 1 5F33B1A2
P 2750 6000
F 0 "U?" H 3400 5363 60  0000 C CNN
F 1 "DAC084S085" H 3400 5469 60  0000 C CNN
F 2 "Custom Footprints:DAC084S085CIMM" H 3450 6200 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fdac084s085" H 3400 5469 60  0001 C CNN
F 4 "Texas Instruments" H 2750 6000 50  0001 C CNN "Manufacturer"
F 5 "DAC084S085CIMM/NOPB" H 2750 6000 50  0001 C CNN "Part #"
	1    2750 6000
	-1   0    0    1   
$EndComp
$Comp
L Custom_parts:MCP4351-502E_ST U?
U 1 1 5F3407BD
P 3950 5350
F 0 "U?" H 4550 5607 60  0000 C CNN
F 1 "MCP4211-502E_ST" H 4550 5501 60  0000 C CNN
F 2 "Custom Footprints:MCP4351-502E" H 4600 5600 60  0001 C CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en547555" H 4550 5501 60  0001 C CNN
F 4 "Microchip Technology" H 3950 5350 50  0001 C CNN "Manufacturer"
F 5 "MCP4351-502E/ST" H 3950 5350 50  0001 C CNN "Part #"
	1    3950 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 6250 5150 6350
Wire Wire Line
	5150 5050 5150 5350
Wire Wire Line
	2750 5600 2900 5600
Wire Wire Line
	2950 5700 2750 5700
$Comp
L power:GND #PWR?
U 1 1 5F34784A
P 3950 5550
F 0 "#PWR?" H 3950 5300 50  0001 C CNN
F 1 "GND" V 3955 5422 50  0000 R CNN
F 2 "" H 3950 5550 50  0001 C CNN
F 3 "" H 3950 5550 50  0001 C CNN
	1    3950 5550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F34877E
P 3950 6050
F 0 "#PWR?" H 3950 5800 50  0001 C CNN
F 1 "GND" V 3850 6050 50  0000 R CNN
F 2 "" H 3950 6050 50  0001 C CNN
F 3 "" H 3950 6050 50  0001 C CNN
	1    3950 6050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F348E43
P 5150 6050
F 0 "#PWR?" H 5150 5800 50  0001 C CNN
F 1 "GND" V 5155 5922 50  0000 R CNN
F 2 "" H 5150 6050 50  0001 C CNN
F 3 "" H 5150 6050 50  0001 C CNN
	1    5150 6050
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F349663
P 5150 5550
F 0 "#PWR?" H 5150 5300 50  0001 C CNN
F 1 "GND" V 5155 5422 50  0000 R CNN
F 2 "" H 5150 5550 50  0001 C CNN
F 3 "" H 5150 5550 50  0001 C CNN
	1    5150 5550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 5950 3950 6050
Connection ~ 3950 6050
NoConn ~ 5150 5750
NoConn ~ 5150 5850
Text Label 5150 5650 0    50   ~ 0
5V-analog
$Comp
L power:GND #PWR?
U 1 1 5F34BA64
P 1450 5600
F 0 "#PWR?" H 1450 5350 50  0001 C CNN
F 1 "GND" V 1455 5472 50  0000 R CNN
F 2 "" H 1450 5600 50  0001 C CNN
F 3 "" H 1450 5600 50  0001 C CNN
	1    1450 5600
	0    1    1    0   
$EndComp
Text Label 1450 5700 2    50   ~ 0
5V-analog
$Comp
L power:GND #PWR?
U 1 1 5F3504EC
P 2750 6200
F 0 "#PWR?" H 2750 5950 50  0001 C CNN
F 1 "GND" V 2755 6072 50  0000 R CNN
F 2 "" H 2750 6200 50  0001 C CNN
F 3 "" H 2750 6200 50  0001 C CNN
	1    2750 6200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F352F78
P 5250 5850
F 0 "#PWR?" H 5250 5600 50  0001 C CNN
F 1 "GND" H 5450 5750 50  0000 R CNN
F 2 "" H 5250 5850 50  0001 C CNN
F 3 "" H 5250 5850 50  0001 C CNN
	1    5250 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5650 5150 5650
$Comp
L Custom_parts:S18V20F12_12V_DC U?
U 1 1 5F357FC0
P 2700 1650
F 0 "U?" H 2675 1785 50  0000 C CNN
F 1 "S20V18F12_12V_DC" H 2675 1694 50  0000 C CNN
F 2 "Custom Footprints:S18V20F12_12V_DC" H 2700 1650 50  0001 C CNN
F 3 "https://www.pololu.com/product-info-merged/2577" H 2700 1650 50  0001 C CNN
F 4 "Pololu Corporation" H 2700 1650 50  0001 C CNN "Manufacturer"
F 5 "2577" H 2700 1650 50  0001 C CNN "Part #"
	1    2700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1950 2200 2000
Wire Wire Line
	3150 1950 3150 2000
Text Label 2100 2000 2    50   ~ 0
Vin
Connection ~ 2200 2000
Wire Wire Line
	2200 2000 2200 2050
Wire Wire Line
	3150 2000 3250 2000
Connection ~ 3150 2000
Wire Wire Line
	3150 2000 3150 2050
Text Label 3250 2000 0    50   ~ 0
12V
$Comp
L Custom_parts:DPBW06F-05 U?
U 1 1 5F35D26E
P 4550 1650
F 0 "U?" H 4600 1785 50  0000 C CNN
F 1 "DPBW06F-05" H 4600 1694 50  0000 C CNN
F 2 "Custom Footprints:DPBW06F-05" H 4550 1650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Mean%20Well%20PDF's/SPBW06,DPBW06_Ds.pdf" H 4550 1650 50  0001 C CNN
F 4 "MEAN WELL USA Inc." H 4550 1650 50  0001 C CNN "Manufacturer"
F 5 "DPBW06F-05" H 4550 1650 50  0001 C CNN "Part #"
	1    4550 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F35E7FC
P 3250 1850
F 0 "C?" H 3342 1896 50  0000 L CNN
F 1 "47uF" H 3342 1805 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3250 1850 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 3250 1850 50  0001 C CNN
F 4 "Murata Electronics" H 3250 1850 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 3250 1850 50  0001 C CNN "Part #"
	1    3250 1850
	1    0    0    -1  
$EndComp
NoConn ~ 4100 1950
$Comp
L power:GND #PWR?
U 1 1 5F3602CD
P 4100 1750
F 0 "#PWR?" H 4100 1500 50  0001 C CNN
F 1 "GND" V 4105 1622 50  0000 R CNN
F 2 "" H 4100 1750 50  0001 C CNN
F 3 "" H 4100 1750 50  0001 C CNN
	1    4100 1750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F36457B
P 5550 1850
F 0 "#PWR?" H 5550 1600 50  0001 C CNN
F 1 "GND" V 5555 1722 50  0000 R CNN
F 2 "" H 5550 1850 50  0001 C CNN
F 3 "" H 5550 1850 50  0001 C CNN
	1    5550 1850
	0    -1   -1   0   
$EndComp
$Comp
L pspice:INDUCTOR L?
U 1 1 5F3651AC
P 3650 2000
F 0 "L?" H 3650 2215 50  0000 C CNN
F 1 "10uH" H 3650 2124 50  0000 C CNN
F 2 "Inductor_SMD:L_1210_3225Metric" H 3650 2000 50  0001 C CNN
F 3 "https://product.tdk.com/info/en/catalog/datasheets/inductor_automotive_power_tfm322512alma_en.pdf?ref_disty=digikey" H 3650 2000 50  0001 C CNN
F 4 "TDK Corporation" H 3650 2000 50  0001 C CNN "Manufacturer"
F 5 "TFM322512ALMA100MTAA" H 3650 2000 50  0001 C CNN "Part #"
	1    3650 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2000 3250 2000
Connection ~ 3250 2000
Wire Wire Line
	3900 2000 3900 1850
Wire Wire Line
	3900 1850 4100 1850
$Comp
L Device:C_Small C?
U 1 1 5F36881C
P 4600 2200
F 0 "C?" V 4500 2200 50  0000 C CNN
F 1 "1500pF" V 4400 2200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4600 2200 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885342206004.pdf" H 4600 2200 50  0001 C CNN
F 4 "Würth Elektronik" H 4600 2200 50  0001 C CNN "Manufacturer"
F 5 "885342206004" H 4600 2200 50  0001 C CNN "Part #"
	1    4600 2200
	0    1    -1   0   
$EndComp
Wire Wire Line
	4500 2200 3900 2200
Wire Wire Line
	3900 2200 3900 2000
Connection ~ 3900 2000
Wire Wire Line
	4700 2200 5100 2200
$Comp
L Device:C_Small C?
U 1 1 5F36C3BB
P 4600 1400
F 0 "C?" V 4700 1400 50  0000 C CNN
F 1 "1500pF" V 4650 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 4600 1400 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/885342206004.pdf" H 4600 1400 50  0001 C CNN
F 4 "Würth Elektronik" H 4600 1400 50  0001 C CNN "Manufacturer"
F 5 "885342206004" H 4600 1400 50  0001 C CNN "Part #"
	1    4600 1400
	0    1    -1   0   
$EndComp
Wire Wire Line
	4100 1750 4100 1400
Wire Wire Line
	4100 1400 4500 1400
Connection ~ 4100 1750
Wire Wire Line
	5100 1750 5100 1650
Wire Wire Line
	5100 1400 4700 1400
$Comp
L Device:C_Small C?
U 1 1 5F370F72
P 5300 1750
F 0 "C?" H 5392 1796 50  0000 L CNN
F 1 "47uF" H 5392 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5300 1750 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 5300 1750 50  0001 C CNN
F 4 "Murata Electronics" H 5300 1750 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 5300 1750 50  0001 C CNN "Part #"
	1    5300 1750
	1    0    0    -1  
$EndComp
Connection ~ 5100 1650
Wire Wire Line
	5100 1650 5100 1400
Text Label 5150 2050 0    50   ~ 0
5V
Text Label 5100 1650 0    50   ~ 0
-5V
Connection ~ 5300 1850
Wire Wire Line
	5100 1850 5300 1850
Wire Wire Line
	5100 1650 5300 1650
Wire Wire Line
	3250 1950 3250 2000
Wire Wire Line
	3150 1750 3150 1850
Wire Wire Line
	3150 1750 3250 1750
Connection ~ 3150 1750
$Comp
L Device:R_Small R?
U 1 1 5F379C80
P 3250 2100
F 0 "R?" H 3309 2146 50  0000 L CNN
F 1 "100" H 3309 2055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 3250 2100 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncp.pdf" H 3250 2100 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 3250 2100 50  0001 C CNN "Manufacturer"
F 5 "RNCP0805FTD100R" H 3250 2100 50  0001 C CNN "Part #"
	1    3250 2100
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:ADP7118AUJZ-5.0-R7 U?
U 1 1 5F380EEB
P 3550 2700
F 0 "U?" H 3975 2907 60  0000 C CNN
F 1 "ADP7120AUJZ-5.0-R7" H 3975 2801 60  0000 C CNN
F 2 "Custom Footprints:ADP7118AUJZ-R7" H 4650 2940 60  0001 C CNN
F 3 "https://www.analog.com/media/en/technical-documentation/data-sheets/ADP7118.pdf" H 3975 2801 60  0001 C CNN
F 4 "Analog Devices Inc." H 3550 2700 50  0001 C CNN "Manufacturer"
F 5 "ADP7118AUJZ-5.0-R7" H 3550 2700 50  0001 C CNN "Part #"
	1    3550 2700
	1    0    0    -1  
$EndComp
Connection ~ 3250 2750
Wire Wire Line
	4700 2950 4700 2750
Text Label 4800 2750 0    50   ~ 0
5V-analog
Wire Wire Line
	3250 2200 3250 2350
$Comp
L Device:C_Small C?
U 1 1 5F388B05
P 4900 2850
F 0 "C?" H 4992 2896 50  0000 L CNN
F 1 "2.2uF" H 4992 2805 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 4900 2850 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 4900 2850 50  0001 C CNN
F 4 "Taiyo Yuden" H 4900 2850 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 4900 2850 50  0001 C CNN "Part #"
	1    4900 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F38AF36
P 4900 2950
F 0 "#PWR?" H 4900 2700 50  0001 C CNN
F 1 "GND" H 5100 2900 50  0000 R CNN
F 2 "" H 4900 2950 50  0001 C CNN
F 3 "" H 4900 2950 50  0001 C CNN
	1    4900 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4900 2750 4700 2750
Connection ~ 4700 2750
$Comp
L Device:C_Small C?
U 1 1 5F38C930
P 3150 2750
F 0 "C?" V 3350 2700 50  0000 L CNN
F 1 "2.2uF" V 3250 2650 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 3150 2750 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 3150 2750 50  0001 C CNN
F 4 "Taiyo Yuden" H 3150 2750 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 3150 2750 50  0001 C CNN "Part #"
	1    3150 2750
	0    -1   -1   0   
$EndComp
Connection ~ 3250 2350
$Comp
L power:GND #PWR?
U 1 1 5F39026E
P 3050 2350
F 0 "#PWR?" H 3050 2100 50  0001 C CNN
F 1 "GND" V 3050 2200 50  0000 R CNN
F 2 "" H 3050 2350 50  0001 C CNN
F 3 "" H 3050 2350 50  0001 C CNN
	1    3050 2350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F390986
P 5250 5750
F 0 "C?" H 5342 5796 50  0000 L CNN
F 1 "2.2uF" H 5342 5705 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5250 5750 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5250 5750 50  0001 C CNN
F 4 "Taiyo Yuden" H 5250 5750 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5250 5750 50  0001 C CNN "Part #"
	1    5250 5750
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F3918D7
P 2750 6100
F 0 "C?" H 2550 6100 50  0000 L CNN
F 1 "2.2uF" H 2500 6000 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 2750 6100 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 2750 6100 50  0001 C CNN
F 4 "Taiyo Yuden" H 2750 6100 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 2750 6100 50  0001 C CNN "Part #"
	1    2750 6100
	1    0    0    -1  
$EndComp
Text Label 2750 6000 0    50   ~ 0
5V-analog
Wire Wire Line
	2750 5800 3250 5800
Wire Wire Line
	2750 5900 3200 5900
Text Notes 2800 3100 0    59   ~ 0
LDO - 12V to clean 5V for analog circuits
Text Notes 3800 1250 0    59   ~ 0
ISOLATED - 12V to split +/- 5V
Text Notes 1900 1000 0    59   ~ 0
SEPIC - Vin (3V - 30V) to 12V DC
Wire Wire Line
	3250 2350 3250 2450
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5F3A0F69
P 2200 2350
F 0 "JP?" H 2200 2450 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 2200 2250 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2200 2350 50  0001 C CNN
F 3 "~" H 2200 2350 50  0001 C CNN
	1    2200 2350
	1    0    0    -1  
$EndComp
Text Label 2350 2350 0    50   ~ 0
12V
$Comp
L Device:C_Small C?
U 1 1 5F3A29AA
P 3150 2350
F 0 "C?" V 2921 2350 50  0000 C CNN
F 1 "47uF" V 3012 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3150 2350 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 3150 2350 50  0001 C CNN
F 4 "Murata Electronics" H 3150 2350 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 3150 2350 50  0001 C CNN "Part #"
	1    3150 2350
	0    1    1    0   
$EndComp
Connection ~ 3250 2450
Wire Wire Line
	3250 2450 3250 2750
$Comp
L power:GND #PWR?
U 1 1 5F3A55D8
P 3050 2750
F 0 "#PWR?" H 3050 2500 50  0001 C CNN
F 1 "GND" V 3050 2600 50  0000 R CNN
F 2 "" H 3050 2750 50  0001 C CNN
F 3 "" H 3050 2750 50  0001 C CNN
	1    3050 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	3050 2750 3050 2850
Wire Wire Line
	3050 2850 3250 2850
Connection ~ 3050 2750
Wire Wire Line
	2700 2950 2700 2450
Wire Wire Line
	2700 2950 3250 2950
Wire Wire Line
	2700 2450 3250 2450
Text Notes 1750 2600 0    59   ~ 0
12V Supply Bypass
$Comp
L Custom_parts:TMUX1204DGSR U?
U 1 1 5F3BA201
P 6800 6300
F 0 "U?" H 6975 6465 50  0000 C CNN
F 1 "TMUX1184DGSR" H 6975 6374 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 6800 7300 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 6800 6300 50  0001 C CNN
F 4 "Texas Instruments" H 6800 6300 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 6800 6300 50  0001 C CNN "Part #"
	1    6800 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 6750 6600 6850
Wire Wire Line
	6600 6850 7350 6850
Wire Wire Line
	7350 6850 7350 6750
Wire Wire Line
	7350 6450 7400 6450
Wire Wire Line
	7400 6450 7400 6650
Wire Wire Line
	7400 6650 7350 6650
$Comp
L power:GND #PWR?
U 1 1 5F3BE358
P 6600 6550
F 0 "#PWR?" H 6600 6300 50  0001 C CNN
F 1 "GND" V 6605 6422 50  0000 R CNN
F 2 "" H 6600 6550 50  0001 C CNN
F 3 "" H 6600 6550 50  0001 C CNN
	1    6600 6550
	0    1    1    0   
$EndComp
Text Label 5150 6150 0    50   ~ 0
internal_analog_1
Text Label 5150 5450 0    50   ~ 0
internal_analog_3
Text Label 3950 5450 2    50   ~ 0
internal_analog_4
Text Label 3950 6150 2    50   ~ 0
internal_analog_2
Wire Wire Line
	2900 5350 2900 5600
Wire Wire Line
	2900 5350 3950 5350
Wire Wire Line
	2950 5050 2950 5700
Wire Wire Line
	2950 5050 5150 5050
Wire Wire Line
	3250 6250 3250 5800
Wire Wire Line
	3250 6250 3950 6250
Wire Wire Line
	3200 5900 3200 6350
Wire Wire Line
	3200 6350 5150 6350
Text Label 6600 6450 2    50   ~ 0
internal_analog_1
Text Label 6600 6650 2    50   ~ 0
external_analog_1
$Comp
L Custom_parts:TMUX1204DGSR U?
U 1 1 5F3DA347
P 6800 7150
F 0 "U?" H 6975 7315 50  0000 C CNN
F 1 "TMUX1184DGSR" H 6975 7224 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 6800 8150 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 6800 7150 50  0001 C CNN
F 4 "Texas Instruments" H 6800 7150 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 6800 7150 50  0001 C CNN "Part #"
	1    6800 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 7600 6600 7700
Wire Wire Line
	6600 7700 7350 7700
Wire Wire Line
	7350 7700 7350 7600
Wire Wire Line
	7350 7300 7400 7300
Wire Wire Line
	7400 7300 7400 7500
Wire Wire Line
	7400 7500 7350 7500
$Comp
L power:GND #PWR?
U 1 1 5F3DA355
P 6600 7400
F 0 "#PWR?" H 6600 7150 50  0001 C CNN
F 1 "GND" V 6605 7272 50  0000 R CNN
F 2 "" H 6600 7400 50  0001 C CNN
F 3 "" H 6600 7400 50  0001 C CNN
	1    6600 7400
	0    1    1    0   
$EndComp
Text Label 6600 7300 2    50   ~ 0
internal_analog_2
Text Label 6600 7500 2    50   ~ 0
external_analog_2
$Comp
L Custom_parts:TMUX1204DGSR U?
U 1 1 5F3DC268
P 6850 8000
F 0 "U?" H 7025 8165 50  0000 C CNN
F 1 "TMUX1184DGSR" H 7025 8074 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 6850 9000 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 6850 8000 50  0001 C CNN
F 4 "Texas Instruments" H 6850 8000 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 6850 8000 50  0001 C CNN "Part #"
	1    6850 8000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 8450 6650 8550
Wire Wire Line
	6650 8550 7400 8550
Wire Wire Line
	7400 8550 7400 8450
Wire Wire Line
	7400 8150 7450 8150
Wire Wire Line
	7450 8150 7450 8350
Wire Wire Line
	7450 8350 7400 8350
$Comp
L power:GND #PWR?
U 1 1 5F3DC276
P 6650 8250
F 0 "#PWR?" H 6650 8000 50  0001 C CNN
F 1 "GND" V 6655 8122 50  0000 R CNN
F 2 "" H 6650 8250 50  0001 C CNN
F 3 "" H 6650 8250 50  0001 C CNN
	1    6650 8250
	0    1    1    0   
$EndComp
Text Label 6650 8150 2    50   ~ 0
internal_analog_3
Text Label 6650 8350 2    50   ~ 0
external_analog_3
$Comp
L Custom_parts:TMUX1204DGSR U?
U 1 1 5F3DEF78
P 6850 8800
F 0 "U?" H 7025 8965 50  0000 C CNN
F 1 "TMUX1184DGSR" H 7025 8874 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 6850 9800 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 6850 8800 50  0001 C CNN
F 4 "Texas Instruments" H 6850 8800 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 6850 8800 50  0001 C CNN "Part #"
	1    6850 8800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 9250 6650 9350
Wire Wire Line
	6650 9350 7400 9350
Wire Wire Line
	7400 9350 7400 9250
Wire Wire Line
	7400 8950 7450 8950
Wire Wire Line
	7450 8950 7450 9150
Wire Wire Line
	7450 9150 7400 9150
$Comp
L power:GND #PWR?
U 1 1 5F3DEF86
P 6650 9050
F 0 "#PWR?" H 6650 8800 50  0001 C CNN
F 1 "GND" V 6655 8922 50  0000 R CNN
F 2 "" H 6650 9050 50  0001 C CNN
F 3 "" H 6650 9050 50  0001 C CNN
	1    6650 9050
	0    1    1    0   
$EndComp
Text Label 6650 8950 2    50   ~ 0
internal_analog_4
Text Label 6650 9150 2    50   ~ 0
external_analog_4
Text Notes 2000 4900 0    59   ~ 0
Internal 4-channel ADC AWG with digipot current limit
$Comp
L Connector:Conn_Coaxial_x2 J?
U 1 1 5F3FAF61
P 1350 7650
F 0 "J?" H 1300 8000 50  0000 L CNN
F 1 "Conn_Coaxial_x2" H 1050 7900 50  0000 L CNN
F 2 "Custom Footprints:031-6575_2x_BNC" H 1350 7550 50  0001 C CNN
F 3 "https://www.amphenolrf.com/library/download/link/link_id/436470/parent/031-6575/" H 1350 7550 50  0001 C CNN
F 4 "Amphenol RF" H 1350 7650 50  0001 C CNN "Manufacturer"
F 5 "031-6575" H 1350 7650 50  0001 C CNN "Part #"
	1    1350 7650
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3FBEF1
P 1350 7050
F 0 "#PWR?" H 1350 6800 50  0001 C CNN
F 1 "GND" H 1450 6900 50  0000 R CNN
F 2 "" H 1350 7050 50  0001 C CNN
F 3 "" H 1350 7050 50  0001 C CNN
	1    1350 7050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3FC8FB
P 1350 7950
F 0 "#PWR?" H 1350 7700 50  0001 C CNN
F 1 "GND" H 1450 7800 50  0000 R CNN
F 2 "" H 1350 7950 50  0001 C CNN
F 3 "" H 1350 7950 50  0001 C CNN
	1    1350 7950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial_x2 J?
U 1 1 5F40799C
P 1350 6750
F 0 "J?" H 1300 7100 50  0000 L CNN
F 1 "Conn_Coaxial_x2" H 1050 7000 50  0000 L CNN
F 2 "Custom Footprints:031-6575_2x_BNC" H 1350 6650 50  0001 C CNN
F 3 "https://www.amphenolrf.com/library/download/link/link_id/436470/parent/031-6575/" H 1350 6650 50  0001 C CNN
F 4 "Amphenol RF" H 1350 6750 50  0001 C CNN "Manufacturer"
F 5 "031-6575" H 1350 6750 50  0001 C CNN "Part #"
	1    1350 6750
	-1   0    0    -1  
$EndComp
Text Label 2600 7100 2    50   ~ 0
external_analog_1
Text Label 2400 7850 0    50   ~ 0
external_analog_2
Text Label 2400 7950 0    50   ~ 0
external_analog_3
Text Label 2400 8050 0    50   ~ 0
external_analog_4
$Comp
L Switch:SW_DIP_x03 SW?
U 1 1 5F411870
P 4400 8200
F 0 "SW?" H 4400 8667 50  0000 C CNN
F 1 "SW_DIP_x03" H 4400 8576 50  0000 C CNN
F 2 "Custom Footprints:SW_DS04-254-2-03BK-SMT" H 4400 8200 50  0001 C CNN
F 3 "https://www.cuidevices.com/api/videos/videoplayer/smallplayer/ds04-254-smt.pdf" H 4400 8200 50  0001 C CNN
F 4 "CUI Devices" H 4400 8200 50  0001 C CNN "Manufacturer"
F 5 "DS04-254-2-03BK-SMT" H 4400 8200 50  0001 C CNN "Part #"
	1    4400 8200
	1    0    0    -1  
$EndComp
Connection ~ 5100 2050
Wire Wire Line
	5100 2050 5100 1950
Wire Wire Line
	5100 2200 5100 2050
Wire Wire Line
	5300 1850 5550 1850
Text Label 6000 2150 2    50   ~ 0
-0.25V_analog
$Comp
L power:GND #PWR?
U 1 1 5F3D1FD7
P 6000 2400
F 0 "#PWR?" H 6000 2150 50  0001 C CNN
F 1 "GND" V 6100 2350 50  0000 R CNN
F 2 "" H 6000 2400 50  0001 C CNN
F 3 "" H 6000 2400 50  0001 C CNN
	1    6000 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F3D1763
P 6000 2300
F 0 "R?" H 6059 2346 50  0000 L CNN
F 1 "249" H 6059 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6000 2300 50  0001 C CNN
F 3 "https://www.seielect.com/api/videos/videoplayer/smallplayer/sei-rncp.pdf" H 6000 2300 50  0001 C CNN
F 4 "Stackpole Electronics Inc" H 6000 2300 50  0001 C CNN "Manufacturer"
F 5 "RNCP0603FTD249R" H 6000 2300 50  0001 C CNN "Part #"
	1    6000 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3D013F
P 6200 1950
F 0 "#PWR?" H 6200 1700 50  0001 C CNN
F 1 "GND" V 6300 1900 50  0000 R CNN
F 2 "" H 6200 1950 50  0001 C CNN
F 3 "" H 6200 1950 50  0001 C CNN
	1    6200 1950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 1950 6000 2200
Connection ~ 6000 1950
Wire Wire Line
	6000 1850 6000 1950
$Comp
L Device:C_Small C?
U 1 1 5F3CD242
P 6100 1950
F 0 "C?" V 6200 1900 50  0000 L CNN
F 1 "47uF" V 6300 1900 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 6100 1950 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 6100 1950 50  0001 C CNN
F 4 "Murata Electronics" H 6100 1950 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 6100 1950 50  0001 C CNN "Part #"
	1    6100 1950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F3CC1B4
P 6000 1750
F 0 "R?" H 6059 1796 50  0000 L CNN
F 1 "4.7k" H 6059 1705 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 6000 1750 50  0001 C CNN
F 3 "https://www.seielect.com/catalog/sei-rncp.pdf" H 6000 1750 50  0001 C CNN
F 4 "Yageo" H 6000 1750 50  0001 C CNN "Manufacturer"
F 5 "RT0805FRE074K7L" H 6000 1750 50  0001 C CNN "Part #"
	1    6000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 2050 5300 2050
$Comp
L Device:C_Small C?
U 1 1 5F37216A
P 5300 1950
F 0 "C?" H 5392 1996 50  0000 L CNN
F 1 "47uF" H 5392 1905 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 5300 1950 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 5300 1950 50  0001 C CNN
F 4 "Murata Electronics" H 5300 1950 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 5300 1950 50  0001 C CNN "Part #"
	1    5300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 1650 6000 1650
Connection ~ 5300 1650
Text Label 7400 6450 0    50   ~ 0
-0.25V_analog
Text Label 7400 7300 0    50   ~ 0
-0.25V_analog
Text Label 7450 8150 0    50   ~ 0
-0.25V_analog
Text Label 7450 8950 0    50   ~ 0
-0.25V_analog
Text Label 7350 6850 0    50   ~ 0
5V-analog
Text Label 7350 7700 0    50   ~ 0
5V-analog
Text Label 7400 8550 0    50   ~ 0
5V-analog
Text Label 7400 9350 0    50   ~ 0
5V-analog
$Comp
L Connector:Conn_Coaxial_x2 J?
U 1 1 5F43D90E
P 1350 9550
F 0 "J?" H 1300 9900 50  0000 L CNN
F 1 "Conn_Coaxial_x2" H 1050 9800 50  0000 L CNN
F 2 "Custom Footprints:031-6575_2x_BNC" H 1350 9450 50  0001 C CNN
F 3 "https://www.amphenolrf.com/library/download/link/link_id/436470/parent/031-6575/" H 1350 9450 50  0001 C CNN
F 4 "Amphenol RF" H 1350 9550 50  0001 C CNN "Manufacturer"
F 5 "031-6575" H 1350 9550 50  0001 C CNN "Part #"
	1    1350 9550
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F43D914
P 1350 8950
F 0 "#PWR?" H 1350 8700 50  0001 C CNN
F 1 "GND" H 1450 8800 50  0000 R CNN
F 2 "" H 1350 8950 50  0001 C CNN
F 3 "" H 1350 8950 50  0001 C CNN
	1    1350 8950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F43D91A
P 1350 9850
F 0 "#PWR?" H 1350 9600 50  0001 C CNN
F 1 "GND" H 1450 9700 50  0000 R CNN
F 2 "" H 1350 9850 50  0001 C CNN
F 3 "" H 1350 9850 50  0001 C CNN
	1    1350 9850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial_x2 J?
U 1 1 5F43D922
P 1350 8650
F 0 "J?" H 1300 9000 50  0000 L CNN
F 1 "Conn_Coaxial_x2" H 1050 8900 50  0000 L CNN
F 2 "Custom Footprints:031-6575_2x_BNC" H 1350 8550 50  0001 C CNN
F 3 "https://www.amphenolrf.com/library/download/link/link_id/436470/parent/031-6575/" H 1350 8550 50  0001 C CNN
F 4 "Amphenol RF" H 1350 8650 50  0001 C CNN "Manufacturer"
F 5 "031-6575" H 1350 8650 50  0001 C CNN "Part #"
	1    1350 8650
	-1   0    0    -1  
$EndComp
$Comp
L Device:R_Pack08 RN?
U 1 1 5F4ABE10
P 2200 8150
F 0 "RN?" V 1583 8150 50  0000 C CNN
F 1 "4.7k" V 1674 8150 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2675 8150 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2200 8150 50  0001 C CNN
F 4 "Bourns Inc." V 2200 8150 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2200 8150 50  0001 C CNN "Part #"
	1    2200 8150
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 7750 1550 8050
Wire Wire Line
	1550 8050 2000 8050
Wire Wire Line
	1550 8550 1550 8150
Wire Wire Line
	1550 8150 2000 8150
Wire Wire Line
	1550 8750 1600 8750
Wire Wire Line
	1600 8750 1600 8250
Wire Wire Line
	1600 8250 2000 8250
Wire Wire Line
	1550 9450 1650 9450
Wire Wire Line
	1650 9450 1650 8350
Wire Wire Line
	1650 8350 2000 8350
Wire Wire Line
	1550 9650 1700 9650
Wire Wire Line
	1700 9650 1700 8450
Wire Wire Line
	1700 8450 2000 8450
Wire Wire Line
	1550 7550 1600 7550
Wire Wire Line
	1600 7550 1600 7950
Wire Wire Line
	1600 7950 2000 7950
Wire Wire Line
	1550 6850 1650 6850
Wire Wire Line
	1650 6850 1650 7850
Wire Wire Line
	1650 7850 2000 7850
Wire Wire Line
	1550 6650 1700 6650
Wire Wire Line
	1700 6650 1700 7750
Wire Wire Line
	1700 7750 2000 7750
Text Label 2400 7750 0    50   ~ 0
external_analog_1
Text Label 2600 7300 2    50   ~ 0
external_analog_2
Text Label 3200 7300 0    50   ~ 0
external_analog_3
Text Label 3200 7100 0    50   ~ 0
external_analog_4
$Comp
L power:GND #PWR?
U 1 1 5F4EB97D
P 2600 7200
F 0 "#PWR?" H 2600 6950 50  0001 C CNN
F 1 "GND" V 2605 7072 50  0000 R CNN
F 2 "" H 2600 7200 50  0001 C CNN
F 3 "" H 2600 7200 50  0001 C CNN
	1    2600 7200
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:D_Zener_x4_ACom_AKKKK D?
U 1 1 5F4F11C3
P 2900 7350
F 0 "D?" H 2900 6875 50  0000 C CNN
F 1 "D_Zener_x4_ACom_AKKKK" H 2900 6966 50  0000 C CNN
F 2 "Custom Footprints:SOT-753" H 2900 7100 50  0001 C CNN
F 3 "https://rohmfs.rohm.com/api/videos/videoplayer/smallplayer/ftz5.6e.pdf" H 2900 7100 50  0001 C CNN
F 4 "Rohm Semiconductor" H 2900 7350 50  0001 C CNN "Manufacturer"
F 5 "FTZ5.6ET148" H 2900 7350 50  0001 C CNN "Part #"
	1    2900 7350
	-1   0    0    1   
$EndComp
Text Notes 1800 6750 0    59   ~ 0
4-channel external analog input with 5.6V zener
Text Label 4100 8000 2    50   ~ 0
external_analog_1
Text Label 4700 8000 0    50   ~ 0
external_analog_2
Text Label 4100 8100 2    50   ~ 0
external_analog_2
Text Label 4700 8100 0    50   ~ 0
external_analog_3
Text Label 4100 8200 2    50   ~ 0
external_analog_3
Text Label 4700 8200 0    50   ~ 0
external_analog_4
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 5F4FA1F9
P 1250 2100
F 0 "J?" H 1307 2417 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 1307 2326 50  0000 C CNN
F 2 "Custom Footprints:54-00165-DC_Jack" H 1300 2060 50  0001 C CNN
F 3 "https://www.tensility.com/api/videos/videoplayer/smallplayer/54-00165.pdf" H 1300 2060 50  0001 C CNN
F 4 "Tensility International Corp" H 1250 2100 50  0001 C CNN "Manufacturer"
F 5 "54-00165" H 1250 2100 50  0001 C CNN "Part #"
	1    1250 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5035F8
P 1550 2200
F 0 "#PWR?" H 1550 1950 50  0001 C CNN
F 1 "GND" H 1750 2100 50  0000 R CNN
F 2 "" H 1550 2200 50  0001 C CNN
F 3 "" H 1550 2200 50  0001 C CNN
	1    1550 2200
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J?
U 1 1 5F50593C
P 1200 1500
F 0 "J?" H 1050 1600 50  0000 L CNN
F 1 "Conn_01x02_Female" H 800 1350 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P7.2mm_D2.4mm_OD3.6mm" H 1200 1500 50  0001 C CNN
F 3 "~" H 1200 1500 50  0001 C CNN
	1    1200 1500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 2000 1800 2000
Wire Wire Line
	1550 2100 1550 2200
Connection ~ 1550 2200
Wire Wire Line
	1800 2000 1800 1500
Wire Wire Line
	1800 1500 1400 1500
Connection ~ 1800 2000
Wire Wire Line
	1800 2000 2200 2000
$Comp
L power:GND #PWR?
U 1 1 5F518EFF
P 1400 1600
F 0 "#PWR?" H 1400 1350 50  0001 C CNN
F 1 "GND" V 1405 1472 50  0000 R CNN
F 2 "" H 1400 1600 50  0001 C CNN
F 3 "" H 1400 1600 50  0001 C CNN
	1    1400 1600
	0    -1   -1   0   
$EndComp
Text Label 5150 9000 2    50   ~ 0
Isense_1
Text Label 5150 9200 2    50   ~ 0
Isense_2
Text Label 5150 9400 2    50   ~ 0
Isense_3
Text Label 5150 9600 2    50   ~ 0
Isense_4
$Comp
L power:GND #PWR?
U 1 1 5F5306B0
P 5150 9700
F 0 "#PWR?" H 5150 9450 50  0001 C CNN
F 1 "GND" V 5150 9550 50  0000 R CNN
F 2 "" H 5150 9700 50  0001 C CNN
F 3 "" H 5150 9700 50  0001 C CNN
	1    5150 9700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F531E2E
P 5150 9500
F 0 "#PWR?" H 5150 9250 50  0001 C CNN
F 1 "GND" V 5150 9350 50  0000 R CNN
F 2 "" H 5150 9500 50  0001 C CNN
F 3 "" H 5150 9500 50  0001 C CNN
	1    5150 9500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F53235A
P 5150 9300
F 0 "#PWR?" H 5150 9050 50  0001 C CNN
F 1 "GND" V 5150 9150 50  0000 R CNN
F 2 "" H 5150 9300 50  0001 C CNN
F 3 "" H 5150 9300 50  0001 C CNN
	1    5150 9300
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F5328BE
P 5150 9100
F 0 "#PWR?" H 5150 8850 50  0001 C CNN
F 1 "GND" V 5150 8950 50  0000 R CNN
F 2 "" H 5150 9100 50  0001 C CNN
F 3 "" H 5150 9100 50  0001 C CNN
	1    5150 9100
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_Coaxial_x2 J?
U 1 1 5F532BE3
P 4500 9100
F 0 "J?" H 4450 9450 50  0000 L CNN
F 1 "Conn_Coaxial_x2" H 4200 9350 50  0000 L CNN
F 2 "Custom Footprints:031-6575_2x_BNC" H 4500 9000 50  0001 C CNN
F 3 "https://www.amphenolrf.com/library/download/link/link_id/436470/parent/031-6575/" H 4500 9000 50  0001 C CNN
F 4 "Amphenol RF" H 4500 9100 50  0001 C CNN "Manufacturer"
F 5 "031-6575" H 4500 9100 50  0001 C CNN "Part #"
	1    4500 9100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_Coaxial_x2 J?
U 1 1 5F535BEA
P 4650 9500
F 0 "J?" H 4600 9750 50  0000 L CNN
F 1 "Conn_Coaxial_x2" H 4000 9200 50  0000 L CNN
F 2 "Custom Footprints:031-6575_2x_BNC" H 4650 9400 50  0001 C CNN
F 3 "https://www.amphenolrf.com/library/download/link/link_id/436470/parent/031-6575/" H 4650 9400 50  0001 C CNN
F 4 "Amphenol RF" H 4650 9500 50  0001 C CNN "Manufacturer"
F 5 "031-6575" H 4650 9500 50  0001 C CNN "Part #"
	1    4650 9500
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F54BD71
P 4500 9400
F 0 "#PWR?" H 4500 9150 50  0001 C CNN
F 1 "GND" H 4600 9250 50  0000 R CNN
F 2 "" H 4500 9400 50  0001 C CNN
F 3 "" H 4500 9400 50  0001 C CNN
	1    4500 9400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F54C869
P 4650 9800
F 0 "#PWR?" H 4650 9550 50  0001 C CNN
F 1 "GND" H 4750 9650 50  0000 R CNN
F 2 "" H 4650 9800 50  0001 C CNN
F 3 "" H 4650 9800 50  0001 C CNN
	1    4650 9800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 2000 1800 2350
Wire Wire Line
	1800 2350 2050 2350
Text Label 14700 900  0    50   ~ 0
5V
Text Label 12400 2300 2    50   ~ 0
3.3V
Text Label 14700 1100 0    50   ~ 0
3.3V
$Comp
L power:GND #PWR?
U 1 1 5F3EF0B8
P 12400 900
F 0 "#PWR?" H 12400 650 50  0001 C CNN
F 1 "GND" V 12400 750 50  0000 R CNN
F 2 "" H 12400 900 50  0001 C CNN
F 3 "" H 12400 900 50  0001 C CNN
	1    12400 900 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3DEA30
P 14700 1000
F 0 "#PWR?" H 14700 750 50  0001 C CNN
F 1 "GND" V 14700 850 50  0000 R CNN
F 2 "" H 14700 1000 50  0001 C CNN
F 3 "" H 14700 1000 50  0001 C CNN
	1    14700 1000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3F47A9
P 14700 2300
F 0 "#PWR?" H 14700 2050 50  0001 C CNN
F 1 "GND" V 14700 2150 50  0000 R CNN
F 2 "" H 14700 2300 50  0001 C CNN
F 3 "" H 14700 2300 50  0001 C CNN
	1    14700 2300
	0    -1   -1   0   
$EndComp
$Comp
L Custom_parts:Teensy3.6 U?
U 1 1 5F413A64
P 13550 3050
F 0 "U?" H 13550 5487 60  0000 C CNN
F 1 "Teensy3.6" H 13550 5381 60  0000 C CNN
F 2 "" H 13550 3100 60  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sparkfun%20PDFs/DEV-14058_Web.pdf" H 13550 5381 60  0001 C CNN
F 4 "SparkFun Electronics" H 13550 3050 50  0001 C CNN "Manufacturer"
F 5 "DEV-14058" H 13550 3050 50  0001 C CNN "Part #"
	1    13550 3050
	1    0    0    -1  
$EndComp
NoConn ~ 12400 3300
NoConn ~ 12400 3400
NoConn ~ 12400 3500
NoConn ~ 12400 3600
NoConn ~ 12400 3700
NoConn ~ 12400 3800
NoConn ~ 12400 3900
NoConn ~ 12400 4000
NoConn ~ 12400 4100
NoConn ~ 12400 4250
NoConn ~ 12400 4350
NoConn ~ 12400 4450
NoConn ~ 12400 4550
NoConn ~ 12400 4650
NoConn ~ 12400 4750
NoConn ~ 12400 4850
NoConn ~ 12400 4950
NoConn ~ 12400 5050
NoConn ~ 12400 5150
NoConn ~ 14700 3350
NoConn ~ 14700 3450
NoConn ~ 14700 3550
NoConn ~ 14700 3650
NoConn ~ 14700 3750
NoConn ~ 14700 3850
NoConn ~ 14700 3950
NoConn ~ 14700 4050
NoConn ~ 14700 4150
NoConn ~ 14700 4250
NoConn ~ 14700 4350
NoConn ~ 14700 4450
NoConn ~ 14700 4550
NoConn ~ 14700 4650
NoConn ~ 14700 4750
NoConn ~ 14700 4850
NoConn ~ 14700 4950
NoConn ~ 14700 5050
NoConn ~ 14700 5150
Wire Wire Line
	2200 1800 2200 1850
Wire Wire Line
	2200 1750 2200 1800
Connection ~ 2200 1800
$Comp
L power:GND #PWR?
U 1 1 5F35A16A
P 2200 1800
F 0 "#PWR?" H 2200 1550 50  0001 C CNN
F 1 "GND" V 2205 1672 50  0000 R CNN
F 2 "" H 2200 1800 50  0001 C CNN
F 3 "" H 2200 1800 50  0001 C CNN
	1    2200 1800
	0    1    1    0   
$EndComp
NoConn ~ 2200 1600
Wire Wire Line
	2200 1500 2200 1400
Wire Wire Line
	2200 1300 2200 1250
Text Label 2200 1500 0    50   ~ 0
Vin
$Comp
L power:GND #PWR?
U 1 1 5F4F5E01
P 3150 1250
F 0 "#PWR?" H 3150 1000 50  0001 C CNN
F 1 "GND" V 3250 1200 50  0000 R CNN
F 2 "" H 3150 1250 50  0001 C CNN
F 3 "" H 3150 1250 50  0001 C CNN
	1    3150 1250
	0    1    1    0   
$EndComp
Connection ~ 2200 1250
Wire Wire Line
	2200 1250 2200 1200
$Comp
L Custom_parts:Conn_01x05_Male J?
U 1 1 5F515681
P 2000 1400
F 0 "J?" H 2100 1750 50  0000 C CNN
F 1 "Conn_01x05_Male" H 2100 1650 50  0000 C CNN
F 2 "Custom Footprints:Ref_only" H 2000 1400 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/tsm.pdf" H 2000 1400 50  0001 C CNN
F 4 "Samtec Inc." H 2000 1400 50  0001 C CNN "Manufacturer"
F 5 "TSM-105-01-T-SV" H 2000 1400 50  0001 C CNN "Part #"
	1    2000 1400
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Conn_01x04_Male J?
U 1 1 5F551B78
P 3350 1400
F 0 "J?" H 3450 1050 50  0000 R CNN
F 1 "Conn_01x04_Male" H 3750 1150 50  0000 R CNN
F 2 "Custom Footprints:Ref_only" H 3350 1400 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/tsm.pdf" H 3350 1400 50  0001 C CNN
F 4 "Samtec Inc." H 3350 1400 50  0001 C CNN "Manufacturer"
F 5 "TSM-104-01-T-SV" H 3350 1400 50  0001 C CNN "Part #"
	1    3350 1400
	-1   0    0    1   
$EndComp
Wire Wire Line
	3150 1300 3150 1250
Wire Wire Line
	3150 1400 3150 1500
Text Label 3150 1500 2    50   ~ 0
12V
Connection ~ 3150 1250
Wire Wire Line
	3150 1250 3150 1200
$Comp
L power:GND #PWR?
U 1 1 5F56462A
P 2200 1250
F 0 "#PWR?" H 2200 1000 50  0001 C CNN
F 1 "GND" V 2100 1200 50  0000 R CNN
F 2 "" H 2200 1250 50  0001 C CNN
F 3 "" H 2200 1250 50  0001 C CNN
	1    2200 1250
	0    -1   -1   0   
$EndComp
Text Notes 2450 1450 0    50   ~ 0
Header pins\nto connect\n12V SEPIC \nDC-DC \nconverter
NoConn ~ 2200 2150
Text Label 7450 6550 0    50   ~ 0
OA1_input
Text Label 7450 7400 0    50   ~ 0
OA2_input
Text Label 7500 8250 0    50   ~ 0
OA3_input
Text Label 7500 9050 0    50   ~ 0
OA4_input
Wire Wire Line
	7450 6550 7350 6550
Wire Wire Line
	7450 7400 7350 7400
Wire Wire Line
	7500 8250 7400 8250
Wire Wire Line
	7500 9050 7400 9050
Text Notes 4550 8700 0    59   ~ 0
Current sense voltage ouput
Text Notes 6550 6050 0    59   ~ 0
Op-amp input mux
Text Label 12400 2700 2    50   ~ 0
SCK0
Text Label 12400 2800 2    50   ~ 0
MOSI0
Text Label 3950 5750 2    50   ~ 0
SCK0
Text Label 3950 5850 2    50   ~ 0
MOSI0
Text Label 1450 6000 2    50   ~ 0
SCK0
Text Label 1450 5800 2    50   ~ 0
MOSI0
Text Label 12400 2400 2    50   ~ 0
24
Text Label 12400 2500 2    50   ~ 0
25
Text Label 1450 5900 2    50   ~ 0
25
Text Label 3950 5650 2    50   ~ 0
24
Text Notes 11850 2400 0    50   ~ 0
Digipot CS
Text Notes 12000 2500 0    50   ~ 0
DAC CS
Text Notes 11800 3100 0    50   ~ 0
Isense_1
Text Notes 11800 3200 0    50   ~ 0
Isense_2
Text Notes 15000 3200 0    50   ~ 0
Isense_3
Text Notes 15000 3100 0    50   ~ 0
Isense_4
Text Label 12400 1200 2    50   ~ 0
2
Text Label 12400 1300 2    50   ~ 0
3
Text Label 12400 1400 2    50   ~ 0
4
Text Label 12400 1500 2    50   ~ 0
5
Text Notes 12300 1200 2    50   ~ 0
Interline PWM 1
Text Label 6600 6350 2    50   ~ 0
2
Text Label 6600 7200 2    50   ~ 0
4
Text Label 6650 8050 2    50   ~ 0
6
Text Label 6650 8850 2    50   ~ 0
8
Text Label 7350 6350 0    50   ~ 0
3
Text Label 7350 7200 0    50   ~ 0
5
Text Label 7400 8050 0    50   ~ 0
7
Text Label 7400 8850 0    50   ~ 0
9
Text Notes 6500 6350 2    50   ~ 0
Interline PWM 1
Text Notes 6500 7200 2    50   ~ 0
Interline PWM 2
Text Notes 6550 8050 2    50   ~ 0
Interline PWM 3
Text Notes 6550 8850 2    50   ~ 0
Interline PWM 4
Text Notes 7450 6350 0    50   ~ 0
Analog select 1\n
Text Notes 7450 7200 0    50   ~ 0
Analog select 2\n
Text Notes 7500 8050 0    50   ~ 0
Analog select 3\n
Text Notes 7500 8850 0    50   ~ 0
Analog select 4\n
Wire Wire Line
	5550 9000 5550 9100
Wire Wire Line
	5550 9200 5550 9300
Wire Wire Line
	5550 9400 5550 9500
Wire Wire Line
	5550 9600 5550 9700
Wire Wire Line
	5150 9000 4700 9000
Wire Wire Line
	4700 9200 5150 9200
Wire Wire Line
	5150 9400 4850 9400
Wire Wire Line
	4850 9600 5150 9600
Text Notes 15000 1700 0    50   ~ 0
A/D IO 2
Text Notes 15000 2400 0    50   ~ 0
A/D IO 3
Text Notes 15350 3000 2    50   ~ 0
A/D IO 4
Text Notes 2050 9400 0    50   ~ 0
A/D IO 2
Text Notes 2100 10100 0    50   ~ 0
A/D IO 4
Text Label 2400 8150 0    50   ~ 0
21
Text Notes 2550 8150 0    50   ~ 0
A/D IO 1
Text Label 2400 8250 0    50   ~ 0
20
Text Notes 2900 8250 2    50   ~ 0
A/D IO 2
Text Label 2400 8350 0    50   ~ 0
19
Text Notes 2550 8350 0    50   ~ 0
A/D IO 3
Text Label 2400 8450 0    50   ~ 0
18
Text Notes 2900 8450 2    50   ~ 0
A/D IO 4
Text Notes 3600 7650 0    59   ~ 0
Distribute external analog inputs
Text Notes 15000 1300 0    50   ~ 0
LED pot 2
Text Notes 15000 1400 0    50   ~ 0
LED pot 3
Text Notes 15000 1500 0    50   ~ 0
LED pot 4
Text Notes 15000 1200 0    50   ~ 0
LED pot 1
Text Notes 11300 2600 0    50   ~ 0
Manual/Auto Switch
Text Notes 11400 2900 0    50   ~ 0
over-temp alarm
Text Notes 15000 1800 0    50   ~ 0
MOSFET temp 1
Text Notes 15000 1900 0    50   ~ 0
MOSFET temp 2
Text Notes 15000 2000 0    50   ~ 0
MOSFET temp 3
Text Notes 12050 3000 2    50   ~ 0
Ext fan PWM
Text Notes 12050 2000 2    50   ~ 0
Internal fan PWM
Text Notes 15000 2100 0    50   ~ 0
MOSFET temp 4
Text Notes 15000 2600 0    50   ~ 0
Resistor temp 1
Text Notes 15000 2700 0    50   ~ 0
Resistor temp 2
Text Notes 15000 2800 0    50   ~ 0
Resistor temp 3
Text Notes 15000 2900 0    50   ~ 0
Resistor temp 4
NoConn ~ 14700 2200
Text Notes 11400 2200 0    50   ~ 0
Status LED 4
Text Notes 11400 2100 0    50   ~ 0
Status LED 3
Text Label 12400 1900 2    50   ~ 0
9
Text Label 12400 1800 2    50   ~ 0
8
Text Label 12400 1700 2    50   ~ 0
7
Text Label 12400 1600 2    50   ~ 0
6
Text Notes 11350 1100 0    50   ~ 0
Status LED 2
Text Notes 11350 1000 0    50   ~ 0
Status LED 1
Text Notes 12300 1800 2    50   ~ 0
Interline PWM 4
Text Notes 12300 1600 2    50   ~ 0
Interline PWM 3
Text Notes 12300 1400 2    50   ~ 0
Interline PWM 2
Text Notes 11700 1300 0    50   ~ 0
Analog select 1\n
Text Notes 11700 1500 0    50   ~ 0
Analog select 2\n
Text Notes 11700 1700 0    50   ~ 0
Analog select 3\n
Text Notes 11700 1900 0    50   ~ 0
Analog select 4\n
$Comp
L Device:R_Pack08 RN?
U 1 1 5F57894B
P 5350 9400
F 0 "RN?" V 4733 9400 50  0000 C CNN
F 1 "4.7k" V 4824 9400 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 5825 9400 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 5350 9400 50  0001 C CNN
F 4 "Bourns Inc." V 5350 9400 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 5350 9400 50  0001 C CNN "Part #"
	1    5350 9400
	0    1    1    0   
$EndComp
Text Notes 900  9150 1    59   ~ 0
I/O maximum voltage: 27V (160mW)\nNiDaq PCI-6110 is +/- 10V 5mA\nTherefore, minimum impedance is 2000 Ohms
Text Notes 3500 9700 0    50   ~ 0
A/D IO 3
Text Notes 3450 9000 0    50   ~ 0
A/D IO 1
Text Notes 1950 8700 0    59   ~ 0
4-channel analog/digital IO with 0-3.3V clamp
$Comp
L power:GND #PWR?
U 1 1 5F48EF1A
P 3350 10100
F 0 "#PWR?" H 3350 9850 50  0001 C CNN
F 1 "GND" V 3450 10050 50  0000 R CNN
F 2 "" H 3350 10100 50  0001 C CNN
F 3 "" H 3350 10100 50  0001 C CNN
	1    3350 10100
	0    -1   -1   0   
$EndComp
Text Label 3350 9900 0    50   ~ 0
3.3V
Text Label 2600 9900 2    50   ~ 0
3.3V
$Comp
L power:GND #PWR?
U 1 1 5F48EF12
P 2600 9700
F 0 "#PWR?" H 2600 9450 50  0001 C CNN
F 1 "GND" V 2500 9650 50  0000 R CNN
F 2 "" H 2600 9700 50  0001 C CNN
F 3 "" H 2600 9700 50  0001 C CNN
	1    2600 9700
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:BAT54SDW D?
U 1 1 5F48EF0C
P 2800 9800
F 0 "D?" H 2975 10147 60  0000 C CNN
F 1 "BAT54SDW" H 2975 10041 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 3000 10000 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 3000 10100 60  0001 L CNN
F 4 "Diodes Incorporated" H 2800 9800 50  0001 C CNN "Manufacturer"
F 5 "BAT54SDW-7-F" H 2800 9800 50  0001 C CNN "Part #"
	1    2800 9800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F47759A
P 3300 9400
F 0 "#PWR?" H 3300 9150 50  0001 C CNN
F 1 "GND" V 3400 9350 50  0000 R CNN
F 2 "" H 3300 9400 50  0001 C CNN
F 3 "" H 3300 9400 50  0001 C CNN
	1    3300 9400
	0    -1   -1   0   
$EndComp
Text Label 3300 9200 0    50   ~ 0
3.3V
Text Label 2550 9200 2    50   ~ 0
3.3V
$Comp
L power:GND #PWR?
U 1 1 5F475E13
P 2550 9000
F 0 "#PWR?" H 2550 8750 50  0001 C CNN
F 1 "GND" V 2450 8950 50  0000 R CNN
F 2 "" H 2550 9000 50  0001 C CNN
F 3 "" H 2550 9000 50  0001 C CNN
	1    2550 9000
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:BAT54SDW D?
U 1 1 5F46875C
P 2750 9100
F 0 "D?" H 2925 9447 60  0000 C CNN
F 1 "BAT54SDW" H 2925 9341 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 2950 9300 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds11005.pdf" H 2950 9400 60  0001 L CNN
F 4 "Diodes Incorporated" H 2750 9100 50  0001 C CNN "Manufacturer"
F 5 "BAT54SDW-7-F" H 2750 9100 50  0001 C CNN "Part #"
	1    2750 9100
	1    0    0    -1  
$EndComp
Text Notes 15000 1600 0    50   ~ 0
A/D IO 1
Text Notes 15850 3000 1    50   ~ 0
--ADC1--
Text Notes 15900 2400 2    50   ~ 0
ADC1
Text Notes 15900 2500 2    50   ~ 0
ADC0
Text Notes 15850 2100 1    50   ~ 0
-------ADC0------
Text Notes 15900 3100 2    50   ~ 0
ADC0
Text Notes 15900 3200 2    50   ~ 0
ADC0
Text Notes 11750 3100 2    50   ~ 0
ADC1
Text Notes 11750 3200 2    50   ~ 0
ADC1
Text Notes 15000 2500 0    50   ~ 0
Ext temp
Text Notes 16000 3600 1    50   ~ 0
https://forum.pjrc.com/attachment.php?attachmentid=10666&d=1495536536
$EndSCHEMATC
