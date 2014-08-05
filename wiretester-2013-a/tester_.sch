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
<library name="2mm">
<packages>
<package name="2MM-4-H">
<wire x1="2.2" y1="-2" x2="2.2" y2="8" width="0.127" layer="21"/>
<wire x1="2.2" y1="8" x2="-8.2" y2="8" width="0.127" layer="21"/>
<wire x1="-8.2" y1="8" x2="-8.2" y2="-2" width="0.127" layer="21"/>
<wire x1="-8.2" y1="-2" x2="2.2" y2="-2" width="0.127" layer="21"/>
<pad name="2" x="-2" y="0" drill="0.8"/>
<pad name="1" x="0" y="0" drill="0.8" shape="square"/>
<pad name="3" x="-4" y="0" drill="0.8"/>
<pad name="4" x="-6" y="0" drill="0.8"/>
<text x="-7.62" y="-3.81" size="1.27" layer="25">&gt;NAME</text>
</package>
<package name="2MM-4-V">
<wire x1="3" y1="-3" x2="3" y2="3" width="0.127" layer="21"/>
<wire x1="3" y1="3" x2="-9" y2="3" width="0.127" layer="21"/>
<wire x1="-9" y1="3" x2="-9" y2="-3" width="0.127" layer="21"/>
<wire x1="-9" y1="-3" x2="3" y2="-3" width="0.127" layer="21"/>
<pad name="2" x="-2" y="0" drill="0.8"/>
<pad name="1" x="0" y="0" drill="0.8" shape="square"/>
<pad name="3" x="-4" y="0" drill="0.8"/>
<pad name="4" x="-6" y="0" drill="0.8"/>
<text x="-8.89" y="-5.08" size="1.27" layer="25">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="4">
<circle x="-5.842" y="0" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.842" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.842" y="-5.08" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.842" y="-7.62" radius="0.762" width="0.254" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="0" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="2" x="0" y="-2.54" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="3" x="0" y="-5.08" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="4" x="0" y="-7.62" visible="pad" length="middle" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="2MM-4" prefix="J">
<gates>
<gate name="G$1" symbol="4" x="0" y="0" swaplevel="1"/>
</gates>
<devices>
<device name="H" package="2MM-4-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="V" package="2MM-4-V">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="1.25mm">
<packages>
<package name="1.25MM-4-H">
<pad name="1" x="0" y="0" drill="0.5" shape="square"/>
<pad name="2" x="-1.25" y="0" drill="0.5"/>
<pad name="3" x="-2.5" y="0" drill="0.5"/>
<pad name="4" x="-3.75" y="0" drill="0.5"/>
<wire x1="-5.25" y1="4.45" x2="-5.25" y2="-1.05" width="0.127" layer="21"/>
<wire x1="-5.25" y1="-1.05" x2="1.5" y2="-1.05" width="0.127" layer="21"/>
<wire x1="1.5" y1="-1.05" x2="1.5" y2="4.45" width="0.127" layer="21"/>
<wire x1="1.5" y1="4.45" x2="-5.25" y2="4.45" width="0.127" layer="21"/>
<text x="-5.08" y="-2.54" size="1.27" layer="21">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="4">
<circle x="-5.842" y="0" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.842" y="-2.54" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.842" y="-5.08" radius="0.762" width="0.254" layer="94"/>
<circle x="-5.842" y="-7.62" radius="0.762" width="0.254" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="0" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="2" x="0" y="-2.54" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="3" x="0" y="-5.08" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="4" x="0" y="-7.62" visible="pad" length="middle" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="1.25MM-4H" prefix="J">
<gates>
<gate name="G$1" symbol="4" x="0" y="0"/>
</gates>
<devices>
<device name="" package="1.25MM-4-H">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
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
<library name="battholders">
<packages>
<package name="BATT-AAA-2">
<pad name="V+" x="-6.35" y="1.7526" drill="0.508" shape="square"/>
<pad name="GND" x="6.35" y="1.7526" drill="0.508"/>
<wire x1="-12.192" y1="51.2064" x2="-12.192" y2="0" width="0.127" layer="21"/>
<wire x1="-12.192" y1="0" x2="12.192" y2="0" width="0.127" layer="21"/>
<wire x1="12.192" y1="0" x2="12.192" y2="51.2064" width="0.127" layer="21"/>
<wire x1="12.192" y1="51.2064" x2="-12.192" y2="51.2064" width="0.127" layer="21"/>
<hole x="-8.763" y="25.6032" drill="2.3622"/>
<hole x="8.763" y="25.6032" drill="2.3622"/>
<text x="6.35" y="2.54" size="1.778" layer="21">-</text>
<text x="-6.35" y="2.54" size="1.778" layer="21">+</text>
</package>
</packages>
<symbols>
<symbol name="BATT-AAA-2">
<pin name="+" x="0" y="0" length="middle" rot="R180"/>
<pin name="-" x="0" y="-5.08" length="middle" rot="R180"/>
<circle x="-6.35" y="0" radius="1.27" width="0.254" layer="94"/>
<circle x="-6.35" y="-5.08" radius="1.27" width="0.254" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="BATT-AAA-2">
<gates>
<gate name="G$1" symbol="BATT-AAA-2" x="0" y="0"/>
</gates>
<devices>
<device name="" package="BATT-AAA-2">
<connects>
<connect gate="G$1" pin="+" pad="V+"/>
<connect gate="G$1" pin="-" pad="GND"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="resistor-array">
<packages>
<package name="RA_4_1206">
<wire x1="-1.6" y1="1.1" x2="1.6" y2="1.1" width="0.153" layer="21"/>
<wire x1="1.6" y1="1.1" x2="1.6" y2="-1.1" width="0.153" layer="21"/>
<wire x1="1.6" y1="-1.1" x2="-1.6" y2="-1.1" width="0.153" layer="21"/>
<wire x1="-1.6" y1="-1.1" x2="-1.6" y2="1.1" width="0.153" layer="21"/>
<smd name="2" x="-1.2" y="0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="1" x="-1.2" y="-0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="4" x="-0.4" y="0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="3" x="-0.4" y="-0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="6" x="0.4" y="0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="5" x="0.4" y="-0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="8" x="1.2" y="0.85" dx="0.5" dy="0.9" layer="1"/>
<smd name="7" x="1.2" y="-0.85" dx="0.5" dy="0.9" layer="1"/>
<text x="-1.524" y="2.794" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.524" y="1.524" size="1.27" layer="27">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="RA-4">
<wire x1="-2.54" y1="0" x2="-2.159" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="1.016" x2="-1.524" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-1.016" x2="-0.889" y2="1.016" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="1.016" x2="-0.254" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-1.016" x2="0.381" y2="1.016" width="0.2032" layer="94"/>
<wire x1="0.381" y1="1.016" x2="1.016" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-1.016" x2="1.651" y2="1.016" width="0.2032" layer="94"/>
<wire x1="1.651" y1="1.016" x2="2.286" y2="-1.016" width="0.2032" layer="94"/>
<wire x1="2.286" y1="-1.016" x2="2.54" y2="0" width="0.2032" layer="94"/>
<wire x1="-2.54" y1="-2.54" x2="-2.159" y2="-1.524" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="-1.524" x2="-1.524" y2="-3.556" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-3.556" x2="-0.889" y2="-1.524" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="-1.524" x2="-0.254" y2="-3.556" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-3.556" x2="0.381" y2="-1.524" width="0.2032" layer="94"/>
<wire x1="0.381" y1="-1.524" x2="1.016" y2="-3.556" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-3.556" x2="1.651" y2="-1.524" width="0.2032" layer="94"/>
<wire x1="1.651" y1="-1.524" x2="2.286" y2="-3.556" width="0.2032" layer="94"/>
<wire x1="2.286" y1="-3.556" x2="2.54" y2="-2.54" width="0.2032" layer="94"/>
<wire x1="-2.54" y1="-5.08" x2="-2.159" y2="-4.064" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="-4.064" x2="-1.524" y2="-6.096" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-6.096" x2="-0.889" y2="-4.064" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="-4.064" x2="-0.254" y2="-6.096" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-6.096" x2="0.381" y2="-4.064" width="0.2032" layer="94"/>
<wire x1="0.381" y1="-4.064" x2="1.016" y2="-6.096" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-6.096" x2="1.651" y2="-4.064" width="0.2032" layer="94"/>
<wire x1="1.651" y1="-4.064" x2="2.286" y2="-6.096" width="0.2032" layer="94"/>
<wire x1="2.286" y1="-6.096" x2="2.54" y2="-5.08" width="0.2032" layer="94"/>
<wire x1="-2.54" y1="-7.62" x2="-2.159" y2="-6.604" width="0.2032" layer="94"/>
<wire x1="-2.159" y1="-6.604" x2="-1.524" y2="-8.636" width="0.2032" layer="94"/>
<wire x1="-1.524" y1="-8.636" x2="-0.889" y2="-6.604" width="0.2032" layer="94"/>
<wire x1="-0.889" y1="-6.604" x2="-0.254" y2="-8.636" width="0.2032" layer="94"/>
<wire x1="-0.254" y1="-8.636" x2="0.381" y2="-6.604" width="0.2032" layer="94"/>
<wire x1="0.381" y1="-6.604" x2="1.016" y2="-8.636" width="0.2032" layer="94"/>
<wire x1="1.016" y1="-8.636" x2="1.651" y2="-6.604" width="0.2032" layer="94"/>
<wire x1="1.651" y1="-6.604" x2="2.286" y2="-8.636" width="0.2032" layer="94"/>
<wire x1="2.286" y1="-8.636" x2="2.54" y2="-7.62" width="0.2032" layer="94"/>
<text x="-5.08" y="5.08" size="1.778" layer="95">&gt;NAME</text>
<text x="-5.08" y="2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="2" x="5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="1" x="-5.08" y="0" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="4" x="5.08" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="-5.08" y="-2.54" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="6" x="5.08" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5" x="-5.08" y="-5.08" visible="off" length="short" direction="pas" swaplevel="1"/>
<pin name="8" x="5.08" y="-7.62" visible="off" length="short" direction="pas" swaplevel="1" rot="R180"/>
<pin name="7" x="-5.08" y="-7.62" visible="off" length="short" direction="pas" swaplevel="1"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="RA-4" prefix="R">
<gates>
<gate name="G$1" symbol="RA-4" x="0" y="0"/>
</gates>
<devices>
<device name="1206" package="RA_4_1206">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
<connect gate="G$1" pin="7" pad="7"/>
<connect gate="G$1" pin="8" pad="8"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="led-array">
<packages>
<package name="HLMP-2820">
<wire x1="0" y1="10.16" x2="20.32" y2="10.16" width="0.127" layer="21"/>
<wire x1="20.32" y1="10.16" x2="20.32" y2="0" width="0.127" layer="21"/>
<wire x1="20.32" y1="0" x2="0" y2="0" width="0.127" layer="21"/>
<wire x1="0" y1="0" x2="0" y2="10.16" width="0.127" layer="21"/>
<pad name="1" x="1.27" y="1.27" drill="0.5588" shape="square"/>
<pad name="2" x="3.81" y="1.27" drill="0.5588"/>
<pad name="3" x="6.35" y="1.27" drill="0.5588"/>
<pad name="4" x="8.89" y="1.27" drill="0.5588"/>
<pad name="5" x="11.43" y="1.27" drill="0.5588"/>
<pad name="6" x="13.97" y="1.27" drill="0.5588"/>
<pad name="7" x="16.51" y="1.27" drill="0.5588"/>
<pad name="8" x="19.05" y="1.27" drill="0.5588"/>
<pad name="9" x="19.05" y="8.89" drill="0.5588"/>
<pad name="10" x="16.51" y="8.89" drill="0.5588"/>
<pad name="11" x="13.97" y="8.89" drill="0.5588"/>
<pad name="12" x="11.43" y="8.89" drill="0.5588"/>
<pad name="13" x="8.89" y="8.89" drill="0.5588"/>
<pad name="14" x="6.35" y="8.89" drill="0.5588"/>
<pad name="15" x="3.81" y="8.89" drill="0.5588"/>
<pad name="16" x="1.27" y="8.89" drill="0.5588"/>
<text x="0" y="-1.27" size="1.27" layer="21">&gt;NAME</text>
</package>
</packages>
<symbols>
<symbol name="LED-ARRAY-8">
<wire x1="5.08" y1="-1.27" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="5.08" y2="1.27" width="0.254" layer="94"/>
<wire x1="2.54" y1="-1.27" x2="2.54" y2="0" width="0.254" layer="94"/>
<wire x1="2.54" y1="0" x2="2.54" y2="1.27" width="0.254" layer="94"/>
<wire x1="5.08" y1="-1.27" x2="5.08" y2="0" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="5.08" y2="1.27" width="0.254" layer="94"/>
<wire x1="5.08" y1="0" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="4.318" y1="2.032" x2="2.921" y2="3.429" width="0.1524" layer="94"/>
<wire x1="3.175" y1="1.905" x2="1.778" y2="3.302" width="0.1524" layer="94"/>
<wire x1="12.7" y1="1.27" x2="15.24" y2="0" width="0.254" layer="94"/>
<wire x1="15.24" y1="0" x2="12.7" y2="-1.27" width="0.254" layer="94"/>
<wire x1="15.24" y1="1.27" x2="15.24" y2="0" width="0.254" layer="94"/>
<wire x1="15.24" y1="0" x2="15.24" y2="-1.27" width="0.254" layer="94"/>
<wire x1="12.7" y1="1.27" x2="12.7" y2="0" width="0.254" layer="94"/>
<wire x1="12.7" y1="0" x2="12.7" y2="-1.27" width="0.254" layer="94"/>
<wire x1="12.7" y1="0" x2="15.24" y2="0" width="0.1524" layer="94"/>
<wire x1="13.462" y1="-2.032" x2="14.859" y2="-3.429" width="0.1524" layer="94"/>
<wire x1="14.605" y1="-1.905" x2="16.002" y2="-3.302" width="0.1524" layer="94"/>
<wire x1="25.4" y1="-1.27" x2="22.86" y2="0" width="0.254" layer="94"/>
<wire x1="22.86" y1="0" x2="25.4" y2="1.27" width="0.254" layer="94"/>
<wire x1="22.86" y1="-1.27" x2="22.86" y2="0" width="0.254" layer="94"/>
<wire x1="22.86" y1="0" x2="22.86" y2="1.27" width="0.254" layer="94"/>
<wire x1="25.4" y1="-1.27" x2="25.4" y2="0" width="0.254" layer="94"/>
<wire x1="25.4" y1="0" x2="25.4" y2="1.27" width="0.254" layer="94"/>
<wire x1="25.4" y1="0" x2="22.86" y2="0" width="0.1524" layer="94"/>
<wire x1="24.638" y1="2.032" x2="23.241" y2="3.429" width="0.1524" layer="94"/>
<wire x1="23.495" y1="1.905" x2="22.098" y2="3.302" width="0.1524" layer="94"/>
<text x="-15.24" y="0" size="1.778" layer="95">&gt;NAME</text>
<text x="-15.24" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="0" y="0" visible="off" length="short" direction="pas"/>
<pin name="2" x="7.62" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="4" x="17.78" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="3" x="10.16" y="0" visible="off" length="short" direction="pas"/>
<pin name="5" x="20.32" y="0" visible="off" length="short" direction="pas"/>
<pin name="6" x="27.94" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<polygon width="0.1524" layer="94">
<vertex x="2.921" y="3.429"/>
<vertex x="3.81" y="3.048"/>
<vertex x="3.302" y="2.54"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="1.778" y="3.302"/>
<vertex x="2.667" y="2.921"/>
<vertex x="2.159" y="2.413"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="14.859" y="-3.429"/>
<vertex x="13.97" y="-3.048"/>
<vertex x="14.478" y="-2.54"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="16.002" y="-3.302"/>
<vertex x="15.113" y="-2.921"/>
<vertex x="15.621" y="-2.413"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="23.241" y="3.429"/>
<vertex x="24.13" y="3.048"/>
<vertex x="23.622" y="2.54"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="22.098" y="3.302"/>
<vertex x="22.987" y="2.921"/>
<vertex x="22.479" y="2.413"/>
</polygon>
<wire x1="33.02" y1="1.27" x2="35.56" y2="0" width="0.254" layer="94"/>
<wire x1="35.56" y1="0" x2="33.02" y2="-1.27" width="0.254" layer="94"/>
<wire x1="35.56" y1="1.27" x2="35.56" y2="0" width="0.254" layer="94"/>
<wire x1="35.56" y1="0" x2="35.56" y2="-1.27" width="0.254" layer="94"/>
<wire x1="33.02" y1="1.27" x2="33.02" y2="0" width="0.254" layer="94"/>
<wire x1="33.02" y1="0" x2="33.02" y2="-1.27" width="0.254" layer="94"/>
<wire x1="33.02" y1="0" x2="35.56" y2="0" width="0.1524" layer="94"/>
<wire x1="33.782" y1="-2.032" x2="35.179" y2="-3.429" width="0.1524" layer="94"/>
<wire x1="34.925" y1="-1.905" x2="36.322" y2="-3.302" width="0.1524" layer="94"/>
<pin name="8" x="38.1" y="0" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="7" x="30.48" y="0" visible="off" length="short" direction="pas"/>
<polygon width="0.1524" layer="94">
<vertex x="35.179" y="-3.429"/>
<vertex x="34.29" y="-3.048"/>
<vertex x="34.798" y="-2.54"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="36.322" y="-3.302"/>
<vertex x="35.433" y="-2.921"/>
<vertex x="35.941" y="-2.413"/>
</polygon>
<wire x1="33.02" y1="8.89" x2="35.56" y2="7.62" width="0.254" layer="94"/>
<wire x1="35.56" y1="7.62" x2="33.02" y2="6.35" width="0.254" layer="94"/>
<wire x1="35.56" y1="8.89" x2="35.56" y2="7.62" width="0.254" layer="94"/>
<wire x1="35.56" y1="7.62" x2="35.56" y2="6.35" width="0.254" layer="94"/>
<wire x1="33.02" y1="8.89" x2="33.02" y2="7.62" width="0.254" layer="94"/>
<wire x1="33.02" y1="7.62" x2="33.02" y2="6.35" width="0.254" layer="94"/>
<wire x1="33.02" y1="7.62" x2="35.56" y2="7.62" width="0.1524" layer="94"/>
<wire x1="33.782" y1="5.588" x2="35.179" y2="4.191" width="0.1524" layer="94"/>
<wire x1="34.925" y1="5.715" x2="36.322" y2="4.318" width="0.1524" layer="94"/>
<wire x1="25.4" y1="6.35" x2="22.86" y2="7.62" width="0.254" layer="94"/>
<wire x1="22.86" y1="7.62" x2="25.4" y2="8.89" width="0.254" layer="94"/>
<wire x1="22.86" y1="6.35" x2="22.86" y2="7.62" width="0.254" layer="94"/>
<wire x1="22.86" y1="7.62" x2="22.86" y2="8.89" width="0.254" layer="94"/>
<wire x1="25.4" y1="6.35" x2="25.4" y2="7.62" width="0.254" layer="94"/>
<wire x1="25.4" y1="7.62" x2="25.4" y2="8.89" width="0.254" layer="94"/>
<wire x1="25.4" y1="7.62" x2="22.86" y2="7.62" width="0.1524" layer="94"/>
<wire x1="24.638" y1="9.652" x2="23.241" y2="11.049" width="0.1524" layer="94"/>
<wire x1="23.495" y1="9.525" x2="22.098" y2="10.922" width="0.1524" layer="94"/>
<wire x1="12.7" y1="8.89" x2="15.24" y2="7.62" width="0.254" layer="94"/>
<wire x1="15.24" y1="7.62" x2="12.7" y2="6.35" width="0.254" layer="94"/>
<wire x1="15.24" y1="8.89" x2="15.24" y2="7.62" width="0.254" layer="94"/>
<wire x1="15.24" y1="7.62" x2="15.24" y2="6.35" width="0.254" layer="94"/>
<wire x1="12.7" y1="8.89" x2="12.7" y2="7.62" width="0.254" layer="94"/>
<wire x1="12.7" y1="7.62" x2="12.7" y2="6.35" width="0.254" layer="94"/>
<wire x1="12.7" y1="7.62" x2="15.24" y2="7.62" width="0.1524" layer="94"/>
<wire x1="13.462" y1="5.588" x2="14.859" y2="4.191" width="0.1524" layer="94"/>
<wire x1="14.605" y1="5.715" x2="16.002" y2="4.318" width="0.1524" layer="94"/>
<pin name="9" x="38.1" y="7.62" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="10" x="30.48" y="7.62" visible="off" length="short" direction="pas"/>
<pin name="12" x="20.32" y="7.62" visible="off" length="short" direction="pas"/>
<pin name="11" x="27.94" y="7.62" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="13" x="17.78" y="7.62" visible="off" length="short" direction="pas" rot="R180"/>
<pin name="14" x="10.16" y="7.62" visible="off" length="short" direction="pas"/>
<polygon width="0.1524" layer="94">
<vertex x="35.179" y="4.191"/>
<vertex x="34.29" y="4.572"/>
<vertex x="34.798" y="5.08"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="36.322" y="4.318"/>
<vertex x="35.433" y="4.699"/>
<vertex x="35.941" y="5.207"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="23.241" y="11.049"/>
<vertex x="24.13" y="10.668"/>
<vertex x="23.622" y="10.16"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="22.098" y="10.922"/>
<vertex x="22.987" y="10.541"/>
<vertex x="22.479" y="10.033"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="14.859" y="4.191"/>
<vertex x="13.97" y="4.572"/>
<vertex x="14.478" y="5.08"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="16.002" y="4.318"/>
<vertex x="15.113" y="4.699"/>
<vertex x="15.621" y="5.207"/>
</polygon>
<wire x1="5.08" y1="6.35" x2="2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="7.62" x2="5.08" y2="8.89" width="0.254" layer="94"/>
<wire x1="2.54" y1="6.35" x2="2.54" y2="7.62" width="0.254" layer="94"/>
<wire x1="2.54" y1="7.62" x2="2.54" y2="8.89" width="0.254" layer="94"/>
<wire x1="5.08" y1="6.35" x2="5.08" y2="7.62" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="5.08" y2="8.89" width="0.254" layer="94"/>
<wire x1="5.08" y1="7.62" x2="2.54" y2="7.62" width="0.1524" layer="94"/>
<wire x1="4.318" y1="9.652" x2="2.921" y2="11.049" width="0.1524" layer="94"/>
<wire x1="3.175" y1="9.525" x2="1.778" y2="10.922" width="0.1524" layer="94"/>
<pin name="16" x="0" y="7.62" visible="off" length="short" direction="pas"/>
<pin name="15" x="7.62" y="7.62" visible="off" length="short" direction="pas" rot="R180"/>
<polygon width="0.1524" layer="94">
<vertex x="2.921" y="11.049"/>
<vertex x="3.81" y="10.668"/>
<vertex x="3.302" y="10.16"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="1.778" y="10.922"/>
<vertex x="2.667" y="10.541"/>
<vertex x="2.159" y="10.033"/>
</polygon>
<text x="0" y="-2.54" size="1.778" layer="97">1</text>
<text x="10.16" y="-2.54" size="1.778" layer="97">2</text>
<text x="20.32" y="-2.54" size="1.778" layer="97">3</text>
<text x="30.48" y="-2.54" size="1.778" layer="97">4</text>
<text x="30.48" y="5.08" size="1.778" layer="97">5</text>
<text x="20.32" y="5.08" size="1.778" layer="97">6</text>
<text x="10.16" y="5.08" size="1.778" layer="97">7</text>
<text x="0" y="5.08" size="1.778" layer="97">8</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="HLMP-2820" prefix="D">
<gates>
<gate name="G$1" symbol="LED-ARRAY-8" x="0" y="0"/>
</gates>
<devices>
<device name="" package="HLMP-2820">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="10" pad="10"/>
<connect gate="G$1" pin="11" pad="11"/>
<connect gate="G$1" pin="12" pad="12"/>
<connect gate="G$1" pin="13" pad="13"/>
<connect gate="G$1" pin="14" pad="14"/>
<connect gate="G$1" pin="15" pad="15"/>
<connect gate="G$1" pin="16" pad="16"/>
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
<part name="J1" library="2mm" deviceset="2MM-4" device="H"/>
<part name="J2" library="1.25mm" deviceset="1.25MM-4H" device=""/>
<part name="SUPPLY1" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY3" library="supply2" deviceset="+5V" device=""/>
<part name="U$1" library="battholders" deviceset="BATT-AAA-2" device=""/>
<part name="R1" library="resistor-array" deviceset="RA-4" device="1206"/>
<part name="R2" library="resistor-array" deviceset="RA-4" device="1206"/>
<part name="R3" library="resistor-array" deviceset="RA-4" device="1206"/>
<part name="R4" library="resistor-array" deviceset="RA-4" device="1206"/>
<part name="D1" library="led-array" deviceset="HLMP-2820" device=""/>
<part name="SUPPLY2" library="supply2" deviceset="GND" device=""/>
<part name="SUPPLY4" library="supply2" deviceset="+5V" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<wire x1="7.62" y1="45.72" x2="132.08" y2="45.72" width="0.1524" layer="97" style="shortdash"/>
<wire x1="132.08" y1="45.72" x2="132.08" y2="-114.3" width="0.1524" layer="97" style="shortdash"/>
<wire x1="132.08" y1="-114.3" x2="7.62" y2="-114.3" width="0.1524" layer="97" style="shortdash"/>
<wire x1="7.62" y1="-114.3" x2="7.62" y2="45.72" width="0.1524" layer="97" style="shortdash"/>
<text x="10.16" y="40.64" size="1.778" layer="97">Tester</text>
<wire x1="-30.48" y1="45.72" x2="0" y2="45.72" width="0.1524" layer="97" style="shortdash"/>
<wire x1="0" y1="45.72" x2="0" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="0" y1="7.62" x2="-30.48" y2="7.62" width="0.1524" layer="97" style="shortdash"/>
<wire x1="-30.48" y1="7.62" x2="-30.48" y2="45.72" width="0.1524" layer="97" style="shortdash"/>
<text x="-27.94" y="40.64" size="1.778" layer="97">Battery</text>
</plain>
<instances>
<instance part="J1" gate="G$1" x="35.56" y="17.78" rot="R180"/>
<instance part="J2" gate="G$1" x="55.88" y="25.4"/>
<instance part="SUPPLY1" gate="GND" x="-15.24" y="17.78"/>
<instance part="SUPPLY3" gate="+5V" x="-15.24" y="33.02"/>
<instance part="U$1" gate="G$1" x="-15.24" y="27.94"/>
<instance part="R1" gate="G$1" x="101.6" y="17.78"/>
<instance part="R2" gate="G$1" x="88.9" y="7.62"/>
<instance part="R3" gate="G$1" x="76.2" y="-2.54"/>
<instance part="R4" gate="G$1" x="63.5" y="-12.7"/>
<instance part="D1" gate="G$1" x="111.76" y="17.78" rot="R270"/>
<instance part="SUPPLY2" gate="GND" x="124.46" y="-25.4"/>
<instance part="SUPPLY4" gate="+5V" x="35.56" y="30.48"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="-"/>
<pinref part="SUPPLY1" gate="GND" pin="GND"/>
<wire x1="-15.24" y1="20.32" x2="-15.24" y2="22.86" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="D1" gate="G$1" pin="8"/>
<pinref part="D1" gate="G$1" pin="9"/>
<wire x1="111.76" y1="-20.32" x2="119.38" y2="-20.32" width="0.1524" layer="91"/>
<wire x1="119.38" y1="-20.32" x2="124.46" y2="-20.32" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="4"/>
<pinref part="D1" gate="G$1" pin="13"/>
<wire x1="111.76" y1="0" x2="119.38" y2="0" width="0.1524" layer="91"/>
<wire x1="119.38" y1="0" x2="124.46" y2="0" width="0.1524" layer="91"/>
<wire x1="124.46" y1="0" x2="124.46" y2="17.78" width="0.1524" layer="91"/>
<wire x1="124.46" y1="-20.32" x2="124.46" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="SUPPLY2" gate="GND" pin="GND"/>
<wire x1="124.46" y1="-2.54" x2="124.46" y2="0" width="0.1524" layer="91"/>
<wire x1="124.46" y1="-22.86" x2="124.46" y2="-20.32" width="0.1524" layer="91"/>
<junction x="124.46" y="-20.32"/>
<junction x="124.46" y="0"/>
<junction x="119.38" y="0"/>
<junction x="119.38" y="-20.32"/>
<pinref part="D1" gate="G$1" pin="12"/>
<pinref part="D1" gate="G$1" pin="5"/>
<wire x1="119.38" y1="-2.54" x2="111.76" y2="-2.54" width="0.1524" layer="91"/>
<wire x1="119.38" y1="-2.54" x2="124.46" y2="-2.54" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="1"/>
<pinref part="D1" gate="G$1" pin="16"/>
<wire x1="111.76" y1="17.78" x2="119.38" y2="17.78" width="0.1524" layer="91"/>
<wire x1="119.38" y1="17.78" x2="124.46" y2="17.78" width="0.1524" layer="91"/>
<junction x="119.38" y="-2.54"/>
<junction x="124.46" y="-2.54"/>
<junction x="119.38" y="17.78"/>
</segment>
</net>
<net name="+5V" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="+"/>
<pinref part="SUPPLY3" gate="+5V" pin="+5V"/>
<wire x1="-15.24" y1="30.48" x2="-15.24" y2="27.94" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="SUPPLY4" gate="+5V" pin="+5V"/>
<pinref part="J1" gate="G$1" pin="4"/>
<wire x1="35.56" y1="27.94" x2="35.56" y2="25.4" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="3"/>
<wire x1="35.56" y1="25.4" x2="35.56" y2="22.86" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="2"/>
<wire x1="35.56" y1="22.86" x2="35.56" y2="20.32" width="0.1524" layer="91"/>
<pinref part="J1" gate="G$1" pin="1"/>
<wire x1="35.56" y1="20.32" x2="35.56" y2="17.78" width="0.1524" layer="91"/>
<junction x="35.56" y="25.4"/>
<junction x="35.56" y="22.86"/>
<junction x="35.56" y="20.32"/>
</segment>
</net>
<net name="N$1" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<pinref part="R1" gate="G$1" pin="1"/>
<wire x1="55.88" y1="25.4" x2="96.52" y2="25.4" width="0.1524" layer="91"/>
<wire x1="96.52" y1="25.4" x2="96.52" y2="17.78" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="7"/>
<pinref part="R1" gate="G$1" pin="5"/>
<wire x1="96.52" y1="10.16" x2="96.52" y2="12.7" width="0.1524" layer="91"/>
<pinref part="R1" gate="G$1" pin="3"/>
<wire x1="96.52" y1="12.7" x2="96.52" y2="15.24" width="0.1524" layer="91"/>
<wire x1="96.52" y1="15.24" x2="96.52" y2="17.78" width="0.1524" layer="91"/>
<junction x="96.52" y="17.78"/>
<junction x="96.52" y="15.24"/>
<junction x="96.52" y="12.7"/>
</segment>
</net>
<net name="N$2" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="55.88" y1="22.86" x2="83.82" y2="22.86" width="0.1524" layer="91"/>
<wire x1="83.82" y1="22.86" x2="83.82" y2="7.62" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="1"/>
<pinref part="R2" gate="G$1" pin="7"/>
<pinref part="R2" gate="G$1" pin="5"/>
<wire x1="83.82" y1="0" x2="83.82" y2="2.54" width="0.1524" layer="91"/>
<pinref part="R2" gate="G$1" pin="3"/>
<wire x1="83.82" y1="2.54" x2="83.82" y2="5.08" width="0.1524" layer="91"/>
<wire x1="83.82" y1="5.08" x2="83.82" y2="7.62" width="0.1524" layer="91"/>
<junction x="83.82" y="7.62"/>
<junction x="83.82" y="5.08"/>
<junction x="83.82" y="2.54"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="3"/>
<wire x1="55.88" y1="20.32" x2="71.12" y2="20.32" width="0.1524" layer="91"/>
<pinref part="R3" gate="G$1" pin="1"/>
<junction x="71.12" y="-2.54"/>
<pinref part="R3" gate="G$1" pin="3"/>
<wire x1="71.12" y1="-5.08" x2="71.12" y2="-2.54" width="0.1524" layer="91"/>
<junction x="71.12" y="-5.08"/>
<pinref part="R3" gate="G$1" pin="5"/>
<wire x1="71.12" y1="-7.62" x2="71.12" y2="-5.08" width="0.1524" layer="91"/>
<junction x="71.12" y="-7.62"/>
<pinref part="R3" gate="G$1" pin="7"/>
<wire x1="71.12" y1="-10.16" x2="71.12" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="71.12" y1="20.32" x2="71.12" y2="-2.54" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$4" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="4"/>
<wire x1="55.88" y1="17.78" x2="58.42" y2="17.78" width="0.1524" layer="91"/>
<wire x1="58.42" y1="17.78" x2="58.42" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="1"/>
<pinref part="R4" gate="G$1" pin="7"/>
<pinref part="R4" gate="G$1" pin="5"/>
<wire x1="58.42" y1="-20.32" x2="58.42" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="3"/>
<wire x1="58.42" y1="-17.78" x2="58.42" y2="-15.24" width="0.1524" layer="91"/>
<wire x1="58.42" y1="-15.24" x2="58.42" y2="-12.7" width="0.1524" layer="91"/>
<junction x="58.42" y="-12.7"/>
<junction x="58.42" y="-15.24"/>
<junction x="58.42" y="-17.78"/>
</segment>
</net>
<net name="N$11" class="0">
<segment>
<pinref part="D1" gate="G$1" pin="10"/>
<pinref part="D1" gate="G$1" pin="7"/>
<wire x1="119.38" y1="-12.7" x2="111.76" y2="-12.7" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="8"/>
<pinref part="R4" gate="G$1" pin="6"/>
<wire x1="68.58" y1="-20.32" x2="68.58" y2="-17.78" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="4"/>
<wire x1="68.58" y1="-17.78" x2="68.58" y2="-15.24" width="0.1524" layer="91"/>
<pinref part="R4" gate="G$1" pin="2"/>
<wire x1="68.58" y1="-15.24" x2="68.58" y2="-12.7" width="0.1524" layer="91"/>
<junction x="68.58" y="-15.24"/>
<junction x="68.58" y="-17.78"/>
<wire x1="111.76" y1="-12.7" x2="68.58" y2="-12.7" width="0.1524" layer="91"/>
<junction x="111.76" y="-12.7"/>
<junction x="68.58" y="-12.7"/>
</segment>
</net>
<net name="N$8" class="0">
<segment>
<pinref part="R1" gate="G$1" pin="2"/>
<pinref part="R1" gate="G$1" pin="4"/>
<wire x1="106.68" y1="15.24" x2="106.68" y2="17.78" width="0.1524" layer="91"/>
<junction x="106.68" y="15.24"/>
<pinref part="R1" gate="G$1" pin="6"/>
<wire x1="106.68" y1="12.7" x2="106.68" y2="15.24" width="0.1524" layer="91"/>
<junction x="106.68" y="12.7"/>
<pinref part="R1" gate="G$1" pin="8"/>
<wire x1="106.68" y1="10.16" x2="106.68" y2="12.7" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="15"/>
<pinref part="D1" gate="G$1" pin="2"/>
<wire x1="111.76" y1="10.16" x2="119.38" y2="10.16" width="0.1524" layer="91"/>
<wire x1="106.68" y1="10.16" x2="111.76" y2="10.16" width="0.1524" layer="91"/>
<junction x="111.76" y="10.16"/>
<junction x="106.68" y="10.16"/>
</segment>
</net>
<net name="N$12" class="0">
<segment>
<pinref part="R3" gate="G$1" pin="2"/>
<pinref part="R3" gate="G$1" pin="4"/>
<wire x1="81.28" y1="-5.08" x2="81.28" y2="-2.54" width="0.1524" layer="91"/>
<junction x="81.28" y="-5.08"/>
<pinref part="R3" gate="G$1" pin="6"/>
<wire x1="81.28" y1="-7.62" x2="81.28" y2="-5.08" width="0.1524" layer="91"/>
<junction x="81.28" y="-7.62"/>
<pinref part="R3" gate="G$1" pin="8"/>
<wire x1="81.28" y1="-10.16" x2="81.28" y2="-7.62" width="0.1524" layer="91"/>
<wire x1="81.28" y1="-10.16" x2="111.76" y2="-10.16" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="11"/>
<pinref part="D1" gate="G$1" pin="6"/>
<wire x1="111.76" y1="-10.16" x2="119.38" y2="-10.16" width="0.1524" layer="91"/>
<junction x="111.76" y="-10.16"/>
<junction x="81.28" y="-10.16"/>
</segment>
</net>
<net name="N$5" class="0">
<segment>
<pinref part="R2" gate="G$1" pin="2"/>
<pinref part="R2" gate="G$1" pin="4"/>
<wire x1="93.98" y1="5.08" x2="93.98" y2="7.62" width="0.1524" layer="91"/>
<junction x="93.98" y="5.08"/>
<pinref part="R2" gate="G$1" pin="6"/>
<wire x1="93.98" y1="2.54" x2="93.98" y2="5.08" width="0.1524" layer="91"/>
<junction x="93.98" y="2.54"/>
<pinref part="R2" gate="G$1" pin="8"/>
<wire x1="93.98" y1="0" x2="93.98" y2="2.54" width="0.1524" layer="91"/>
<pinref part="D1" gate="G$1" pin="14"/>
<pinref part="D1" gate="G$1" pin="3"/>
<wire x1="119.38" y1="7.62" x2="111.76" y2="7.62" width="0.1524" layer="91"/>
<wire x1="93.98" y1="7.62" x2="111.76" y2="7.62" width="0.1524" layer="91"/>
<junction x="93.98" y="7.62"/>
<junction x="111.76" y="7.62"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
