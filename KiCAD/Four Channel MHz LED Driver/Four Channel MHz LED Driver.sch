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
L Custom_parts:DAC084S085 U2
U 1 1 5F33B1A2
P 8000 6900
F 0 "U2" H 8650 6263 60  0000 C CNN
F 1 "DAC124S085" H 8650 6369 60  0000 C CNN
F 2 "Custom Footprints:DAC084S085CIMM" H 8700 7100 60  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/dac124s085.pdf?HQS=TI-null-null-digikeymode-df-pf-null-wwe&ts=1598235066839" H 8650 6369 60  0001 C CNN
F 4 "Texas Instruments" H 8000 6900 50  0001 C CNN "Manufacturer"
F 5 "DAC124S085CIMM/NOPB" H 8000 6900 50  0001 C CNN "Part #"
	1    8000 6900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 5F34BA64
P 6700 6500
F 0 "#PWR0101" H 6700 6250 50  0001 C CNN
F 1 "GND" V 6705 6372 50  0000 R CNN
F 2 "" H 6700 6500 50  0001 C CNN
F 3 "" H 6700 6500 50  0001 C CNN
	1    6700 6500
	0    1    1    0   
$EndComp
Text Label 6700 6600 2    50   ~ 0
5V-analog
$Comp
L power:GND #PWR0102
U 1 1 5F3504EC
P 8000 7100
F 0 "#PWR0102" H 8000 6850 50  0001 C CNN
F 1 "GND" H 8050 6950 50  0000 R CNN
F 2 "" H 8000 7100 50  0001 C CNN
F 3 "" H 8000 7100 50  0001 C CNN
	1    8000 7100
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:S18V20F12_12V_DC U1
U 1 1 5F357FC0
P 2350 1300
F 0 "U1" H 2325 1435 50  0000 C CNN
F 1 "S20V18F12_12V_DC" H 2325 1344 50  0000 C CNN
F 2 "Custom Footprints:S18V20F12_12V_DC" H 2350 1300 50  0001 C CNN
F 3 "https://www.pololu.com/product-info-merged/2577" H 2350 1300 50  0001 C CNN
F 4 "Pololu Corporation" H 2350 1300 50  0001 C CNN "Manufacturer"
F 5 "2577" H 2350 1300 50  0001 C CNN "Part #"
	1    2350 1300
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 1600 1850 1650
Wire Wire Line
	2800 1600 2800 1650
Text Label 1750 1650 2    50   ~ 0
Vin
Connection ~ 1850 1650
Wire Wire Line
	1850 1650 1850 1700
Wire Wire Line
	2800 1650 2900 1650
Connection ~ 2800 1650
Wire Wire Line
	2800 1650 2800 1700
Text Label 2900 1650 0    50   ~ 0
12V
$Comp
L Custom_parts:DPBW06F-05 U3
U 1 1 5F35D26E
P 4200 1300
F 0 "U3" H 4250 1435 50  0000 C CNN
F 1 "DPBW06F-05" H 4250 1344 50  0000 C CNN
F 2 "Custom Footprints:DPBW06F-05" H 4200 1300 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Mean%20Well%20PDF's/SPBW06,DPBW06_Ds.pdf" H 4200 1300 50  0001 C CNN
F 4 "MEAN WELL USA Inc." H 4200 1300 50  0001 C CNN "Manufacturer"
F 5 "DPBW06F-05" H 4200 1300 50  0001 C CNN "Part #"
	1    4200 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 5F35E7FC
P 2900 1500
F 0 "C11" H 2992 1546 50  0000 L CNN
F 1 "47uF" H 2992 1455 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 2900 1500 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 2900 1500 50  0001 C CNN
F 4 "Murata Electronics" H 2900 1500 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 2900 1500 50  0001 C CNN "Part #"
	1    2900 1500
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
	3050 1650 2900 1650
Connection ~ 2900 1650
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
Wire Wire Line
	2900 1600 2900 1650
Wire Wire Line
	2800 1400 2800 1500
Wire Wire Line
	2800 1400 2900 1400
Connection ~ 2800 1400
$Comp
L Device:C_Small C9
U 1 1 5F3918D7
P 8000 7000
F 0 "C9" H 7800 7000 50  0000 L CNN
F 1 "2.2uF" H 7750 6900 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 8000 7000 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 8000 7000 50  0001 C CNN
F 4 "Taiyo Yuden" H 8000 7000 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 8000 7000 50  0001 C CNN "Part #"
	1    8000 7000
	1    0    0    -1  
$EndComp
Text Label 8000 6900 0    50   ~ 0
5V-analog
Text Notes 2450 2750 0    59   ~ 0
LDO: 12V to clean 5V for analog circuits
Text Notes 3450 900  0    59   ~ 0
ISOLATED: 12V to split +/- 5V
Text Notes 1550 650  0    59   ~ 0
SEPIC - Vin (3V - 30V) to 12V DC
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
	5450 6550 5450 6750
Wire Wire Line
	5450 6750 5400 6750
Text Label 8000 6600 0    50   ~ 0
internal_analog_3
Text Label 8000 6500 0    50   ~ 0
internal_analog_4
Text Label 4650 6550 2    50   ~ 0
internal_analog_1
Text Label 4650 6750 2    50   ~ 0
external_analog_1
$Comp
L Custom_parts:TMUX1204DGSR U7
U 1 1 5F3DA347
P 4850 7250
F 0 "U7" H 5025 7415 50  0000 C CNN
F 1 "TMUX1204DGSR" H 5025 7324 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 4850 8250 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 4850 7250 50  0001 C CNN
F 4 "Texas Instruments" H 4850 7250 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 4850 7250 50  0001 C CNN "Part #"
	1    4850 7250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 7700 4650 7750
Wire Wire Line
	4650 7800 5400 7800
Wire Wire Line
	5400 7800 5400 7700
Wire Wire Line
	5400 7400 5450 7400
Wire Wire Line
	5450 7400 5450 7600
Wire Wire Line
	5450 7600 5400 7600
Text Label 4650 7400 2    50   ~ 0
internal_analog_2
Text Label 4650 7600 2    50   ~ 0
external_analog_2
Wire Wire Line
	4700 8550 4700 8600
Wire Wire Line
	4700 8650 5450 8650
Wire Wire Line
	5450 8650 5450 8550
Wire Wire Line
	5450 8250 5500 8250
Wire Wire Line
	5500 8250 5500 8450
Wire Wire Line
	5500 8450 5450 8450
Text Label 4700 8250 2    50   ~ 0
internal_analog_3
Text Label 4700 8450 2    50   ~ 0
external_analog_3
$Comp
L Custom_parts:TMUX1204DGSR U9
U 1 1 5F3DEF78
P 4900 8900
F 0 "U9" H 5075 9065 50  0000 C CNN
F 1 "TMUX1204DGSR" H 5075 8974 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 4900 9900 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 4900 8900 50  0001 C CNN
F 4 "Texas Instruments" H 4900 8900 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 4900 8900 50  0001 C CNN "Part #"
	1    4900 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 9350 4700 9400
Wire Wire Line
	4700 9450 5450 9450
Wire Wire Line
	5450 9450 5450 9350
Wire Wire Line
	5450 9050 5500 9050
Wire Wire Line
	5500 9050 5500 9250
Wire Wire Line
	5500 9250 5450 9250
Text Label 4700 9050 2    50   ~ 0
internal_analog_4
Text Label 4700 9250 2    50   ~ 0
external_analog_4
Text Notes 6650 6150 0    59   ~ 0
Internal 4-channel 12-bit DAC AWG
Text Label 4700 10000 2    50   ~ 0
external_analog_1
Text Label 2150 6650 0    50   ~ 0
external_analog_2
Text Label 2150 6850 0    50   ~ 0
external_analog_3
Text Label 2150 7050 0    50   ~ 0
external_analog_4
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
Text Label 5450 6550 0    50   ~ 0
-0.25V_analog
Text Label 5450 7400 0    50   ~ 0
-0.25V_analog
Text Label 5500 8250 0    50   ~ 0
-0.25V_analog
Text Label 5500 9050 0    50   ~ 0
-0.25V_analog
Text Label 3900 6150 2    50   ~ 0
5V-analog
Text Label 2150 6450 0    50   ~ 0
external_analog_1
Text Label 4700 10200 2    50   ~ 0
external_analog_2
Text Label 5300 10200 0    50   ~ 0
external_analog_3
Text Label 5300 10000 0    50   ~ 0
external_analog_4
$Comp
L power:GND #PWR0111
U 1 1 5F4EB97D
P 4700 10100
F 0 "#PWR0111" H 4700 9850 50  0001 C CNN
F 1 "GND" V 4705 9972 50  0000 R CNN
F 2 "" H 4700 10100 50  0001 C CNN
F 3 "" H 4700 10100 50  0001 C CNN
	1    4700 10100
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:D_Zener_x4_ACom_AKKKK D3
U 1 1 5F4F11C3
P 5000 10250
F 0 "D3" H 5000 9775 50  0000 C CNN
F 1 "D_Zener_x4_ACom_AKKKK" H 5000 9866 50  0000 C CNN
F 2 "Custom Footprints:SOT-753" H 5000 10000 50  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/discrete/diode/zener/ftz5.6e.pdf" H 5000 10000 50  0001 C CNN
F 4 "Rohm Semiconductor" H 5000 10250 50  0001 C CNN "Manufacturer"
F 5 "FTZ5.6ET148" H 5000 10250 50  0001 C CNN "Part #"
	1    5000 10250
	-1   0    0    1   
$EndComp
Text Notes 3800 9700 0    59   ~ 0
4-channel external analog input with 5.6V zener clamp\nAbsolute max voltage: +11V/-6V
$Comp
L Connector:Barrel_Jack_Switch J1
U 1 1 5F4FA1F9
P 800 1750
F 0 "J1" H 857 2067 50  0000 C CNN
F 1 "Barrel_Jack_Switch" H 857 1976 50  0000 C CNN
F 2 "Custom Footprints:54-00165-DC_Jack" H 850 1710 50  0001 C CNN
F 3 "https://www.tensility.com/api/videos/videoplayer/smallplayer/54-00165.pdf" H 850 1710 50  0001 C CNN
F 4 "Tensility International Corp" H 800 1750 50  0001 C CNN "Manufacturer"
F 5 "54-00165" H 800 1750 50  0001 C CNN "Part #"
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
F 1 "Conn_01x02_Female" H 450 1000 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P7.2mm_D2.4mm_OD3.6mm" H 850 1150 50  0001 C CNN
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
P 1050 1250
F 0 "#PWR0113" H 1050 1000 50  0001 C CNN
F 1 "GND" V 1055 1122 50  0000 R CNN
F 2 "" H 1050 1250 50  0001 C CNN
F 3 "" H 1050 1250 50  0001 C CNN
	1    1050 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5F5306B0
P 2250 11050
F 0 "#PWR0114" H 2250 10800 50  0001 C CNN
F 1 "GND" V 2250 10900 50  0000 R CNN
F 2 "" H 2250 11050 50  0001 C CNN
F 3 "" H 2250 11050 50  0001 C CNN
	1    2250 11050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5F531E2E
P 2250 10850
F 0 "#PWR0115" H 2250 10600 50  0001 C CNN
F 1 "GND" V 2250 10700 50  0000 R CNN
F 2 "" H 2250 10850 50  0001 C CNN
F 3 "" H 2250 10850 50  0001 C CNN
	1    2250 10850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 5F53235A
P 2250 10650
F 0 "#PWR0116" H 2250 10400 50  0001 C CNN
F 1 "GND" V 2250 10500 50  0000 R CNN
F 2 "" H 2250 10650 50  0001 C CNN
F 3 "" H 2250 10650 50  0001 C CNN
	1    2250 10650
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 5F5328BE
P 2250 10450
F 0 "#PWR0117" H 2250 10200 50  0001 C CNN
F 1 "GND" V 2250 10300 50  0000 R CNN
F 2 "" H 2250 10450 50  0001 C CNN
F 3 "" H 2250 10450 50  0001 C CNN
	1    2250 10450
	0    1    1    0   
$EndComp
Text Label 14850 900  0    50   ~ 0
5V
Text Label 12550 2300 2    50   ~ 0
3.3V
Text Label 14850 1100 0    50   ~ 0
3.3V
$Comp
L power:GND #PWR0118
U 1 1 5F3EF0B8
P 12550 900
F 0 "#PWR0118" H 12550 650 50  0001 C CNN
F 1 "GND" V 12550 750 50  0000 R CNN
F 2 "" H 12550 900 50  0001 C CNN
F 3 "" H 12550 900 50  0001 C CNN
	1    12550 900 
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0119
U 1 1 5F3DEA30
P 14850 1000
F 0 "#PWR0119" H 14850 750 50  0001 C CNN
F 1 "GND" V 14850 850 50  0000 R CNN
F 2 "" H 14850 1000 50  0001 C CNN
F 3 "" H 14850 1000 50  0001 C CNN
	1    14850 1000
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 5F3F47A9
P 14850 2300
F 0 "#PWR0120" H 14850 2050 50  0001 C CNN
F 1 "GND" V 14850 2150 50  0000 R CNN
F 2 "" H 14850 2300 50  0001 C CNN
F 3 "" H 14850 2300 50  0001 C CNN
	1    14850 2300
	0    -1   -1   0   
$EndComp
$Comp
L Custom_parts:Teensy3.6 U14
U 1 1 5F413A64
P 13700 3050
F 0 "U14" H 13700 5487 60  0000 C CNN
F 1 "Teensy3.6" H 13700 5381 60  0000 C CNN
F 2 "" H 13700 3100 60  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Sparkfun%20PDFs/DEV-14058_Web.pdf" H 13700 5381 60  0001 C CNN
F 4 "SparkFun Electronics" H 13700 3050 50  0001 C CNN "Manufacturer"
F 5 "DEV-14058" H 13700 3050 50  0001 C CNN "Part #"
	1    13700 3050
	1    0    0    -1  
