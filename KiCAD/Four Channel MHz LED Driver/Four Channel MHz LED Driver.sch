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
Wire Wire Line
	1900 1800 1900 1900
Wire Wire Line
	3500 2500 3500 2550
Wire Wire Line
	1900 2700 1900 2800
$Comp
L power:GND #PWR?
U 1 1 5F336788
P 1900 2600
F 0 "#PWR?" H 1900 2350 50  0001 C CNN
F 1 "GND" V 1905 2472 50  0000 R CNN
F 2 "" H 1900 2600 50  0001 C CNN
F 3 "" H 1900 2600 50  0001 C CNN
	1    1900 2600
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F3372A1
P 1900 2100
F 0 "#PWR?" H 1900 1850 50  0001 C CNN
F 1 "GND" V 1905 1972 50  0000 R CNN
F 2 "" H 1900 2100 50  0001 C CNN
F 3 "" H 1900 2100 50  0001 C CNN
	1    1900 2100
	0    1    1    0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F339AEC
P 1800 2300
F 0 "R?" V 1700 2100 50  0000 C CNN
F 1 "100k" V 1700 2300 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1800 2300 50  0001 C CNN
F 3 "http://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1800 2300 50  0001 C CNN
F 4 "Susumu" V 1800 2300 50  0001 C CNN "Manufacturer"
F 5 "RR0816P-104-D" V 1800 2300 50  0001 C CNN "Part #"
	1    1800 2300
	0    1    1    0   
$EndComp
Wire Wire Line
	1700 2300 1700 2350
$Comp
L power:GND #PWR?
U 1 1 5F33BA16
P 1700 2350
F 0 "#PWR?" H 1700 2100 50  0001 C CNN
F 1 "GND" V 1705 2222 50  0000 R CNN
F 2 "" H 1700 2350 50  0001 C CNN
F 3 "" H 1700 2350 50  0001 C CNN
	1    1700 2350
	0    1    1    0   
$EndComp
Connection ~ 1700 2350
Wire Wire Line
	1700 2350 1700 2400
$Comp
L Device:R_Small R?
U 1 1 5F33C330
P 1800 2400
F 0 "R?" V 1900 2200 50  0000 C CNN
F 1 "100k" V 1900 2400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 1800 2400 50  0001 C CNN
F 3 "http://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 1800 2400 50  0001 C CNN
F 4 "Susumu" V 1800 2400 50  0001 C CNN "Manufacturer"
F 5 "RR0816P-104-D" V 1800 2400 50  0001 C CNN "Part #"
	1    1800 2400
	0    1    1    0   
$EndComp
NoConn ~ 1900 3150
NoConn ~ 1900 3250
NoConn ~ 1900 2900
$Comp
L Device:C_Small C?
U 1 1 5F33D488
P 1650 1700
F 0 "C?" H 1742 1746 50  0000 L CNN
F 1 "4.7uF" H 1742 1655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1650 1700 50  0001 C CNN
F 3 "https://www.samsungsem.com/resources/file/global/support/product_catalog/MLCC.pdf" H 1650 1700 50  0001 C CNN
F 4 "Samsung Electro-Mechanics" H 1650 1700 50  0001 C CNN "Manufacturer"
F 5 "CL21A475KLCLQNC" H 1650 1700 50  0001 C CNN "Part #"
	1    1650 1700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5F33F047
P 1650 1800
F 0 "#PWR?" H 1650 1550 50  0001 C CNN
F 1 "GND" H 1655 1627 50  0000 C CNN
F 2 "" H 1650 1800 50  0001 C CNN
F 3 "" H 1650 1800 50  0001 C CNN
	1    1650 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 1700 3500 1900
Connection ~ 3500 1900
Wire Wire Line
	3500 1900 3500 2100
$Comp
L power:GND #PWR?
U 1 1 5F33F9AA
P 4350 1900
F 0 "#PWR?" H 4350 1650 50  0001 C CNN
F 1 "GND" V 4355 1772 50  0000 R CNN
F 2 "" H 4350 1900 50  0001 C CNN
F 3 "" H 4350 1900 50  0001 C CNN
	1    4350 1900
	0    -1   -1   0   
$EndComp
Text Label 4700 2250 0    50   ~ 0
-5V
Text Label 4700 1550 0    50   ~ 0
12V
Wire Wire Line
	1900 1600 1650 1600
