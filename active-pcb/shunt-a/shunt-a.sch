<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="6.5.0">
<drawing>
<settings>
<setting alwaysvectorfont="yes"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.05" altunitdist="inch" altunit="inch"/>
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
<library name="RoboJackets-Connectors">
<description>&lt;img src="http://www.robojackets.org/wp-content/themes/RoboJackets-3.0/img/banner.png" width="600"&gt;
&lt;hr&gt;
&lt;h1&gt;RoboJackets EAGLE Libraries - Connectors&lt;/h1&gt;&lt;/br&gt;
&lt;p&gt;
In this library you will find all the connectors used on any of our boards.
&lt;/p&gt;</description>
<packages>
<package name="VIA_2MM">
<pad name="P$1" x="0" y="0" drill="2"/>
<text x="-2.54" y="2.54" size="1.27" layer="21">&gt;VALUE</text>
<text x="-2.54" y="-2.54" size="1.27" layer="22" rot="MR180">&gt;VALUE</text>
</package>
</packages>
<symbols>
<symbol name="VIA_TP">
<pin name="P$1" x="0" y="2.54" visible="off" length="short" direction="pwr" rot="R270"/>
<circle x="0" y="-1.27" radius="1.27" width="0.254" layer="94"/>
<circle x="0" y="-1.27" radius="1.905" width="0.254" layer="94"/>
<text x="2.54" y="2.54" size="0.8128" layer="97" rot="R270">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="VIA_TP" uservalue="yes">
<gates>
<gate name="G$1" symbol="VIA_TP" x="0" y="0"/>
</gates>
<devices>
<device name="" package="VIA_2MM">
<connects>
<connect gate="G$1" pin="P$1" pad="P$1"/>
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
<part name="U$1" library="RoboJackets-Connectors" deviceset="VIA_TP" device="" value="I+"/>
<part name="U$2" library="RoboJackets-Connectors" deviceset="VIA_TP" device="" value="I-"/>
<part name="U$3" library="RoboJackets-Connectors" deviceset="VIA_TP" device="" value="V+"/>
<part name="U$4" library="RoboJackets-Connectors" deviceset="VIA_TP" device="" value="GND"/>
</parts>
<sheets>
<sheet>
<plain>
<circle x="20.32" y="45.72" radius="3.5921" width="0.1524" layer="97"/>
<wire x1="20.32" y1="43.18" x2="20.32" y2="48.26" width="0.1524" layer="97"/>
<wire x1="20.32" y1="48.26" x2="19.05" y2="45.72" width="0.1524" layer="97"/>
<wire x1="19.05" y1="45.72" x2="21.59" y2="45.72" width="0.1524" layer="97"/>
<wire x1="21.59" y1="45.72" x2="20.32" y2="48.26" width="0.1524" layer="97"/>
<wire x1="20.32" y1="49.53" x2="20.32" y2="53.34" width="0.1524" layer="97"/>
<wire x1="20.32" y1="38.1" x2="20.32" y2="41.91" width="0.1524" layer="97"/>
<wire x1="35.56" y1="53.34" x2="35.56" y2="50.8" width="0.1524" layer="97"/>
<wire x1="35.56" y1="50.8" x2="36.83" y2="49.53" width="0.1524" layer="97"/>
<wire x1="36.83" y1="49.53" x2="34.29" y2="48.26" width="0.1524" layer="97"/>
<wire x1="34.29" y1="48.26" x2="36.83" y2="46.99" width="0.1524" layer="97"/>
<wire x1="36.83" y1="46.99" x2="34.29" y2="45.72" width="0.1524" layer="97"/>
<wire x1="34.29" y1="45.72" x2="36.83" y2="44.45" width="0.1524" layer="97"/>
<wire x1="36.83" y1="44.45" x2="34.29" y2="43.18" width="0.1524" layer="97"/>
<wire x1="34.29" y1="43.18" x2="36.83" y2="41.91" width="0.1524" layer="97"/>
<wire x1="36.83" y1="41.91" x2="35.56" y2="40.64" width="0.1524" layer="97"/>
<wire x1="35.56" y1="40.64" x2="35.56" y2="38.1" width="0.1524" layer="97"/>
</plain>
<instances>
<instance part="U$1" gate="G$1" x="17.78" y="53.34" rot="R270"/>
<instance part="U$2" gate="G$1" x="17.78" y="38.1" rot="R270"/>
<instance part="U$3" gate="G$1" x="48.26" y="53.34" rot="R90"/>
<instance part="U$4" gate="G$1" x="48.26" y="38.1" rot="R90"/>
</instances>
<busses>
</busses>
<nets>
<net name="RSHUNT" class="0">
<segment>
<pinref part="U$1" gate="G$1" pin="P$1"/>
<wire x1="20.32" y1="53.34" x2="35.56" y2="53.34" width="0.1524" layer="91"/>
<pinref part="U$3" gate="G$1" pin="P$1"/>
<pinref part="U$2" gate="G$1" pin="P$1"/>
<wire x1="35.56" y1="53.34" x2="45.72" y2="53.34" width="0.1524" layer="91"/>
<wire x1="20.32" y1="38.1" x2="35.56" y2="38.1" width="0.1524" layer="91"/>
<pinref part="U$4" gate="G$1" pin="P$1"/>
<wire x1="35.56" y1="38.1" x2="45.72" y2="38.1" width="0.1524" layer="91"/>
<wire x1="35.56" y1="53.34" x2="35.56" y2="38.1" width="0.1524" layer="91"/>
<junction x="35.56" y="53.34"/>
<junction x="35.56" y="38.1"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
</eagle>