$EndComp
NoConn ~ 12550 3300
NoConn ~ 12550 3400
NoConn ~ 12550 3500
NoConn ~ 12550 3600
NoConn ~ 12550 3700
NoConn ~ 12550 3800
NoConn ~ 12550 3900
NoConn ~ 12550 4000
NoConn ~ 12550 4100
NoConn ~ 12550 4250
NoConn ~ 12550 4350
NoConn ~ 12550 4450
NoConn ~ 12550 4550
NoConn ~ 12550 4650
NoConn ~ 12550 4750
NoConn ~ 12550 4850
NoConn ~ 12550 4950
NoConn ~ 12550 5050
NoConn ~ 12550 5150
NoConn ~ 14850 3350
NoConn ~ 14850 3450
NoConn ~ 14850 3550
NoConn ~ 14850 3650
NoConn ~ 14850 3750
NoConn ~ 14850 3850
NoConn ~ 14850 3950
NoConn ~ 14850 4050
NoConn ~ 14850 4150
NoConn ~ 14850 4250
NoConn ~ 14850 4350
NoConn ~ 14850 4450
NoConn ~ 14850 4550
NoConn ~ 14850 4650
NoConn ~ 14850 4750
NoConn ~ 14850 4850
NoConn ~ 14850 4950
NoConn ~ 14850 5050
NoConn ~ 14850 5150
Wire Wire Line
	1850 1450 1850 1500
Wire Wire Line
	1850 1400 1850 1450
Connection ~ 1850 1450
$Comp
L power:GND #PWR0121
U 1 1 5F35A16A
P 1850 1450
F 0 "#PWR0121" H 1850 1200 50  0001 C CNN
F 1 "GND" V 1855 1322 50  0000 R CNN
F 2 "" H 1850 1450 50  0001 C CNN
F 3 "" H 1850 1450 50  0001 C CNN
	1    1850 1450
	0    1    1    0   
$EndComp
NoConn ~ 1850 1250
Wire Wire Line
	1850 1150 1850 1050
Wire Wire Line
	1850 950  1850 900 
Text Label 1850 1150 0    50   ~ 0
Vin
$Comp
L power:GND #PWR0122
U 1 1 5F4F5E01
P 2800 900
F 0 "#PWR0122" H 2800 650 50  0001 C CNN
F 1 "GND" V 2900 850 50  0000 R CNN
F 2 "" H 2800 900 50  0001 C CNN
F 3 "" H 2800 900 50  0001 C CNN
	1    2800 900 
	0    1    1    0   
$EndComp
Connection ~ 1850 900 
Wire Wire Line
	1850 900  1850 850 
$Comp
L Custom_parts:Conn_01x05_Male J6
U 1 1 5F515681
P 1650 1050
F 0 "J6" H 1750 1400 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1750 1300 50  0000 C CNN
F 2 "Custom Footprints:Ref_only" H 1650 1050 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/tsm.pdf" H 1650 1050 50  0001 C CNN
F 4 "Samtec Inc." H 1650 1050 50  0001 C CNN "Manufacturer"
F 5 "TSM-105-01-T-SV" H 1650 1050 50  0001 C CNN "Part #"
	1    1650 1050
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:Conn_01x04_Male J9
U 1 1 5F551B78
P 3000 1050
F 0 "J9" H 3100 700 50  0000 R CNN
F 1 "Conn_01x04_Male" H 3400 800 50  0000 R CNN
F 2 "Custom Footprints:Ref_only" H 3000 1050 50  0001 C CNN
F 3 "http://suddendocs.samtec.com/catalog_english/tsm.pdf" H 3000 1050 50  0001 C CNN
F 4 "Samtec Inc." H 3000 1050 50  0001 C CNN "Manufacturer"
F 5 "TSM-104-01-T-SV" H 3000 1050 50  0001 C CNN "Part #"
	1    3000 1050
	-1   0    0    1   
$EndComp
Wire Wire Line
	2800 950  2800 900 
Wire Wire Line
	2800 1050 2800 1150
Text Label 2800 1150 2    50   ~ 0
12V
Connection ~ 2800 900 
Wire Wire Line
	2800 900  2800 850 
$Comp
L power:GND #PWR0123
U 1 1 5F56462A
P 1850 900
F 0 "#PWR0123" H 1850 650 50  0001 C CNN
F 1 "GND" V 1750 850 50  0000 R CNN
F 2 "" H 1850 900 50  0001 C CNN
F 3 "" H 1850 900 50  0001 C CNN
	1    1850 900 
	0    -1   -1   0   
$EndComp
Text Notes 2100 1100 0    50   ~ 0
Header pins\nto connect\n12V SEPIC \nDC-DC \nconverter
NoConn ~ 1850 1800
Text Label 5500 6650 0    50   ~ 0
OA1_input
Text Label 5500 7500 0    50   ~ 0
OA2_input
Text Label 5550 8350 0    50   ~ 0
OA3_input
Text Label 5550 9150 0    50   ~ 0
OA4_input
Wire Wire Line
	5500 6650 5400 6650
Wire Wire Line
	5500 7500 5400 7500
Wire Wire Line
	5550 8350 5450 8350
Wire Wire Line
	5550 9150 5450 9150
Text Notes 1300 10150 0    59   ~ 0
Current sense voltage ouput
Text Notes 4600 6150 0    59   ~ 0
Op-amp input mux
Text Label 9600 2900 3    50   ~ 0
SCK0
Text Label 12550 2100 2    50   ~ 0
MOSI0
Text Label 6700 6900 2    50   ~ 0
SCK0
Text Label 6700 6700 2    50   ~ 0
MOSI0
Wire Wire Line
	2650 10350 2650 10450
Wire Wire Line
	2650 10550 2650 10650
Wire Wire Line
	2650 10750 2650 10850
Wire Wire Line
	2650 10950 2650 11050
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
Text Notes 15800 3000 1    50   ~ 0
--ADC1--
Text Notes 15850 2400 2    50   ~ 0
ADC1
Text Notes 15850 2500 2    50   ~ 0
ADC0
Text Notes 15800 2100 1    50   ~ 0
-------ADC0------
Text Notes 15850 3100 2    50   ~ 0
ADC0
Text Notes 15850 3200 2    50   ~ 0
ADC0
Text Notes 11850 3100 2    50   ~ 0
ADC1
Text Notes 11850 3200 2    50   ~ 0
ADC1
Text Notes 16000 3600 1    50   ~ 0
https://forum.pjrc.com/attachment.php?attachmentid=10666&d=1495536536
$Comp
L Device:CP1_Small C1
U 1 1 5F41CA67
P 1150 3600
F 0 "C1" H 1100 3900 50  0000 L CNN
F 1 "14000uF" H 950 3800 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 1150 3600 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/United%20Chemi-Con%20PDFs/LBK_Series.pdf" H 1150 3600 50  0001 C CNN
F 4 "United Chemi-Con" H 1150 3600 50  0001 C CNN "Manufacturer"
F 5 "ELBK250ELL143AM40S" H 1150 3600 50  0001 C CNN "Part #"
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
L Device:CP1_Small C2
U 1 1 5F422553
P 1150 4150
F 0 "C2" H 1100 4450 50  0000 L CNN
F 1 "14000uF" H 950 4350 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 1150 4150 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/United%20Chemi-Con%20PDFs/LBK_Series.pdf" H 1150 4150 50  0001 C CNN
F 4 "United Chemi-Con" H 1150 4150 50  0001 C CNN "Manufacturer"
F 5 "ELBK250ELL143AM40S" H 1150 4150 50  0001 C CNN "Part #"
	1    1150 4150
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
L Device:CP1_Small C3
U 1 1 5F45FB0D
P 1150 4700
F 0 "C3" H 1100 5000 50  0000 L CNN
F 1 "14000uF" H 950 4900 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 1150 4700 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/United%20Chemi-Con%20PDFs/LBK_Series.pdf" H 1150 4700 50  0001 C CNN
F 4 "United Chemi-Con" H 1150 4700 50  0001 C CNN "Manufacturer"
F 5 "ELBK250ELL143AM40S" H 1150 4700 50  0001 C CNN "Part #"
	1    1150 4700
	1    0    0    -1  
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
L Device:CP1_Small C4
U 1 1 5F465A2E
P 1150 5250
F 0 "C4" H 1100 5550 50  0000 L CNN
F 1 "14000uF" H 950 5450 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D18.0mm_P7.50mm" H 1150 5250 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/United%20Chemi-Con%20PDFs/LBK_Series.pdf" H 1150 5250 50  0001 C CNN
F 4 "United Chemi-Con" H 1150 5250 50  0001 C CNN "Manufacturer"
F 5 "ELBK250ELL143AM40S" H 1150 5250 50  0001 C CNN "Part #"
	1    1150 5250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0130
U 1 1 5F465A34
P 1150 5350
F 0 "#PWR0130" H 1150 5100 50  0001 C CNN
F 1 "GND" H 1150 5350 50  0000 R CNN
F 2 "" H 1150 5350 50  0001 C CNN
F 3 "" H 1150 5350 50  0001 C CNN
	1    1150 5350
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
	1400 4050 1150 4050
Wire Wire Line
	1400 4600 1150 4600
Wire Wire Line
	1400 5150 1150 5150
Wire Wire Line
	1150 5150 850  5150
Wire Wire Line
	850  5150 850  4600
Wire Wire Line
	850  3500 1150 3500
Connection ~ 1150 5150
Connection ~ 1150 3500
Wire Wire Line
	1150 4050 850  4050
Connection ~ 1150 4050
Connection ~ 850  4050
Wire Wire Line
	850  4050 850  3500
Wire Wire Line
	1150 4600 850  4600
Connection ~ 1150 4600
Connection ~ 850  4600
Wire Wire Line
	850  4600 850  4050
$Comp
L Device:Jumper_NO_Small JP1
U 1 1 5F4EBD0C
P 1850 3500
F 0 "JP1" H 1850 3600 50  0000 C CNN
F 1 "LED wire" H 1850 3400 50  0000 C CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P7.2mm_D2.4mm_OD3.6mm" H 1850 3500 50  0001 C CNN
F 3 "~" H 1850 3500 50  0001 C CNN
	1    1850 3500
	1    0    0    -1  
$EndComp
Text Label 1500 3500 0    50   ~ 0
LED1+
Wire Wire Line
	1750 3500 1400 3500
Connection ~ 1400 3500
$Comp
L Device:Jumper_NO_Small JP2
U 1 1 5F4F518E
P 1850 4050
F 0 "JP2" H 1850 4150 50  0000 C CNN
F 1 "LED wire" H 1850 3950 50  0000 C CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P7.2mm_D2.4mm_OD3.6mm" H 1850 4050 50  0001 C CNN
F 3 "~" H 1850 4050 50  0001 C CNN
	1    1850 4050
	1    0    0    -1  
$EndComp
Text Label 1500 4050 0    50   ~ 0
LED2+
Wire Wire Line
	1750 4050 1400 4050
$Comp
L Device:Jumper_NO_Small JP3
U 1 1 5F4FB4E9
P 1850 4600
F 0 "JP3" H 1850 4700 50  0000 C CNN
F 1 "LED wire" H 1850 4500 50  0000 C CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P7.2mm_D2.4mm_OD3.6mm" H 1850 4600 50  0001 C CNN
F 3 "~" H 1850 4600 50  0001 C CNN
	1    1850 4600
	1    0    0    -1  
$EndComp
Text Label 1500 4600 0    50   ~ 0
LED3+
Wire Wire Line
	1750 4600 1400 4600
$Comp
L Device:Jumper_NO_Small JP4
U 1 1 5F501F26
P 1850 5150
F 0 "JP4" H 1850 5250 50  0000 C CNN
F 1 "LED wire" H 1850 5050 50  0000 C CNN
F 2 "Connector_Wire:SolderWire-2.5sqmm_1x02_P7.2mm_D2.4mm_OD3.6mm" H 1850 5150 50  0001 C CNN
F 3 "~" H 1850 5150 50  0001 C CNN
	1    1850 5150
	1    0    0    -1  
$EndComp
Text Label 1500 5150 0    50   ~ 0
LED4+
Wire Wire Line
	1750 5150 1400 5150
Text Label 1950 4050 0    50   ~ 0
LED2-
Text Label 1950 4600 0    50   ~ 0
LED3-
Text Label 1950 5150 0    50   ~ 0
LED4-
Text Label 3050 4050 0    50   ~ 0
LED1+
Text Label 3050 3950 0    50   ~ 0
LED1-
$Comp
L power:GND #PWR0135
U 1 1 5F50FCB4
P 2650 4250
F 0 "#PWR0135" H 2650 4000 50  0001 C CNN
F 1 "GND" H 2850 4250 50  0000 R CNN
F 2 "" H 2650 4250 50  0001 C CNN
F 3 "" H 2650 4250 50  0001 C CNN
	1    2650 4250
	1    0    0    -1  
$EndComp
Text Label 3050 5000 0    50   ~ 0
LED3+
Text Label 3050 5100 0    50   ~ 0
LED3-
$Comp
L power:GND #PWR0136
U 1 1 5F523406
P 2650 5600
F 0 "#PWR0136" H 2650 5350 50  0001 C CNN
F 1 "GND" H 2850 5600 50  0000 R CNN
F 2 "" H 2650 5600 50  0001 C CNN
F 3 "" H 2650 5600 50  0001 C CNN
	1    2650 5600
	1    0    0    -1  
$EndComp
Text Label 4150 3850 0    50   ~ 0
LED2+
Text Label 4150 3550 0    50   ~ 0
LED2-
$Comp
L power:GND #PWR0137
U 1 1 5F52B343
P 3750 4250
F 0 "#PWR0137" H 3750 4000 50  0001 C CNN
F 1 "GND" H 3950 4250 50  0000 R CNN
F 2 "" H 3750 4250 50  0001 C CNN
F 3 "" H 3750 4250 50  0001 C CNN
	1    3750 4250
	1    0    0    -1  