$Comp
L Device:C_Small C?
U 1 1 5F3415A5
P 1450 1700
F 0 "C?" H 1359 1654 50  0000 R CNN
F 1 "4.7uF" H 1359 1745 50  0000 R CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1450 1700 50  0001 C CNN
F 3 "https://www.samsungsem.com/resources/file/global/support/product_catalog/MLCC.pdf" H 1450 1700 50  0001 C CNN
F 4 "Samsung Electro-Mechanics" H 1450 1700 50  0001 C CNN "Manufacturer"
F 5 "CL21A475KLCLQNC" H 1450 1700 50  0001 C CNN "Part #"
	1    1450 1700
	1    0    0    1   
$EndComp
Wire Wire Line
	1900 1500 1900 1600
Connection ~ 1900 1600
Wire Wire Line
	1650 1600 1450 1600
Connection ~ 1650 1600
Text Label 1450 1600 2    50   ~ 0
Vin
$Comp
L power:GND #PWR?
U 1 1 5F344A5A
P 1450 1800
F 0 "#PWR?" H 1450 1550 50  0001 C CNN
F 1 "GND" H 1455 1627 50  0000 C CNN
F 2 "" H 1450 1800 50  0001 C CNN
F 3 "" H 1450 1800 50  0001 C CNN
	1    1450 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F34576D
P 3600 1600
F 0 "R?" V 3500 1400 50  0000 C CNN
F 1 "130k" V 3500 1600 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3600 1600 50  0001 C CNN
F 3 "http://www.susumu.co.jp/common/pdf/n_catalog_partition05_en.pdf" H 3600 1600 50  0001 C CNN
F 4 "Susumu" V 3600 1600 50  0001 C CNN "Manufacturer"
F 5 "RR0816P-134-D" V 3600 1600 50  0001 C CNN "Part #"
	1    3600 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R?
U 1 1 5F3469F9
P 3600 2200
F 0 "R?" V 3500 2400 50  0000 C CNN
F 1 "60.4k" V 3500 2200 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 3600 2200 50  0001 C CNN
F 3 "https://www.te.com/commerce/DocumentDelivery/DDEController?Action=srchrtrv&DocNm=1773200&DocType=DS&DocLang=English" H 3600 2200 50  0001 C CNN
F 4 "TE Connectivity Passive Product" V 3600 2200 50  0001 C CNN "Manufacturer"
F 5 "CPF0603F60K4C1" V 3600 2200 50  0001 C CNN "Part #"
	1    3600 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	3500 1500 3700 1500
Wire Wire Line
	3700 1500 3700 1550
Wire Wire Line
	3500 2300 3700 2300
Wire Wire Line
	3700 2300 3700 2250
Wire Wire Line
	3700 2250 4000 2250
Connection ~ 3700 2250
Wire Wire Line
	3700 2250 3700 2200
Wire Wire Line
	3700 1550 4000 1550
Connection ~ 3700 1550
Wire Wire Line
	3700 1550 3700 1600
Wire Wire Line
	3500 1900 4000 1900
$Comp
L Device:C_Small C?
U 1 1 5F34BC9F
P 4000 1650
F 0 "C?" H 4092 1696 50  0000 L CNN
F 1 "47uF" H 4092 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4000 1650 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/partnumbering_e_01.pdf" H 4000 1650 50  0001 C CNN
F 4 "Murata Electronics" H 4000 1650 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4000 1650 50  0001 C CNN "Part #"
	1    4000 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F34D180
P 4000 2150
F 0 "C?" H 4092 2196 50  0000 L CNN
F 1 "47uF" H 4092 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4000 2150 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/partnumbering_e_01.pdf" H 4000 2150 50  0001 C CNN
F 4 "Murata Electronics" H 4000 2150 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4000 2150 50  0001 C CNN "Part #"
	1    4000 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1750 4000 1900
Connection ~ 4000 1900
Wire Wire Line
	4000 1900 4000 2050
$Comp
L Device:C_Small C?
U 1 1 5F34E4FB
P 4350 1650
F 0 "C?" H 4442 1696 50  0000 L CNN
F 1 "47uF" H 4442 1605 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4350 1650 50  0001 C CNN
F 3 "https://search.murata.co.jp/Ceramy/image/img/A01X/partnumbering_e_01.pdf" H 4350 1650 50  0001 C CNN
F 4 "Murata Electronics" H 4350 1650 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 4350 1650 50  0001 C CNN "Part #"
	1    4350 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C?
