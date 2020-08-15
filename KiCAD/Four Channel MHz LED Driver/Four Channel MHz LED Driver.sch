EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A2 23386 16535
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
P 3250 5650
F 0 "U?" H 3900 5013 60  0000 C CNN
F 1 "DAC084S085" H 3900 5119 60  0000 C CNN
F 2 "Custom Footprints:DAC084S085CIMM" H 3950 5850 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fdac084s085" H 3900 5119 60  0001 C CNN
F 4 "Texas Instruments" H 3250 5650 50  0001 C CNN "Manufacturer"
F 5 "DAC084S085CIMM/NOPB" H 3250 5650 50  0001 C CNN "Part #"
	1    3250 5650
	-1   0    0    1   
$EndComp
$Comp
L Custom_parts:MCP4351-502E_ST U?
U 1 1 5F3407BD
P 3950 5000
F 0 "U?" H 4550 5257 60  0000 C CNN
F 1 "MCP4351-502E_ST" H 4550 5151 60  0000 C CNN
F 2 "Custom Footprints:MCP4351-502E" H 4600 5250 60  0001 C CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en547555" H 4550 5151 60  0001 C CNN
F 4 "Microchip Technology" H 3950 5000 50  0001 C CNN "Manufacturer"
F 5 "MCP4351-502E/ST" H 3950 5000 50  0001 C CNN "Part #"
	1    3950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5900 5150 6000
Wire Wire Line
	5150 4700 5150 5000
Wire Wire Line
	3250 5250 3400 5250
Wire Wire Line
	3400 5250 3400 5000
Wire Wire Line
	3400 5000 3950 5000
Wire Wire Line
	3450 4700 3450 5350
Wire Wire Line
	3450 5350 3250 5350
Wire Wire Line
	3450 4700 5150 4700
$Comp
L power:GND #PWR?
U 1 1 5F34784A
P 3950 5200
F 0 "#PWR?" H 3950 4950 50  0001 C CNN
F 1 "GND" V 3955 5072 50  0000 R CNN
F 2 "" H 3950 5200 50  0001 C CNN
F 3 "" H 3950 5200 50  0001 C CNN
	1    3950 5200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F34877E
P 3950 5700
F 0 "#PWR?" H 3950 5450 50  0001 C CNN
F 1 "GND" V 3850 5700 50  0000 R CNN
F 2 "" H 3950 5700 50  0001 C CNN
F 3 "" H 3950 5700 50  0001 C CNN
	1    3950 5700
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F348E43
P 5150 5700
F 0 "#PWR?" H 5150 5450 50  0001 C CNN
F 1 "GND" V 5155 5572 50  0000 R CNN
F 2 "" H 5150 5700 50  0001 C CNN
F 3 "" H 5150 5700 50  0001 C CNN
	1    5150 5700
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F349663
P 5150 5200
F 0 "#PWR?" H 5150 4950 50  0001 C CNN
F 1 "GND" V 5155 5072 50  0000 R CNN
F 2 "" H 5150 5200 50  0001 C CNN
F 3 "" H 5150 5200 50  0001 C CNN
	1    5150 5200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3950 5600 3950 5700
Connection ~ 3950 5700
NoConn ~ 5150 5400
NoConn ~ 5150 5500
Text Label 5150 5300 0    50   ~ 0
5V-analog
$Comp
L power:GND #PWR?
U 1 1 5F34BA64
P 1950 5250
F 0 "#PWR?" H 1950 5000 50  0001 C CNN
F 1 "GND" V 1955 5122 50  0000 R CNN
F 2 "" H 1950 5250 50  0001 C CNN
F 3 "" H 1950 5250 50  0001 C CNN
	1    1950 5250
	0    1    1    0   
$EndComp
Text Label 1950 5350 2    50   ~ 0
5V-analog
$Comp
L power:GND #PWR?
U 1 1 5F3504EC
P 3250 5850
F 0 "#PWR?" H 3250 5600 50  0001 C CNN
F 1 "GND" V 3255 5722 50  0000 R CNN
F 2 "" H 3250 5850 50  0001 C CNN
F 3 "" H 3250 5850 50  0001 C CNN
	1    3250 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F352F78
P 5250 5500
F 0 "#PWR?" H 5250 5250 50  0001 C CNN
F 1 "GND" H 5450 5400 50  0000 R CNN
F 2 "" H 5250 5500 50  0001 C CNN
F 3 "" H 5250 5500 50  0001 C CNN
	1    5250 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 5300 5150 5300