$EndComp
Text Label 4150 4800 0    50   ~ 0
LED4+
Text Label 4150 4700 0    50   ~ 0
LED4-
$Comp
L power:GND #PWR0138
U 1 1 5F5331E6
P 3750 5600
F 0 "#PWR0138" H 3750 5350 50  0001 C CNN
F 1 "GND" H 3950 5600 50  0000 R CNN
F 2 "" H 3750 5600 50  0001 C CNN
F 3 "" H 3750 5600 50  0001 C CNN
	1    3750 5600
	1    0    0    -1  
$EndComp
Text Label 3050 3850 0    50   ~ 0
LED1+
Text Label 3050 3650 0    50   ~ 0
LED1+
Text Label 3050 3450 0    50   ~ 0
LED1+
Text Label 3050 3750 0    50   ~ 0
LED1-
Text Label 3050 3550 0    50   ~ 0
LED1-
Text Label 3050 3350 0    50   ~ 0
LED1-
Text Label 4150 4050 0    50   ~ 0
LED2+
Text Label 4150 3650 0    50   ~ 0
LED2+
Text Label 4150 3450 0    50   ~ 0
LED2+
Text Label 4150 3950 0    50   ~ 0
LED2-
Text Label 4150 3750 0    50   ~ 0
LED2-
Text Label 4150 3350 0    50   ~ 0
LED2-
Text Label 3050 5400 0    50   ~ 0
LED3+
Text Label 3050 5200 0    50   ~ 0
LED3+
Text Label 3050 4800 0    50   ~ 0
LED3+
Text Label 3050 5300 0    50   ~ 0
LED3-
Text Label 3050 4900 0    50   ~ 0
LED3-
Text Label 3050 4700 0    50   ~ 0
LED3-
Text Label 4150 5400 0    50   ~ 0
LED4+
Text Label 4150 5200 0    50   ~ 0
LED4+
Text Label 4150 5000 0    50   ~ 0
LED4+
Text Label 4150 5300 0    50   ~ 0
LED4-
Text Label 4150 5100 0    50   ~ 0
LED4-
Text Label 4150 4900 0    50   ~ 0
LED4-
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
L power:GND #PWR0149
U 1 1 5F6566C3
P 1200 10150
F 0 "#PWR0149" H 1200 9900 50  0001 C CNN
F 1 "GND" H 1450 10100 50  0000 R CNN
F 2 "" H 1200 10150 50  0001 C CNN
F 3 "" H 1200 10150 50  0001 C CNN
	1    1200 10150
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0150
U 1 1 5F6566C9
P 1600 10450
F 0 "#PWR0150" H 1600 10200 50  0001 C CNN
F 1 "GND" V 1600 10300 50  0000 R CNN
F 2 "" H 1600 10450 50  0001 C CNN
F 3 "" H 1600 10450 50  0001 C CNN
	1    1600 10450
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0151
U 1 1 5F6566CF
P 1600 10650
F 0 "#PWR0151" H 1600 10400 50  0001 C CNN
F 1 "GND" V 1600 10500 50  0000 R CNN
F 2 "" H 1600 10650 50  0001 C CNN
F 3 "" H 1600 10650 50  0001 C CNN
	1    1600 10650
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0152
U 1 1 5F6566D5
P 1600 10850
F 0 "#PWR0152" H 1600 10600 50  0001 C CNN
F 1 "GND" V 1600 10700 50  0000 R CNN
F 2 "" H 1600 10850 50  0001 C CNN
F 3 "" H 1600 10850 50  0001 C CNN
	1    1600 10850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0153
U 1 1 5F6566DB
P 1600 11050
F 0 "#PWR0153" H 1600 10800 50  0001 C CNN
F 1 "GND" V 1600 10900 50  0000 R CNN
F 2 "" H 1600 11050 50  0001 C CNN
F 3 "" H 1600 11050 50  0001 C CNN
	1    1600 11050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1600 10350 2250 10350
Wire Wire Line
	1600 10550 2250 10550
Wire Wire Line
	1600 10750 2250 10750
Wire Wire Line
	1600 10950 2250 10950
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
Wire Wire Line
	6150 1300 6050 1300
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
Wire Wire Line
	3900 9400 4700 9400
Connection ~ 4700 9400
Wire Wire Line
	4700 9400 4700 9450
Connection ~ 4700 8600
Wire Wire Line
	4700 8600 4700 8650
Connection ~ 3900 8600
Wire Wire Line
	3900 8600 3900 9400
Connection ~ 4650 7750
Wire Wire Line
	4650 7750 4650 7800
Connection ~ 3900 7750
Wire Wire Line
	3900 7750 3900 8600
Connection ~ 4650 6900
Wire Wire Line
	4650 6900 4650 6950
Connection ~ 3900 6900
Wire Wire Line
	3900 6900 3900 7750
$Comp
L Custom_parts:BAT54SDW D6
U 1 1 5F442A0D
P 6650 1950
F 0 "D6" H 6900 2250 60  0000 C CNN
F 1 "BAT54SDW" H 6900 2150 60  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-363_SC-70-6" H 6850 2150 60  0001 L CNN
F 3 "https://www.diodes.com/assets/Datasheets/ds30152.pdf" H 6850 2250 60  0001 L CNN
F 4 "Diodes Incorporated" H 6650 1950 50  0001 C CNN "Manufacturer"
F 5 "BAT54SDW-7-F" H 6650 1950 50  0001 C CNN "Part #"
	1    6650 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 1300 6050 1850
Wire Wire Line
	6050 1850 6450 1850
Connection ~ 6050 1300
Wire Wire Line
	6050 1300 5900 1300
Wire Wire Line
	7400 1200 7450 1200
Wire Wire Line
	7450 1200 7450 1850
Wire Wire Line
	7450 1850 7200 1850
$Comp
L power:GND #PWR0157
U 1 1 5F457916
P 6450 2050
F 0 "#PWR0157" H 6450 1800 50  0001 C CNN
F 1 "GND" H 6550 1900 50  0000 R CNN
F 2 "" H 6450 2050 50  0001 C CNN
F 3 "" H 6450 2050 50  0001 C CNN
	1    6450 2050
	0    1    1    0   
$EndComp
$Comp
L Custom_parts:BDJ0GA5WEFJ-E2 U4
U 1 1 5F46185F
P 6050 2600
F 0 "U4" H 6750 2857 60  0000 C CNN
F 1 "BDJ0GA5WEFJ-E2" H 6750 2751 60  0000 C CNN
F 2 "Custom Footprints:BDJ0GA5WEFJ-E2" H 6800 2840 60  0001 C CNN
F 3 "http://rohmfs.rohm.com/en/products/databook/datasheet/ic/power/linear_regulator/bdxxga5wefj-e.pdf" H 6750 2751 60  0001 C CNN
F 4 "Rohm Semiconductor" H 6050 2600 50  0001 C CNN "Manufacturer"
F 5 "BDJ0GA5WEFJ-E2" H 6050 2600 50  0001 C CNN "Part #"
	1    6050 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0158
U 1 1 5F46361B
P 7200 2250
F 0 "#PWR0158" H 7200 2000 50  0001 C CNN
F 1 "GND" H 7300 2100 50  0000 R CNN
F 2 "" H 7200 2250 50  0001 C CNN
F 3 "" H 7200 2250 50  0001 C CNN
	1    7200 2250
	0    -1   -1   0   
$EndComp
Text Label 7450 2050 0    50   ~ 0
12V
Wire Wire Line
	7450 2900 7500 2900
Wire Wire Line
	7500 2900 7500 2600
Wire Wire Line
	7500 2600 7450 2600
Text Label 6000 2250 0    50   ~ 0
10V-analog
Wire Wire Line
	7200 2050 7500 2050
Connection ~ 7500 2600
Wire Wire Line
	6050 2600 6000 2600
Wire Wire Line
	6000 2600 6000 2250
Wire Wire Line
	6000 2250 6450 2250
NoConn ~ 6050 2700
Wire Wire Line
	6700 3250 6300 3250
Wire Wire Line
	6000 3250 6000 2800
Wire Wire Line
	6000 2800 6050 2800
$Comp
L power:GND #PWR0159
U 1 1 5F4C5626
P 6300 3250
F 0 "#PWR0159" H 6300 3000 50  0001 C CNN
F 1 "GND" H 6350 3100 50  0000 R CNN
F 2 "" H 6300 3250 50  0001 C CNN
F 3 "" H 6300 3250 50  0001 C CNN
	1    6300 3250
	1    0    0    -1  
$EndComp
Connection ~ 6300 3250
Wire Wire Line
	6300 3250 6000 3250
Wire Wire Line
	7500 2050 7500 2600
$Comp
L Mechanical:Heatsink_Pad_2Pin HS1
U 1 1 5F44CB6E
P 10650 10650
F 0 "HS1" H 10550 10900 50  0000 L CNN
F 1 "HS-MOS" H 10500 10800 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_634-15ABPE" H 10662 10650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/634%20Heat%20Sinks.pdf" H 10662 10650 50  0001 C CNN
F 4 "Wakefield-Vette" H 10650 10650 50  0001 C CNN "Manufacturer"
F 5 "634-15ABPE" H 10650 10650 50  0001 C CNN "Part #"
	1    10650 10650
	1    0    0    -1  
$EndComp
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
Text Label 11350 7350 0    50   ~ 0
LED1-
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
OA1_input
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
Wire Wire Line
	11350 8050 11350 7750
Connection ~ 11350 7750
$Comp
L Mechanical:Heatsink HS2
U 1 1 5F527EE9
P 11000 10700
F 0 "HS2" H 10900 11000 50  0000 L CNN
F 1 "HS-PCB" H 10850 10900 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_910-40-2-23-2-B-0" H 11012 10700 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/910_Series_Pin.pdf" H 11012 10700 50  0001 C CNN
F 4 "Wakefield-Vette" H 11000 10700 50  0001 C CNN "Manufacturer"
F 5 "910-40-2-23-2-B-0" H 11000 10700 50  0001 C CNN "Part #"
	1    11000 10700
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:Heatsink_Pad_2Pin HS3
U 1 1 5F5289B1
P 11350 10650
F 0 "HS3" H 11250 10900 50  0000 L CNN
F 1 "HS-RES" H 11200 10800 50  0000 L CNN
F 2 "Custom Footprints:Heatsink_634-15ABPE" H 11362 10650 50  0001 C CNN
F 3 "https://media.digikey.com/pdf/Data%20Sheets/Wakefield%20Thermal%20PDFs/634%20Heat%20Sinks.pdf" H 11362 10650 50  0001 C CNN
F 4 "Wakefield-Vette" H 11350 10650 50  0001 C CNN "Manufacturer"
F 5 "634-15ABPE" H 11350 10650 50  0001 C CNN "Part #"
	1    11350 10650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R3
U 1 1 5F52FEC2
P 11350 8150
F 0 "R3" H 11400 8200 50  0000 L CNN
F 1 "5" H 11400 8100 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 11350 8150 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 11350 8150 50  0001 C CNN
F 4 "Ohmite" H 11350 8150 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 11350 8150 50  0001 C CNN "Part #"
	1    11350 8150
	1    0    0    -1  
$EndComp
Connection ~ 11350 8050
$Comp
L power:GND #PWR0162
U 1 1 5F531B47
P 11350 8250
F 0 "#PWR0162" H 11350 8000 50  0001 C CNN
F 1 "GND" H 11400 8100 50  0000 R CNN
F 2 "" H 11350 8250 50  0001 C CNN
F 3 "" H 11350 8250 50  0001 C CNN
	1    11350 8250
	1    0    0    -1  
$EndComp
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
Isense_1
$Comp
L Device:Q_NMOS_GDS Q3
U 1 1 5F587F3A
P 11250 8900
F 0 "Q3" H 11454 8946 50  0000 L CNN
F 1 "SUM70060E" H 11454 8855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 11450 9000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/65383/sum70060e.pdf" H 11250 8900 50  0001 C CNN
F 4 "Vishay Siliconix" H 11250 8900 50  0001 C CNN "Manufacturer"
F 5 "SUM70060E-GE3" H 11250 8900 50  0001 C CNN "Part #"
	1    11250 8900
	1    0    0    -1  
$EndComp
Text Label 11350 8700 0    50   ~ 0
LED2-
Wire Wire Line
	9950 8900 10450 8900
Text Label 9350 8800 2    50   ~ 0
OA2_input
$Comp
L Device:C_Small C24
U 1 1 5F587F4D
P 10450 9100
F 0 "C24" H 10600 9100 50  0000 C CNN
F 1 "2200pF" H 10600 9000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 10450 9100 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 10450 9100 50  0001 C CNN
F 4 "KEMET" H 10450 9100 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 10450 9100 50  0001 C CNN "Part #"
	1    10450 9100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	10450 8900 10450 9000
Connection ~ 10450 8900
NoConn ~ 9650 9200
$Comp
L Device:C_Small C22
U 1 1 5F587F58
P 9650 9300
F 0 "C22" V 9850 9250 50  0000 L CNN
F 1 "2.2uF" V 9750 9200 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 9650 9300 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 9650 9300 50  0001 C CNN
F 4 "Taiyo Yuden" H 9650 9300 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 9650 9300 50  0001 C CNN "Part #"
	1    9650 9300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C21
U 1 1 5F587F60
P 9650 8500
F 0 "C21" V 9850 8450 50  0000 L CNN
F 1 "2.2uF" V 9750 8400 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 9650 8500 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 9650 8500 50  0001 C CNN
F 4 "Taiyo Yuden" H 9650 8500 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 9650 8500 50  0001 C CNN "Part #"
	1    9650 8500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9550 9200 9550 9300
Wire Wire Line
	9550 8600 9550 8500
$Comp
L power:GND #PWR0163
U 1 1 5F587F68
P 9750 8500
F 0 "#PWR0163" H 9750 8250 50  0001 C CNN
F 1 "GND" V 9750 8400 50  0000 R CNN
F 2 "" H 9750 8500 50  0001 C CNN
F 3 "" H 9750 8500 50  0001 C CNN
	1    9750 8500
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0164
U 1 1 5F587F6E
P 9750 9300
F 0 "#PWR0164" H 9750 9050 50  0001 C CNN
F 1 "GND" V 9750 9200 50  0000 R CNN
F 2 "" H 9750 9300 50  0001 C CNN
F 3 "" H 9750 9300 50  0001 C CNN
	1    9750 9300
	0    -1   -1   0   