U 1 1 5F34EACC
P 4350 2150
F 0 "C?" H 4442 2196 50  0000 L CNN
F 1 "100uF" H 4442 2105 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 4350 2150 50  0001 C CNN
F 3 "http://www.yuden.co.jp/productdata/catalog/mlcc06_e.pdf" H 4350 2150 50  0001 C CNN
F 4 "Taiyo Yuden" H 4350 2150 50  0001 C CNN "Manufacturer"
F 5 "LMK316BBJ107ML-T" H 4350 2150 50  0001 C CNN "Part #"
	1    4350 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 1550 4000 1550
Connection ~ 4000 1550
Wire Wire Line
	4350 1550 4700 1550
Connection ~ 4350 1550
Wire Wire Line
	4350 1750 4350 1900
Connection ~ 4350 1900
Wire Wire Line
	4350 1900 4350 2050
Wire Wire Line
	4000 2250 4350 2250
Connection ~ 4000 2250
Connection ~ 4350 2250
Wire Wire Line
	4350 2250 4700 2250
Wire Wire Line
	3500 2550 3700 2550
Connection ~ 3500 2550
Wire Wire Line
	3500 2550 3500 2600
Text Label 3700 2550 0    50   ~ 0
PS_Monitor
$Comp
L Custom_parts:LTM8049IY U?
U 1 1 5F335740
P 1900 1650
F 0 "U?" H 2700 2163 60  0000 C CNN
F 1 "LTM8049IY" H 2700 2057 60  0000 C CNN
F 2 "LTM8049IY_ADI" H 2900 1890 60  0001 C CNN
F 3 "http://www.linear.com/docs/54241" H 2700 1951 60  0000 C CNN
F 4 "Analog Devices Inc." H 1900 1650 50  0001 C CNN "Manufacturer"
F 5 "LTM8049EY#PBF" H 1900 1650 50  0001 C CNN "Part #"
	1    1900 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 1900 4350 1900
$Comp
L Custom_parts:DAC084S085 U?
U 1 1 5F33B1A2
P 3250 5650
F 0 "U?" H 3900 5013 60  0000 C CNN
F 1 "DAC084S085" H 3900 5119 60  0000 C CNN
F 2 "MUB10A_TEX" H 3950 5850 60  0001 C CNN
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
F 2 "TSSOP20_MC_MCH" H 4600 5250 60  0001 C CNN
F 3 "http://www.microchip.com/mymicrochip/filehandler.aspx?ddocname=en547555" H 4550 5151 60  0001 C CNN
F 4 "Microchip Technology" H 3950 5000 50  0001 C CNN "Manufacturer"
F 5 "MCP4351-502E/ST" H 3950 5000 50  0001 C CNN "Part #"
	1    3950 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 5550 3250 5550
Wire Wire Line
	5150 5900 5150 6100
Wire Wire Line
	5150 6100 3400 6100
Wire Wire Line
	3400 5550 3400 6100
Wire Wire Line
	3250 5450 3450 5450
Wire Wire Line
	3450 5450 3450 5900
Wire Wire Line
	3450 5900 3950 5900
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
F 1 "GND" V 3955 5572 50  0000 R CNN
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
5V
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
5V
Text Label 3250 5650 0    50   ~ 0
5V
$Comp
L Device:C_Small C?
U 1 1 5F34DBA4
P 3250 5750
F 0 "C?" H 3342 5796 50  0000 L CNN
F 1 "1uF" H 3342 5705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 3250 5750 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2019/04/10/Data%20sheet_CL10A105KA8NNNC.pdf" H 3250 5750 50  0001 C CNN
F 4 "Samsung Electro-Mechanics" H 3250 5750 50  0001 C CNN "Manufacturer"
F 5 "CL10A105KA8NNNC" H 3250 5750 50  0001 C CNN "Part #"
	1    3250 5750
	-1   0    0    1   
$EndComp
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
L Device:C_Small C?
U 1 1 5F351B65
P 5250 5400
F 0 "C?" H 5342 5446 50  0000 L CNN
F 1 "1uF" H 5342 5355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 5250 5400 50  0001 C CNN
F 3 "http://www.samsungsem.com/kr/support/product-search/mlcc/__icsFiles/afieldfile/2019/04/10/Data%20sheet_CL10A105KA8NNNC.pdf" H 5250 5400 50  0001 C CNN
F 4 "Samsung Electro-Mechanics" H 5250 5400 50  0001 C CNN "Manufacturer"
F 5 "CL10A105KA8NNNC" H 5250 5400 50  0001 C CNN "Part #"
	1    5250 5400
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
$EndSCHEMATC