$Comp
L Custom_parts:S18V20F12_12V_DC U?
U 1 1 5F357FC0
P 2700 1650
F 0 "U?" H 2675 1785 50  0000 C CNN
F 1 "S18V20F12_12V_DC" H 2675 1694 50  0000 C CNN
F 2 "" H 2700 1650 50  0001 C CNN
F 3 "https://www.pololu.com/product-info-merged/2577" H 2700 1650 50  0001 C CNN
F 4 "Pololu Corporation" H 2700 1650 50  0001 C CNN "Manufacturer"
F 5 "2577" H 2700 1650 50  0001 C CNN "Part #"
	1    2700 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 1750 2200 1800
Wire Wire Line
	2200 1950 2200 2000
Wire Wire Line
	3150 1950 3150 2000
Text Label 2100 2000 2    50   ~ 0
Vin
Wire Wire Line
	2100 2000 2200 2000
Connection ~ 2200 2000
Wire Wire Line
	2200 2000 2200 2050
Wire Wire Line
	3150 2000 3250 2000
Connection ~ 3150 2000
Wire Wire Line
	3150 2000 3150 2050
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
Connection ~ 2200 1800
Wire Wire Line
	2200 1800 2200 1850
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
U 1 1 5F35F7A3
P 3250 1750
F 0 "#PWR?" H 3250 1500 50  0001 C CNN
F 1 "GND" H 3150 1650 50  0000 R CNN
F 2 "" H 3250 1750 50  0001 C CNN
F 3 "" H 3250 1750 50  0001 C CNN
	1    3250 1750
	-1   0    0    1   
$EndComp
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
Wire Wire Line
	5100 2200 5100 2050
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
Connection ~ 5100 1650
Wire Wire Line
	5100 1650 5100 1400
Connection ~ 5100 2050
Wire Wire Line
	5100 2050 5100 1950
Text Label 5150 2050 0    50   ~ 0
5V
Text Label 5100 1650 0    50   ~ 0
-5V
Connection ~ 5300 1850
Wire Wire Line
	5300 1850 5550 1850
Wire Wire Line
	5100 1850 5300 1850
Wire Wire Line
	5100 1650 5300 1650
Wire Wire Line
	5100 2050 5300 2050
Wire Wire Line
	3250 1950 3250 2000
Wire Wire Line
	3150 1750 3150 1850
Wire Wire Line
	3150 1750 3250 1750
Connection ~ 3150 1750
Connection ~ 3250 1750
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
F 1 "ADP7118AUJZ-5.0-R7" H 3975 2801 60  0000 C CNN
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
P 5250 5400
F 0 "C?" H 5342 5446 50  0000 L CNN
F 1 "2.2uF" H 5342 5355 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5250 5400 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5250 5400 50  0001 C CNN
F 4 "Taiyo Yuden" H 5250 5400 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5250 5400 50  0001 C CNN "Part #"
	1    5250 5400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F3918D7
P 3250 5750
F 0 "C?" H 3050 5750 50  0000 L CNN
F 1 "2.2uF" H 3000 5650 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 3250 5750 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 3250 5750 50  0001 C CNN
F 4 "Taiyo Yuden" H 3250 5750 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 3250 5750 50  0001 C CNN "Part #"
	1    3250 5750
	1    0    0    -1  
$EndComp
Text Label 3250 5650 0    50   ~ 0
5V-analog
Wire Wire Line
	3750 5450 3750 5900
Wire Wire Line
	3750 5900 3950 5900
Wire Wire Line
	3250 5450 3750 5450
Wire Wire Line
	3700 5550 3700 6000
Wire Wire Line
	3700 6000 5150 6000
Wire Wire Line
	3250 5550 3700 5550
Text Notes 2800 3100 0    59   ~ 0
LDO - 12V to clean 5V for analog circuits
Text Notes 3800 1250 0    59   ~ 0
ISOLATED - 12V to split +/- 5V
Text Notes 1800 1500 0    59   ~ 0
SEPIC - Vin (3V - 30V) to 12V DC
Wire Wire Line
	3250 2350 3250 2450
$Comp
L Jumper:SolderJumper_2_Open JP?
U 1 1 5F3A0F69
P 2250 2350
F 0 "JP?" H 2250 2555 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 2250 2464 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2250 2350 50  0001 C CNN
F 3 "~" H 2250 2350 50  0001 C CNN
	1    2250 2350
	1    0    0    -1  
$EndComp
Text Label 2100 2350 2    50   ~ 0
Vin
Text Label 2400 2350 0    50   ~ 0
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
Text Notes 1800 2500 0    59   ~ 0
12V Supply Bypass
$EndSCHEMATC