$EndComp
Text Label 9550 9300 2    50   ~ 0
-1.8V-analog
Text Label 9550 8500 2    50   ~ 0
10V-analog
Wire Wire Line
	9350 9000 9000 9000
Wire Wire Line
	9000 9000 9000 9550
Wire Wire Line
	9000 9550 10450 9550
Wire Wire Line
	10450 9550 10450 9200
$Comp
L Device:D_Zener_Small_ALT D12
U 1 1 5F587F7C
P 12000 8900
F 0 "D12" V 11954 8970 50  0000 L CNN
F 1 "TVS_Diode" V 12045 8970 50  0000 L CNN
F 2 "Custom Footprints:DO-214AA" V 12000 8900 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/824520581.pdf" V 12000 8900 50  0001 C CNN
F 4 "Würth Elektronik" V 12000 8900 50  0001 C CNN "Manufacturer"
F 5 "824520581" V 12000 8900 50  0001 C CNN "Part #"
	1    12000 8900
	0    1    1    0   
$EndComp
Wire Wire Line
	11350 8700 12000 8700
Wire Wire Line
	12000 8700 12000 8800
Wire Wire Line
	12000 9000 12000 9100
Wire Wire Line
	12000 9100 11350 9100
$Comp
L Device:R_POT_TRIM RV3
U 1 1 5F587F88
P 10900 9050
F 0 "RV3" V 10785 9050 50  0000 C CNN
F 1 "R_POT_TRIM" V 10694 9050 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 10900 9050 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 10900 9050 50  0001 C CNN
F 4 "Bourns Inc." V 10900 9050 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 10900 9050 50  0001 C CNN "Part #"
	1    10900 9050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11050 8900 10900 8900
Wire Wire Line
	10750 9050 10750 8900
Wire Wire Line
	10450 8900 10750 8900
Wire Wire Line
	10750 9550 10450 9550
Connection ~ 10450 9550
Wire Wire Line
	10900 9400 11350 9400
Wire Wire Line
	11350 9400 11350 9100
Connection ~ 11350 9100
$Comp
L Device:R_Small R4
U 1 1 5F587F98
P 11350 9500
F 0 "R4" H 11400 9550 50  0000 L CNN
F 1 "5" H 11400 9450 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 11350 9500 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 11350 9500 50  0001 C CNN
F 4 "Ohmite" H 11350 9500 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 11350 9500 50  0001 C CNN "Part #"
	1    11350 9500
	1    0    0    -1  
$EndComp
Connection ~ 11350 9400
$Comp
L power:GND #PWR0165
U 1 1 5F587F9F
P 11350 9600
F 0 "#PWR0165" H 11350 9350 50  0001 C CNN
F 1 "GND" H 11400 9450 50  0000 R CNN
F 2 "" H 11350 9600 50  0001 C CNN
F 3 "" H 11350 9600 50  0001 C CNN
	1    11350 9600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM RV4
U 1 1 5F587FA7
P 10900 9550
F 0 "RV4" V 10785 9550 50  0000 C CNN
F 1 "R_POT_TRIM" V 10694 9550 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 10900 9550 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 10900 9550 50  0001 C CNN
F 4 "Bourns Inc." V 10900 9550 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 10900 9550 50  0001 C CNN "Part #"
	1    10900 9550
	0    -1   -1   0   
$EndComp
NoConn ~ 11050 9050
NoConn ~ 11050 9550
Text Label 11350 9300 0    50   ~ 0
Isense_2
Text Label 14850 9300 0    50   ~ 0
Isense_4
NoConn ~ 14550 9550
NoConn ~ 14550 9050
$Comp
L Device:R_POT_TRIM RV8
U 1 1 5F60DE2D
P 14400 9550
F 0 "RV8" V 14285 9550 50  0000 C CNN
F 1 "R_POT_TRIM" V 14194 9550 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 14400 9550 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 14400 9550 50  0001 C CNN
F 4 "Bourns Inc." V 14400 9550 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 14400 9550 50  0001 C CNN "Part #"
	1    14400 9550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0166
U 1 1 5F60DE25
P 14850 9600
F 0 "#PWR0166" H 14850 9350 50  0001 C CNN
F 1 "GND" H 14900 9450 50  0000 R CNN
F 2 "" H 14850 9600 50  0001 C CNN
F 3 "" H 14850 9600 50  0001 C CNN
	1    14850 9600
	1    0    0    -1  
$EndComp
Connection ~ 14850 9400
$Comp
L Device:R_Small R6
U 1 1 5F60DE1E
P 14850 9500
F 0 "R6" H 14900 9550 50  0000 L CNN
F 1 "5" H 14900 9450 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 14850 9500 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 14850 9500 50  0001 C CNN
F 4 "Ohmite" H 14850 9500 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 14850 9500 50  0001 C CNN "Part #"
	1    14850 9500
	1    0    0    -1  
$EndComp
Connection ~ 14850 9100
Wire Wire Line
	14850 9400 14850 9100
Wire Wire Line
	14400 9400 14850 9400
Connection ~ 13950 9550
Wire Wire Line
	14250 9550 13950 9550
Wire Wire Line
	13950 8900 14250 8900
Wire Wire Line
	14250 9050 14250 8900
Wire Wire Line
	14550 8900 14400 8900
$Comp
L Device:R_POT_TRIM RV7
U 1 1 5F60DE0E
P 14400 9050
F 0 "RV7" V 14285 9050 50  0000 C CNN
F 1 "R_POT_TRIM" V 14194 9050 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 14400 9050 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 14400 9050 50  0001 C CNN
F 4 "Bourns Inc." V 14400 9050 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 14400 9050 50  0001 C CNN "Part #"
	1    14400 9050
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15500 9100 14850 9100
Wire Wire Line
	15500 9000 15500 9100
Wire Wire Line
	15500 8700 15500 8800
Wire Wire Line
	14850 8700 15500 8700
$Comp
L Device:D_Zener_Small_ALT D14
U 1 1 5F60DE02
P 15500 8900
F 0 "D14" V 15454 8970 50  0000 L CNN
F 1 "TVS_Diode" V 15545 8970 50  0000 L CNN
F 2 "Custom Footprints:DO-214AA" V 15500 8900 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/824520581.pdf" V 15500 8900 50  0001 C CNN
F 4 "Würth Elektronik" V 15500 8900 50  0001 C CNN "Manufacturer"
F 5 "824520581" V 15500 8900 50  0001 C CNN "Part #"
	1    15500 8900
	0    1    1    0   
$EndComp
Wire Wire Line
	13950 9550 13950 9200
Wire Wire Line
	12500 9550 13950 9550
Wire Wire Line
	12500 9000 12500 9550
Wire Wire Line
	12850 9000 12500 9000
Text Label 13050 8500 2    50   ~ 0
10V-analog
Text Label 13050 9300 2    50   ~ 0
-1.8V-analog
$Comp
L power:GND #PWR0167
U 1 1 5F60DDF4
P 13250 9300
F 0 "#PWR0167" H 13250 9050 50  0001 C CNN
F 1 "GND" V 13250 9200 50  0000 R CNN
F 2 "" H 13250 9300 50  0001 C CNN
F 3 "" H 13250 9300 50  0001 C CNN
	1    13250 9300
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0168
U 1 1 5F60DDEE
P 13250 8500
F 0 "#PWR0168" H 13250 8250 50  0001 C CNN
F 1 "GND" V 13250 8400 50  0000 R CNN
F 2 "" H 13250 8500 50  0001 C CNN
F 3 "" H 13250 8500 50  0001 C CNN
	1    13250 8500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13050 8600 13050 8500
Wire Wire Line
	13050 9200 13050 9300
$Comp
L Device:C_Small C27
U 1 1 5F60DDE6
P 13150 8500
F 0 "C27" V 13350 8450 50  0000 L CNN
F 1 "2.2uF" V 13250 8400 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 13150 8500 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 13150 8500 50  0001 C CNN
F 4 "Taiyo Yuden" H 13150 8500 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 13150 8500 50  0001 C CNN "Part #"
	1    13150 8500
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C28
U 1 1 5F60DDDE
P 13150 9300
F 0 "C28" V 13350 9250 50  0000 L CNN
F 1 "2.2uF" V 13250 9200 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 13150 9300 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 13150 9300 50  0001 C CNN
F 4 "Taiyo Yuden" H 13150 9300 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 13150 9300 50  0001 C CNN "Part #"
	1    13150 9300
	0    1    1    0   
$EndComp
NoConn ~ 13150 9200
Connection ~ 13950 8900
Wire Wire Line
	13950 8900 13950 9000
$Comp
L Device:C_Small C30
U 1 1 5F60DDD3
P 13950 9100
F 0 "C30" H 14100 9100 50  0000 C CNN
F 1 "2200pF" H 14100 9000 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 13950 9100 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 13950 9100 50  0001 C CNN
F 4 "KEMET" H 13950 9100 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 13950 9100 50  0001 C CNN "Part #"
	1    13950 9100
	-1   0    0    -1  
$EndComp
Text Label 12850 8800 2    50   ~ 0
OA4_input
Wire Wire Line
	13450 8900 13950 8900
Text Label 14850 8700 0    50   ~ 0
LED4-
$Comp
L Device:Q_NMOS_GDS Q5
U 1 1 5F60DDC0
P 14750 8900
F 0 "Q5" H 14954 8946 50  0000 L CNN
F 1 "SUM70060E" H 14954 8855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 14950 9000 50  0001 C CNN
F 3 "https://www.vishay.com/docs/65383/sum70060e.pdf" H 14750 8900 50  0001 C CNN
F 4 "Vishay Siliconix" H 14750 8900 50  0001 C CNN "Manufacturer"
F 5 "SUM70060E-GE3" H 14750 8900 50  0001 C CNN "Part #"
	1    14750 8900
	1    0    0    -1  
$EndComp
Text Label 14850 7950 0    50   ~ 0
Isense_3
NoConn ~ 14550 8200
NoConn ~ 14550 7700
$Comp
L Device:R_POT_TRIM RV6
U 1 1 5F599C07
P 14400 8200
F 0 "RV6" V 14285 8200 50  0000 C CNN
F 1 "R_POT_TRIM" V 14194 8200 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 14400 8200 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 14400 8200 50  0001 C CNN
F 4 "Bourns Inc." V 14400 8200 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 14400 8200 50  0001 C CNN "Part #"
	1    14400 8200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0169
U 1 1 5F599BFF
P 14850 8250
F 0 "#PWR0169" H 14850 8000 50  0001 C CNN
F 1 "GND" H 14900 8100 50  0000 R CNN
F 2 "" H 14850 8250 50  0001 C CNN
F 3 "" H 14850 8250 50  0001 C CNN
	1    14850 8250
	1    0    0    -1  
$EndComp
Connection ~ 14850 8050
$Comp
L Device:R_Small R5
U 1 1 5F599BF8
P 14850 8150
F 0 "R5" H 14900 8200 50  0000 L CNN
F 1 "5" H 14900 8100 50  0000 L CNN
F 2 "Custom Footprints:TO-252_resistor" H 14850 8150 50  0001 C CNN
F 3 "http://www.ohmite.com/assets/docs/res_tkh.pdf?r=false" H 14850 8150 50  0001 C CNN
F 4 "Ohmite" H 14850 8150 50  0001 C CNN "Manufacturer"
F 5 "TKH45P5R00FE-TR" H 14850 8150 50  0001 C CNN "Part #"
	1    14850 8150
	1    0    0    -1  
$EndComp
Connection ~ 14850 7750
Wire Wire Line
	14850 8050 14850 7750
Wire Wire Line
	14400 8050 14850 8050
Connection ~ 13950 8200
Wire Wire Line
	14250 8200 13950 8200
Wire Wire Line
	13950 7550 14250 7550
Wire Wire Line
	14250 7700 14250 7550
Wire Wire Line
	14550 7550 14400 7550
$Comp
L Device:R_POT_TRIM RV5
U 1 1 5F599BE8
P 14400 7700
F 0 "RV5" V 14285 7700 50  0000 C CNN
F 1 "R_POT_TRIM" V 14194 7700 50  0000 C CNN
F 2 "Custom Footprints:3224W-1-502E" H 14400 7700 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/3224.pdf" H 14400 7700 50  0001 C CNN
F 4 "Bourns Inc." V 14400 7700 50  0001 C CNN "Manufacturer"
F 5 "3224W-1-501E" V 14400 7700 50  0001 C CNN "Part #"
	1    14400 7700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	15500 7750 14850 7750
Wire Wire Line
	15500 7650 15500 7750
Wire Wire Line
	15500 7350 15500 7450
Wire Wire Line
	14850 7350 15500 7350
$Comp
L Device:D_Zener_Small_ALT D13
U 1 1 5F599BDC
P 15500 7550
F 0 "D13" V 15454 7620 50  0000 L CNN
F 1 "TVS_Diode" V 15545 7620 50  0000 L CNN
F 2 "Custom Footprints:DO-214AA" V 15500 7550 50  0001 C CNN
F 3 "https://katalog.we-online.de/pbs/datasheet/824520581.pdf" V 15500 7550 50  0001 C CNN
F 4 "Würth Elektronik" V 15500 7550 50  0001 C CNN "Manufacturer"
F 5 "824520581" V 15500 7550 50  0001 C CNN "Part #"
	1    15500 7550
	0    1    1    0   
$EndComp
Wire Wire Line
	13950 8200 13950 7850
Wire Wire Line
	12500 8200 13950 8200
Wire Wire Line
	12850 7650 12500 7650
