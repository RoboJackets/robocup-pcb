<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.1">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="2" name="Route2" color="1" fill="3" visible="no" active="no"/>
<layer number="3" name="Route3" color="4" fill="3" visible="no" active="no"/>
<layer number="4" name="Route4" color="1" fill="4" visible="no" active="no"/>
<layer number="5" name="Route5" color="4" fill="4" visible="no" active="no"/>
<layer number="6" name="Route6" color="1" fill="8" visible="no" active="no"/>
<layer number="7" name="Route7" color="4" fill="8" visible="no" active="no"/>
<layer number="8" name="Route8" color="1" fill="2" visible="no" active="no"/>
<layer number="9" name="Route9" color="4" fill="2" visible="no" active="no"/>
<layer number="10" name="Route10" color="1" fill="7" visible="no" active="no"/>
<layer number="11" name="Route11" color="4" fill="7" visible="no" active="no"/>
<layer number="12" name="Route12" color="1" fill="5" visible="no" active="no"/>
<layer number="13" name="Route13" color="4" fill="5" visible="no" active="no"/>
<layer number="14" name="Route14" color="1" fill="6" visible="no" active="no"/>
<layer number="15" name="Route15" color="4" fill="6" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="hirose">
<packages>
<package name="FH_11_HOR">
<wire x1="-7.8" y1="6.8" x2="-7.8" y2="0" width="0.127" layer="21"/>
<wire x1="-7.8" y1="6.8" x2="7.8" y2="6.8" width="0.127" layer="21"/>
<wire x1="7.8" y1="6.8" x2="7.8" y2="0" width="0.127" layer="21"/>
<wire x1="-7.8" y1="0" x2="7.8" y2="0" width="0.127" layer="21"/>
<smd name="11" x="5" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="10" x="4" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="9" x="3" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="8" x="2" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="7" x="1" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="6" x="0" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="5" x="-1" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="4" x="-2" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="3" x="-3" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="2" x="-4" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="1" x="-5" y="0.65" dx="0.6" dy="1.9" layer="1"/>
<smd name="12NC" x="8.2" y="3" dx="2.1" dy="2.8" layer="1"/>
<smd name="13NC" x="-8.2" y="3" dx="2.1" dy="2.8" layer="1"/>
<text x="-3" y="7" size="1.27" layer="25">&gt;NAME</text>
<rectangle x1="-7.1" y1="1.6" x2="-5.3" y2="4.4" layer="41"/>
<rectangle x1="5.3" y1="1.6" x2="7.1" y2="4.4" layer="41"/>
</package>
<package name="FH_11_PADONLY">
<smd name="11" x="5" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="10" x="4" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="9" x="3" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="8" x="2" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="7" x="1" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="6" x="0" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="5" x="-1" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="4" x="-2" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="3" x="-3" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="2" x="-4" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
<smd name="1" x="-5" y="-0.62" dx="0.6" dy="1.9" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="FH_11">
<wire x1="-7.62" y1="12.7" x2="7.62" y2="12.7" width="0.254" layer="94"/>
<wire x1="7.62" y1="12.7" x2="7.62" y2="-17.78" width="0.254" layer="94"/>
<wire x1="7.62" y1="-17.78" x2="-7.62" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-7.62" y1="-17.78" x2="-7.62" y2="12.7" width="0.254" layer="94"/>
<text x="-7.62" y="15.24" size="1.778" layer="95">&gt;NAME</text>
<text x="-7.62" y="12.7" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-12.7" y="10.16" length="middle"/>
<pin name="2" x="-12.7" y="7.62" length="middle"/>
<pin name="3" x="-12.7" y="5.08" length="middle"/>
<pin name="4" x="-12.7" y="2.54" length="middle"/>
<pin name="5" x="-12.7" y="0" length="middle"/>
<pin name="6" x="-12.7" y="-2.54" length="middle"/>
<pin name="7" x="-12.7" y="-5.08" length="middle"/>
<pin name="8" x="-12.7" y="-7.62" length="middle"/>
<pin name="9" x="-12.7" y="-10.16" length="middle"/>
<pin name="10" x="-12.7" y="-12.7" length="middle"/>
<pin name="11" x="-12.7" y="-15.24" length="middle"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FH_11_H">
<gates>
<gate name="G$1" symbol="FH_11" x="0" y="2.54"/>
</gates>
<devices>
<device name="" package="FH_11_HOR">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="FH_11_PAD" prefix="J">
<gates>
<gate name="G$1" symbol="FH_11" x="5.08" y="2.54"/>
</gates>
<devices>
<device name="" package="FH_11_PADONLY">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
<connect gate="G$1" pin="9" pad="9"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply2">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
Please keep in mind, that these devices are necessary for the
automatic wiring of the supply signals.&lt;p&gt;
The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="-1.27" width="0.254" layer="94"/>
<wire x1="0" y1="-1.27" x2="-1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.905" y="-3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="+05V">
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.1524" layer="94"/>
<wire x1="0" y1="0.635" x2="0" y2="1.905" width="0.1524" layer="94"/>
<circle x="0" y="1.27" radius="1.27" width="0.254" layer="94"/>
<text x="-1.905" y="3.175" size="1.778" layer="96">&gt;VALUE</text>
<pin name="+5V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="GND" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="+5V" prefix="SUPPLY">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="+5V" symbol="+05V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="J1" library="hirose" deviceset="FH_11_H" device=""/>
<part name="J2" library="hirose" deviceset="FH_11_PAD" device=""/>
<part name="SUPPLY1" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY2" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY3" library="supply2" deviceset="+5V" device=""/>
<part name="SUPPLY4" library="supply2" deviceset="+5V" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="J1" gate="G$1" x="121.92" y="38.1" rot="MR0"/>
<instance part="J2" gate="G$1" x="185.42" y="38.1"/>
<instance part="SUPPLY1" gate="GND" x="139.7" y="33.02" rot="R90"/>
<instance part="SUPPLY2" gate="GND" x="167.64" y="33.02" rot="R270"/>
<instance part="SUPPLY3" gate="+5V" x="139.7" y="22.86" rot="R270"/>
<instance part="SUPPLY4" gate="+5V" x="167.64" y="22.86" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="SUPPLY1" gate="GND" pin="GND"/>
<pinref part="J1" gate="G$1" pin="7"/>
<wire x1="134.62" y1="33.02" x2="137.16" y2="33.02" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="7"/>
<wire x1="172.72" y1="33.02" x2="170.18" y2="33.02" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="GND" pin="GND"/>
</segment>
</net>
<net name="MA" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="134.62" y1="48.26" x2="137.16" y2="48.26" width="0.1524" layer="91"/>
<wire x1="137.16" y1="48.26" x2="137.16" y2="45.72" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="137.16" y1="45.72" x2="134.62" y2="45.72" width="0.1524" layer="91"/>
<wire x1="137.16" y1="48.26" x2="170.18" y2="48.26" width="0.1524" layer="91"/>
<wire x1="170.18" y1="48.26" x2="170.18" y2="45.72" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="170.18" y1="45.72" x2="172.72" y2="45.72" width="0.1524" layer="91"/>
<junction x="137.16" y="48.26"/>
<label x="147.32" y="48.26" size="1.778" layer="95"/>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="170.18" y1="48.26" x2="172.72" y2="48.26" width="0.1524" layer="91"/>
<junction x="170.18" y="48.26"/>
</segment>
</net>
<net name="MB" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="134.62" y1="43.18" x2="137.16" y2="43.18" width="0.1524" layer="91"/>
<wire x1="137.16" y1="43.18" x2="137.16" y2="40.64" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="4"/>
<wire x1="137.16" y1="40.64" x2="134.62" y2="40.64" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="3"/>
<wire x1="172.72" y1="43.18" x2="170.18" y2="43.18" width="0.1524" layer="91"/>
<wire x1="170.18" y1="43.18" x2="170.18" y2="40.64" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="4"/>
<wire x1="170.18" y1="40.64" x2="172.72" y2="40.64" width="0.1524" layer="91"/>
<wire x1="170.18" y1="43.18" x2="137.16" y2="43.18" width="0.1524" layer="91"/>
<junction x="137.16" y="43.18"/>
<junction x="170.18" y="43.18"/>
<label x="147.32" y="43.18" size="1.778" layer="95"/>
</segment>
</net>
<net name="MC" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="5"/>
<wire x1="134.62" y1="38.1" x2="137.16" y2="38.1" width="0.1524" layer="91"/>
<wire x1="137.16" y1="38.1" x2="137.16" y2="35.56" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="6"/>
<wire x1="137.16" y1="35.56" x2="134.62" y2="35.56" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="5"/>
<wire x1="172.72" y1="38.1" x2="170.18" y2="38.1" width="0.1524" layer="91"/>
<wire x1="170.18" y1="38.1" x2="170.18" y2="35.56" width="0.1524" layer="91"/>
<pinref part="J2" gate="G$1" pin="6"/>
<wire x1="170.18" y1="35.56" x2="172.72" y2="35.56" width="0.1524" layer="91"/>
<wire x1="170.18" y1="38.1" x2="137.16" y2="38.1" width="0.1524" layer="91"/>
<junction x="137.16" y="38.1"/>
<junction x="170.18" y="38.1"/>
<label x="147.32" y="38.1" size="1.778" layer="95"/>
</segment>
</net>
<net name="HALLB" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="8"/>
<pinref part="J2" gate="G$1" pin="8"/>
<wire x1="134.62" y1="30.48" x2="172.72" y2="30.48" width="0.1524" layer="91"/>
<label x="147.32" y="30.48" size="1.778" layer="95"/>
</segment>
</net>
<net name="HALLA" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="9"/>
<pinref part="J1" gate="G$1" pin="9"/>
<wire x1="172.72" y1="27.94" x2="134.62" y2="27.94" width="0.1524" layer="91"/>
<label x="147.32" y="27.94" size="1.778" layer="95"/>
</segment>
</net>
<net name="HALLC" class="0">
<segment>
<pinref part="J1" gate="G$1" pin="10"/>
<pinref part="J2" gate="G$1" pin="10"/>
<wire x1="134.62" y1="25.4" x2="172.72" y2="25.4" width="0.1524" layer="91"/>
<label x="147.32" y="25.4" size="1.778" layer="95"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="SUPPLY3" gate="+5V" pin="+5V"/>
<pinref part="J1" gate="G$1" pin="11"/>
<wire x1="137.16" y1="22.86" x2="134.62" y2="22.86" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY4" gate="+5V" pin="+5V"/>
<pinref part="J2" gate="G$1" pin="11"/>
<wire x1="170.18" y1="22.86" x2="172.72" y2="22.86" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
