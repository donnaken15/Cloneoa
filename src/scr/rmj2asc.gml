///ROMAJI-TO-ASCII
///AN ASCII CHARSET WITH KATAKANA GRAPHICS WILL BE NEEDED
///INPUT MUST BE LOWERCASE

/// DONT USE YET, STILL WOKRING OON

//note to self, order replacements by widest combos to shortest

/*
097 - A
098 - I
099 - U
100 - E
101 - O
102 - KA
103 - KI
104 - KU
105 - KE
106 - KO
107 - SA
108 - SHI
109 - SU
110 - SE
111 - SO
112 - TA
113 - CHI
114 - TSU
115 - TE
116 - TO
117 - NA
118 - NI
119 - NU
120 - NE
121 - NO
128 - HA
129 - HI
130 - FU
131 - HE
132 - HO
133 - MA
134 - MI
135 - MU
136 - ME
137 - MO
138 - YA
139 - YU
140 - YO
141 - RA
142 - RI
143 - RU
144 - RE
145 - RO
146 - WA
147 - WI
148 - WE
149 - WO
150 - *YA
151 - *YU
152 - *YO
153 - GA
154 - GI
155 - GU
156 - GE
157 - GO
158 - ZA
159 - JI
160 - ZU
161 - ZE
162 - ZO
163 - DA
164 - DJI
165 - DZU
166 - OPEN QUOTE
167 - CLOSE QUOTE
224 - DE
225 - DO
226 - BA
227 - BI
228 - BU
229 - BE
230 - BO
231 - PA
232 - PI
233 - PU
234 - PE
235 - PO
236 - N
237 - LONG
238 - FULL STOP
239 - COMMA
246 - U+FF9E
247 - ("reduplicates and voices syllable")
248 - U+FF9F
249 - ("reduplicates and unvoices syllable")
250 - MIDDLE DOT

example strings from pause menu:
ゲームせつづける - ge-setsudzukeru
*/

var __new_string = argument0;
var __kana_rpms =
[
	"-",237,
	".",238,
	",",239,
	"PO",235,
	"PE",234,
	"PU",233,
	"PI",232,
	"PA",231,
	"BO",230,
	"BE",229,
	"BU",228,
	"BI",227,
	"BA",226,
	"DO",225,
	"DE",224,
	"DZU",229,
	"DJI",229,
	"DA",163,
	"ZO",162,
	"ZE",161,
	"ZU",160,
	"JI",159,
	"ZA",158,
	"GO",157,
	"GE",156,
	"GU",155,
	"GI",154,
	"GA",153,
	//"YO",152, figure out or something
	"WO",149,
	"WE",148,
	"WI",147,
	"WA",146,
	"RO",145,
	"RE",144,
	"RU",143,
	"RI",142,
	"RA",141,
	"RA",141,
];

/*
097 - A
098 - I
099 - U
100 - E
101 - O
102 - KA
103 - KI
104 - KU
105 - KE
106 - KO
107 - SA
108 - SHI
109 - SU
110 - SE
111 - SO
112 - TA
113 - CHI
114 - TSU
115 - TE
116 - TO
117 - NA
118 - NI
119 - NU
120 - NE
121 - NO
128 - HA
129 - HI
130 - FU
131 - HE
132 - HO
133 - MA
134 - MI
135 - MU
136 - ME
137 - MO
138 - YA
139 - YU
140 - YO
*/

//use this instead and figure out array thing
for(i=0;i<100;i+=1)
	__new_string = string_replace_all(__new_string,"-",ansi_char(237))

__new_string = string_replace_all(__new_string,"-",ansi_char(237))
__new_string = string_replace_all(__new_string,".",ansi_char(238))
__new_string = string_replace_all(__new_string,",",ansi_char(239))
while(string_count('"',__new_string)>0) {
	__new_string = string_replace(__new_string,'"',ansi_char(166))
	__new_string = string_replace(__new_string,'"',ansi_char(167))
}
__new_string = string_replace_all(__new_string,"PO",ansi_char(235))
__new_string = string_replace_all(__new_string,"PE",ansi_char(234))
__new_string = string_replace_all(__new_string,"PU",ansi_char(233))
__new_string = string_replace_all(__new_string,"PI",ansi_char(232))
__new_string = string_replace_all(__new_string,"PA",ansi_char(231))
__new_string = string_replace_all(__new_string,"BO",ansi_char(230))
__new_string = string_replace_all(__new_string,"BE",ansi_char(229))
__new_string = string_replace_all(__new_string,"BU",ansi_char(228))
__new_string = string_replace_all(__new_string,"BI",ansi_char(227))
__new_string = string_replace_all(__new_string,"BA",ansi_char(226))
__new_string = string_replace_all(__new_string,"DO",ansi_char(225))
__new_string = string_replace_all(__new_string,"DE",ansi_char(224))
__new_string = string_replace_all(__new_string,"DZU",ansi_char(165))
__new_string = string_replace_all(__new_string,"DJI",ansi_char(164))
__new_string = string_replace_all(__new_string,"DA",ansi_char(163))
__new_string = string_replace_all(__new_string,"ZO",ansi_char(162))
__new_string = string_replace_all(__new_string,"ZE",ansi_char(162))
__new_string = string_replace_all(__new_string,"ZU",ansi_char(162))
__new_string = string_replace_all(__new_string,"JI",ansi_char(162))
__new_string = string_replace_all(__new_string,"ZA",ansi_char(162))
__new_string = string_replace_all(__new_string,"GO",ansi_char(162))
__new_string = string_replace_all(__new_string,"GE",ansi_char(162))
__new_string = string_replace_all(__new_string,"GU",ansi_char(162))
__new_string = string_replace_all(__new_string,"GI",ansi_char(162))
__new_string = string_replace_all(__new_string,"GA",ansi_char(162))