Text Label 13050 7150 2    50   ~ 0
10V-analog
Text Label 13050 7950 2    50   ~ 0
-1.8V-analog
$Comp
L power:GND #PWR0170
U 1 1 5F599BCE
P 13250 7950
F 0 "#PWR0170" H 13250 7700 50  0001 C CNN
F 1 "GND" V 13250 7850 50  0000 R CNN
F 2 "" H 13250 7950 50  0001 C CNN
F 3 "" H 13250 7950 50  0001 C CNN
	1    13250 7950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0171
U 1 1 5F599BC8
P 13250 7150
F 0 "#PWR0171" H 13250 6900 50  0001 C CNN
F 1 "GND" V 13250 7050 50  0000 R CNN
F 2 "" H 13250 7150 50  0001 C CNN
F 3 "" H 13250 7150 50  0001 C CNN
	1    13250 7150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	13050 7250 13050 7150
Wire Wire Line
	13050 7850 13050 7950
$Comp
L Device:C_Small C25
U 1 1 5F599BC0
P 13150 7150
F 0 "C25" V 13350 7100 50  0000 L CNN
F 1 "2.2uF" V 13250 7050 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 13150 7150 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 13150 7150 50  0001 C CNN
F 4 "Taiyo Yuden" H 13150 7150 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 13150 7150 50  0001 C CNN "Part #"
	1    13150 7150
	0    -1   -1   0   
$EndComp
$Comp
L Device:C_Small C26
U 1 1 5F599BB8
P 13150 7950
F 0 "C26" V 13350 7900 50  0000 L CNN
F 1 "2.2uF" V 13250 7850 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 13150 7950 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 13150 7950 50  0001 C CNN
F 4 "Taiyo Yuden" H 13150 7950 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 13150 7950 50  0001 C CNN "Part #"
	1    13150 7950
	0    1    1    0   
$EndComp
NoConn ~ 13150 7850
Connection ~ 13950 7550
Wire Wire Line
	13950 7550 13950 7650
$Comp
L Device:C_Small C29
U 1 1 5F599BAD
P 13950 7750
F 0 "C29" H 14100 7750 50  0000 C CNN
F 1 "2200pF" H 14100 7650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0603_1608Metric" H 13950 7750 50  0001 C CNN
F 3 "https://api.kemet.com/component-edge/download/datasheet/C0603C222K1RACTU.pdf" H 13950 7750 50  0001 C CNN
F 4 "KEMET" H 13950 7750 50  0001 C CNN "Manufacturer"
F 5 "C0603C222K1RACTU" H 13950 7750 50  0001 C CNN "Part #"
	1    13950 7750
	-1   0    0    -1  
$EndComp
Text Label 12850 7450 2    50   ~ 0
OA3_input
Wire Wire Line
	13450 7550 13950 7550
Text Label 14850 7350 0    50   ~ 0
LED3-
$Comp
L Device:Q_NMOS_GDS Q4
U 1 1 5F599B9A
P 14750 7550
F 0 "Q4" H 14954 7596 50  0000 L CNN
F 1 "SUM70060E" H 14954 7505 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TO-263-2" H 14950 7650 50  0001 C CNN
F 3 "https://www.vishay.com/docs/65383/sum70060e.pdf" H 14750 7550 50  0001 C CNN
F 4 "Vishay Siliconix" H 14750 7550 50  0001 C CNN "Manufacturer"
F 5 "SUM70060E-GE3" H 14750 7550 50  0001 C CNN "Part #"
	1    14750 7550
	1    0    0    -1  
$EndComp
Wire Wire Line
	12500 7650 12500 8200
$Comp
L power:GND #PWR0172
U 1 1 5F7518EB
P 10550 10750
F 0 "#PWR0172" H 10550 10500 50  0001 C CNN
F 1 "GND" H 10600 10600 50  0000 R CNN
F 2 "" H 10550 10750 50  0001 C CNN
F 3 "" H 10550 10750 50  0001 C CNN
	1    10550 10750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0173
U 1 1 5F7529EF
P 10750 10750
F 0 "#PWR0173" H 10750 10500 50  0001 C CNN
F 1 "GND" H 10800 10600 50  0000 R CNN
F 2 "" H 10750 10750 50  0001 C CNN
F 3 "" H 10750 10750 50  0001 C CNN
	1    10750 10750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0174
U 1 1 5F752FAC
P 11250 10750
F 0 "#PWR0174" H 11250 10500 50  0001 C CNN
F 1 "GND" H 11300 10600 50  0000 R CNN
F 2 "" H 11250 10750 50  0001 C CNN
F 3 "" H 11250 10750 50  0001 C CNN
	1    11250 10750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0175
U 1 1 5F7537A5
P 11450 10750
F 0 "#PWR0175" H 11450 10500 50  0001 C CNN
F 1 "GND" H 11500 10600 50  0000 R CNN
F 2 "" H 11450 10750 50  0001 C CNN
F 3 "" H 11450 10750 50  0001 C CNN
	1    11450 10750
	1    0    0    -1  
$EndComp
Text Notes 10950 6800 0    59   ~ 0
4-channel op-amp constant current LED driver
Text Notes 10750 10300 0    59   ~ 0
Heatsinks
Wire Notes Line
	4500 2800 450  2800
Wire Notes Line
	4500 3550 8000 3550
Wire Notes Line
	8000 3550 8000 450 
Text Notes 1300 3000 0    59   ~ 0
LED bypass capacitors and connectors
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
$Comp
L power:GND #PWR0177
U 1 1 5F91969A
P 2900 1400
F 0 "#PWR0177" H 2900 1150 50  0001 C CNN
F 1 "GND" V 3000 1350 50  0000 R CNN
F 2 "" H 2900 1400 50  0001 C CNN
F 3 "" H 2900 1400 50  0001 C CNN
	1    2900 1400
	0    -1   -1   0   
$EndComp
Connection ~ 2900 1400
Text Label 1950 3500 0    50   ~ 0
LED1-
$Comp
L Custom_parts:TMUX1204DGSR U8
U 1 1 5F3DC268
P 4900 8100
F 0 "U8" H 5075 8265 50  0000 C CNN
F 1 "TMUX1204DGSR" H 5075 8174 50  0000 C CNN
F 2 "Custom Footprints:TMUX1204DGSR" H 4900 9100 50  0001 L BNN
F 3 "https://www.ti.com/api/videos/videoplayer/smallplayer/suppproductinfo.tsp" H 4900 8100 50  0001 C CNN
F 4 "Texas Instruments" H 4900 8100 50  0001 C CNN "Manufacturer"
F 5 "TMUX1204DGSR" H 4900 8100 50  0001 C CNN "Part #"
	1    4900 8100
	1    0    0    -1  
$EndComp
Wire Notes Line
	4500 2800 4500 6000
Wire Wire Line
	1050 1150 1350 1150
Wire Wire Line
	1350 1150 1350 1650
Wire Wire Line
	1100 1650 1350 1650
Wire Wire Line
	1350 1650 1850 1650
Connection ~ 1350 1650
$Comp
L power:GND #PWR0178
U 1 1 5F42FF36
P 9750 10850
F 0 "#PWR0178" H 9750 10600 50  0001 C CNN
F 1 "GND" H 9800 10700 50  0000 R CNN
F 2 "" H 9750 10850 50  0001 C CNN
F 3 "" H 9750 10850 50  0001 C CNN
	1    9750 10850
	1    0    0    -1  
$EndComp
Text Label 9750 9950 0    50   ~ 0
12V
$Comp
L Mechanical:MountingHole H1
U 1 1 5F452E2A
P 9450 10050
F 0 "H1" H 9400 10150 50  0000 L CNN
F 1 "MountingHole" H 9550 10005 50  0001 L CNN
F 2 "Custom Footprints:60mm_fan_mount" H 9450 10050 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/970xxxxx1_overview.pdf" H 9450 10050 50  0001 C CNN
F 4 "Würth Elektronik" H 9450 10050 50  0001 C CNN "Manufacturer"
F 5 "970300471" H 9450 10050 50  0001 C CNN "Part #"
	1    9450 10050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5F45A937
P 10050 10050
F 0 "H3" H 10000 10150 50  0000 L CNN
F 1 "MountingHole" H 10150 10005 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 10050 10050 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/970xxxxx1_overview.pdf" H 10050 10050 50  0001 C CNN
F 4 "Würth Elektronik" H 10050 10050 50  0001 C CNN "Manufacturer"
F 5 "970300471" H 10050 10050 50  0001 C CNN "Part #"
	1    10050 10050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H6
U 1 1 5F45C2D1
P 10050 10500
F 0 "H6" H 10000 10600 50  0000 L CNN
F 1 "MountingHole" H 10150 10455 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 10050 10500 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/970xxxxx1_overview.pdf" H 10050 10500 50  0001 C CNN
F 4 "Würth Elektronik" H 10050 10500 50  0001 C CNN "Manufacturer"
F 5 "970300471" H 10050 10500 50  0001 C CNN "Part #"
	1    10050 10500
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5F45CD36
P 10050 10050
F 0 "H4" H 10000 10150 50  0000 L CNN
F 1 "MountingHole" H 10150 10005 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 10050 10050 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/970xxxxx1_overview.pdf" H 10050 10050 50  0001 C CNN
F 4 "Würth Elektronik" H 10050 10050 50  0001 C CNN "Manufacturer"
F 5 "970300471" H 10050 10050 50  0001 C CNN "Part #"
	1    10050 10050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H5
U 1 1 5F45D0AD
P 10050 10050
F 0 "H5" H 10000 10150 50  0000 L CNN
F 1 "MountingHole" H 10150 10005 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 10050 10050 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/970xxxxx1_overview.pdf" H 10050 10050 50  0001 C CNN
F 4 "Würth Elektronik" H 10050 10050 50  0001 C CNN "Manufacturer"
F 5 "970300471" H 10050 10050 50  0001 C CNN "Part #"
	1    10050 10050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5F45D9B5
P 9450 10500
F 0 "H2" H 9400 10600 50  0000 L CNN
F 1 "MountingHole" H 9550 10455 50  0001 L CNN
F 2 "Custom Footprints:Ref_only" H 9450 10500 50  0001 C CNN
F 3 "https://katalog.we-online.de/em/datasheet/970xxxxx1_overview.pdf" H 9450 10500 50  0001 C CNN
F 4 "Würth Elektronik" H 9450 10500 50  0001 C CNN "Manufacturer"
F 5 "970300471" H 9450 10500 50  0001 C CNN "Part #"
	1    9450 10500
	1    0    0    -1  
$EndComp
$Comp
L Motor:Fan M1
U 1 1 5F42A861
P 9750 10250
F 0 "M1" H 9750 10750 50  0000 L CNN
F 1 "Fan - CFM-6010V-140-285" H 9300 10650 50  0000 L CNN
F 2 "Connector_Wire:SolderWire-1sqmm_1x02_P5.4mm_D1.4mm_OD2.7mm" H 9750 10260 50  0001 C CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/cfm-60v.pdf" H 9750 10260 50  0001 C CNN
F 4 "CUI Devices" H 9750 10250 50  0001 C CNN "Manufacturer"
F 5 "CFM-6010V-140-285" H 9750 10250 50  0001 C CNN "Part #"
	1    9750 10250
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_DUAL_NMOS_G1S2G2D2S1D1 Q1
U 1 1 5F47322B
P 9650 10650
F 0 "Q1" H 9854 10696 50  0000 L CNN
F 1 "Q_DUAL_NMOS" H 9854 10605 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 9850 10650 50  0001 C CNN
F 3 "https://fscdn.rohm.com/en/products/databook/datasheet/discrete/transistor/mosfet/qs6k1-e.pdf" H 9850 10650 50  0001 C CNN
F 4 "Rohm Semiconductor" H 9650 10650 50  0001 C CNN "Manufacturer"
F 5 "QS6K1TR" H 9650 10650 50  0001 C CNN "Part #"
	1    9650 10650
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:LT6200CS8-10 U12
U 1 1 5F5541C8
P 13150 7550
F 0 "U12" H 13494 7596 50  0000 L CNN
F 1 "LT6200CS8-10" H 13350 7450 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 13200 7600 50  0001 C CNN
F 3 "http://www.linear.com/docs/3869" H 13200 7700 50  0001 C CNN
F 4 "Analog Devices Inc." H 13150 7550 50  0001 C CNN "Manufacturer"
F 5 "LT6200CS8-10#PBF" H 13150 7550 50  0001 C CNN "Part #"
	1    13150 7550
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:LT6200CS8-10 U11
U 1 1 5F5559EC
P 9650 8900
F 0 "U11" H 9994 8946 50  0000 L CNN
F 1 "LT6200CS8-10" H 9850 8800 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 9700 8950 50  0001 C CNN
F 3 "http://www.linear.com/docs/3869" H 9700 9050 50  0001 C CNN
F 4 "Analog Devices Inc." H 9650 8900 50  0001 C CNN "Manufacturer"
F 5 "LT6200CS8-10#PBF" H 9650 8900 50  0001 C CNN "Part #"
	1    9650 8900
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:LT6200CS8-10 U13
U 1 1 5F5578B4
P 13150 8900
F 0 "U13" H 13494 8946 50  0000 L CNN
F 1 "LT6200CS8-10" H 13350 8800 50  0000 L CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 13200 8950 50  0001 C CNN
F 3 "http://www.linear.com/docs/3869" H 13200 9050 50  0001 C CNN
F 4 "Analog Devices Inc." H 13150 8900 50  0001 C CNN "Manufacturer"
F 5 "LT6200CS8-10#PBF" H 13150 8900 50  0001 C CNN "Part #"
	1    13150 8900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 6450 1600 6450
Wire Wire Line
	1600 6650 1850 6650
Wire Wire Line
	1600 6850 1850 6850
Wire Wire Line
	1600 7050 1850 7050
Wire Wire Line
	1850 7750 1600 7750
Wire Wire Line
	1850 7950 1600 7950
Wire Wire Line
	1850 8150 1600 8150
Wire Wire Line
	1850 8350 1600 8350
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
Text Label 8000 6800 0    50   ~ 0
internal_analog_1
Text Label 8000 6700 0    50   ~ 0
internal_analog_2
$Comp
L Switch:SW_NKK_GW12LJPCF SW1
U 1 1 5F79CF44
P 8550 4050
F 0 "SW1" H 8550 4535 50  0000 C CNN
F 1 "G13JVCF" H 8550 4444 50  0000 C CNN
F 2 "Custom Footprints:G13JVCF_or_GW12LJVCF" H 8550 4500 50  0001 C CNN
F 3 "https://www.nkkswitches.com/pdf/gtogglesilluminated.pdf" H 8550 4250 50  0001 C CNN
F 4 "NKK Switches" H 8550 4050 50  0001 C CNN "Manufacturer"
F 5 "G13JVCF" H 8550 4050 50  0001 C CNN "Part #"
	1    8550 4050
	1    0    0    -1  
$EndComp
Text Notes 8300 4500 0    50   ~ 0
Can replace\nwith GW12LJVCF
NoConn ~ 8750 3950
$Comp
L power:GND #PWR0185
U 1 1 5F7B4062
P 8750 3750
F 0 "#PWR0185" H 8750 3500 50  0001 C CNN
F 1 "GND" V 8850 3700 50  0000 R CNN
F 2 "" H 8750 3750 50  0001 C CNN
F 3 "" H 8750 3750 50  0001 C CNN
	1    8750 3750
	0    -1   -1   0   
$EndComp
Text Label 8750 4150 0    50   ~ 0
3.3V
Wire Wire Line
	5450 2000 5450 1900
Wire Wire Line
	5450 1900 5650 1900
Connection ~ 5650 1900
Wire Wire Line
	5450 2200 5550 2200
Connection ~ 5550 2200
Wire Wire Line
	5550 2200 5650 2200
$Comp
L Device:R_Pack04_Split RN1
U 2 1 5F7ED6F3
P 5650 2050
F 0 "RN1" H 5700 2050 50  0000 L CNN
F 1 "150" V 5650 2000 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5570 2050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 5650 2050 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 5650 2050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" H 5650 2050 50  0001 C CNN "Part #"
	2    5650 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 4 1 5F82F07B
P 2000 8350
F 0 "RN3" V 1900 8350 50  0000 C CNN
F 1 "4.7k" V 2000 8350 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2475 8350 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2000 8350 50  0001 C CNN
F 4 "Bourns Inc." V 2000 8350 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2000 8350 50  0001 C CNN "Part #"
	4    2000 8350
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 3 1 5F82E690
P 2000 8150
F 0 "RN3" V 1900 8150 50  0000 C CNN
F 1 "4.7k" V 2000 8150 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2475 8150 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2000 8150 50  0001 C CNN
F 4 "Bourns Inc." V 2000 8150 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2000 8150 50  0001 C CNN "Part #"
	3    2000 8150
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08 RN4
U 1 1 5F57894B
P 2450 10750
F 0 "RN4" V 1950 10650 50  0000 C CNN
F 1 "4.7k" V 1950 10850 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2925 10750 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2450 10750 50  0001 C CNN
F 4 "Bourns Inc." V 2450 10750 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2450 10750 50  0001 C CNN "Part #"
	1    2450 10750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 1 1 5F607B24
P 2000 7750
F 0 "RN3" V 1900 7750 50  0000 C CNN
F 1 "4.7k" V 2000 7750 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2475 7750 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2000 7750 50  0001 C CNN
F 4 "Bourns Inc." V 2000 7750 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2000 7750 50  0001 C CNN "Part #"
	1    2000 7750
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 1 1 5F7E1AD6
P 5650 1750
F 0 "RN1" H 5700 1750 50  0000 L CNN
F 1 "150" V 5650 1700 50  0000 L CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 5570 1750 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 5650 1750 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 5650 1750 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" H 5650 1750 50  0001 C CNN "Part #"
	1    5650 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 3 1 5F80B99A
P 8200 4050
F 0 "RN1" V 8100 4050 50  0000 C CNN
F 1 "150" V 8200 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 8120 4050 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 8200 4050 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 8200 4050 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" H 8200 4050 50  0001 C CNN "Part #"
	3    8200 4050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack04_Split RN1
U 4 1 5F80DDC0
P 8200 4250
F 0 "RN1" V 8100 4250 50  0000 C CNN
F 1 "150" V 8200 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_Array_Convex_4x1206" V 8120 4250 50  0001 C CNN
F 3 "https://industrial.panasonic.com/cdbs/www-data/pdf/AOC0000/AOC0000C14.pdf" H 8200 4250 50  0001 C CNN
F 4 "Panasonic Electronic Components" H 8200 4250 50  0001 C CNN "Manufacturer"
F 5 "EXB-38V151JV" H 8200 4250 50  0001 C CNN "Part #"
	4    8200 4250
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 2 1 5F82DD76
P 2000 7950
F 0 "RN3" V 1900 7950 50  0000 C CNN
F 1 "4.7k" V 2000 7950 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2475 7950 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2000 7950 50  0001 C CNN
F 4 "Bourns Inc." V 2000 7950 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2000 7950 50  0001 C CNN "Part #"
	2    2000 7950
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN3
U 5 1 5F855B7A
P 3900 6300
F 0 "RN3" V 4000 6300 50  0000 C CNN
F 1 "4.7k" V 3900 6300 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 4375 6300 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 3900 6300 50  0001 C CNN
F 4 "Bourns Inc." V 3900 6300 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 3900 6300 50  0001 C CNN "Part #"
	5    3900 6300
	-1   0    0    1   
$EndComp
Connection ~ 5400 6850
$Comp
L Device:R_Pack08 RN5
U 1 1 5F4E9509
P 5300 4650
F 0 "RN5" V 4800 4600 50  0000 C CNN
F 1 "4.7k" V 4800 4800 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 5775 4650 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 5300 4650 50  0001 C CNN
F 4 "Bourns Inc." V 5300 4650 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 5300 4650 50  0001 C CNN "Part #"
	1    5300 4650
	0    -1   1    0   
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 1 1 5F57B5E3
P 1200 6750
F 0 "J3" H 1350 6300 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 7300 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 6775 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 6775 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 6750 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 6750 50  0001 C CNN "Part #"
	1    1200 6750
	1    0    0    1   
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 2 1 5F589234
P 1200 8050
F 0 "J3" H 1350 7600 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 8600 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 8075 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 8075 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 8050 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 8050 50  0001 C CNN "Part #"
	2    1200 8050
	1    0    0    1   
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 3 1 5F58DBB9
P 1200 10650
F 0 "J3" H 1350 10200 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 11200 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 10675 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 10675 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 10650 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 10650 50  0001 C CNN "Part #"
	3    1200 10650
	1    0    0    1   
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J3
U 4 1 5F5922AC
P 1200 9350
F 0 "J3" H 1350 8900 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 1550 9900 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 1200 9375 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 1200 9375 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 1200 9350 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 1200 9350 50  0001 C CNN "Part #"
	4    1200 9350
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5F59943B
P 1200 8850
F 0 "#PWR01" H 1200 8600 50  0001 C CNN
F 1 "GND" H 1450 8800 50  0000 R CNN
F 2 "" H 1200 8850 50  0001 C CNN
F 3 "" H 1200 8850 50  0001 C CNN
	1    1200 8850
	-1   0    0    1   
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J4
U 1 1 5F59AB86
P 2650 3750
F 0 "J4" H 2650 4400 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 3000 4300 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 2650 3775 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 2650 3775 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 2650 3750 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 2650 3750 50  0001 C CNN "Part #"
	1    2650 3750
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J4
U 2 1 5F5AD6A0
P 3750 3750
F 0 "J4" H 3750 4400 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 4100 4300 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 3750 3775 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 3750 3775 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 3750 3750 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 3750 3750 50  0001 C CNN "Part #"
	2    3750 3750
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J4
U 3 1 5F5AFA79
P 2650 5100
F 0 "J4" H 2650 5750 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 3000 5650 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 2650 5125 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 2650 5125 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 2650 5100 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 2650 5100 50  0001 C CNN "Part #"
	3    2650 5100
	1    0    0    -1  
$EndComp
$Comp
L Custom_parts:8P8C_Shielded_x4 J4
U 4 1 5F5B1C83
P 3750 5100
F 0 "J4" H 3750 5750 50  0000 R CNN
F 1 "8P8C_Shielded_x4" H 4100 5650 50  0000 R CNN
F 2 "Custom Footprints:RJ45_x4-RJSSE-5380-04" V 3750 5125 50  0001 C CNN
F 3 "https://cdn.amphenol-icc.com/media/wysiwyg/files/drawing/rjsse538004.pdf" V 3750 5125 50  0001 C CNN
F 4 "Amphenol ICC (Commercial Products)" H 3750 5100 50  0001 C CNN "Manufacturer"
F 5 "RJSSE-5380-04" H 3750 5100 50  0001 C CNN "Part #"
	4    3750 5100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5F5CDB2E
P 1600 9350
F 0 "#PWR03" H 1600 9100 50  0001 C CNN
F 1 "GND" V 1600 9250 50  0000 R CNN
F 2 "" H 1600 9350 50  0001 C CNN
F 3 "" H 1600 9350 50  0001 C CNN
	1    1600 9350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR04
U 1 1 5F5CDB34
P 1600 9550
F 0 "#PWR04" H 1600 9300 50  0001 C CNN
F 1 "GND" V 1600 9450 50  0000 R CNN
F 2 "" H 1600 9550 50  0001 C CNN
F 3 "" H 1600 9550 50  0001 C CNN
	1    1600 9550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5F5CDB3A
P 1600 9750
F 0 "#PWR05" H 1600 9500 50  0001 C CNN
F 1 "GND" V 1600 9650 50  0000 R CNN
F 2 "" H 1600 9750 50  0001 C CNN
F 3 "" H 1600 9750 50  0001 C CNN
	1    1600 9750
	0    -1   -1   0   
$EndComp
Text Label 1850 9050 0    50   ~ 0
External_thermistor
Text Label 12550 1200 2    50   ~ 0
Interline_PWM_1
Text Label 12550 1400 2    50   ~ 0
Interline_PWM_2
Text Label 12550 1600 2    50   ~ 0
Interline_PWM_3
Text Label 12550 1800 2    50   ~ 0
Interline_PWM_4
Text Label 12550 1300 2    50   ~ 0
Analog_select_1
Text Label 12550 1500 2    50   ~ 0
Analog_select_2
Text Label 12550 1700 2    50   ~ 0
Analog_select_3
Text Label 12550 1900 2    50   ~ 0
Analog_select_4
Text Label 4650 6450 2    50   ~ 0
Interline_PWM_1
Text Label 4650 7300 2    50   ~ 0
Interline_PWM_2
Text Label 4700 8150 2    50   ~ 0
Interline_PWM_3
Text Label 4700 8950 2    50   ~ 0
Interline_PWM_4
Text Label 5400 6450 0    50   ~ 0
Analog_select_1
Text Label 5400 7300 0    50   ~ 0
Analog_select_2
Text Label 5450 8150 0    50   ~ 0
Analog_select_3
Text Label 5450 8950 0    50   ~ 0
Analog_select_4
Text Label 12550 2000 2    50   ~ 0
Internal_fan_PWM
Text Label 9450 10650 2    50   ~ 0
Internal_fan_PWM
Wire Notes Line
	8750 11200 8750 6000
Wire Notes Line
	8750 6700 16050 6700
Wire Notes Line
	500  6000 8750 6000
Text Label 12550 2500 2    50   ~ 0
Toggle_red_LED
Text Label 12550 2600 2    50   ~ 0
Toggle_green_LED
Text Label 8050 4050 2    50   ~ 0
Toggle_red_LED
Text Label 8050 4250 2    50   ~ 0
Toggle_green_LED
Text Label 12550 2800 2    50   ~ 0
DAC_CS
Text Label 6700 6800 2    50   ~ 0
DAC_CS
Text Label 12550 2200 2    50   ~ 0
Over_temp_alarm1-MISO0
Text Label 12550 3100 2    50   ~ 0
A-D_input_1
Text Label 12550 3200 2    50   ~ 0
A-D_input_2
Text Label 14850 3200 0    50   ~ 0
A-D_input_3
Text Label 14850 3100 0    50   ~ 0
A-D_input_4
Text Label 2150 7750 0    50   ~ 0
A-D_input_1
Text Label 2150 7950 0    50   ~ 0
A-D_input_2
Text Label 2150 8150 0    50   ~ 0
A-D_input_3
Text Label 2150 8350 0    50   ~ 0
A-D_input_4
Text Label 2650 10400 0    50   ~ 0
Internal_Isense_1
Text Label 4500 10700 0    50   ~ 0
A-D_input_1
Text Label 3750 11100 2    50   ~ 0
A-D_input_2
Text Label 6150 10750 0    50   ~ 0
A-D_input_3
Text Label 5400 11150 2    50   ~ 0
A-D_input_4
Text Label 14850 1500 0    50   ~ 0
LED_pot_1
Text Label 14850 1400 0    50   ~ 0
LED_pot_2
Text Label 14850 1300 0    50   ~ 0
LED_pot_3
Text Label 14850 1200 0    50   ~ 0
LED_pot_4
Text Label 14850 1900 0    50   ~ 0
MOSFET_temp_1
Text Label 14850 1800 0    50   ~ 0
MOSFET_temp_2
Text Label 14850 1700 0    50   ~ 0
MOSFET_temp_3
Text Label 14850 1600 0    50   ~ 0
MOSFET_temp_4
Text Label 14850 2500 0    50   ~ 0
External_thermistor
Text Label 2900 9050 0    50   ~ 0
3.3V
Text Label 14850 2700 0    50   ~ 0
Resistor_temp_4
Text Label 14850 3000 0    50   ~ 0
Resistor_temp_1
Text Label 14850 2900 0    50   ~ 0
Resistor_temp_2
Text Label 14850 2800 0    50   ~ 0
Resistor_temp_3
$Comp
L Device:Thermistor TH1
U 1 1 5F76C793
P 6400 4100
F 0 "TH1" V 6400 4050 50  0000 L CNN
F 1 "Thermistor" H 6505 4055 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 4100 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 4100 50  0001 C CNN
F 4 "Murata Electronics" H 6400 4100 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 4100 50  0001 C CNN "Part #"
	1    6400 4100
	0    -1   1    0   
$EndComp
Text Label 5500 4250 0    50   ~ 0
MOSFET_temp_1
Text Label 5500 4350 0    50   ~ 0
MOSFET_temp_2
$Comp
L Device:Thermistor TH3
U 1 1 5F79A712
P 6400 4400
F 0 "TH3" V 6400 4350 50  0000 L CNN
F 1 "Thermistor" H 6505 4355 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 4400 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 4400 50  0001 C CNN
F 4 "Murata Electronics" H 6400 4400 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 4400 50  0001 C CNN "Part #"
	1    6400 4400
	0    -1   1    0   
$EndComp
Text Label 5500 4450 0    50   ~ 0
MOSFET_temp_3
$Comp
L Device:Thermistor TH4
U 1 1 5F7A6A80
P 6400 4550
F 0 "TH4" V 6400 4500 50  0000 L CNN
F 1 "Thermistor" H 6505 4505 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 4550 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 4550 50  0001 C CNN
F 4 "Murata Electronics" H 6400 4550 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 4550 50  0001 C CNN "Part #"
	1    6400 4550
	0    -1   1    0   
$EndComp
Text Label 5500 4550 0    50   ~ 0
MOSFET_temp_4
$Comp
L Device:Thermistor TH5
U 1 1 5F84512D
P 6400 4700
F 0 "TH5" V 6400 4650 50  0000 L CNN
F 1 "Thermistor" H 6505 4655 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 4700 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 4700 50  0001 C CNN
F 4 "Murata Electronics" H 6400 4700 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 4700 50  0001 C CNN "Part #"
	1    6400 4700
	0    -1   1    0   
$EndComp
$Comp
L Device:Thermistor TH6
U 1 1 5F845136
P 6400 4850
F 0 "TH6" V 6400 4800 50  0000 L CNN
F 1 "Thermistor" H 6505 4805 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 4850 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 4850 50  0001 C CNN
F 4 "Murata Electronics" H 6400 4850 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 4850 50  0001 C CNN "Part #"
	1    6400 4850
	0    -1   1    0   
$EndComp
$Comp
L Device:Thermistor TH7
U 1 1 5F84513F
P 6400 5000
F 0 "TH7" V 6400 4950 50  0000 L CNN
F 1 "Thermistor" H 6505 4955 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 5000 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 5000 50  0001 C CNN
F 4 "Murata Electronics" H 6400 5000 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 5000 50  0001 C CNN "Part #"
	1    6400 5000
	0    -1   1    0   
$EndComp
$Comp
L Device:Thermistor TH8
U 1 1 5F845148
P 6400 5150
F 0 "TH8" V 6400 5100 50  0000 L CNN
F 1 "Thermistor" H 6505 5105 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 5150 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 5150 50  0001 C CNN
F 4 "Murata Electronics" H 6400 5150 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 5150 50  0001 C CNN "Part #"
	1    6400 5150
	0    -1   1    0   
$EndComp
Text Label 5500 4650 0    50   ~ 0
Resistor_temp_1
Text Label 5500 4750 0    50   ~ 0
Resistor_temp_2
Text Label 5500 4850 0    50   ~ 0
Resistor_temp_3
Text Label 5500 4950 0    50   ~ 0
Resistor_temp_4
$Comp
L Device:Thermistor TH2
U 1 1 5F78EA16
P 6400 4250
F 0 "TH2" V 6400 4200 50  0000 L CNN
F 1 "Thermistor" H 6505 4205 50  0001 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" H 6400 4250 50  0001 C CNN
F 3 "https://ds.murata.co.jp/simsurfing/ntcthermistor.html?lcid=en-us" H 6400 4250 50  0001 C CNN
F 4 "Murata Electronics" H 6400 4250 50  0001 C CNN "Manufacturer"
F 5 "NCP18XM472J03RB" H 6400 4250 50  0001 C CNN "Part #"
	1    6400 4250
	0    -1   1    0   
$EndComp
Wire Wire Line
	6150 5000 6150 4850
Wire Wire Line
	6150 4850 5500 4850
Wire Wire Line
	6200 4850 6200 4750
Wire Wire Line
	6200 4750 5500 4750
Wire Wire Line
	6200 4650 6200 4700
Wire Wire Line
	6200 4650 5500 4650
Wire Wire Line
	6150 5000 6200 5000
Wire Wire Line
	5500 4950 6100 4950
Wire Wire Line
	6100 4950 6100 5150
Wire Wire Line
	6100 5150 6200 5150
Wire Wire Line
	6200 4550 5500 4550
Wire Wire Line
	6200 4450 6200 4400
Wire Wire Line
	6200 4450 5500 4450
Wire Wire Line
	6200 4350 6200 4250
Wire Wire Line
	6200 4350 5500 4350
Wire Wire Line
	5500 4250 6150 4250
Wire Wire Line
	6150 4250 6150 4100
Wire Wire Line
	6150 4100 6200 4100
Wire Wire Line
	6600 5150 6600 5000
Connection ~ 6600 4250
Wire Wire Line
	6600 4250 6600 4100
Connection ~ 6600 4400
Wire Wire Line
	6600 4400 6600 4250
Connection ~ 6600 4550
Wire Wire Line
	6600 4550 6600 4400
Connection ~ 6600 4700
Wire Wire Line
	6600 4700 6600 4550
Connection ~ 6600 4850
Wire Wire Line
	6600 4850 6600 4700
Connection ~ 6600 5000
Wire Wire Line
	6600 5000 6600 4850
Text Label 5100 4250 2    50   ~ 0
3.3V
Wire Wire Line
	5100 4250 5100 4350
Connection ~ 5100 4350
Wire Wire Line
	5100 4350 5100 4450
Connection ~ 5100 4450
Wire Wire Line
	5100 4450 5100 4550
Connection ~ 5100 4550
Wire Wire Line
	5100 4550 5100 4650
Connection ~ 5100 4650
Wire Wire Line
	5100 4650 5100 4750
Connection ~ 5100 4750
Wire Wire Line
	5100 4750 5100 4850
Connection ~ 5100 4850
Wire Wire Line
	5100 4850 5100 4950
$Comp
L power:GND #PWR017
U 1 1 5FAA68F2
P 6600 5150
F 0 "#PWR017" H 6600 4900 50  0001 C CNN
F 1 "GND" H 6650 5000 50  0000 R CNN
F 2 "" H 6600 5150 50  0001 C CNN
F 3 "" H 6600 5150 50  0001 C CNN
	1    6600 5150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1600 9250 1850 9250
$Comp
L Device:R_Pack08_Split RN3
U 6 1 5F857F89
P 2750 9050
F 0 "RN3" V 2650 9050 50  0000 C CNN
F 1 "4.7k" V 2750 9050 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 3225 9050 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2750 9050 50  0001 C CNN
F 4 "Bourns Inc." V 2750 9050 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2750 9050 50  0001 C CNN "Part #"
	6    2750 9050
	0    -1   -1   0   
$EndComp
Connection ~ 6600 5150
$Comp
L dk_Alarms-Buzzers-and-Sirens:PKMCS0909E4000-R1 BZ1
U 1 1 5FCB6274
P 8350 5150
F 0 "BZ1" H 8690 5258 60  0000 L CNN
F 1 "CPT-2016-75-SMT-TR" H 8690 5152 60  0000 L CNN
F 2 "Custom Footprints:XDCR_CPT-2016-75-SMT-TR" H 8550 5350 60  0001 L CNN
F 3 "https://www.cuidevices.com/product/resource/digikeypdf/cpt-2016-75-smt-tr.pdf" H 8550 5450 60  0001 L CNN
F 4 "CUI Devices" H 8350 5150 50  0001 C CNN "Manufacturer"
F 5 "CPT-2016-75-SMT-TR" H 8350 5150 50  0001 C CNN "Part #"
	1    8350 5150
	1    0    0    -1  
$EndComp
Text Label 12550 2700 2    50   ~ 0
Toggle_switch
Text Label 8350 3850 2    50   ~ 0
Toggle_switch
Text Label 12550 2900 2    50   ~ 0
External_3v3_PWM
Text Label 12550 1100 2    50   ~ 0
LCD_CS
Text Label 12550 1000 2    50   ~ 0
LCD_reset
$Comp
L Device:R_Pack08_Split RN2
U 1 1 5FD16D4F
P 2000 6450
F 0 "RN2" V 1900 6450 50  0000 C CNN
F 1 "220" V 2000 6450 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 1920 6450 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 2000 6450 50  0001 C CNN
F 4 "Bourns Inc." V 2000 6450 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 2000 6450 50  0001 C CNN "Part #"
	1    2000 6450
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 2 1 5FD1B9DD
P 2000 6650
F 0 "RN2" V 1900 6650 50  0000 C CNN
F 1 "220" V 2000 6650 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 1920 6650 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 2000 6650 50  0001 C CNN
F 4 "Bourns Inc." V 2000 6650 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 2000 6650 50  0001 C CNN "Part #"
	2    2000 6650
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 3 1 5FD1BF4A
P 2000 6850
F 0 "RN2" V 1900 6850 50  0000 C CNN
F 1 "220" V 2000 6850 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 1920 6850 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 2000 6850 50  0001 C CNN
F 4 "Bourns Inc." V 2000 6850 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 2000 6850 50  0001 C CNN "Part #"
	3    2000 6850
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 4 1 5FD1C560
P 2000 7050
F 0 "RN2" V 1900 7050 50  0000 C CNN
F 1 "220" V 2000 7050 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 1920 7050 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 2000 7050 50  0001 C CNN
F 4 "Bourns Inc." V 2000 7050 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 2000 7050 50  0001 C CNN "Part #"
	4    2000 7050
	0    1    1    0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 5 1 5FD20CF7
P 2900 1800
F 0 "RN2" V 2800 1800 50  0000 C CNN
F 1 "220" V 2900 1800 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2820 1800 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 2900 1800 50  0001 C CNN
F 4 "Bourns Inc." V 2900 1800 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 2900 1800 50  0001 C CNN "Part #"
	5    2900 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 6 1 5FD86E74
P 2900 2000
F 0 "RN2" V 2800 2000 50  0000 C CNN
F 1 "220" V 2900 2000 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 2820 2000 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 2900 2000 50  0001 C CNN
F 4 "Bourns Inc." V 2900 2000 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 2900 2000 50  0001 C CNN "Part #"
	6    2900 2000
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 7 1 5FD876CF
P 3300 1800
F 0 "RN2" V 3200 1800 50  0000 C CNN
F 1 "220" V 3300 1800 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 3220 1800 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 3300 1800 50  0001 C CNN
F 4 "Bourns Inc." V 3300 1800 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 3300 1800 50  0001 C CNN "Part #"
	7    3300 1800
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Pack08_Split RN2
U 8 1 5FD87D88
P 3300 2000
F 0 "RN2" V 3200 2000 50  0000 C CNN
F 1 "220" V 3300 2000 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 3220 2000 50  0001 C CNN
F 3 "https://www.bourns.com/docs/Product-Datasheets/4800P.pdf" H 3300 2000 50  0001 C CNN
F 4 "Bourns Inc." V 3300 2000 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-221LF" V 3300 2000 50  0001 C CNN "Part #"
	8    3300 2000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3050 1650 3050 1800
Connection ~ 3050 1650
Wire Wire Line
	2750 1800 2750 2000
Wire Wire Line
	3050 2000 3100 2000
Wire Wire Line
	3100 2000 3100 1800
Wire Wire Line
	3100 1800 3150 1800
Wire Wire Line
	3450 1800 3450 2000
Wire Wire Line
	3000 2400 3000 2500
$Comp
L power:GND #PWR0183
U 1 1 5F70A88C
P 3000 2500
F 0 "#PWR0183" H 3000 2250 50  0001 C CNN
F 1 "GND" H 3100 2350 50  0000 R CNN
F 2 "" H 3000 2500 50  0001 C CNN
F 3 "" H 3000 2500 50  0001 C CNN
	1    3000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2200 3000 2200
Connection ~ 3150 2200
$Comp
L Reference_Voltage:LM4040DBZ-5 D1
U 1 1 5F6F1425
P 3150 2350
F 0 "D1" V 3100 2300 50  0000 R CNN
F 1 "Voltage Reference" V 3100 2950 50  0001 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3150 2150 50  0001 C CIN
F 3 "https://ww1.microchip.com/downloads/en/DeviceDoc/LM4040-41-Precision-Micropower-Shunt-Voltage-Reference-DS20005757B.pdf" H 3150 2350 50  0001 C CIN
F 4 "Microchip Technology" V 3150 2350 50  0001 C CNN "Manufacturer"
F 5 "LM4040CYM3-5.0-TR" V 3150 2350 50  0001 C CNN "Part #"
	1    3150 2350
	0    -1   -1   0   
$EndComp
Text Label 3150 2200 0    50   ~ 0
5V-analog
$Comp
L power:GND #PWR0105
U 1 1 5F3A55D8
P 3150 2500
F 0 "#PWR0105" H 3150 2250 50  0001 C CNN
F 1 "GND" H 3250 2350 50  0000 R CNN
F 2 "" H 3150 2500 50  0001 C CNN
F 3 "" H 3150 2500 50  0001 C CNN
	1    3150 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2000 3150 2200
Text Label 2050 10950 2    50   ~ 0
Isense_4
Text Label 2050 10750 2    50   ~ 0
Isense_3
Text Label 2050 10550 2    50   ~ 0
Isense_2
Text Label 2050 10350 2    50   ~ 0
Isense_1
Text Label 2650 10600 0    50   ~ 0
Internal_Isense_2
Text Label 2650 10800 0    50   ~ 0
Internal_Isense_3
Text Label 2650 11000 0    50   ~ 0
Internal_Isense_4
Text Label 14850 2100 0    50   ~ 0
Internal_Isense_1
Text Label 14850 2000 0    50   ~ 0
Internal_Isense_2
Text Label 14850 2600 0    50   ~ 0
Internal_Isense_3
Text Label 14850 2500 0    50   ~ 0
External_thermistor
Text Label 14850 2400 0    50   ~ 0
Internal_Isense_4
$Comp
L Device:R_Pack08_Split RN3
U 8 1 5FEC9EE9
P 2800 9600
F 0 "RN3" V 2900 9600 50  0000 C CNN
F 1 "4.7k" V 2800 9600 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 3275 9600 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2800 9600 50  0001 C CNN
F 4 "Bourns Inc." V 2800 9600 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2800 9600 50  0001 C CNN "Part #"
	8    2800 9600
	0    -1   -1   0   
$EndComp
Text Label 12550 3000 2    50   ~ 0
External_5V_PWM
Wire Wire Line
	4700 8600 3900 8600
Wire Wire Line
	4650 7750 3900 7750
$Comp
L Device:C_Small C18
U 1 1 5F422B07
P 5500 6850
F 0 "C18" V 5700 6800 50  0000 L CNN
F 1 "2.2uF" V 5600 6800 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5500 6850 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5500 6850 50  0001 C CNN
F 4 "Taiyo Yuden" H 5500 6850 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5500 6850 50  0001 C CNN "Part #"
	1    5500 6850
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 6900 3900 6900
$Comp
L Device:C_Small C31
U 1 1 5FF7921A
P 5500 7700
F 0 "C31" V 5700 7650 50  0000 L CNN
F 1 "2.2uF" V 5600 7650 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5500 7700 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5500 7700 50  0001 C CNN
F 4 "Taiyo Yuden" H 5500 7700 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5500 7700 50  0001 C CNN "Part #"
	1    5500 7700
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C32
U 1 1 5FF8B2EB
P 5550 8550
F 0 "C32" V 5750 8500 50  0000 L CNN
F 1 "2.2uF" V 5650 8500 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5550 8550 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5550 8550 50  0001 C CNN
F 4 "Taiyo Yuden" H 5550 8550 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5550 8550 50  0001 C CNN "Part #"
	1    5550 8550
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C33
U 1 1 5FF9D048
P 5550 9350
F 0 "C33" V 5500 9400 50  0000 L CNN
F 1 "2.2uF" V 5650 9300 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 5550 9350 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 5550 9350 50  0001 C CNN
F 4 "Taiyo Yuden" H 5550 9350 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 5550 9350 50  0001 C CNN "Part #"
	1    5550 9350
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C10
U 1 1 5FFAFBD6
P 3000 2300
F 0 "C10" H 3092 2346 50  0000 L CNN
F 1 "47uF" H 3092 2255 50  0000 L CNN
F 2 "Capacitor_SMD:C_1206_3216Metric" H 3000 2300 50  0001 C CNN
F 3 "https://www.digikey.com/en/ptm/m/murata-electronics-north-america/high-cap-multilayer-ceramic-capacitors?pn_sku=490-16268-1-ND&part_id=7363259" H 3000 2300 50  0001 C CNN
F 4 "Murata Electronics" H 3000 2300 50  0001 C CNN "Manufacturer"
F 5 "GRM31CR61E476ME44L" H 3000 2300 50  0001 C CNN "Part #"
	1    3000 2300
	-1   0    0    -1  
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
L power:GND #PWR010
U 1 1 5FFB97D4
P 4650 7500
F 0 "#PWR010" H 4650 7250 50  0001 C CNN
F 1 "GND" V 4650 7400 50  0000 R CNN
F 2 "" H 4650 7500 50  0001 C CNN
F 3 "" H 4650 7500 50  0001 C CNN
	1    4650 7500
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5FFB9D68
P 4700 8350
F 0 "#PWR011" H 4700 8100 50  0001 C CNN
F 1 "GND" V 4700 8250 50  0000 R CNN
F 2 "" H 4700 8350 50  0001 C CNN
F 3 "" H 4700 8350 50  0001 C CNN
	1    4700 8350
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR012
U 1 1 5FFBA400
P 4700 9150
F 0 "#PWR012" H 4700 8900 50  0001 C CNN
F 1 "GND" V 4700 9050 50  0000 R CNN
F 2 "" H 4700 9150 50  0001 C CNN
F 3 "" H 4700 9150 50  0001 C CNN
	1    4700 9150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5FFBA97F
P 5650 9350
F 0 "#PWR016" H 5650 9100 50  0001 C CNN
F 1 "GND" V 5650 9250 50  0000 R CNN
F 2 "" H 5650 9350 50  0001 C CNN
F 3 "" H 5650 9350 50  0001 C CNN
	1    5650 9350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5FFBB0A7
P 5650 8550
F 0 "#PWR015" H 5650 8300 50  0001 C CNN
F 1 "GND" V 5650 8450 50  0000 R CNN
F 2 "" H 5650 8550 50  0001 C CNN
F 3 "" H 5650 8550 50  0001 C CNN
	1    5650 8550
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5FFBB5FC
P 5600 7700
F 0 "#PWR014" H 5600 7450 50  0001 C CNN
F 1 "GND" V 5600 7600 50  0000 R CNN
F 2 "" H 5600 7700 50  0001 C CNN
F 3 "" H 5600 7700 50  0001 C CNN
	1    5600 7700
	0    -1   -1   0   
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
P 7500 3000
F 0 "C34" H 7350 3100 50  0000 L CNN
F 1 "2.2uF" H 7250 2900 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 7500 3000 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 7500 3000 50  0001 C CNN
F 4 "Taiyo Yuden" H 7500 3000 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 7500 3000 50  0001 C CNN "Part #"
	1    7500 3000
	-1   0    0    -1  
$EndComp
Connection ~ 7500 2900
$Comp
L power:GND #PWR018
U 1 1 5FFC4572
P 7500 3100
F 0 "#PWR018" H 7500 2850 50  0001 C CNN
F 1 "GND" H 7550 2950 50  0000 R CNN
F 2 "" H 7500 3100 50  0001 C CNN
F 3 "" H 7500 3100 50  0001 C CNN
	1    7500 3100
	1    0    0    -1  
$EndComp
Text Label 1850 9250 0    50   ~ 0
Over_temp_alarm2
Text Label 12550 2400 2    50   ~ 0
Over_temp_alarm2
Text Label 8250 5050 2    50   ~ 0
Over_temp_alarm1-MISO0
$Comp
L Custom_parts:LCD-EA_DOGS164N-A U15
U 1 1 5F49B318
P 9100 2450
F 0 "U15" H 9625 2575 50  0000 C CNN
F 1 "LCD-EA_DOGS164N-A" H 9625 2484 50  0000 C CNN
F 2 "Custom Footprints:LCD-EA_DOGS164N-A" H 9150 2450 50  0001 C CNN
F 3 "https://www.lcd-module.de/fileadmin/html-seiten/eng/pdf/doma/dogs164e.pdf" H 9100 2450 50  0001 C CNN
F 4 "Display Visions" H 9100 2450 50  0001 C CNN "Manufacturer"
F 5 "EA DOGS164N-A" H 9100 2450 50  0001 C CNN "Part #"
	1    9100 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR020
U 1 1 5F49D772
P 9000 2650
F 0 "#PWR020" H 9000 2400 50  0001 C CNN
F 1 "GND" V 9005 2522 50  0000 R CNN
F 2 "" H 9000 2650 50  0001 C CNN
F 3 "" H 9000 2650 50  0001 C CNN
	1    9000 2650
	0    1    1    0   
$EndComp
Wire Wire Line
	8650 2550 9000 2550
$Comp
L Device:C_Small C35
U 1 1 5F4C79BE
P 8650 2650
F 0 "C35" H 8500 2750 50  0000 L CNN
F 1 "2.2uF" H 8400 2550 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 8650 2650 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 8650 2650 50  0001 C CNN
F 4 "Taiyo Yuden" H 8650 2650 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 8650 2650 50  0001 C CNN "Part #"
	1    8650 2650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR019
U 1 1 5F4CC6D9
P 8650 2750
F 0 "#PWR019" H 8650 2500 50  0001 C CNN
F 1 "GND" H 8700 2600 50  0000 R CNN
F 2 "" H 8650 2750 50  0001 C CNN
F 3 "" H 8650 2750 50  0001 C CNN
	1    8650 2750
	1    0    0    -1  
$EndComp
Text Label 8750 2550 0    50   ~ 0
3.3V
$Comp
L Device:C_Small C36
U 1 1 5F4CD4EC
P 9000 2850
F 0 "C36" H 8850 2950 50  0000 L CNN
F 1 "2.2uF" H 8750 2750 50  0000 L CNN
F 2 "Custom Footprints:0508_Capacitor" H 9000 2850 50  0001 C CNN
F 3 "https://ds.yuden.co.jp/TYCOMPAS/ut/detail?pn=TWK212B7225MD-T%20&u=M" H 9000 2850 50  0001 C CNN
F 4 "Taiyo Yuden" H 9000 2850 50  0001 C CNN "Manufacturer"
F 5 "TWK212B7225MD-T" H 9000 2850 50  0001 C CNN "Part #"
	1    9000 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR021
U 1 1 5F4CDD36
P 9000 2950
F 0 "#PWR021" H 9000 2700 50  0001 C CNN
F 1 "GND" H 9050 2800 50  0000 R CNN
F 2 "" H 9000 2950 50  0001 C CNN
F 3 "" H 9000 2950 50  0001 C CNN
	1    9000 2950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 5F4CE233
P 9400 2900
F 0 "#PWR022" H 9400 2650 50  0001 C CNN
F 1 "GND" H 9400 2750 50  0000 R CNN
F 2 "" H 9400 2900 50  0001 C CNN
F 3 "" H 9400 2900 50  0001 C CNN
	1    9400 2900
	1    0    0    -1  
$EndComp
Text Label 9500 2900 3    50   ~ 0
LCD_CS
Text Label 9700 2900 3    50   ~ 0
MOSI0
Text Label 10250 2650 0    50   ~ 0
LCD_reset
Text Label 10250 2550 0    50   ~ 0
3.3V
$Comp
L Jumper:SolderJumper_2_Bridged JP5
U 1 1 5F4D3E38
P 9800 3050
F 0 "JP5" H 9800 2950 50  0000 C CNN
F 1 "SolderJumper_2_Bridged" H 9800 2900 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Bridged_Pad1.0x1.5mm" H 9800 3050 50  0001 C CNN
F 3 "~" H 9800 3050 50  0001 C CNN
	1    9800 3050
	0    -1   1    0   
$EndComp
Text Label 9800 3300 2    50   ~ 0
Over_temp_alarm1-MISO0
Wire Wire Line
	9800 3300 9800 3200
Text Label 14850 2200 0    50   ~ 0
SCK0
$Comp
L Device:Q_DUAL_NMOS_G1S2G2D2S1D1 Q1
U 2 1 5F695D52
P 2100 9750
F 0 "Q1" H 1900 9800 50  0000 L CNN
F 1 "Q_DUAL_NMOS" H 1600 9600 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:TSOT-23-6" H 2300 9750 50  0001 C CNN
F 3 "https://fscdn.rohm.com/en/products/databook/datasheet/discrete/transistor/mosfet/qs6k1-e.pdf" H 2300 9750 50  0001 C CNN
F 4 "Rohm Semiconductor" H 2100 9750 50  0001 C CNN "Manufacturer"
F 5 "QS6K1TR" H 2100 9750 50  0001 C CNN "Part #"
	2    2100 9750
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5F6B2779
P 1600 9150
F 0 "#PWR02" H 1600 8900 50  0001 C CNN
F 1 "GND" V 1600 9050 50  0000 R CNN
F 2 "" H 1600 9150 50  0001 C CNN
F 3 "" H 1600 9150 50  0001 C CNN
	1    1600 9150
	0    -1   -1   0   
$EndComp
Text Label 8250 5150 2    50   ~ 0
Over_temp_alarm2
$Comp
L power:GND #PWR08
U 1 1 5F8AE8D4
P 2000 9950
F 0 "#PWR08" H 2000 9700 50  0001 C CNN
F 1 "GND" V 2000 9850 50  0000 R CNN
F 2 "" H 2000 9950 50  0001 C CNN
F 3 "" H 2000 9950 50  0001 C CNN
	1    2000 9950
	0    1    1    0   
$EndComp
Text Label 2950 9500 0    50   ~ 0
5V
$Comp
L Device:R_Pack08_Split RN3
U 7 1 5FECCDD6
P 2800 9400
F 0 "RN3" V 2900 9400 50  0000 C CNN
F 1 "4.7k" V 2800 9400 50  0000 C CNN
F 2 "Custom Footprints:Bourns_16-SOIC_8x_r-pack" V 3275 9400 50  0001 C CNN
F 3 "file://media.digikey.com/api/videos/videoplayer/smallplayer/N0706.pdf" H 2800 9400 50  0001 C CNN
F 4 "Bourns Inc." V 2800 9400 50  0001 C CNN "Manufacturer"
F 5 "4816P-T01-472LF" V 2800 9400 50  0001 C CNN "Part #"
	7    2800 9400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1600 9450 1850 9450
Text Label 1850 9450 0    50   ~ 0
External_3v3_PWM
Text Label 2300 9750 0    50   ~ 0
External_5V_PWM
Wire Wire Line
	2650 9400 2600 9400
Wire Wire Line
	2600 9600 2650 9600
Wire Wire Line
	2950 9400 2950 9600
Wire Wire Line
	1600 9650 1900 9650
Wire Wire Line
	1900 9650 1900 9550
Wire Wire Line
	1900 9550 2000 9550
Wire Wire Line
	1600 9050 2600 9050
Wire Wire Line
	2600 9400 2600 9550
Wire Wire Line
	2000 9550 2600 9550
Connection ~ 2000 9550
Connection ~ 2600 9550
Wire Wire Line
	2600 9550 2600 9600
$EndSCHEMATC
