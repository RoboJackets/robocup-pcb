<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.2.2">
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
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
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
<library name="RoboJackets-Frames">
<description>&lt;img src="http://www.robojackets.org/wp-content/themes/RoboJackets-3.0/img/banner.png" width="600"&gt;
&lt;hr&gt;
&lt;h1&gt;RoboJackets EAGLE Libraries - Frames&lt;/h1&gt;&lt;/br&gt;
&lt;p&gt;
In this library you will find frames that can be used to help organize a schematic. If you wish to change any of the fields in the frame, right click the frame's origin marker, and edit the attributes of the frame.
&lt;/p&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="FRAME_B_L">
<frame x1="0" y1="0" x2="431.8" y2="279.4" columns="9" rows="6" layer="94" border-bottom="no"/>
</symbol>
<symbol name="DOCFIELD">
<wire x1="0" y1="0" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="71.12" y2="15.24" width="0.1016" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="71.12" y2="5.08" width="0.1016" layer="94"/>
<wire x1="0" y1="5.08" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="101.6" y1="15.24" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="71.12" y2="0" width="0.1016" layer="94"/>
<wire x1="71.12" y1="0" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="71.12" y1="15.24" x2="71.12" y2="5.08" width="0.1016" layer="94"/>
<wire x1="71.12" y1="15.24" x2="0" y2="15.24" width="0.1016" layer="94"/>
<wire x1="71.12" y1="5.08" x2="101.6" y2="5.08" width="0.1016" layer="94"/>
<wire x1="101.6" y1="5.08" x2="101.6" y2="0" width="0.1016" layer="94"/>
<wire x1="0" y1="15.24" x2="0" y2="22.86" width="0.1016" layer="94"/>
<wire x1="101.6" y1="43.1292" x2="0" y2="43.1292" width="0.1016" layer="94"/>
<wire x1="101.6" y1="43.1292" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="101.6" y2="22.86" width="0.1016" layer="94"/>
<wire x1="0" y1="22.86" x2="0" y2="43.1292" width="0.1016" layer="94"/>
<wire x1="101.6" y1="22.86" x2="101.6" y2="15.24" width="0.1016" layer="94"/>
<text x="1.27" y="3.81" size="2.54" layer="94" font="vector" ratio="15" align="top-left">Date:</text>
<text x="12.7" y="1.27" size="2.54" layer="94" font="vector">&gt;LAST_DATE_TIME</text>
<text x="72.39" y="3.81" size="2.54" layer="94" font="vector" ratio="15" align="top-left">Sheet:</text>
<text x="86.36" y="1.27" size="2.54" layer="94" font="vector">&gt;SHEET</text>
<text x="72.39" y="13.97" size="2.54" layer="94" font="vector" ratio="15" align="top-left">Rev:</text>
<text x="1.27" y="21.59" size="2.54" layer="94" font="vector" ratio="15" align="top-left">Title:</text>
<text x="1.27" y="13.97" size="2.54" layer="94" font="vector" ratio="15" align="top-left">Description:</text>
<text x="15.24" y="19.05" size="2.54" layer="94" font="vector">&gt;DRAWING_NAME</text>
<text x="1.27" y="41.91" size="2.54" layer="94" ratio="15" align="top-left">Georgia Institute of Technology</text>
<text x="1.27" y="38.1" size="2.54" layer="94" ratio="15" align="top-left">RoboJackets</text>
<text x="1.27" y="34.29" size="3.048" layer="94" ratio="10" align="top-left">&gt;TEAM</text>
<text x="72.39" y="6.35" size="2.54" layer="94">&gt;REVISION</text>
<text x="1.27" y="6.35" size="2.54" layer="94">&gt;SCH_DESC</text>
<rectangle x1="91.8083" y1="23.5839" x2="91.8845" y2="23.6093" layer="94"/>
<rectangle x1="91.8337" y1="23.6093" x2="91.9099" y2="23.6347" layer="94"/>
<rectangle x1="91.8083" y1="23.6347" x2="91.9353" y2="23.6601" layer="94"/>
<rectangle x1="91.8337" y1="23.6601" x2="91.9607" y2="23.6855" layer="94"/>
<rectangle x1="91.8083" y1="23.6855" x2="91.9861" y2="23.7109" layer="94"/>
<rectangle x1="91.8083" y1="23.7109" x2="91.9861" y2="23.7363" layer="94"/>
<rectangle x1="91.8083" y1="23.7363" x2="91.8845" y2="23.7617" layer="94"/>
<rectangle x1="91.9099" y1="23.7363" x2="92.0115" y2="23.7617" layer="94"/>
<rectangle x1="91.8083" y1="23.7617" x2="91.8845" y2="23.7871" layer="94"/>
<rectangle x1="91.9353" y1="23.7617" x2="92.0115" y2="23.7871" layer="94"/>
<rectangle x1="91.8083" y1="23.7871" x2="91.8845" y2="23.8125" layer="94"/>
<rectangle x1="91.9607" y1="23.7871" x2="92.0369" y2="23.8125" layer="94"/>
<rectangle x1="91.8083" y1="23.8125" x2="91.8845" y2="23.8379" layer="94"/>
<rectangle x1="91.9861" y1="23.8125" x2="92.0623" y2="23.8379" layer="94"/>
<rectangle x1="91.8083" y1="23.8379" x2="91.8845" y2="23.8633" layer="94"/>
<rectangle x1="92.0115" y1="23.8379" x2="92.0877" y2="23.8633" layer="94"/>
<rectangle x1="91.8083" y1="23.8633" x2="91.8845" y2="23.8887" layer="94"/>
<rectangle x1="92.0369" y1="23.8633" x2="92.1131" y2="23.8887" layer="94"/>
<rectangle x1="91.8083" y1="23.8887" x2="91.8845" y2="23.9141" layer="94"/>
<rectangle x1="92.0369" y1="23.8887" x2="92.1385" y2="23.9141" layer="94"/>
<rectangle x1="91.8083" y1="23.9141" x2="91.8845" y2="23.9395" layer="94"/>
<rectangle x1="92.0623" y1="23.9141" x2="92.1639" y2="23.9395" layer="94"/>
<rectangle x1="91.8083" y1="23.9395" x2="91.8845" y2="23.9649" layer="94"/>
<rectangle x1="92.0623" y1="23.9395" x2="92.1893" y2="23.9649" layer="94"/>
<rectangle x1="91.8083" y1="23.9649" x2="91.8845" y2="23.9903" layer="94"/>
<rectangle x1="92.0877" y1="23.9649" x2="92.2147" y2="23.9903" layer="94"/>
<rectangle x1="91.8083" y1="23.9903" x2="91.8845" y2="24.0157" layer="94"/>
<rectangle x1="92.1131" y1="23.9903" x2="92.2401" y2="24.0157" layer="94"/>
<rectangle x1="91.8083" y1="24.0157" x2="91.8845" y2="24.0411" layer="94"/>
<rectangle x1="92.1385" y1="24.0157" x2="92.2401" y2="24.0411" layer="94"/>
<rectangle x1="91.8083" y1="24.0411" x2="91.8845" y2="24.0665" layer="94"/>
<rectangle x1="92.1639" y1="24.0411" x2="92.2909" y2="24.0665" layer="94"/>
<rectangle x1="91.8083" y1="24.0665" x2="91.8845" y2="24.0919" layer="94"/>
<rectangle x1="92.1893" y1="24.0665" x2="92.2655" y2="24.0919" layer="94"/>
<rectangle x1="91.8083" y1="24.0919" x2="91.8845" y2="24.1173" layer="94"/>
<rectangle x1="92.2147" y1="24.0919" x2="92.3163" y2="24.1173" layer="94"/>
<rectangle x1="91.8083" y1="24.1173" x2="91.8845" y2="24.1427" layer="94"/>
<rectangle x1="92.2401" y1="24.1173" x2="92.3163" y2="24.1427" layer="94"/>
<rectangle x1="91.8083" y1="24.1427" x2="91.8845" y2="24.1681" layer="94"/>
<rectangle x1="92.2655" y1="24.1427" x2="92.3417" y2="24.1681" layer="94"/>
<rectangle x1="91.8083" y1="24.1681" x2="91.8845" y2="24.1935" layer="94"/>
<rectangle x1="92.2909" y1="24.1681" x2="92.3671" y2="24.1935" layer="94"/>
<rectangle x1="91.8083" y1="24.1935" x2="91.8845" y2="24.2189" layer="94"/>
<rectangle x1="92.2909" y1="24.1935" x2="92.3925" y2="24.2189" layer="94"/>
<rectangle x1="91.8083" y1="24.2189" x2="91.8591" y2="24.2443" layer="94"/>
<rectangle x1="92.3417" y1="24.2189" x2="92.4179" y2="24.2443" layer="94"/>
<rectangle x1="91.8083" y1="24.2443" x2="91.8845" y2="24.2697" layer="94"/>
<rectangle x1="92.3417" y1="24.2443" x2="92.4433" y2="24.2697" layer="94"/>
<rectangle x1="91.8083" y1="24.2697" x2="91.8591" y2="24.2951" layer="94"/>
<rectangle x1="92.3671" y1="24.2697" x2="92.4687" y2="24.2951" layer="94"/>
<rectangle x1="91.8083" y1="24.2951" x2="91.8845" y2="24.3205" layer="94"/>
<rectangle x1="92.3671" y1="24.2951" x2="92.4941" y2="24.3205" layer="94"/>
<rectangle x1="91.8083" y1="24.3205" x2="91.8591" y2="24.3459" layer="94"/>
<rectangle x1="92.3925" y1="24.3205" x2="92.5195" y2="24.3459" layer="94"/>
<rectangle x1="91.5543" y1="24.3459" x2="91.7321" y2="24.3713" layer="94"/>
<rectangle x1="91.7575" y1="24.3459" x2="91.7829" y2="24.3713" layer="94"/>
<rectangle x1="91.8083" y1="24.3459" x2="91.8845" y2="24.3713" layer="94"/>
<rectangle x1="92.4179" y1="24.3459" x2="92.5449" y2="24.3713" layer="94"/>
<rectangle x1="91.5797" y1="24.3713" x2="91.9099" y2="24.3967" layer="94"/>
<rectangle x1="92.4433" y1="24.3713" x2="92.5449" y2="24.3967" layer="94"/>
<rectangle x1="91.5543" y1="24.3967" x2="92.0877" y2="24.4221" layer="94"/>
<rectangle x1="92.1131" y1="24.3967" x2="92.1385" y2="24.4221" layer="94"/>
<rectangle x1="92.1639" y1="24.3967" x2="92.1893" y2="24.4221" layer="94"/>
<rectangle x1="92.4687" y1="24.3967" x2="92.5957" y2="24.4221" layer="94"/>
<rectangle x1="91.5797" y1="24.4221" x2="92.2147" y2="24.4475" layer="94"/>
<rectangle x1="92.2401" y1="24.4221" x2="92.2655" y2="24.4475" layer="94"/>
<rectangle x1="92.2909" y1="24.4221" x2="92.3163" y2="24.4475" layer="94"/>
<rectangle x1="92.4941" y1="24.4221" x2="92.5957" y2="24.4475" layer="94"/>
<rectangle x1="91.5543" y1="24.4475" x2="92.4941" y2="24.4729" layer="94"/>
<rectangle x1="92.5195" y1="24.4475" x2="92.6211" y2="24.4729" layer="94"/>
<rectangle x1="91.5797" y1="24.4729" x2="92.6719" y2="24.4983" layer="94"/>
<rectangle x1="91.5543" y1="24.4983" x2="92.8497" y2="24.5237" layer="94"/>
<rectangle x1="92.8751" y1="24.4983" x2="92.9005" y2="24.5237" layer="94"/>
<rectangle x1="91.5797" y1="24.5237" x2="92.9767" y2="24.5491" layer="94"/>
<rectangle x1="93.0021" y1="24.5237" x2="93.0275" y2="24.5491" layer="94"/>
<rectangle x1="91.5543" y1="24.5491" x2="93.0529" y2="24.5745" layer="94"/>
<rectangle x1="91.5797" y1="24.5745" x2="93.0275" y2="24.5999" layer="94"/>
<rectangle x1="91.5543" y1="24.5999" x2="93.0529" y2="24.6253" layer="94"/>
<rectangle x1="91.5797" y1="24.6253" x2="91.6051" y2="24.6507" layer="94"/>
<rectangle x1="91.6305" y1="24.6253" x2="93.0783" y2="24.6507" layer="94"/>
<rectangle x1="91.7067" y1="24.6507" x2="91.7321" y2="24.6761" layer="94"/>
<rectangle x1="91.7575" y1="24.6507" x2="93.1037" y2="24.6761" layer="94"/>
<rectangle x1="91.7829" y1="24.6761" x2="91.8591" y2="24.7015" layer="94"/>
<rectangle x1="91.9353" y1="24.6761" x2="91.9607" y2="24.7015" layer="94"/>
<rectangle x1="91.9861" y1="24.6761" x2="92.0115" y2="24.7015" layer="94"/>
<rectangle x1="92.0369" y1="24.6761" x2="93.1037" y2="24.7015" layer="94"/>
<rectangle x1="91.8083" y1="24.7015" x2="91.8845" y2="24.7269" layer="94"/>
<rectangle x1="92.0623" y1="24.7015" x2="92.0877" y2="24.7269" layer="94"/>
<rectangle x1="92.1131" y1="24.7015" x2="92.1385" y2="24.7269" layer="94"/>
<rectangle x1="92.1639" y1="24.7015" x2="93.1291" y2="24.7269" layer="94"/>
<rectangle x1="91.7829" y1="24.7269" x2="91.8591" y2="24.7523" layer="94"/>
<rectangle x1="92.3417" y1="24.7269" x2="92.3671" y2="24.7523" layer="94"/>
<rectangle x1="92.3925" y1="24.7269" x2="93.1291" y2="24.7523" layer="94"/>
<rectangle x1="91.8083" y1="24.7523" x2="91.8845" y2="24.7777" layer="94"/>
<rectangle x1="92.5195" y1="24.7523" x2="92.5449" y2="24.7777" layer="94"/>
<rectangle x1="92.5703" y1="24.7523" x2="93.1545" y2="24.7777" layer="94"/>
<rectangle x1="91.7829" y1="24.7777" x2="91.8591" y2="24.8031" layer="94"/>
<rectangle x1="92.7481" y1="24.7777" x2="92.7735" y2="24.8031" layer="94"/>
<rectangle x1="92.7989" y1="24.7777" x2="93.1545" y2="24.8031" layer="94"/>
<rectangle x1="91.8083" y1="24.8031" x2="91.8845" y2="24.8285" layer="94"/>
<rectangle x1="92.8243" y1="24.8031" x2="92.9513" y2="24.8285" layer="94"/>
<rectangle x1="92.9767" y1="24.8031" x2="93.1799" y2="24.8285" layer="94"/>
<rectangle x1="91.7829" y1="24.8285" x2="91.8591" y2="24.8539" layer="94"/>
<rectangle x1="92.8497" y1="24.8285" x2="92.9259" y2="24.8539" layer="94"/>
<rectangle x1="93.1545" y1="24.8285" x2="93.1799" y2="24.8539" layer="94"/>
<rectangle x1="91.8083" y1="24.8539" x2="91.8845" y2="24.8793" layer="94"/>
<rectangle x1="92.8497" y1="24.8539" x2="92.9513" y2="24.8793" layer="94"/>
<rectangle x1="91.7829" y1="24.8793" x2="91.8591" y2="24.9047" layer="94"/>
<rectangle x1="92.9005" y1="24.8793" x2="92.9767" y2="24.9047" layer="94"/>
<rectangle x1="91.8083" y1="24.9047" x2="91.8845" y2="24.9301" layer="94"/>
<rectangle x1="92.8751" y1="24.9047" x2="93.0021" y2="24.9301" layer="94"/>
<rectangle x1="91.7829" y1="24.9301" x2="91.8591" y2="24.9555" layer="94"/>
<rectangle x1="92.9259" y1="24.9301" x2="93.0275" y2="24.9555" layer="94"/>
<rectangle x1="91.8083" y1="24.9555" x2="91.8845" y2="24.9809" layer="94"/>
<rectangle x1="92.9259" y1="24.9555" x2="93.0529" y2="24.9809" layer="94"/>
<rectangle x1="91.7829" y1="24.9809" x2="91.8591" y2="25.0063" layer="94"/>
<rectangle x1="92.9767" y1="24.9809" x2="93.0783" y2="25.0063" layer="94"/>
<rectangle x1="91.8083" y1="25.0063" x2="91.8845" y2="25.0317" layer="94"/>
<rectangle x1="92.9767" y1="25.0063" x2="93.1037" y2="25.0317" layer="94"/>
<rectangle x1="91.7829" y1="25.0317" x2="91.8591" y2="25.0571" layer="94"/>
<rectangle x1="93.0021" y1="25.0317" x2="93.1291" y2="25.0571" layer="94"/>
<rectangle x1="91.5543" y1="25.0571" x2="91.8845" y2="25.0825" layer="94"/>
<rectangle x1="93.0275" y1="25.0571" x2="93.1291" y2="25.0825" layer="94"/>
<rectangle x1="91.5797" y1="25.0825" x2="91.9607" y2="25.1079" layer="94"/>
<rectangle x1="91.9861" y1="25.0825" x2="92.0115" y2="25.1079" layer="94"/>
<rectangle x1="92.0369" y1="25.0825" x2="92.0623" y2="25.1079" layer="94"/>
<rectangle x1="93.0529" y1="25.0825" x2="93.1545" y2="25.1079" layer="94"/>
<rectangle x1="91.5543" y1="25.1079" x2="92.2909" y2="25.1333" layer="94"/>
<rectangle x1="92.3163" y1="25.1079" x2="92.3417" y2="25.1333" layer="94"/>
<rectangle x1="92.3671" y1="25.1079" x2="92.3925" y2="25.1333" layer="94"/>
<rectangle x1="93.0783" y1="25.1079" x2="93.2053" y2="25.1333" layer="94"/>
<rectangle x1="91.5543" y1="25.1333" x2="92.4687" y2="25.1587" layer="94"/>
<rectangle x1="92.4941" y1="25.1333" x2="92.5195" y2="25.1587" layer="94"/>
<rectangle x1="92.5449" y1="25.1333" x2="92.5703" y2="25.1587" layer="94"/>
<rectangle x1="93.1037" y1="25.1333" x2="93.1799" y2="25.1587" layer="94"/>
<rectangle x1="91.5543" y1="25.1587" x2="92.7989" y2="25.1841" layer="94"/>
<rectangle x1="92.8243" y1="25.1587" x2="92.8497" y2="25.1841" layer="94"/>
<rectangle x1="92.8751" y1="25.1587" x2="92.9005" y2="25.1841" layer="94"/>
<rectangle x1="93.1291" y1="25.1587" x2="93.2307" y2="25.1841" layer="94"/>
<rectangle x1="91.5543" y1="25.1841" x2="92.9767" y2="25.2095" layer="94"/>
<rectangle x1="93.0021" y1="25.1841" x2="93.0275" y2="25.2095" layer="94"/>
<rectangle x1="93.0529" y1="25.1841" x2="93.0783" y2="25.2095" layer="94"/>
<rectangle x1="93.1545" y1="25.1841" x2="93.2307" y2="25.2095" layer="94"/>
<rectangle x1="91.5543" y1="25.2095" x2="93.3069" y2="25.2349" layer="94"/>
<rectangle x1="93.3323" y1="25.2095" x2="93.3577" y2="25.2349" layer="94"/>
<rectangle x1="93.3831" y1="25.2095" x2="93.4085" y2="25.2349" layer="94"/>
<rectangle x1="91.5543" y1="25.2349" x2="93.4847" y2="25.2603" layer="94"/>
<rectangle x1="93.5101" y1="25.2349" x2="93.5355" y2="25.2603" layer="94"/>
<rectangle x1="93.5609" y1="25.2349" x2="93.5863" y2="25.2603" layer="94"/>
<rectangle x1="91.5543" y1="25.2603" x2="93.6117" y2="25.2857" layer="94"/>
<rectangle x1="91.5289" y1="25.2857" x2="93.6371" y2="25.3111" layer="94"/>
<rectangle x1="91.5543" y1="25.3111" x2="93.6625" y2="25.3365" layer="94"/>
<rectangle x1="91.5289" y1="25.3365" x2="91.5543" y2="25.3619" layer="94"/>
<rectangle x1="91.5797" y1="25.3365" x2="93.6625" y2="25.3619" layer="94"/>
<rectangle x1="91.7067" y1="25.3619" x2="91.7321" y2="25.3873" layer="94"/>
<rectangle x1="91.7575" y1="25.3619" x2="93.6879" y2="25.3873" layer="94"/>
<rectangle x1="91.7829" y1="25.3873" x2="91.8591" y2="25.4127" layer="94"/>
<rectangle x1="92.0877" y1="25.3873" x2="92.1131" y2="25.4127" layer="94"/>
<rectangle x1="92.1385" y1="25.3873" x2="92.1639" y2="25.4127" layer="94"/>
<rectangle x1="92.1893" y1="25.3873" x2="93.6879" y2="25.4127" layer="94"/>
<rectangle x1="91.7829" y1="25.4127" x2="91.8845" y2="25.4381" layer="94"/>
<rectangle x1="92.2655" y1="25.4127" x2="92.2909" y2="25.4381" layer="94"/>
<rectangle x1="92.3163" y1="25.4127" x2="92.3417" y2="25.4381" layer="94"/>
<rectangle x1="92.3671" y1="25.4127" x2="93.7387" y2="25.4381" layer="94"/>
<rectangle x1="91.7829" y1="25.4381" x2="91.8591" y2="25.4635" layer="94"/>
<rectangle x1="92.5957" y1="25.4381" x2="92.6211" y2="25.4635" layer="94"/>
<rectangle x1="92.6465" y1="25.4381" x2="92.6719" y2="25.4635" layer="94"/>
<rectangle x1="92.6973" y1="25.4381" x2="92.7227" y2="25.4635" layer="94"/>
<rectangle x1="92.7481" y1="25.4381" x2="93.7387" y2="25.4635" layer="94"/>
<rectangle x1="91.7829" y1="25.4635" x2="91.8845" y2="25.4889" layer="94"/>
<rectangle x1="92.8243" y1="25.4635" x2="92.8497" y2="25.4889" layer="94"/>
<rectangle x1="92.8751" y1="25.4635" x2="92.9005" y2="25.4889" layer="94"/>
<rectangle x1="92.9259" y1="25.4635" x2="93.7641" y2="25.4889" layer="94"/>
<rectangle x1="91.7829" y1="25.4889" x2="91.8591" y2="25.5143" layer="94"/>
<rectangle x1="93.1545" y1="25.4889" x2="93.1799" y2="25.5143" layer="94"/>
<rectangle x1="93.2053" y1="25.4889" x2="93.2307" y2="25.5143" layer="94"/>
<rectangle x1="93.2561" y1="25.4889" x2="93.2815" y2="25.5143" layer="94"/>
<rectangle x1="93.3069" y1="25.4889" x2="93.7895" y2="25.5143" layer="94"/>
<rectangle x1="91.7829" y1="25.5143" x2="91.8845" y2="25.5397" layer="94"/>
<rectangle x1="93.3831" y1="25.5143" x2="93.8149" y2="25.5397" layer="94"/>
<rectangle x1="91.7829" y1="25.5397" x2="91.8591" y2="25.5651" layer="94"/>
<rectangle x1="93.4593" y1="25.5397" x2="93.5355" y2="25.5651" layer="94"/>
<rectangle x1="93.7641" y1="25.5397" x2="93.7895" y2="25.5651" layer="94"/>
<rectangle x1="91.7829" y1="25.5651" x2="91.8845" y2="25.5905" layer="94"/>
<rectangle x1="93.4593" y1="25.5651" x2="93.5609" y2="25.5905" layer="94"/>
<rectangle x1="91.7829" y1="25.5905" x2="91.8591" y2="25.6159" layer="94"/>
<rectangle x1="93.4847" y1="25.5905" x2="93.5863" y2="25.6159" layer="94"/>
<rectangle x1="91.7829" y1="25.6159" x2="91.8845" y2="25.6413" layer="94"/>
<rectangle x1="93.4847" y1="25.6159" x2="93.6117" y2="25.6413" layer="94"/>
<rectangle x1="91.7829" y1="25.6413" x2="91.8591" y2="25.6667" layer="94"/>
<rectangle x1="93.5101" y1="25.6413" x2="93.6371" y2="25.6667" layer="94"/>
<rectangle x1="91.7829" y1="25.6667" x2="91.8591" y2="25.6921" layer="94"/>
<rectangle x1="93.5355" y1="25.6667" x2="93.6625" y2="25.6921" layer="94"/>
<rectangle x1="91.7829" y1="25.6921" x2="91.8591" y2="25.7175" layer="94"/>
<rectangle x1="93.5609" y1="25.6921" x2="93.6879" y2="25.7175" layer="94"/>
<rectangle x1="91.7829" y1="25.7175" x2="91.8591" y2="25.7429" layer="94"/>
<rectangle x1="93.5863" y1="25.7175" x2="93.7133" y2="25.7429" layer="94"/>
<rectangle x1="91.7829" y1="25.7429" x2="91.8591" y2="25.7683" layer="94"/>
<rectangle x1="93.6117" y1="25.7429" x2="93.7133" y2="25.7683" layer="94"/>
<rectangle x1="91.7829" y1="25.7683" x2="91.8591" y2="25.7937" layer="94"/>
<rectangle x1="93.6371" y1="25.7683" x2="93.7387" y2="25.7937" layer="94"/>
<rectangle x1="91.7829" y1="25.7937" x2="91.8591" y2="25.8191" layer="94"/>
<rectangle x1="93.6625" y1="25.7937" x2="93.7387" y2="25.8191" layer="94"/>
<rectangle x1="91.5543" y1="25.8191" x2="91.7321" y2="25.8445" layer="94"/>
<rectangle x1="91.7575" y1="25.8191" x2="91.8845" y2="25.8445" layer="94"/>
<rectangle x1="93.6879" y1="25.8191" x2="93.7641" y2="25.8445" layer="94"/>
<rectangle x1="91.5543" y1="25.8445" x2="92.0115" y2="25.8699" layer="94"/>
<rectangle x1="92.0369" y1="25.8445" x2="92.0623" y2="25.8699" layer="94"/>
<rectangle x1="92.0877" y1="25.8445" x2="92.1131" y2="25.8699" layer="94"/>
<rectangle x1="93.7133" y1="25.8445" x2="93.7895" y2="25.8699" layer="94"/>
<rectangle x1="91.5543" y1="25.8699" x2="92.3925" y2="25.8953" layer="94"/>
<rectangle x1="92.4179" y1="25.8699" x2="92.4433" y2="25.8953" layer="94"/>
<rectangle x1="92.4687" y1="25.8699" x2="92.4941" y2="25.8953" layer="94"/>
<rectangle x1="92.5195" y1="25.8699" x2="92.5449" y2="25.8953" layer="94"/>
<rectangle x1="93.7387" y1="25.8699" x2="93.8149" y2="25.8953" layer="94"/>
<rectangle x1="91.5543" y1="25.8953" x2="92.6719" y2="25.9207" layer="94"/>
<rectangle x1="92.6973" y1="25.8953" x2="92.7227" y2="25.9207" layer="94"/>
<rectangle x1="92.7481" y1="25.8953" x2="92.7735" y2="25.9207" layer="94"/>
<rectangle x1="93.7641" y1="25.8953" x2="93.8403" y2="25.9207" layer="94"/>
<rectangle x1="91.5543" y1="25.9207" x2="93.0529" y2="25.9461" layer="94"/>
<rectangle x1="93.0783" y1="25.9207" x2="93.1037" y2="25.9461" layer="94"/>
<rectangle x1="93.1291" y1="25.9207" x2="93.1545" y2="25.9461" layer="94"/>
<rectangle x1="93.1799" y1="25.9207" x2="93.2053" y2="25.9461" layer="94"/>
<rectangle x1="93.7641" y1="25.9207" x2="93.8657" y2="25.9461" layer="94"/>
<rectangle x1="91.5289" y1="25.9461" x2="93.3323" y2="25.9715" layer="94"/>
<rectangle x1="93.3577" y1="25.9461" x2="93.3831" y2="25.9715" layer="94"/>
<rectangle x1="93.4085" y1="25.9461" x2="93.4339" y2="25.9715" layer="94"/>
<rectangle x1="93.4593" y1="25.9461" x2="93.4847" y2="25.9715" layer="94"/>
<rectangle x1="93.7895" y1="25.9461" x2="93.8911" y2="25.9715" layer="94"/>
<rectangle x1="91.5543" y1="25.9715" x2="93.7133" y2="25.9969" layer="94"/>
<rectangle x1="93.7387" y1="25.9715" x2="93.7641" y2="25.9969" layer="94"/>
<rectangle x1="93.7895" y1="25.9715" x2="93.9165" y2="25.9969" layer="94"/>
<rectangle x1="91.5289" y1="25.9969" x2="93.9419" y2="26.0223" layer="94"/>
<rectangle x1="93.9673" y1="25.9969" x2="93.9927" y2="26.0223" layer="94"/>
<rectangle x1="94.0181" y1="25.9969" x2="94.0435" y2="26.0223" layer="94"/>
<rectangle x1="94.0689" y1="25.9969" x2="94.0943" y2="26.0223" layer="94"/>
<rectangle x1="91.5289" y1="26.0223" x2="94.1959" y2="26.0477" layer="94"/>
<rectangle x1="91.5289" y1="26.0477" x2="94.2213" y2="26.0731" layer="94"/>
<rectangle x1="91.5289" y1="26.0731" x2="94.2467" y2="26.0985" layer="94"/>
<rectangle x1="91.5289" y1="26.0985" x2="94.2467" y2="26.1239" layer="94"/>
<rectangle x1="91.6559" y1="26.1239" x2="91.6813" y2="26.1493" layer="94"/>
<rectangle x1="91.7067" y1="26.1239" x2="91.7321" y2="26.1493" layer="94"/>
<rectangle x1="91.7575" y1="26.1239" x2="94.3229" y2="26.1493" layer="94"/>
<rectangle x1="91.7829" y1="26.1493" x2="91.8591" y2="26.1747" layer="94"/>
<rectangle x1="92.1385" y1="26.1493" x2="92.1639" y2="26.1747" layer="94"/>
<rectangle x1="92.1893" y1="26.1493" x2="92.2147" y2="26.1747" layer="94"/>
<rectangle x1="92.2401" y1="26.1493" x2="92.2655" y2="26.1747" layer="94"/>
<rectangle x1="92.2909" y1="26.1493" x2="94.2975" y2="26.1747" layer="94"/>
<rectangle x1="91.7575" y1="26.1747" x2="91.8591" y2="26.2001" layer="94"/>
<rectangle x1="92.4179" y1="26.1747" x2="92.4433" y2="26.2001" layer="94"/>
<rectangle x1="92.4687" y1="26.1747" x2="92.4941" y2="26.2001" layer="94"/>
<rectangle x1="92.5195" y1="26.1747" x2="92.5449" y2="26.2001" layer="94"/>
<rectangle x1="92.5703" y1="26.1747" x2="94.3737" y2="26.2001" layer="94"/>
<rectangle x1="91.7829" y1="26.2001" x2="91.8591" y2="26.2255" layer="94"/>
<rectangle x1="92.8497" y1="26.2001" x2="92.8751" y2="26.2255" layer="94"/>
<rectangle x1="92.9005" y1="26.2001" x2="92.9259" y2="26.2255" layer="94"/>
<rectangle x1="92.9513" y1="26.2001" x2="92.9767" y2="26.2255" layer="94"/>
<rectangle x1="93.0021" y1="26.2001" x2="94.3483" y2="26.2255" layer="94"/>
<rectangle x1="91.7575" y1="26.2255" x2="91.8591" y2="26.2509" layer="94"/>
<rectangle x1="93.1291" y1="26.2255" x2="93.1545" y2="26.2509" layer="94"/>
<rectangle x1="93.1799" y1="26.2255" x2="93.2053" y2="26.2509" layer="94"/>
<rectangle x1="93.2307" y1="26.2255" x2="93.2561" y2="26.2509" layer="94"/>
<rectangle x1="93.2815" y1="26.2255" x2="94.4245" y2="26.2509" layer="94"/>
<rectangle x1="91.7829" y1="26.2509" x2="91.8591" y2="26.2763" layer="94"/>
<rectangle x1="93.5609" y1="26.2509" x2="93.5863" y2="26.2763" layer="94"/>
<rectangle x1="93.6117" y1="26.2509" x2="93.6371" y2="26.2763" layer="94"/>
<rectangle x1="93.6625" y1="26.2509" x2="93.6879" y2="26.2763" layer="94"/>
<rectangle x1="93.7133" y1="26.2509" x2="94.4245" y2="26.2763" layer="94"/>
<rectangle x1="91.7575" y1="26.2763" x2="91.8591" y2="26.3017" layer="94"/>
<rectangle x1="93.8403" y1="26.2763" x2="93.8657" y2="26.3017" layer="94"/>
<rectangle x1="93.8911" y1="26.2763" x2="93.9165" y2="26.3017" layer="94"/>
<rectangle x1="93.9419" y1="26.2763" x2="93.9673" y2="26.3017" layer="94"/>
<rectangle x1="93.9927" y1="26.2763" x2="94.4499" y2="26.3017" layer="94"/>
<rectangle x1="91.7829" y1="26.3017" x2="91.8591" y2="26.3271" layer="94"/>
<rectangle x1="94.0943" y1="26.3017" x2="94.1959" y2="26.3271" layer="94"/>
<rectangle x1="94.2721" y1="26.3017" x2="94.2975" y2="26.3271" layer="94"/>
<rectangle x1="94.3229" y1="26.3017" x2="94.3483" y2="26.3271" layer="94"/>
<rectangle x1="94.3737" y1="26.3017" x2="94.3991" y2="26.3271" layer="94"/>
<rectangle x1="94.4245" y1="26.3017" x2="94.4753" y2="26.3271" layer="94"/>
<rectangle x1="91.7575" y1="26.3271" x2="91.8591" y2="26.3525" layer="94"/>
<rectangle x1="94.0943" y1="26.3271" x2="94.2213" y2="26.3525" layer="94"/>
<rectangle x1="91.7829" y1="26.3525" x2="91.8591" y2="26.3779" layer="94"/>
<rectangle x1="94.1197" y1="26.3525" x2="94.2467" y2="26.3779" layer="94"/>
<rectangle x1="91.7575" y1="26.3779" x2="91.8591" y2="26.4033" layer="94"/>
<rectangle x1="94.1451" y1="26.3779" x2="94.2721" y2="26.4033" layer="94"/>
<rectangle x1="91.7829" y1="26.4033" x2="91.8591" y2="26.4287" layer="94"/>
<rectangle x1="94.1705" y1="26.4033" x2="94.2721" y2="26.4287" layer="94"/>
<rectangle x1="91.7575" y1="26.4287" x2="91.8591" y2="26.4541" layer="94"/>
<rectangle x1="94.1959" y1="26.4287" x2="94.2975" y2="26.4541" layer="94"/>
<rectangle x1="91.7829" y1="26.4541" x2="91.8591" y2="26.4795" layer="94"/>
<rectangle x1="94.2213" y1="26.4541" x2="94.3229" y2="26.4795" layer="94"/>
<rectangle x1="91.7575" y1="26.4795" x2="91.8591" y2="26.5049" layer="94"/>
<rectangle x1="94.2467" y1="26.4795" x2="94.3483" y2="26.5049" layer="94"/>
<rectangle x1="91.7829" y1="26.5049" x2="91.8591" y2="26.5303" layer="94"/>
<rectangle x1="94.2721" y1="26.5049" x2="94.3483" y2="26.5303" layer="94"/>
<rectangle x1="91.5289" y1="26.5303" x2="91.6813" y2="26.5557" layer="94"/>
<rectangle x1="91.7067" y1="26.5303" x2="91.7321" y2="26.5557" layer="94"/>
<rectangle x1="91.7575" y1="26.5303" x2="91.8591" y2="26.5557" layer="94"/>
<rectangle x1="94.2721" y1="26.5303" x2="94.3737" y2="26.5557" layer="94"/>
<rectangle x1="91.5289" y1="26.5557" x2="91.9607" y2="26.5811" layer="94"/>
<rectangle x1="91.9861" y1="26.5557" x2="92.0115" y2="26.5811" layer="94"/>
<rectangle x1="92.0369" y1="26.5557" x2="92.0623" y2="26.5811" layer="94"/>
<rectangle x1="92.0877" y1="26.5557" x2="92.1131" y2="26.5811" layer="94"/>
<rectangle x1="94.3229" y1="26.5557" x2="94.3991" y2="26.5811" layer="94"/>
<rectangle x1="91.5289" y1="26.5811" x2="92.4433" y2="26.6065" layer="94"/>
<rectangle x1="92.4687" y1="26.5811" x2="92.4941" y2="26.6065" layer="94"/>
<rectangle x1="92.5195" y1="26.5811" x2="92.5449" y2="26.6065" layer="94"/>
<rectangle x1="92.5703" y1="26.5811" x2="92.5957" y2="26.6065" layer="94"/>
<rectangle x1="94.3229" y1="26.5811" x2="94.4245" y2="26.6065" layer="94"/>
<rectangle x1="91.5289" y1="26.6065" x2="92.7227" y2="26.6319" layer="94"/>
<rectangle x1="92.7481" y1="26.6065" x2="92.7735" y2="26.6319" layer="94"/>
<rectangle x1="92.7989" y1="26.6065" x2="92.8243" y2="26.6319" layer="94"/>
<rectangle x1="92.8497" y1="26.6065" x2="92.8751" y2="26.6319" layer="94"/>
<rectangle x1="94.3737" y1="26.6065" x2="94.4499" y2="26.6319" layer="94"/>
<rectangle x1="91.5035" y1="26.6319" x2="93.2053" y2="26.6573" layer="94"/>
<rectangle x1="93.2307" y1="26.6319" x2="93.2561" y2="26.6573" layer="94"/>
<rectangle x1="93.2815" y1="26.6319" x2="93.3069" y2="26.6573" layer="94"/>
<rectangle x1="93.3323" y1="26.6319" x2="93.3577" y2="26.6573" layer="94"/>
<rectangle x1="94.3483" y1="26.6319" x2="94.4753" y2="26.6573" layer="94"/>
<rectangle x1="91.5289" y1="26.6573" x2="93.4847" y2="26.6827" layer="94"/>
<rectangle x1="93.5101" y1="26.6573" x2="93.5355" y2="26.6827" layer="94"/>
<rectangle x1="93.5609" y1="26.6573" x2="93.5863" y2="26.6827" layer="94"/>
<rectangle x1="93.6117" y1="26.6573" x2="93.6371" y2="26.6827" layer="94"/>
<rectangle x1="94.3991" y1="26.6573" x2="94.5007" y2="26.6827" layer="94"/>
<rectangle x1="91.5035" y1="26.6827" x2="93.9673" y2="26.7081" layer="94"/>
<rectangle x1="93.9927" y1="26.6827" x2="94.0181" y2="26.7081" layer="94"/>
<rectangle x1="94.0435" y1="26.6827" x2="94.0689" y2="26.7081" layer="94"/>
<rectangle x1="94.0943" y1="26.6827" x2="94.1197" y2="26.7081" layer="94"/>
<rectangle x1="94.3991" y1="26.6827" x2="94.5261" y2="26.7081" layer="94"/>
<rectangle x1="91.5289" y1="26.7081" x2="94.2467" y2="26.7335" layer="94"/>
<rectangle x1="94.2721" y1="26.7081" x2="94.2975" y2="26.7335" layer="94"/>
<rectangle x1="94.3229" y1="26.7081" x2="94.3483" y2="26.7335" layer="94"/>
<rectangle x1="94.3737" y1="26.7081" x2="94.3991" y2="26.7335" layer="94"/>
<rectangle x1="94.4245" y1="26.7081" x2="94.5261" y2="26.7335" layer="94"/>
<rectangle x1="91.5035" y1="26.7335" x2="94.5769" y2="26.7589" layer="94"/>
<rectangle x1="91.5289" y1="26.7589" x2="94.6023" y2="26.7843" layer="94"/>
<rectangle x1="91.5035" y1="26.7843" x2="94.6531" y2="26.8097" layer="94"/>
<rectangle x1="91.5289" y1="26.8097" x2="94.6531" y2="26.8351" layer="94"/>
<rectangle x1="91.5543" y1="26.8351" x2="91.5797" y2="26.8605" layer="94"/>
<rectangle x1="91.6051" y1="26.8351" x2="91.6305" y2="26.8605" layer="94"/>
<rectangle x1="91.6559" y1="26.8351" x2="91.6813" y2="26.8605" layer="94"/>
<rectangle x1="91.7067" y1="26.8351" x2="91.7321" y2="26.8605" layer="94"/>
<rectangle x1="91.7575" y1="26.8351" x2="94.7039" y2="26.8605" layer="94"/>
<rectangle x1="91.7829" y1="26.8605" x2="91.8591" y2="26.8859" layer="94"/>
<rectangle x1="92.0877" y1="26.8605" x2="92.1131" y2="26.8859" layer="94"/>
<rectangle x1="92.1385" y1="26.8605" x2="92.1639" y2="26.8859" layer="94"/>
<rectangle x1="92.1893" y1="26.8605" x2="92.2147" y2="26.8859" layer="94"/>
<rectangle x1="92.2401" y1="26.8605" x2="92.2655" y2="26.8859" layer="94"/>
<rectangle x1="92.2909" y1="26.8605" x2="94.7293" y2="26.8859" layer="94"/>
<rectangle x1="91.7575" y1="26.8859" x2="91.8337" y2="26.9113" layer="94"/>
<rectangle x1="92.4179" y1="26.8859" x2="92.4433" y2="26.9113" layer="94"/>
<rectangle x1="92.4687" y1="26.8859" x2="92.4941" y2="26.9113" layer="94"/>
<rectangle x1="92.5195" y1="26.8859" x2="92.5449" y2="26.9113" layer="94"/>
<rectangle x1="92.5703" y1="26.8859" x2="92.5957" y2="26.9113" layer="94"/>
<rectangle x1="92.6211" y1="26.8859" x2="94.7801" y2="26.9113" layer="94"/>
<rectangle x1="91.7829" y1="26.9113" x2="91.8591" y2="26.9367" layer="94"/>
<rectangle x1="92.9513" y1="26.9113" x2="92.9767" y2="26.9367" layer="94"/>
<rectangle x1="93.0021" y1="26.9113" x2="93.0275" y2="26.9367" layer="94"/>
<rectangle x1="93.0529" y1="26.9113" x2="93.0783" y2="26.9367" layer="94"/>
<rectangle x1="93.1037" y1="26.9113" x2="94.8055" y2="26.9367" layer="94"/>
<rectangle x1="91.7575" y1="26.9367" x2="91.8337" y2="26.9621" layer="94"/>
<rectangle x1="93.2307" y1="26.9367" x2="93.2561" y2="26.9621" layer="94"/>
<rectangle x1="93.2815" y1="26.9367" x2="93.3069" y2="26.9621" layer="94"/>
<rectangle x1="93.3323" y1="26.9367" x2="93.3577" y2="26.9621" layer="94"/>
<rectangle x1="93.3831" y1="26.9367" x2="93.4085" y2="26.9621" layer="94"/>
<rectangle x1="93.4339" y1="26.9367" x2="94.8309" y2="26.9621" layer="94"/>
<rectangle x1="95.1611" y1="26.9367" x2="95.2119" y2="26.9621" layer="94"/>
<rectangle x1="91.7829" y1="26.9621" x2="91.8591" y2="26.9875" layer="94"/>
<rectangle x1="93.7641" y1="26.9621" x2="93.7895" y2="26.9875" layer="94"/>
<rectangle x1="93.8149" y1="26.9621" x2="93.8403" y2="26.9875" layer="94"/>
<rectangle x1="93.8657" y1="26.9621" x2="93.8911" y2="26.9875" layer="94"/>
<rectangle x1="93.9165" y1="26.9621" x2="93.9419" y2="26.9875" layer="94"/>
<rectangle x1="93.9673" y1="26.9621" x2="94.8563" y2="26.9875" layer="94"/>
<rectangle x1="94.8817" y1="26.9621" x2="94.9071" y2="26.9875" layer="94"/>
<rectangle x1="94.9325" y1="26.9621" x2="94.9579" y2="26.9875" layer="94"/>
<rectangle x1="94.9833" y1="26.9621" x2="95.0087" y2="26.9875" layer="94"/>
<rectangle x1="95.0341" y1="26.9621" x2="95.0595" y2="26.9875" layer="94"/>
<rectangle x1="95.0849" y1="26.9621" x2="95.1103" y2="26.9875" layer="94"/>
<rectangle x1="95.1357" y1="26.9621" x2="95.2119" y2="26.9875" layer="94"/>
<rectangle x1="91.7575" y1="26.9875" x2="91.8337" y2="27.0129" layer="94"/>
<rectangle x1="94.0943" y1="26.9875" x2="94.1197" y2="27.0129" layer="94"/>
<rectangle x1="94.1451" y1="26.9875" x2="94.1705" y2="27.0129" layer="94"/>
<rectangle x1="94.1959" y1="26.9875" x2="94.2213" y2="27.0129" layer="94"/>
<rectangle x1="94.2467" y1="26.9875" x2="94.2721" y2="27.0129" layer="94"/>
<rectangle x1="94.2975" y1="26.9875" x2="95.2373" y2="27.0129" layer="94"/>
<rectangle x1="91.7829" y1="27.0129" x2="91.8591" y2="27.0383" layer="94"/>
<rectangle x1="94.4245" y1="27.0129" x2="95.2119" y2="27.0383" layer="94"/>
<rectangle x1="91.7575" y1="27.0383" x2="91.8337" y2="27.0637" layer="94"/>
<rectangle x1="94.3483" y1="27.0383" x2="95.2373" y2="27.0637" layer="94"/>
<rectangle x1="91.7829" y1="27.0637" x2="91.8337" y2="27.0891" layer="94"/>
<rectangle x1="94.2721" y1="27.0637" x2="95.2627" y2="27.0891" layer="94"/>
<rectangle x1="91.7575" y1="27.0891" x2="91.8337" y2="27.1145" layer="94"/>
<rectangle x1="94.1959" y1="27.0891" x2="95.2627" y2="27.1145" layer="94"/>
<rectangle x1="91.7829" y1="27.1145" x2="91.8337" y2="27.1399" layer="94"/>
<rectangle x1="94.1705" y1="27.1145" x2="95.2627" y2="27.1399" layer="94"/>
<rectangle x1="91.7575" y1="27.1399" x2="91.8337" y2="27.1653" layer="94"/>
<rectangle x1="94.0943" y1="27.1399" x2="95.2881" y2="27.1653" layer="94"/>
<rectangle x1="91.7829" y1="27.1653" x2="91.8337" y2="27.1907" layer="94"/>
<rectangle x1="94.0181" y1="27.1653" x2="95.2627" y2="27.1907" layer="94"/>
<rectangle x1="91.7575" y1="27.1907" x2="91.8337" y2="27.2161" layer="94"/>
<rectangle x1="93.9419" y1="27.1907" x2="95.2881" y2="27.2161" layer="94"/>
<rectangle x1="91.6305" y1="27.2161" x2="91.7067" y2="27.2415" layer="94"/>
<rectangle x1="91.7321" y1="27.2161" x2="91.8591" y2="27.2415" layer="94"/>
<rectangle x1="93.9165" y1="27.2161" x2="95.2881" y2="27.2415" layer="94"/>
<rectangle x1="91.6305" y1="27.2415" x2="92.2401" y2="27.2669" layer="94"/>
<rectangle x1="92.2655" y1="27.2415" x2="92.2909" y2="27.2669" layer="94"/>
<rectangle x1="92.3163" y1="27.2415" x2="92.3417" y2="27.2669" layer="94"/>
<rectangle x1="92.3671" y1="27.2415" x2="92.3925" y2="27.2669" layer="94"/>
<rectangle x1="92.4179" y1="27.2415" x2="92.4433" y2="27.2669" layer="94"/>
<rectangle x1="93.7895" y1="27.2415" x2="95.3135" y2="27.2669" layer="94"/>
<rectangle x1="91.6305" y1="27.2669" x2="92.5703" y2="27.2923" layer="94"/>
<rectangle x1="92.5957" y1="27.2669" x2="92.6211" y2="27.2923" layer="94"/>
<rectangle x1="92.6465" y1="27.2669" x2="92.6719" y2="27.2923" layer="94"/>
<rectangle x1="92.6973" y1="27.2669" x2="92.7227" y2="27.2923" layer="94"/>
<rectangle x1="93.7641" y1="27.2669" x2="95.3135" y2="27.2923" layer="94"/>
<rectangle x1="91.6305" y1="27.2923" x2="93.1037" y2="27.3177" layer="94"/>
<rectangle x1="93.1291" y1="27.2923" x2="93.1545" y2="27.3177" layer="94"/>
<rectangle x1="93.1799" y1="27.2923" x2="93.2053" y2="27.3177" layer="94"/>
<rectangle x1="93.2307" y1="27.2923" x2="93.2561" y2="27.3177" layer="94"/>
<rectangle x1="93.2815" y1="27.2923" x2="93.3069" y2="27.3177" layer="94"/>
<rectangle x1="93.6879" y1="27.2923" x2="95.3389" y2="27.3177" layer="94"/>
<rectangle x1="91.6305" y1="27.3177" x2="93.4339" y2="27.3431" layer="94"/>
<rectangle x1="93.4593" y1="27.3177" x2="93.4847" y2="27.3431" layer="94"/>
<rectangle x1="93.5101" y1="27.3177" x2="93.5355" y2="27.3431" layer="94"/>
<rectangle x1="93.5609" y1="27.3177" x2="93.5863" y2="27.3431" layer="94"/>
<rectangle x1="93.6117" y1="27.3177" x2="95.3135" y2="27.3431" layer="94"/>
<rectangle x1="91.6305" y1="27.3431" x2="95.3389" y2="27.3685" layer="94"/>
<rectangle x1="91.6305" y1="27.3685" x2="95.3389" y2="27.3939" layer="94"/>
<rectangle x1="91.6051" y1="27.3939" x2="95.3389" y2="27.4193" layer="94"/>
<rectangle x1="91.6305" y1="27.4193" x2="95.3643" y2="27.4447" layer="94"/>
<rectangle x1="91.6051" y1="27.4447" x2="95.3897" y2="27.4701" layer="94"/>
<rectangle x1="91.6305" y1="27.4701" x2="95.3643" y2="27.4955" layer="94"/>
<rectangle x1="91.6051" y1="27.4955" x2="95.3897" y2="27.5209" layer="94"/>
<rectangle x1="91.7829" y1="27.5209" x2="91.8591" y2="27.5463" layer="94"/>
<rectangle x1="91.8845" y1="27.5209" x2="91.9099" y2="27.5463" layer="94"/>
<rectangle x1="91.9353" y1="27.5209" x2="91.9607" y2="27.5463" layer="94"/>
<rectangle x1="91.9861" y1="27.5209" x2="92.0115" y2="27.5463" layer="94"/>
<rectangle x1="92.0369" y1="27.5209" x2="95.3897" y2="27.5463" layer="94"/>
<rectangle x1="91.7575" y1="27.5463" x2="91.8337" y2="27.5717" layer="94"/>
<rectangle x1="92.1639" y1="27.5463" x2="92.1893" y2="27.5717" layer="94"/>
<rectangle x1="92.2147" y1="27.5463" x2="92.2401" y2="27.5717" layer="94"/>
<rectangle x1="92.2655" y1="27.5463" x2="92.2909" y2="27.5717" layer="94"/>
<rectangle x1="92.3163" y1="27.5463" x2="92.3417" y2="27.5717" layer="94"/>
<rectangle x1="92.3671" y1="27.5463" x2="95.3897" y2="27.5717" layer="94"/>
<rectangle x1="91.7575" y1="27.5717" x2="91.8337" y2="27.5971" layer="94"/>
<rectangle x1="92.7481" y1="27.5717" x2="92.7735" y2="27.5971" layer="94"/>
<rectangle x1="92.7989" y1="27.5717" x2="92.8243" y2="27.5971" layer="94"/>
<rectangle x1="92.8497" y1="27.5717" x2="92.8751" y2="27.5971" layer="94"/>
<rectangle x1="92.9005" y1="27.5717" x2="95.4151" y2="27.5971" layer="94"/>
<rectangle x1="91.7575" y1="27.5971" x2="91.8337" y2="27.6225" layer="94"/>
<rectangle x1="92.8751" y1="27.5971" x2="95.4151" y2="27.6225" layer="94"/>
<rectangle x1="91.7575" y1="27.6225" x2="91.8337" y2="27.6479" layer="94"/>
<rectangle x1="92.8497" y1="27.6225" x2="95.4151" y2="27.6479" layer="94"/>
<rectangle x1="91.7575" y1="27.6479" x2="91.8337" y2="27.6733" layer="94"/>
<rectangle x1="92.7227" y1="27.6479" x2="92.7481" y2="27.6733" layer="94"/>
<rectangle x1="92.7735" y1="27.6479" x2="95.4405" y2="27.6733" layer="94"/>
<rectangle x1="91.7575" y1="27.6733" x2="91.8337" y2="27.6987" layer="94"/>
<rectangle x1="92.6973" y1="27.6733" x2="95.4405" y2="27.6987" layer="94"/>
<rectangle x1="91.7575" y1="27.6987" x2="91.8337" y2="27.7241" layer="94"/>
<rectangle x1="92.6211" y1="27.6987" x2="95.4659" y2="27.7241" layer="94"/>
<rectangle x1="91.7575" y1="27.7241" x2="91.8337" y2="27.7495" layer="94"/>
<rectangle x1="92.5449" y1="27.7241" x2="92.5703" y2="27.7495" layer="94"/>
<rectangle x1="92.5957" y1="27.7241" x2="95.4659" y2="27.7495" layer="94"/>
<rectangle x1="91.7575" y1="27.7495" x2="91.8337" y2="27.7749" layer="94"/>
<rectangle x1="92.4687" y1="27.7495" x2="92.4941" y2="27.7749" layer="94"/>
<rectangle x1="92.5195" y1="27.7495" x2="95.4659" y2="27.7749" layer="94"/>
<rectangle x1="91.7575" y1="27.7749" x2="91.8337" y2="27.8003" layer="94"/>
<rectangle x1="92.4433" y1="27.7749" x2="95.4659" y2="27.8003" layer="94"/>
<rectangle x1="91.7575" y1="27.8003" x2="91.8337" y2="27.8257" layer="94"/>
<rectangle x1="92.3671" y1="27.8003" x2="95.5421" y2="27.8257" layer="94"/>
<rectangle x1="91.7575" y1="27.8257" x2="91.8337" y2="27.8511" layer="94"/>
<rectangle x1="92.2909" y1="27.8257" x2="92.3163" y2="27.8511" layer="94"/>
<rectangle x1="92.3417" y1="27.8257" x2="95.5675" y2="27.8511" layer="94"/>
<rectangle x1="95.5929" y1="27.8257" x2="95.6183" y2="27.8511" layer="94"/>
<rectangle x1="91.7575" y1="27.8511" x2="91.8337" y2="27.8765" layer="94"/>
<rectangle x1="92.2147" y1="27.8511" x2="95.6945" y2="27.8765" layer="94"/>
<rectangle x1="91.7575" y1="27.8765" x2="91.8337" y2="27.9019" layer="94"/>
<rectangle x1="92.1893" y1="27.8765" x2="95.6945" y2="27.9019" layer="94"/>
<rectangle x1="91.7575" y1="27.9019" x2="91.8337" y2="27.9273" layer="94"/>
<rectangle x1="92.1131" y1="27.9019" x2="95.7199" y2="27.9273" layer="94"/>
<rectangle x1="91.7575" y1="27.9273" x2="91.8337" y2="27.9527" layer="94"/>
<rectangle x1="92.0369" y1="27.9273" x2="95.7199" y2="27.9527" layer="94"/>
<rectangle x1="91.7575" y1="27.9527" x2="95.7453" y2="27.9781" layer="94"/>
<rectangle x1="91.7575" y1="27.9781" x2="95.7199" y2="28.0035" layer="94"/>
<rectangle x1="91.7575" y1="28.0035" x2="95.4913" y2="28.0289" layer="94"/>
<rectangle x1="95.5167" y1="28.0035" x2="95.7453" y2="28.0289" layer="94"/>
<rectangle x1="91.7575" y1="28.0289" x2="95.4151" y2="28.0543" layer="94"/>
<rectangle x1="95.5167" y1="28.0289" x2="95.7707" y2="28.0543" layer="94"/>
<rectangle x1="91.7067" y1="28.0543" x2="95.3897" y2="28.0797" layer="94"/>
<rectangle x1="95.5167" y1="28.0543" x2="95.7707" y2="28.0797" layer="94"/>
<rectangle x1="91.6813" y1="28.0797" x2="95.3135" y2="28.1051" layer="94"/>
<rectangle x1="95.5421" y1="28.0797" x2="95.7707" y2="28.1051" layer="94"/>
<rectangle x1="91.6559" y1="28.1051" x2="95.2881" y2="28.1305" layer="94"/>
<rectangle x1="95.5167" y1="28.1051" x2="95.7961" y2="28.1305" layer="94"/>
<rectangle x1="91.6305" y1="28.1305" x2="95.2627" y2="28.1559" layer="94"/>
<rectangle x1="95.5421" y1="28.1305" x2="95.7961" y2="28.1559" layer="94"/>
<rectangle x1="91.5543" y1="28.1559" x2="95.2373" y2="28.1813" layer="94"/>
<rectangle x1="95.5421" y1="28.1559" x2="95.7961" y2="28.1813" layer="94"/>
<rectangle x1="91.5289" y1="28.1813" x2="95.1611" y2="28.2067" layer="94"/>
<rectangle x1="95.5421" y1="28.1813" x2="95.8215" y2="28.2067" layer="94"/>
<rectangle x1="91.4781" y1="28.2067" x2="95.1357" y2="28.2321" layer="94"/>
<rectangle x1="95.5675" y1="28.2067" x2="95.8215" y2="28.2321" layer="94"/>
<rectangle x1="91.4273" y1="28.2321" x2="95.0595" y2="28.2575" layer="94"/>
<rectangle x1="95.5675" y1="28.2321" x2="95.8215" y2="28.2575" layer="94"/>
<rectangle x1="91.4019" y1="28.2575" x2="95.0341" y2="28.2829" layer="94"/>
<rectangle x1="95.5675" y1="28.2575" x2="95.8469" y2="28.2829" layer="94"/>
<rectangle x1="91.3511" y1="28.2829" x2="94.9579" y2="28.3083" layer="94"/>
<rectangle x1="95.5929" y1="28.2829" x2="95.8469" y2="28.3083" layer="94"/>
<rectangle x1="91.3003" y1="28.3083" x2="94.9325" y2="28.3337" layer="94"/>
<rectangle x1="95.5929" y1="28.3083" x2="95.8469" y2="28.3337" layer="94"/>
<rectangle x1="91.2749" y1="28.3337" x2="94.9071" y2="28.3591" layer="94"/>
<rectangle x1="95.5929" y1="28.3337" x2="95.8723" y2="28.3591" layer="94"/>
<rectangle x1="91.2241" y1="28.3591" x2="94.8563" y2="28.3845" layer="94"/>
<rectangle x1="95.5929" y1="28.3591" x2="95.8977" y2="28.3845" layer="94"/>
<rectangle x1="91.2241" y1="28.3845" x2="94.8563" y2="28.4099" layer="94"/>
<rectangle x1="95.5929" y1="28.3845" x2="95.8723" y2="28.4099" layer="94"/>
<rectangle x1="91.2495" y1="28.4099" x2="94.8563" y2="28.4353" layer="94"/>
<rectangle x1="95.6183" y1="28.4099" x2="95.8977" y2="28.4353" layer="94"/>
<rectangle x1="91.2495" y1="28.4353" x2="94.8563" y2="28.4607" layer="94"/>
<rectangle x1="95.6437" y1="28.4353" x2="95.8977" y2="28.4607" layer="94"/>
<rectangle x1="91.2495" y1="28.4607" x2="94.8817" y2="28.4861" layer="94"/>
<rectangle x1="95.6183" y1="28.4607" x2="95.9231" y2="28.4861" layer="94"/>
<rectangle x1="91.2749" y1="28.4861" x2="94.8563" y2="28.5115" layer="94"/>
<rectangle x1="95.6437" y1="28.4861" x2="95.9231" y2="28.5115" layer="94"/>
<rectangle x1="91.2749" y1="28.5115" x2="94.4245" y2="28.5369" layer="94"/>
<rectangle x1="94.4499" y1="28.5115" x2="94.8817" y2="28.5369" layer="94"/>
<rectangle x1="95.6437" y1="28.5115" x2="95.9485" y2="28.5369" layer="94"/>
<rectangle x1="91.3003" y1="28.5369" x2="94.2975" y2="28.5623" layer="94"/>
<rectangle x1="94.4753" y1="28.5369" x2="94.9071" y2="28.5623" layer="94"/>
<rectangle x1="95.6437" y1="28.5369" x2="95.9231" y2="28.5623" layer="94"/>
<rectangle x1="91.3003" y1="28.5623" x2="94.2721" y2="28.5877" layer="94"/>
<rectangle x1="94.4499" y1="28.5623" x2="94.9071" y2="28.5877" layer="94"/>
<rectangle x1="95.6691" y1="28.5623" x2="95.9485" y2="28.5877" layer="94"/>
<rectangle x1="91.3257" y1="28.5877" x2="94.1959" y2="28.6131" layer="94"/>
<rectangle x1="94.4753" y1="28.5877" x2="94.9071" y2="28.6131" layer="94"/>
<rectangle x1="95.6691" y1="28.5877" x2="95.9739" y2="28.6131" layer="94"/>
<rectangle x1="91.3003" y1="28.6131" x2="94.1197" y2="28.6385" layer="94"/>
<rectangle x1="94.4753" y1="28.6131" x2="94.9325" y2="28.6385" layer="94"/>
<rectangle x1="95.6691" y1="28.6131" x2="95.9739" y2="28.6385" layer="94"/>
<rectangle x1="91.3257" y1="28.6385" x2="94.0435" y2="28.6639" layer="94"/>
<rectangle x1="94.5007" y1="28.6385" x2="94.9071" y2="28.6639" layer="94"/>
<rectangle x1="95.6945" y1="28.6385" x2="95.9739" y2="28.6639" layer="94"/>
<rectangle x1="91.3511" y1="28.6639" x2="94.0181" y2="28.6893" layer="94"/>
<rectangle x1="94.5007" y1="28.6639" x2="94.9325" y2="28.6893" layer="94"/>
<rectangle x1="95.6691" y1="28.6639" x2="95.9993" y2="28.6893" layer="94"/>
<rectangle x1="91.3511" y1="28.6893" x2="93.9419" y2="28.7147" layer="94"/>
<rectangle x1="94.5007" y1="28.6893" x2="94.9579" y2="28.7147" layer="94"/>
<rectangle x1="95.6945" y1="28.6893" x2="95.9993" y2="28.7147" layer="94"/>
<rectangle x1="91.3511" y1="28.7147" x2="93.8657" y2="28.7401" layer="94"/>
<rectangle x1="94.5007" y1="28.7147" x2="94.9325" y2="28.7401" layer="94"/>
<rectangle x1="95.6945" y1="28.7147" x2="95.9993" y2="28.7401" layer="94"/>
<rectangle x1="91.3765" y1="28.7401" x2="93.7895" y2="28.7655" layer="94"/>
<rectangle x1="94.5261" y1="28.7401" x2="94.9579" y2="28.7655" layer="94"/>
<rectangle x1="95.6945" y1="28.7401" x2="96.0247" y2="28.7655" layer="94"/>
<rectangle x1="91.3511" y1="28.7655" x2="93.7641" y2="28.7909" layer="94"/>
<rectangle x1="94.5261" y1="28.7655" x2="94.9833" y2="28.7909" layer="94"/>
<rectangle x1="95.7199" y1="28.7655" x2="96.0501" y2="28.7909" layer="94"/>
<rectangle x1="91.3765" y1="28.7909" x2="93.7895" y2="28.8163" layer="94"/>
<rectangle x1="94.5261" y1="28.7909" x2="94.9579" y2="28.8163" layer="94"/>
<rectangle x1="95.7199" y1="28.7909" x2="96.0247" y2="28.8163" layer="94"/>
<rectangle x1="91.4019" y1="28.8163" x2="93.7895" y2="28.8417" layer="94"/>
<rectangle x1="94.5515" y1="28.8163" x2="94.9833" y2="28.8417" layer="94"/>
<rectangle x1="95.7199" y1="28.8163" x2="95.9993" y2="28.8417" layer="94"/>
<rectangle x1="91.4273" y1="28.8417" x2="93.7895" y2="28.8671" layer="94"/>
<rectangle x1="94.5769" y1="28.8417" x2="94.9833" y2="28.8671" layer="94"/>
<rectangle x1="95.7453" y1="28.8417" x2="95.9739" y2="28.8671" layer="94"/>
<rectangle x1="91.4019" y1="28.8671" x2="93.8149" y2="28.8925" layer="94"/>
<rectangle x1="94.5515" y1="28.8671" x2="94.9833" y2="28.8925" layer="94"/>
<rectangle x1="95.7199" y1="28.8671" x2="95.9739" y2="28.8925" layer="94"/>
<rectangle x1="91.4273" y1="28.8925" x2="93.8149" y2="28.9179" layer="94"/>
<rectangle x1="94.5769" y1="28.8925" x2="95.0087" y2="28.9179" layer="94"/>
<rectangle x1="95.7453" y1="28.8925" x2="95.9485" y2="28.9179" layer="94"/>
<rectangle x1="91.4273" y1="28.9179" x2="93.8149" y2="28.9433" layer="94"/>
<rectangle x1="94.5769" y1="28.9179" x2="95.0087" y2="28.9433" layer="94"/>
<rectangle x1="95.7453" y1="28.9179" x2="95.9485" y2="28.9433" layer="94"/>
<rectangle x1="91.4273" y1="28.9433" x2="93.2307" y2="28.9687" layer="94"/>
<rectangle x1="93.2561" y1="28.9433" x2="93.2815" y2="28.9687" layer="94"/>
<rectangle x1="93.3577" y1="28.9433" x2="93.8403" y2="28.9687" layer="94"/>
<rectangle x1="94.5769" y1="28.9433" x2="95.0087" y2="28.9687" layer="94"/>
<rectangle x1="95.7707" y1="28.9433" x2="95.8977" y2="28.9687" layer="94"/>
<rectangle x1="91.4527" y1="28.9687" x2="93.2053" y2="28.9941" layer="94"/>
<rectangle x1="93.3577" y1="28.9687" x2="93.8403" y2="28.9941" layer="94"/>
<rectangle x1="94.6023" y1="28.9687" x2="95.0341" y2="28.9941" layer="94"/>
<rectangle x1="95.7707" y1="28.9687" x2="95.8977" y2="28.9941" layer="94"/>
<rectangle x1="91.4781" y1="28.9941" x2="93.0783" y2="29.0195" layer="94"/>
<rectangle x1="93.3577" y1="28.9941" x2="93.8403" y2="29.0195" layer="94"/>
<rectangle x1="94.6023" y1="28.9941" x2="95.0341" y2="29.0195" layer="94"/>
<rectangle x1="95.7707" y1="28.9941" x2="95.8723" y2="29.0195" layer="94"/>
<rectangle x1="91.4527" y1="29.0195" x2="93.0021" y2="29.0449" layer="94"/>
<rectangle x1="93.3831" y1="29.0195" x2="93.8657" y2="29.0449" layer="94"/>
<rectangle x1="94.6023" y1="29.0195" x2="95.0341" y2="29.0449" layer="94"/>
<rectangle x1="95.7707" y1="29.0195" x2="95.8723" y2="29.0449" layer="94"/>
<rectangle x1="91.4781" y1="29.0449" x2="92.8751" y2="29.0703" layer="94"/>
<rectangle x1="93.4085" y1="29.0449" x2="93.8657" y2="29.0703" layer="94"/>
<rectangle x1="94.6277" y1="29.0449" x2="95.0595" y2="29.0703" layer="94"/>
<rectangle x1="95.7453" y1="29.0449" x2="95.8723" y2="29.0703" layer="94"/>
<rectangle x1="91.4781" y1="29.0703" x2="92.7989" y2="29.0957" layer="94"/>
<rectangle x1="92.8243" y1="29.0703" x2="92.8497" y2="29.0957" layer="94"/>
<rectangle x1="93.3831" y1="29.0703" x2="93.8657" y2="29.0957" layer="94"/>
<rectangle x1="94.6277" y1="29.0703" x2="95.0595" y2="29.0957" layer="94"/>
<rectangle x1="95.6691" y1="29.0703" x2="95.8977" y2="29.0957" layer="94"/>
<rectangle x1="91.4781" y1="29.0957" x2="92.6719" y2="29.1211" layer="94"/>
<rectangle x1="92.6973" y1="29.0957" x2="92.7227" y2="29.1211" layer="94"/>
<rectangle x1="93.4085" y1="29.0957" x2="93.8911" y2="29.1211" layer="94"/>
<rectangle x1="94.6277" y1="29.0957" x2="95.0595" y2="29.1211" layer="94"/>
<rectangle x1="95.6437" y1="29.0957" x2="95.8977" y2="29.1211" layer="94"/>
<rectangle x1="91.5035" y1="29.1211" x2="92.5957" y2="29.1465" layer="94"/>
<rectangle x1="92.6211" y1="29.1211" x2="92.6465" y2="29.1465" layer="94"/>
<rectangle x1="93.4339" y1="29.1211" x2="93.8911" y2="29.1465" layer="94"/>
<rectangle x1="94.6531" y1="29.1211" x2="95.0849" y2="29.1465" layer="94"/>
<rectangle x1="95.5675" y1="29.1211" x2="95.8977" y2="29.1465" layer="94"/>
<rectangle x1="91.5289" y1="29.1465" x2="92.5957" y2="29.1719" layer="94"/>
<rectangle x1="93.4339" y1="29.1465" x2="93.8911" y2="29.1719" layer="94"/>
<rectangle x1="94.6531" y1="29.1465" x2="95.0849" y2="29.1719" layer="94"/>
<rectangle x1="95.5421" y1="29.1465" x2="95.9231" y2="29.1719" layer="94"/>
<rectangle x1="91.5289" y1="29.1719" x2="92.5957" y2="29.1973" layer="94"/>
<rectangle x1="93.4339" y1="29.1719" x2="93.9165" y2="29.1973" layer="94"/>
<rectangle x1="94.6531" y1="29.1719" x2="95.0849" y2="29.1973" layer="94"/>
<rectangle x1="95.4913" y1="29.1719" x2="95.9231" y2="29.1973" layer="94"/>
<rectangle x1="91.5289" y1="29.1973" x2="92.6211" y2="29.2227" layer="94"/>
<rectangle x1="93.4593" y1="29.1973" x2="93.9165" y2="29.2227" layer="94"/>
<rectangle x1="94.6785" y1="29.1973" x2="95.1103" y2="29.2227" layer="94"/>
<rectangle x1="95.4405" y1="29.1973" x2="95.9231" y2="29.2227" layer="94"/>
<rectangle x1="91.5543" y1="29.2227" x2="92.6465" y2="29.2481" layer="94"/>
<rectangle x1="93.4339" y1="29.2227" x2="93.9165" y2="29.2481" layer="94"/>
<rectangle x1="94.6531" y1="29.2227" x2="95.1103" y2="29.2481" layer="94"/>
<rectangle x1="95.4151" y1="29.2227" x2="95.9485" y2="29.2481" layer="94"/>
<rectangle x1="91.5543" y1="29.2481" x2="92.2147" y2="29.2735" layer="94"/>
<rectangle x1="92.3417" y1="29.2481" x2="92.6211" y2="29.2735" layer="94"/>
<rectangle x1="93.4593" y1="29.2481" x2="93.9419" y2="29.2735" layer="94"/>
<rectangle x1="94.6785" y1="29.2481" x2="95.1103" y2="29.2735" layer="94"/>
<rectangle x1="95.3897" y1="29.2481" x2="95.9485" y2="29.2735" layer="94"/>
<rectangle x1="91.5543" y1="29.2735" x2="92.1385" y2="29.2989" layer="94"/>
<rectangle x1="92.3163" y1="29.2735" x2="92.6465" y2="29.2989" layer="94"/>
<rectangle x1="93.4847" y1="29.2735" x2="93.9419" y2="29.2989" layer="94"/>
<rectangle x1="94.7039" y1="29.2735" x2="95.1357" y2="29.2989" layer="94"/>
<rectangle x1="95.3135" y1="29.2735" x2="95.9485" y2="29.2989" layer="94"/>
<rectangle x1="91.5797" y1="29.2989" x2="92.0115" y2="29.3243" layer="94"/>
<rectangle x1="92.3417" y1="29.2989" x2="92.6465" y2="29.3243" layer="94"/>
<rectangle x1="93.4847" y1="29.2989" x2="93.9419" y2="29.3243" layer="94"/>
<rectangle x1="94.7039" y1="29.2989" x2="95.1103" y2="29.3243" layer="94"/>
<rectangle x1="95.2881" y1="29.2989" x2="95.9739" y2="29.3243" layer="94"/>
<rectangle x1="91.5797" y1="29.3243" x2="91.9353" y2="29.3497" layer="94"/>
<rectangle x1="92.3417" y1="29.3243" x2="92.6719" y2="29.3497" layer="94"/>
<rectangle x1="93.4847" y1="29.3243" x2="93.9673" y2="29.3497" layer="94"/>
<rectangle x1="94.7039" y1="29.3243" x2="95.1357" y2="29.3497" layer="94"/>
<rectangle x1="95.2119" y1="29.3243" x2="95.9739" y2="29.3497" layer="94"/>
<rectangle x1="91.5797" y1="29.3497" x2="91.9099" y2="29.3751" layer="94"/>
<rectangle x1="92.3417" y1="29.3497" x2="92.6719" y2="29.3751" layer="94"/>
<rectangle x1="93.5101" y1="29.3497" x2="93.9673" y2="29.3751" layer="94"/>
<rectangle x1="94.7293" y1="29.3497" x2="95.1357" y2="29.3751" layer="94"/>
<rectangle x1="95.1865" y1="29.3497" x2="95.9739" y2="29.3751" layer="94"/>
<rectangle x1="91.6051" y1="29.3751" x2="91.9353" y2="29.4005" layer="94"/>
<rectangle x1="92.3671" y1="29.3751" x2="92.6973" y2="29.4005" layer="94"/>
<rectangle x1="93.4847" y1="29.3751" x2="93.9673" y2="29.4005" layer="94"/>
<rectangle x1="94.7039" y1="29.3751" x2="95.9993" y2="29.4005" layer="94"/>
<rectangle x1="91.5289" y1="29.4005" x2="91.9099" y2="29.4259" layer="94"/>
<rectangle x1="92.3925" y1="29.4005" x2="92.6719" y2="29.4259" layer="94"/>
<rectangle x1="93.5101" y1="29.4005" x2="93.9927" y2="29.4259" layer="94"/>
<rectangle x1="94.7293" y1="29.4005" x2="95.9993" y2="29.4259" layer="94"/>
<rectangle x1="91.5543" y1="29.4259" x2="91.9353" y2="29.4513" layer="94"/>
<rectangle x1="92.3671" y1="29.4259" x2="92.6973" y2="29.4513" layer="94"/>
<rectangle x1="93.5355" y1="29.4259" x2="93.9927" y2="29.4513" layer="94"/>
<rectangle x1="94.7293" y1="29.4259" x2="95.9993" y2="29.4513" layer="94"/>
<rectangle x1="91.5543" y1="29.4513" x2="91.9353" y2="29.4767" layer="94"/>
<rectangle x1="92.3925" y1="29.4513" x2="92.6973" y2="29.4767" layer="94"/>
<rectangle x1="93.5355" y1="29.4513" x2="93.9927" y2="29.4767" layer="94"/>
<rectangle x1="94.7293" y1="29.4513" x2="95.9993" y2="29.4767" layer="94"/>
<rectangle x1="91.5543" y1="29.4767" x2="91.9353" y2="29.5021" layer="94"/>
<rectangle x1="92.3925" y1="29.4767" x2="92.7227" y2="29.5021" layer="94"/>
<rectangle x1="93.5355" y1="29.4767" x2="94.0181" y2="29.5021" layer="94"/>
<rectangle x1="94.7547" y1="29.4767" x2="96.0247" y2="29.5021" layer="94"/>
<rectangle x1="91.5797" y1="29.5021" x2="91.9607" y2="29.5275" layer="94"/>
<rectangle x1="92.3925" y1="29.5021" x2="92.7227" y2="29.5275" layer="94"/>
<rectangle x1="93.5609" y1="29.5021" x2="94.0181" y2="29.5275" layer="94"/>
<rectangle x1="94.7293" y1="29.5021" x2="96.0247" y2="29.5275" layer="94"/>
<rectangle x1="91.5797" y1="29.5275" x2="91.9607" y2="29.5529" layer="94"/>
<rectangle x1="92.4179" y1="29.5275" x2="92.7481" y2="29.5529" layer="94"/>
<rectangle x1="93.5609" y1="29.5275" x2="94.0181" y2="29.5529" layer="94"/>
<rectangle x1="94.6531" y1="29.5275" x2="96.0501" y2="29.5529" layer="94"/>
<rectangle x1="91.5797" y1="29.5529" x2="91.9607" y2="29.5783" layer="94"/>
<rectangle x1="92.4179" y1="29.5529" x2="92.7227" y2="29.5783" layer="94"/>
<rectangle x1="93.5609" y1="29.5529" x2="94.0181" y2="29.5783" layer="94"/>
<rectangle x1="94.6277" y1="29.5529" x2="96.0247" y2="29.5783" layer="94"/>
<rectangle x1="91.6051" y1="29.5783" x2="91.9861" y2="29.6037" layer="94"/>
<rectangle x1="92.4179" y1="29.5783" x2="92.7481" y2="29.6037" layer="94"/>
<rectangle x1="93.5863" y1="29.5783" x2="94.0435" y2="29.6037" layer="94"/>
<rectangle x1="94.5515" y1="29.5783" x2="96.0501" y2="29.6037" layer="94"/>
<rectangle x1="91.6051" y1="29.6037" x2="91.9861" y2="29.6291" layer="94"/>
<rectangle x1="92.4433" y1="29.6037" x2="92.7735" y2="29.6291" layer="94"/>
<rectangle x1="93.5863" y1="29.6037" x2="94.0435" y2="29.6291" layer="94"/>
<rectangle x1="94.4753" y1="29.6037" x2="96.0501" y2="29.6291" layer="94"/>
<rectangle x1="91.6051" y1="29.6291" x2="91.9861" y2="29.6545" layer="94"/>
<rectangle x1="92.4433" y1="29.6291" x2="92.7481" y2="29.6545" layer="94"/>
<rectangle x1="93.5863" y1="29.6291" x2="94.0689" y2="29.6545" layer="94"/>
<rectangle x1="94.3991" y1="29.6291" x2="96.0755" y2="29.6545" layer="94"/>
<rectangle x1="91.6305" y1="29.6545" x2="92.0115" y2="29.6799" layer="94"/>
<rectangle x1="92.4433" y1="29.6545" x2="92.7735" y2="29.6799" layer="94"/>
<rectangle x1="93.6117" y1="29.6545" x2="94.0435" y2="29.6799" layer="94"/>
<rectangle x1="94.3737" y1="29.6545" x2="96.0755" y2="29.6799" layer="94"/>
<rectangle x1="91.6305" y1="29.6799" x2="92.0115" y2="29.7053" layer="94"/>
<rectangle x1="92.4687" y1="29.6799" x2="92.7989" y2="29.7053" layer="94"/>
<rectangle x1="93.6117" y1="29.6799" x2="94.0689" y2="29.7053" layer="94"/>
<rectangle x1="94.2975" y1="29.6799" x2="96.1009" y2="29.7053" layer="94"/>
<rectangle x1="91.6305" y1="29.7053" x2="92.0115" y2="29.7307" layer="94"/>
<rectangle x1="92.4687" y1="29.7053" x2="92.7735" y2="29.7307" layer="94"/>
<rectangle x1="93.6117" y1="29.7053" x2="94.0689" y2="29.7307" layer="94"/>
<rectangle x1="94.2213" y1="29.7053" x2="94.2467" y2="29.7307" layer="94"/>
<rectangle x1="94.2721" y1="29.7053" x2="96.0755" y2="29.7307" layer="94"/>
<rectangle x1="91.6559" y1="29.7307" x2="92.0369" y2="29.7561" layer="94"/>
<rectangle x1="92.4687" y1="29.7307" x2="92.7989" y2="29.7561" layer="94"/>
<rectangle x1="93.6371" y1="29.7307" x2="94.0943" y2="29.7561" layer="94"/>
<rectangle x1="94.1451" y1="29.7307" x2="96.1009" y2="29.7561" layer="94"/>
<rectangle x1="91.6813" y1="29.7561" x2="92.0115" y2="29.7815" layer="94"/>
<rectangle x1="92.4941" y1="29.7561" x2="92.7989" y2="29.7815" layer="94"/>
<rectangle x1="93.6371" y1="29.7561" x2="94.0943" y2="29.7815" layer="94"/>
<rectangle x1="94.1197" y1="29.7561" x2="96.1009" y2="29.7815" layer="94"/>
<rectangle x1="91.6559" y1="29.7815" x2="92.0369" y2="29.8069" layer="94"/>
<rectangle x1="92.4687" y1="29.7815" x2="92.8243" y2="29.8069" layer="94"/>
<rectangle x1="93.6371" y1="29.7815" x2="96.1263" y2="29.8069" layer="94"/>
<rectangle x1="91.6813" y1="29.8069" x2="92.0623" y2="29.8323" layer="94"/>
<rectangle x1="92.4941" y1="29.8069" x2="92.8243" y2="29.8323" layer="94"/>
<rectangle x1="93.6625" y1="29.8069" x2="96.1263" y2="29.8323" layer="94"/>
<rectangle x1="91.6813" y1="29.8323" x2="92.0369" y2="29.8577" layer="94"/>
<rectangle x1="92.5195" y1="29.8323" x2="92.8497" y2="29.8577" layer="94"/>
<rectangle x1="93.6625" y1="29.8323" x2="96.1263" y2="29.8577" layer="94"/>
<rectangle x1="91.6813" y1="29.8577" x2="92.0623" y2="29.8831" layer="94"/>
<rectangle x1="92.5195" y1="29.8577" x2="92.8243" y2="29.8831" layer="94"/>
<rectangle x1="93.6625" y1="29.8577" x2="96.1263" y2="29.8831" layer="94"/>
<rectangle x1="91.7067" y1="29.8831" x2="92.0877" y2="29.9085" layer="94"/>
<rectangle x1="92.5195" y1="29.8831" x2="92.8497" y2="29.9085" layer="94"/>
<rectangle x1="93.6879" y1="29.8831" x2="96.1263" y2="29.9085" layer="94"/>
<rectangle x1="91.7321" y1="29.9085" x2="92.0623" y2="29.9339" layer="94"/>
<rectangle x1="92.5449" y1="29.9085" x2="92.8751" y2="29.9339" layer="94"/>
<rectangle x1="93.6879" y1="29.9085" x2="96.0755" y2="29.9339" layer="94"/>
<rectangle x1="91.7067" y1="29.9339" x2="92.0877" y2="29.9593" layer="94"/>
<rectangle x1="92.5195" y1="29.9339" x2="92.8751" y2="29.9593" layer="94"/>
<rectangle x1="93.6879" y1="29.9339" x2="96.0501" y2="29.9593" layer="94"/>
<rectangle x1="91.7321" y1="29.9593" x2="92.0877" y2="29.9847" layer="94"/>
<rectangle x1="92.5449" y1="29.9593" x2="92.8751" y2="29.9847" layer="94"/>
<rectangle x1="93.6625" y1="29.9593" x2="96.0247" y2="29.9847" layer="94"/>
<rectangle x1="91.7321" y1="29.9847" x2="92.0877" y2="30.0101" layer="94"/>
<rectangle x1="92.5449" y1="29.9847" x2="92.9005" y2="30.0101" layer="94"/>
<rectangle x1="93.5355" y1="29.9847" x2="95.9993" y2="30.0101" layer="94"/>
<rectangle x1="96.1263" y1="29.9847" x2="96.1517" y2="30.0101" layer="94"/>
<rectangle x1="90.1573" y1="30.0101" x2="90.1827" y2="30.0355" layer="94"/>
<rectangle x1="90.2081" y1="30.0101" x2="90.2335" y2="30.0355" layer="94"/>
<rectangle x1="90.2589" y1="30.0101" x2="90.2843" y2="30.0355" layer="94"/>
<rectangle x1="90.3097" y1="30.0101" x2="90.3859" y2="30.0355" layer="94"/>
<rectangle x1="91.7321" y1="30.0101" x2="92.1131" y2="30.0355" layer="94"/>
<rectangle x1="92.5449" y1="30.0101" x2="92.8751" y2="30.0355" layer="94"/>
<rectangle x1="93.4593" y1="30.0101" x2="93.4847" y2="30.0355" layer="94"/>
<rectangle x1="93.5101" y1="30.0101" x2="95.9485" y2="30.0355" layer="94"/>
<rectangle x1="96.1009" y1="30.0101" x2="96.1517" y2="30.0355" layer="94"/>
<rectangle x1="89.5477" y1="30.0355" x2="90.4113" y2="30.0609" layer="94"/>
<rectangle x1="91.7575" y1="30.0355" x2="92.1385" y2="30.0609" layer="94"/>
<rectangle x1="92.5703" y1="30.0355" x2="92.9005" y2="30.0609" layer="94"/>
<rectangle x1="93.3323" y1="30.0355" x2="93.3577" y2="30.0609" layer="94"/>
<rectangle x1="93.3831" y1="30.0355" x2="95.9231" y2="30.0609" layer="94"/>
<rectangle x1="96.0501" y1="30.0355" x2="96.1517" y2="30.0609" layer="94"/>
<rectangle x1="89.5477" y1="30.0609" x2="90.4113" y2="30.0863" layer="94"/>
<rectangle x1="91.7575" y1="30.0609" x2="92.1131" y2="30.0863" layer="94"/>
<rectangle x1="92.5957" y1="30.0609" x2="92.9259" y2="30.0863" layer="94"/>
<rectangle x1="93.3069" y1="30.0609" x2="95.8723" y2="30.0863" layer="94"/>
<rectangle x1="96.0247" y1="30.0609" x2="96.1517" y2="30.0863" layer="94"/>
<rectangle x1="89.5477" y1="30.0863" x2="90.4367" y2="30.1117" layer="94"/>
<rectangle x1="91.7575" y1="30.0863" x2="92.1385" y2="30.1117" layer="94"/>
<rectangle x1="92.5703" y1="30.0863" x2="92.9259" y2="30.1117" layer="94"/>
<rectangle x1="93.1291" y1="30.0863" x2="93.1545" y2="30.1117" layer="94"/>
<rectangle x1="93.1799" y1="30.0863" x2="95.8469" y2="30.1117" layer="94"/>
<rectangle x1="95.9739" y1="30.0863" x2="96.1517" y2="30.1117" layer="94"/>
<rectangle x1="89.5477" y1="30.1117" x2="90.4367" y2="30.1371" layer="94"/>
<rectangle x1="91.7829" y1="30.1117" x2="92.1385" y2="30.1371" layer="94"/>
<rectangle x1="92.5957" y1="30.1117" x2="92.9259" y2="30.1371" layer="94"/>
<rectangle x1="93.1037" y1="30.1117" x2="95.8215" y2="30.1371" layer="94"/>
<rectangle x1="95.9485" y1="30.1117" x2="96.1771" y2="30.1371" layer="94"/>
<rectangle x1="89.5223" y1="30.1371" x2="90.4621" y2="30.1625" layer="94"/>
<rectangle x1="91.7829" y1="30.1371" x2="92.1385" y2="30.1625" layer="94"/>
<rectangle x1="92.5957" y1="30.1371" x2="92.9513" y2="30.1625" layer="94"/>
<rectangle x1="92.9767" y1="30.1371" x2="95.7961" y2="30.1625" layer="94"/>
<rectangle x1="95.9231" y1="30.1371" x2="96.1517" y2="30.1625" layer="94"/>
<rectangle x1="89.5477" y1="30.1625" x2="90.4875" y2="30.1879" layer="94"/>
<rectangle x1="91.8083" y1="30.1625" x2="92.1639" y2="30.1879" layer="94"/>
<rectangle x1="92.5957" y1="30.1625" x2="95.7707" y2="30.1879" layer="94"/>
<rectangle x1="95.8977" y1="30.1625" x2="96.1771" y2="30.1879" layer="94"/>
<rectangle x1="89.5223" y1="30.1879" x2="90.5129" y2="30.2133" layer="94"/>
<rectangle x1="91.8083" y1="30.1879" x2="92.1893" y2="30.2133" layer="94"/>
<rectangle x1="92.6211" y1="30.1879" x2="95.7453" y2="30.2133" layer="94"/>
<rectangle x1="95.8215" y1="30.1879" x2="96.1517" y2="30.2133" layer="94"/>
<rectangle x1="89.5477" y1="30.2133" x2="90.5129" y2="30.2387" layer="94"/>
<rectangle x1="91.8083" y1="30.2133" x2="92.1639" y2="30.2387" layer="94"/>
<rectangle x1="92.6211" y1="30.2133" x2="95.6945" y2="30.2387" layer="94"/>
<rectangle x1="95.8469" y1="30.2133" x2="96.1771" y2="30.2387" layer="94"/>
<rectangle x1="89.5223" y1="30.2387" x2="90.5383" y2="30.2641" layer="94"/>
<rectangle x1="91.8083" y1="30.2387" x2="92.1893" y2="30.2641" layer="94"/>
<rectangle x1="92.5195" y1="30.2387" x2="92.5449" y2="30.2641" layer="94"/>
<rectangle x1="92.5703" y1="30.2387" x2="95.6691" y2="30.2641" layer="94"/>
<rectangle x1="95.7707" y1="30.2387" x2="96.1517" y2="30.2641" layer="94"/>
<rectangle x1="89.5477" y1="30.2641" x2="90.5383" y2="30.2895" layer="94"/>
<rectangle x1="91.8337" y1="30.2641" x2="92.1893" y2="30.2895" layer="94"/>
<rectangle x1="92.4941" y1="30.2641" x2="95.6183" y2="30.2895" layer="94"/>
<rectangle x1="95.7453" y1="30.2641" x2="96.1771" y2="30.2895" layer="94"/>
<rectangle x1="89.5223" y1="30.2895" x2="90.5637" y2="30.3149" layer="94"/>
<rectangle x1="91.8337" y1="30.2895" x2="92.1893" y2="30.3149" layer="94"/>
<rectangle x1="92.3163" y1="30.2895" x2="92.3417" y2="30.3149" layer="94"/>
<rectangle x1="92.3671" y1="30.2895" x2="95.5929" y2="30.3149" layer="94"/>
<rectangle x1="95.7199" y1="30.2895" x2="96.1517" y2="30.3149" layer="94"/>
<rectangle x1="89.5223" y1="30.3149" x2="90.5891" y2="30.3403" layer="94"/>
<rectangle x1="91.8591" y1="30.3149" x2="92.2147" y2="30.3403" layer="94"/>
<rectangle x1="92.2909" y1="30.3149" x2="95.5675" y2="30.3403" layer="94"/>
<rectangle x1="95.6945" y1="30.3149" x2="96.1771" y2="30.3403" layer="94"/>
<rectangle x1="89.5223" y1="30.3403" x2="90.6145" y2="30.3657" layer="94"/>
<rectangle x1="91.9607" y1="30.3403" x2="95.5421" y2="30.3657" layer="94"/>
<rectangle x1="95.6691" y1="30.3403" x2="96.1517" y2="30.3657" layer="94"/>
<rectangle x1="89.5223" y1="30.3657" x2="90.6145" y2="30.3911" layer="94"/>
<rectangle x1="91.9861" y1="30.3657" x2="95.4659" y2="30.3911" layer="94"/>
<rectangle x1="95.6437" y1="30.3657" x2="96.1771" y2="30.3911" layer="94"/>
<rectangle x1="97.2185" y1="30.3657" x2="97.2439" y2="30.3911" layer="94"/>
<rectangle x1="89.5223" y1="30.3911" x2="89.9541" y2="30.4165" layer="94"/>
<rectangle x1="89.9795" y1="30.3911" x2="90.0049" y2="30.4165" layer="94"/>
<rectangle x1="90.0303" y1="30.3911" x2="90.0557" y2="30.4165" layer="94"/>
<rectangle x1="90.0811" y1="30.3911" x2="90.1065" y2="30.4165" layer="94"/>
<rectangle x1="90.1319" y1="30.3911" x2="90.6399" y2="30.4165" layer="94"/>
<rectangle x1="91.9607" y1="30.3911" x2="95.4405" y2="30.4165" layer="94"/>
<rectangle x1="95.5675" y1="30.3911" x2="96.1517" y2="30.4165" layer="94"/>
<rectangle x1="97.2185" y1="30.3911" x2="97.3201" y2="30.4165" layer="94"/>
<rectangle x1="89.4969" y1="30.4165" x2="89.9541" y2="30.4419" layer="94"/>
<rectangle x1="90.1573" y1="30.4165" x2="90.6399" y2="30.4419" layer="94"/>
<rectangle x1="91.9861" y1="30.4165" x2="95.3135" y2="30.4419" layer="94"/>
<rectangle x1="95.5421" y1="30.4165" x2="96.1517" y2="30.4419" layer="94"/>
<rectangle x1="97.2185" y1="30.4165" x2="97.3455" y2="30.4419" layer="94"/>
<rectangle x1="89.5223" y1="30.4419" x2="89.9541" y2="30.4673" layer="94"/>
<rectangle x1="90.1573" y1="30.4419" x2="90.6653" y2="30.4673" layer="94"/>
<rectangle x1="91.9861" y1="30.4419" x2="95.2881" y2="30.4673" layer="94"/>
<rectangle x1="95.4659" y1="30.4419" x2="96.1517" y2="30.4673" layer="94"/>
<rectangle x1="97.2439" y1="30.4419" x2="97.3709" y2="30.4673" layer="94"/>
<rectangle x1="89.3445" y1="30.4673" x2="89.3699" y2="30.4927" layer="94"/>
<rectangle x1="89.3953" y1="30.4673" x2="89.4207" y2="30.4927" layer="94"/>
<rectangle x1="89.4969" y1="30.4673" x2="89.9541" y2="30.4927" layer="94"/>
<rectangle x1="90.1827" y1="30.4673" x2="90.6907" y2="30.4927" layer="94"/>
<rectangle x1="92.0115" y1="30.4673" x2="95.1611" y2="30.4927" layer="94"/>
<rectangle x1="95.1865" y1="30.4673" x2="95.2119" y2="30.4927" layer="94"/>
<rectangle x1="95.4405" y1="30.4673" x2="96.1517" y2="30.4927" layer="94"/>
<rectangle x1="97.2439" y1="30.4673" x2="97.3455" y2="30.4927" layer="94"/>
<rectangle x1="89.2683" y1="30.4927" x2="89.2937" y2="30.5181" layer="94"/>
<rectangle x1="89.3191" y1="30.4927" x2="89.4461" y2="30.5181" layer="94"/>
<rectangle x1="89.4969" y1="30.4927" x2="89.9541" y2="30.5181" layer="94"/>
<rectangle x1="90.1827" y1="30.4927" x2="90.7161" y2="30.5181" layer="94"/>
<rectangle x1="92.0115" y1="30.4927" x2="95.1357" y2="30.5181" layer="94"/>
<rectangle x1="95.3135" y1="30.4927" x2="96.1517" y2="30.5181" layer="94"/>
<rectangle x1="96.6343" y1="30.4927" x2="96.6597" y2="30.5181" layer="94"/>
<rectangle x1="97.2439" y1="30.4927" x2="97.3709" y2="30.5181" layer="94"/>
<rectangle x1="89.2429" y1="30.5181" x2="89.4715" y2="30.5435" layer="94"/>
<rectangle x1="89.4969" y1="30.5181" x2="89.9287" y2="30.5435" layer="94"/>
<rectangle x1="90.2081" y1="30.5181" x2="90.7161" y2="30.5435" layer="94"/>
<rectangle x1="92.0369" y1="30.5181" x2="95.0595" y2="30.5435" layer="94"/>
<rectangle x1="95.2881" y1="30.5181" x2="96.1517" y2="30.5435" layer="94"/>
<rectangle x1="96.6343" y1="30.5181" x2="96.6851" y2="30.5435" layer="94"/>
<rectangle x1="97.2693" y1="30.5181" x2="97.3709" y2="30.5435" layer="94"/>
<rectangle x1="88.5571" y1="30.5435" x2="88.5825" y2="30.5689" layer="94"/>
<rectangle x1="88.6079" y1="30.5435" x2="88.6333" y2="30.5689" layer="94"/>
<rectangle x1="88.6587" y1="30.5435" x2="88.6841" y2="30.5689" layer="94"/>
<rectangle x1="88.7095" y1="30.5435" x2="88.7349" y2="30.5689" layer="94"/>
<rectangle x1="88.7603" y1="30.5435" x2="88.7857" y2="30.5689" layer="94"/>
<rectangle x1="89.2175" y1="30.5435" x2="89.9541" y2="30.5689" layer="94"/>
<rectangle x1="90.2335" y1="30.5435" x2="90.7415" y2="30.5689" layer="94"/>
<rectangle x1="92.0369" y1="30.5435" x2="94.9833" y2="30.5689" layer="94"/>
<rectangle x1="95.0087" y1="30.5435" x2="95.0341" y2="30.5689" layer="94"/>
<rectangle x1="95.2119" y1="30.5435" x2="96.1517" y2="30.5689" layer="94"/>
<rectangle x1="96.6343" y1="30.5435" x2="96.6851" y2="30.5689" layer="94"/>
<rectangle x1="97.2439" y1="30.5435" x2="97.3709" y2="30.5689" layer="94"/>
<rectangle x1="88.5317" y1="30.5689" x2="88.8619" y2="30.5943" layer="94"/>
<rectangle x1="88.8873" y1="30.5689" x2="88.9127" y2="30.5943" layer="94"/>
<rectangle x1="89.2429" y1="30.5689" x2="89.9287" y2="30.5943" layer="94"/>
<rectangle x1="90.2589" y1="30.5689" x2="90.7415" y2="30.5943" layer="94"/>
<rectangle x1="92.0369" y1="30.5689" x2="94.9071" y2="30.5943" layer="94"/>
<rectangle x1="95.1357" y1="30.5689" x2="96.1263" y2="30.5943" layer="94"/>
<rectangle x1="96.6089" y1="30.5689" x2="96.6851" y2="30.5943" layer="94"/>
<rectangle x1="97.2693" y1="30.5689" x2="97.3963" y2="30.5943" layer="94"/>
<rectangle x1="88.4555" y1="30.5943" x2="89.0397" y2="30.6197" layer="94"/>
<rectangle x1="89.2175" y1="30.5943" x2="89.9287" y2="30.6197" layer="94"/>
<rectangle x1="90.2589" y1="30.5943" x2="90.7669" y2="30.6197" layer="94"/>
<rectangle x1="92.0623" y1="30.5943" x2="94.8309" y2="30.6197" layer="94"/>
<rectangle x1="94.8563" y1="30.5943" x2="94.8817" y2="30.6197" layer="94"/>
<rectangle x1="95.0595" y1="30.5943" x2="96.1517" y2="30.6197" layer="94"/>
<rectangle x1="96.5835" y1="30.5943" x2="96.7105" y2="30.6197" layer="94"/>
<rectangle x1="97.2693" y1="30.5943" x2="97.3963" y2="30.6197" layer="94"/>
<rectangle x1="88.4301" y1="30.6197" x2="89.0651" y2="30.6451" layer="94"/>
<rectangle x1="89.2429" y1="30.6197" x2="89.9287" y2="30.6451" layer="94"/>
<rectangle x1="90.2843" y1="30.6197" x2="90.7923" y2="30.6451" layer="94"/>
<rectangle x1="92.0623" y1="30.6197" x2="94.7547" y2="30.6451" layer="94"/>
<rectangle x1="94.7801" y1="30.6197" x2="94.8055" y2="30.6451" layer="94"/>
<rectangle x1="94.9833" y1="30.6197" x2="96.1263" y2="30.6451" layer="94"/>
<rectangle x1="96.5835" y1="30.6197" x2="96.6851" y2="30.6451" layer="94"/>
<rectangle x1="97.2693" y1="30.6197" x2="97.3963" y2="30.6451" layer="94"/>
<rectangle x1="88.4047" y1="30.6451" x2="89.1159" y2="30.6705" layer="94"/>
<rectangle x1="89.2175" y1="30.6451" x2="89.9541" y2="30.6705" layer="94"/>
<rectangle x1="90.2843" y1="30.6451" x2="90.8177" y2="30.6705" layer="94"/>
<rectangle x1="92.0623" y1="30.6451" x2="94.7293" y2="30.6705" layer="94"/>
<rectangle x1="94.9071" y1="30.6451" x2="96.1263" y2="30.6705" layer="94"/>
<rectangle x1="96.5835" y1="30.6451" x2="96.7105" y2="30.6705" layer="94"/>
<rectangle x1="97.2947" y1="30.6451" x2="97.4217" y2="30.6705" layer="94"/>
<rectangle x1="88.3793" y1="30.6705" x2="89.1413" y2="30.6959" layer="94"/>
<rectangle x1="89.2175" y1="30.6705" x2="89.9795" y2="30.6959" layer="94"/>
<rectangle x1="90.3097" y1="30.6705" x2="90.8177" y2="30.6959" layer="94"/>
<rectangle x1="92.0877" y1="30.6705" x2="94.6531" y2="30.6959" layer="94"/>
<rectangle x1="94.8309" y1="30.6705" x2="94.8563" y2="30.6959" layer="94"/>
<rectangle x1="94.8817" y1="30.6705" x2="96.1263" y2="30.6959" layer="94"/>
<rectangle x1="96.6089" y1="30.6705" x2="96.7105" y2="30.6959" layer="94"/>
<rectangle x1="97.2947" y1="30.6705" x2="97.3963" y2="30.6959" layer="94"/>
<rectangle x1="88.3539" y1="30.6959" x2="90.1065" y2="30.7213" layer="94"/>
<rectangle x1="90.3351" y1="30.6959" x2="90.8431" y2="30.7213" layer="94"/>
<rectangle x1="92.0877" y1="30.6959" x2="94.5769" y2="30.7213" layer="94"/>
<rectangle x1="94.7547" y1="30.6959" x2="96.1009" y2="30.7213" layer="94"/>
<rectangle x1="96.5835" y1="30.6959" x2="96.7105" y2="30.7213" layer="94"/>
<rectangle x1="97.2947" y1="30.6959" x2="97.4217" y2="30.7213" layer="94"/>
<rectangle x1="88.3793" y1="30.7213" x2="90.1319" y2="30.7467" layer="94"/>
<rectangle x1="90.3605" y1="30.7213" x2="90.8431" y2="30.7467" layer="94"/>
<rectangle x1="92.0877" y1="30.7213" x2="94.5007" y2="30.7467" layer="94"/>
<rectangle x1="94.7293" y1="30.7213" x2="96.1009" y2="30.7467" layer="94"/>
<rectangle x1="96.6089" y1="30.7213" x2="96.7359" y2="30.7467" layer="94"/>
<rectangle x1="97.3201" y1="30.7213" x2="97.4471" y2="30.7467" layer="94"/>
<rectangle x1="88.3539" y1="30.7467" x2="90.1573" y2="30.7721" layer="94"/>
<rectangle x1="90.2843" y1="30.7467" x2="90.3097" y2="30.7721" layer="94"/>
<rectangle x1="90.3351" y1="30.7467" x2="90.8685" y2="30.7721" layer="94"/>
<rectangle x1="92.1131" y1="30.7467" x2="94.4245" y2="30.7721" layer="94"/>
<rectangle x1="94.6023" y1="30.7467" x2="94.6277" y2="30.7721" layer="94"/>
<rectangle x1="94.6531" y1="30.7467" x2="96.1009" y2="30.7721" layer="94"/>
<rectangle x1="96.6089" y1="30.7467" x2="96.7359" y2="30.7721" layer="94"/>
<rectangle x1="97.2947" y1="30.7467" x2="97.4725" y2="30.7721" layer="94"/>
<rectangle x1="88.3285" y1="30.7721" x2="90.1573" y2="30.7975" layer="94"/>
<rectangle x1="90.2843" y1="30.7721" x2="90.8939" y2="30.7975" layer="94"/>
<rectangle x1="90.9193" y1="30.7721" x2="90.9447" y2="30.7975" layer="94"/>
<rectangle x1="92.1131" y1="30.7721" x2="94.3483" y2="30.7975" layer="94"/>
<rectangle x1="94.5769" y1="30.7721" x2="96.1009" y2="30.7975" layer="94"/>
<rectangle x1="96.6089" y1="30.7721" x2="96.7359" y2="30.7975" layer="94"/>
<rectangle x1="97.3201" y1="30.7721" x2="97.4979" y2="30.7975" layer="94"/>
<rectangle x1="88.3285" y1="30.7975" x2="90.1827" y2="30.8229" layer="94"/>
<rectangle x1="90.2843" y1="30.7975" x2="91.0209" y2="30.8229" layer="94"/>
<rectangle x1="92.1131" y1="30.7975" x2="94.3229" y2="30.8229" layer="94"/>
<rectangle x1="94.5007" y1="30.7975" x2="96.1009" y2="30.8229" layer="94"/>
<rectangle x1="96.6343" y1="30.7975" x2="96.7613" y2="30.8229" layer="94"/>
<rectangle x1="97.2947" y1="30.7975" x2="97.5487" y2="30.8229" layer="94"/>
<rectangle x1="88.2777" y1="30.8229" x2="88.3031" y2="30.8483" layer="94"/>
<rectangle x1="88.3285" y1="30.8229" x2="89.5223" y2="30.8483" layer="94"/>
<rectangle x1="89.7001" y1="30.8229" x2="89.7255" y2="30.8483" layer="94"/>
<rectangle x1="89.7509" y1="30.8229" x2="90.1827" y2="30.8483" layer="94"/>
<rectangle x1="90.2843" y1="30.8229" x2="91.0209" y2="30.8483" layer="94"/>
<rectangle x1="92.1385" y1="30.8229" x2="94.1959" y2="30.8483" layer="94"/>
<rectangle x1="94.4245" y1="30.8229" x2="96.0755" y2="30.8483" layer="94"/>
<rectangle x1="96.6343" y1="30.8229" x2="96.7359" y2="30.8483" layer="94"/>
<rectangle x1="97.3201" y1="30.8229" x2="97.5487" y2="30.8483" layer="94"/>
<rectangle x1="88.2523" y1="30.8483" x2="89.4969" y2="30.8737" layer="94"/>
<rectangle x1="89.7509" y1="30.8483" x2="90.2081" y2="30.8737" layer="94"/>
<rectangle x1="90.2843" y1="30.8483" x2="91.0209" y2="30.8737" layer="94"/>
<rectangle x1="92.1385" y1="30.8483" x2="94.1705" y2="30.8737" layer="94"/>
<rectangle x1="94.3483" y1="30.8483" x2="96.0755" y2="30.8737" layer="94"/>
<rectangle x1="96.6343" y1="30.8483" x2="96.7613" y2="30.8737" layer="94"/>
<rectangle x1="97.3201" y1="30.8483" x2="97.5995" y2="30.8737" layer="94"/>
<rectangle x1="88.2269" y1="30.8737" x2="89.4715" y2="30.8991" layer="94"/>
<rectangle x1="89.8017" y1="30.8737" x2="90.1827" y2="30.8991" layer="94"/>
<rectangle x1="90.2843" y1="30.8737" x2="91.0209" y2="30.8991" layer="94"/>
<rectangle x1="92.1639" y1="30.8737" x2="94.0435" y2="30.8991" layer="94"/>
<rectangle x1="94.0689" y1="30.8737" x2="94.0943" y2="30.8991" layer="94"/>
<rectangle x1="94.2975" y1="30.8737" x2="96.0755" y2="30.8991" layer="94"/>
<rectangle x1="96.6597" y1="30.8737" x2="96.7867" y2="30.8991" layer="94"/>
<rectangle x1="97.3201" y1="30.8737" x2="97.5995" y2="30.8991" layer="94"/>
<rectangle x1="88.2015" y1="30.8991" x2="89.4969" y2="30.9245" layer="94"/>
<rectangle x1="89.7763" y1="30.8991" x2="90.1573" y2="30.9245" layer="94"/>
<rectangle x1="90.2843" y1="30.8991" x2="91.0209" y2="30.9245" layer="94"/>
<rectangle x1="92.1639" y1="30.8991" x2="94.0181" y2="30.9245" layer="94"/>
<rectangle x1="94.1959" y1="30.8991" x2="96.0501" y2="30.9245" layer="94"/>
<rectangle x1="96.6343" y1="30.8991" x2="96.7867" y2="30.9245" layer="94"/>
<rectangle x1="97.3455" y1="30.8991" x2="97.6757" y2="30.9245" layer="94"/>
<rectangle x1="88.2015" y1="30.9245" x2="89.4715" y2="30.9499" layer="94"/>
<rectangle x1="89.8017" y1="30.9245" x2="90.1319" y2="30.9499" layer="94"/>
<rectangle x1="90.2843" y1="30.9245" x2="91.0209" y2="30.9499" layer="94"/>
<rectangle x1="92.1893" y1="30.9245" x2="93.9419" y2="30.9499" layer="94"/>
<rectangle x1="94.1197" y1="30.9245" x2="94.1451" y2="30.9499" layer="94"/>
<rectangle x1="94.1705" y1="30.9245" x2="96.0501" y2="30.9499" layer="94"/>
<rectangle x1="96.6343" y1="30.9245" x2="96.7867" y2="30.9499" layer="94"/>
<rectangle x1="97.3455" y1="30.9245" x2="97.6757" y2="30.9499" layer="94"/>
<rectangle x1="88.1761" y1="30.9499" x2="89.4461" y2="30.9753" layer="94"/>
<rectangle x1="89.8271" y1="30.9499" x2="90.1573" y2="30.9753" layer="94"/>
<rectangle x1="90.3351" y1="30.9499" x2="91.0209" y2="30.9753" layer="94"/>
<rectangle x1="92.1639" y1="30.9499" x2="93.8657" y2="30.9753" layer="94"/>
<rectangle x1="94.0689" y1="30.9499" x2="96.0501" y2="30.9753" layer="94"/>
<rectangle x1="96.6089" y1="30.9499" x2="96.7867" y2="30.9753" layer="94"/>
<rectangle x1="97.3455" y1="30.9499" x2="97.7265" y2="30.9753" layer="94"/>
<rectangle x1="88.1761" y1="30.9753" x2="89.4207" y2="31.0007" layer="94"/>
<rectangle x1="89.8271" y1="30.9753" x2="90.1319" y2="31.0007" layer="94"/>
<rectangle x1="90.4113" y1="30.9753" x2="90.4367" y2="31.0007" layer="94"/>
<rectangle x1="90.4621" y1="30.9753" x2="91.0209" y2="31.0007" layer="94"/>
<rectangle x1="92.1893" y1="30.9753" x2="93.7895" y2="31.0007" layer="94"/>
<rectangle x1="94.0181" y1="30.9753" x2="96.0247" y2="31.0007" layer="94"/>
<rectangle x1="96.6089" y1="30.9753" x2="96.7867" y2="31.0007" layer="94"/>
<rectangle x1="97.3709" y1="30.9753" x2="97.7519" y2="31.0007" layer="94"/>
<rectangle x1="88.1507" y1="31.0007" x2="89.4461" y2="31.0261" layer="94"/>
<rectangle x1="89.8271" y1="31.0007" x2="90.1573" y2="31.0261" layer="94"/>
<rectangle x1="90.4875" y1="31.0007" x2="90.5129" y2="31.0261" layer="94"/>
<rectangle x1="90.5383" y1="31.0007" x2="90.5637" y2="31.0261" layer="94"/>
<rectangle x1="90.5891" y1="31.0007" x2="90.6145" y2="31.0261" layer="94"/>
<rectangle x1="90.6399" y1="31.0007" x2="90.6653" y2="31.0261" layer="94"/>
<rectangle x1="90.6907" y1="31.0007" x2="90.7161" y2="31.0261" layer="94"/>
<rectangle x1="90.7415" y1="31.0007" x2="90.7669" y2="31.0261" layer="94"/>
<rectangle x1="90.7923" y1="31.0007" x2="90.8177" y2="31.0261" layer="94"/>
<rectangle x1="90.8431" y1="31.0007" x2="90.8685" y2="31.0261" layer="94"/>
<rectangle x1="90.8939" y1="31.0007" x2="90.9193" y2="31.0261" layer="94"/>
<rectangle x1="90.9447" y1="31.0007" x2="90.9701" y2="31.0261" layer="94"/>
<rectangle x1="90.9955" y1="31.0007" x2="91.0209" y2="31.0261" layer="94"/>
<rectangle x1="92.2147" y1="31.0007" x2="93.7133" y2="31.0261" layer="94"/>
<rectangle x1="93.8911" y1="31.0007" x2="93.9165" y2="31.0261" layer="94"/>
<rectangle x1="93.9419" y1="31.0007" x2="96.0247" y2="31.0261" layer="94"/>
<rectangle x1="96.5835" y1="31.0007" x2="96.8121" y2="31.0261" layer="94"/>
<rectangle x1="97.3455" y1="31.0007" x2="97.7773" y2="31.0261" layer="94"/>
<rectangle x1="88.1507" y1="31.0261" x2="89.4207" y2="31.0515" layer="94"/>
<rectangle x1="89.8525" y1="31.0261" x2="90.1319" y2="31.0515" layer="94"/>
<rectangle x1="92.2147" y1="31.0261" x2="93.5863" y2="31.0515" layer="94"/>
<rectangle x1="93.8657" y1="31.0261" x2="96.0247" y2="31.0515" layer="94"/>
<rectangle x1="96.6089" y1="31.0261" x2="96.8121" y2="31.0515" layer="94"/>
<rectangle x1="97.3709" y1="31.0261" x2="97.8027" y2="31.0515" layer="94"/>
<rectangle x1="88.1507" y1="31.0515" x2="89.4461" y2="31.0769" layer="94"/>
<rectangle x1="89.8271" y1="31.0515" x2="90.1573" y2="31.0769" layer="94"/>
<rectangle x1="92.2147" y1="31.0515" x2="93.5101" y2="31.0769" layer="94"/>
<rectangle x1="93.7387" y1="31.0515" x2="93.7641" y2="31.0769" layer="94"/>
<rectangle x1="93.7895" y1="31.0515" x2="95.9993" y2="31.0769" layer="94"/>
<rectangle x1="96.5835" y1="31.0515" x2="96.8121" y2="31.0769" layer="94"/>
<rectangle x1="97.3709" y1="31.0515" x2="97.8281" y2="31.0769" layer="94"/>
<rectangle x1="88.1253" y1="31.0769" x2="89.4207" y2="31.1023" layer="94"/>
<rectangle x1="89.8271" y1="31.0769" x2="90.1319" y2="31.1023" layer="94"/>
<rectangle x1="92.2401" y1="31.0769" x2="93.3831" y2="31.1023" layer="94"/>
<rectangle x1="93.4085" y1="31.0769" x2="93.4339" y2="31.1023" layer="94"/>
<rectangle x1="93.6625" y1="31.0769" x2="95.9739" y2="31.1023" layer="94"/>
<rectangle x1="96.5581" y1="31.0769" x2="96.8375" y2="31.1023" layer="94"/>
<rectangle x1="97.3709" y1="31.0769" x2="97.4979" y2="31.1023" layer="94"/>
<rectangle x1="97.5233" y1="31.0769" x2="97.8535" y2="31.1023" layer="94"/>
<rectangle x1="88.1507" y1="31.1023" x2="89.4461" y2="31.1277" layer="94"/>
<rectangle x1="89.8271" y1="31.1023" x2="90.1573" y2="31.1277" layer="94"/>
<rectangle x1="90.2335" y1="31.1023" x2="90.2589" y2="31.1277" layer="94"/>
<rectangle x1="90.2843" y1="31.1023" x2="90.3097" y2="31.1277" layer="94"/>
<rectangle x1="90.3351" y1="31.1023" x2="90.3605" y2="31.1277" layer="94"/>
<rectangle x1="90.3859" y1="31.1023" x2="90.4113" y2="31.1277" layer="94"/>
<rectangle x1="90.4367" y1="31.1023" x2="90.4621" y2="31.1277" layer="94"/>
<rectangle x1="90.4875" y1="31.1023" x2="90.5129" y2="31.1277" layer="94"/>
<rectangle x1="90.5383" y1="31.1023" x2="90.5637" y2="31.1277" layer="94"/>
<rectangle x1="90.5891" y1="31.1023" x2="90.6145" y2="31.1277" layer="94"/>
<rectangle x1="90.6399" y1="31.1023" x2="90.6653" y2="31.1277" layer="94"/>
<rectangle x1="90.6907" y1="31.1023" x2="90.7161" y2="31.1277" layer="94"/>
<rectangle x1="90.7415" y1="31.1023" x2="90.7669" y2="31.1277" layer="94"/>
<rectangle x1="90.7923" y1="31.1023" x2="90.8177" y2="31.1277" layer="94"/>
<rectangle x1="92.2147" y1="31.1023" x2="93.3069" y2="31.1277" layer="94"/>
<rectangle x1="93.3323" y1="31.1023" x2="93.3577" y2="31.1277" layer="94"/>
<rectangle x1="93.5355" y1="31.1023" x2="93.5609" y2="31.1277" layer="94"/>
<rectangle x1="93.5863" y1="31.1023" x2="95.9993" y2="31.1277" layer="94"/>
<rectangle x1="96.5581" y1="31.1023" x2="96.8375" y2="31.1277" layer="94"/>
<rectangle x1="97.3963" y1="31.1023" x2="97.4725" y2="31.1277" layer="94"/>
<rectangle x1="97.4979" y1="31.1023" x2="97.8789" y2="31.1277" layer="94"/>
<rectangle x1="88.1253" y1="31.1277" x2="89.4461" y2="31.1531" layer="94"/>
<rectangle x1="89.8017" y1="31.1277" x2="90.1827" y2="31.1531" layer="94"/>
<rectangle x1="90.2335" y1="31.1277" x2="90.8431" y2="31.1531" layer="94"/>
<rectangle x1="92.2401" y1="31.1277" x2="93.2307" y2="31.1531" layer="94"/>
<rectangle x1="93.4593" y1="31.1277" x2="93.4847" y2="31.1531" layer="94"/>
<rectangle x1="93.5101" y1="31.1277" x2="95.9739" y2="31.1531" layer="94"/>
<rectangle x1="96.5581" y1="31.1277" x2="96.8375" y2="31.1531" layer="94"/>
<rectangle x1="97.3963" y1="31.1277" x2="97.4979" y2="31.1531" layer="94"/>
<rectangle x1="97.5487" y1="31.1277" x2="97.9043" y2="31.1531" layer="94"/>
<rectangle x1="88.1507" y1="31.1531" x2="89.4715" y2="31.1785" layer="94"/>
<rectangle x1="89.8017" y1="31.1531" x2="90.2081" y2="31.1785" layer="94"/>
<rectangle x1="90.2335" y1="31.1531" x2="90.8685" y2="31.1785" layer="94"/>
<rectangle x1="92.2655" y1="31.1531" x2="93.1037" y2="31.1785" layer="94"/>
<rectangle x1="93.1291" y1="31.1531" x2="93.1545" y2="31.1785" layer="94"/>
<rectangle x1="93.3831" y1="31.1531" x2="95.9485" y2="31.1785" layer="94"/>
<rectangle x1="96.5327" y1="31.1531" x2="96.8629" y2="31.1785" layer="94"/>
<rectangle x1="97.3963" y1="31.1531" x2="97.4979" y2="31.1785" layer="94"/>
<rectangle x1="97.5741" y1="31.1531" x2="97.9297" y2="31.1785" layer="94"/>
<rectangle x1="88.1507" y1="31.1785" x2="89.4715" y2="31.2039" layer="94"/>
<rectangle x1="89.8017" y1="31.1785" x2="90.9447" y2="31.2039" layer="94"/>
<rectangle x1="92.2909" y1="31.1785" x2="93.0275" y2="31.2039" layer="94"/>
<rectangle x1="93.3069" y1="31.1785" x2="95.9231" y2="31.2039" layer="94"/>
<rectangle x1="96.5581" y1="31.1785" x2="96.8375" y2="31.2039" layer="94"/>
<rectangle x1="97.4217" y1="31.1785" x2="97.4979" y2="31.2039" layer="94"/>
<rectangle x1="97.6249" y1="31.1785" x2="97.9551" y2="31.2039" layer="94"/>
<rectangle x1="88.1507" y1="31.2039" x2="89.4969" y2="31.2293" layer="94"/>
<rectangle x1="89.7763" y1="31.2039" x2="90.9701" y2="31.2293" layer="94"/>
<rectangle x1="92.3163" y1="31.2039" x2="92.9513" y2="31.2293" layer="94"/>
<rectangle x1="93.1799" y1="31.2039" x2="95.9485" y2="31.2293" layer="94"/>
<rectangle x1="96.5327" y1="31.2039" x2="96.8629" y2="31.2293" layer="94"/>
<rectangle x1="97.3963" y1="31.2039" x2="97.5233" y2="31.2293" layer="94"/>
<rectangle x1="97.6249" y1="31.2039" x2="97.9805" y2="31.2293" layer="94"/>
<rectangle x1="88.1761" y1="31.2293" x2="89.5223" y2="31.2547" layer="94"/>
<rectangle x1="89.7509" y1="31.2293" x2="91.0209" y2="31.2547" layer="94"/>
<rectangle x1="92.3925" y1="31.2293" x2="92.8243" y2="31.2547" layer="94"/>
<rectangle x1="92.8497" y1="31.2293" x2="92.8751" y2="31.2547" layer="94"/>
<rectangle x1="93.1037" y1="31.2293" x2="95.9231" y2="31.2547" layer="94"/>
<rectangle x1="96.5073" y1="31.2293" x2="96.8629" y2="31.2547" layer="94"/>
<rectangle x1="97.4217" y1="31.2293" x2="97.4979" y2="31.2547" layer="94"/>
<rectangle x1="97.6757" y1="31.2293" x2="98.0059" y2="31.2547" layer="94"/>
<rectangle x1="88.1507" y1="31.2547" x2="89.5985" y2="31.2801" layer="94"/>
<rectangle x1="89.6747" y1="31.2547" x2="90.2081" y2="31.2801" layer="94"/>
<rectangle x1="90.2335" y1="31.2547" x2="91.0209" y2="31.2801" layer="94"/>
<rectangle x1="92.3925" y1="31.2547" x2="92.7481" y2="31.2801" layer="94"/>
<rectangle x1="92.9767" y1="31.2547" x2="93.0021" y2="31.2801" layer="94"/>
<rectangle x1="93.0275" y1="31.2547" x2="95.8977" y2="31.2801" layer="94"/>
<rectangle x1="96.5073" y1="31.2547" x2="96.7613" y2="31.2801" layer="94"/>
<rectangle x1="96.7867" y1="31.2547" x2="96.8629" y2="31.2801" layer="94"/>
<rectangle x1="97.3963" y1="31.2547" x2="97.5233" y2="31.2801" layer="94"/>
<rectangle x1="97.7011" y1="31.2547" x2="98.0313" y2="31.2801" layer="94"/>
<rectangle x1="88.2777" y1="31.2801" x2="90.1827" y2="31.3055" layer="94"/>
<rectangle x1="90.2335" y1="31.2801" x2="91.0209" y2="31.3055" layer="94"/>
<rectangle x1="92.4433" y1="31.2801" x2="92.6211" y2="31.3055" layer="94"/>
<rectangle x1="92.6465" y1="31.2801" x2="92.6719" y2="31.3055" layer="94"/>
<rectangle x1="92.9513" y1="31.2801" x2="95.8723" y2="31.3055" layer="94"/>
<rectangle x1="96.5073" y1="31.2801" x2="96.7359" y2="31.3055" layer="94"/>
<rectangle x1="96.7867" y1="31.2801" x2="96.8883" y2="31.3055" layer="94"/>
<rectangle x1="97.4217" y1="31.2801" x2="97.5233" y2="31.3055" layer="94"/>
<rectangle x1="97.7265" y1="31.2801" x2="98.0567" y2="31.3055" layer="94"/>
<rectangle x1="88.3031" y1="31.3055" x2="90.2081" y2="31.3309" layer="94"/>
<rectangle x1="90.2335" y1="31.3055" x2="91.0209" y2="31.3309" layer="94"/>
<rectangle x1="92.4687" y1="31.3055" x2="92.5449" y2="31.3309" layer="94"/>
<rectangle x1="92.5703" y1="31.3055" x2="92.5957" y2="31.3309" layer="94"/>
<rectangle x1="92.9767" y1="31.3055" x2="93.0021" y2="31.3309" layer="94"/>
<rectangle x1="93.0275" y1="31.3055" x2="93.0529" y2="31.3309" layer="94"/>
<rectangle x1="93.0783" y1="31.3055" x2="93.1037" y2="31.3309" layer="94"/>
<rectangle x1="93.1291" y1="31.3055" x2="93.1545" y2="31.3309" layer="94"/>
<rectangle x1="93.1799" y1="31.3055" x2="93.2053" y2="31.3309" layer="94"/>
<rectangle x1="93.2307" y1="31.3055" x2="93.2561" y2="31.3309" layer="94"/>
<rectangle x1="93.2815" y1="31.3055" x2="95.8723" y2="31.3309" layer="94"/>
<rectangle x1="96.4819" y1="31.3055" x2="96.7613" y2="31.3309" layer="94"/>
<rectangle x1="96.7867" y1="31.3055" x2="96.8883" y2="31.3309" layer="94"/>
<rectangle x1="97.4471" y1="31.3055" x2="97.5233" y2="31.3309" layer="94"/>
<rectangle x1="97.7519" y1="31.3055" x2="98.1329" y2="31.3309" layer="94"/>
<rectangle x1="88.3031" y1="31.3309" x2="88.9635" y2="31.3563" layer="94"/>
<rectangle x1="89.0397" y1="31.3309" x2="90.1827" y2="31.3563" layer="94"/>
<rectangle x1="90.3097" y1="31.3309" x2="91.0209" y2="31.3563" layer="94"/>
<rectangle x1="93.4085" y1="31.3309" x2="93.4339" y2="31.3563" layer="94"/>
<rectangle x1="93.4593" y1="31.3309" x2="95.8469" y2="31.3563" layer="94"/>
<rectangle x1="96.4819" y1="31.3309" x2="96.7359" y2="31.3563" layer="94"/>
<rectangle x1="96.8121" y1="31.3309" x2="96.8883" y2="31.3563" layer="94"/>
<rectangle x1="97.4725" y1="31.3309" x2="97.5487" y2="31.3563" layer="94"/>
<rectangle x1="97.7773" y1="31.3309" x2="98.1329" y2="31.3563" layer="94"/>
<rectangle x1="88.3031" y1="31.3563" x2="88.9889" y2="31.3817" layer="94"/>
<rectangle x1="89.0143" y1="31.3563" x2="90.0557" y2="31.3817" layer="94"/>
<rectangle x1="90.3097" y1="31.3563" x2="91.0209" y2="31.3817" layer="94"/>
<rectangle x1="92.9259" y1="31.3563" x2="92.9513" y2="31.3817" layer="94"/>
<rectangle x1="92.9767" y1="31.3563" x2="93.0021" y2="31.3817" layer="94"/>
<rectangle x1="93.0275" y1="31.3563" x2="93.0529" y2="31.3817" layer="94"/>
<rectangle x1="93.0783" y1="31.3563" x2="93.1037" y2="31.3817" layer="94"/>
<rectangle x1="93.1291" y1="31.3563" x2="93.1545" y2="31.3817" layer="94"/>
<rectangle x1="93.1799" y1="31.3563" x2="93.2053" y2="31.3817" layer="94"/>
<rectangle x1="93.4847" y1="31.3563" x2="93.5101" y2="31.3817" layer="94"/>
<rectangle x1="93.5355" y1="31.3563" x2="95.8469" y2="31.3817" layer="94"/>
<rectangle x1="96.4819" y1="31.3563" x2="96.7105" y2="31.3817" layer="94"/>
<rectangle x1="96.7867" y1="31.3563" x2="96.9137" y2="31.3817" layer="94"/>
<rectangle x1="97.5233" y1="31.3563" x2="97.5487" y2="31.3817" layer="94"/>
<rectangle x1="97.8027" y1="31.3563" x2="98.1837" y2="31.3817" layer="94"/>
<rectangle x1="88.3285" y1="31.3817" x2="88.9635" y2="31.4071" layer="94"/>
<rectangle x1="89.0397" y1="31.3817" x2="90.0303" y2="31.4071" layer="94"/>
<rectangle x1="90.3097" y1="31.3817" x2="91.0209" y2="31.4071" layer="94"/>
<rectangle x1="92.7989" y1="31.3817" x2="92.8243" y2="31.4071" layer="94"/>
<rectangle x1="92.8497" y1="31.3817" x2="92.9259" y2="31.4071" layer="94"/>
<rectangle x1="92.9513" y1="31.3817" x2="92.9767" y2="31.4071" layer="94"/>
<rectangle x1="93.0021" y1="31.3817" x2="93.0275" y2="31.4071" layer="94"/>
<rectangle x1="93.0529" y1="31.3817" x2="93.0783" y2="31.4071" layer="94"/>
<rectangle x1="93.1037" y1="31.3817" x2="93.1291" y2="31.4071" layer="94"/>
<rectangle x1="93.1545" y1="31.3817" x2="93.1799" y2="31.4071" layer="94"/>
<rectangle x1="93.2053" y1="31.3817" x2="93.2815" y2="31.4071" layer="94"/>
<rectangle x1="93.5609" y1="31.3817" x2="93.5863" y2="31.4071" layer="94"/>
<rectangle x1="93.6117" y1="31.3817" x2="95.8215" y2="31.4071" layer="94"/>
<rectangle x1="96.4565" y1="31.3817" x2="96.7105" y2="31.4071" layer="94"/>
<rectangle x1="96.8121" y1="31.3817" x2="96.8883" y2="31.4071" layer="94"/>
<rectangle x1="97.8281" y1="31.3817" x2="98.1837" y2="31.4071" layer="94"/>
<rectangle x1="88.3031" y1="31.4071" x2="88.9889" y2="31.4325" layer="94"/>
<rectangle x1="89.0651" y1="31.4071" x2="90.0557" y2="31.4325" layer="94"/>
<rectangle x1="90.2843" y1="31.4071" x2="91.0209" y2="31.4325" layer="94"/>
<rectangle x1="92.6719" y1="31.4071" x2="92.7989" y2="31.4325" layer="94"/>
<rectangle x1="92.8243" y1="31.4071" x2="92.8497" y2="31.4325" layer="94"/>
<rectangle x1="93.2307" y1="31.4071" x2="93.2561" y2="31.4325" layer="94"/>
<rectangle x1="93.2815" y1="31.4071" x2="93.4085" y2="31.4325" layer="94"/>
<rectangle x1="93.4339" y1="31.4071" x2="93.4593" y2="31.4325" layer="94"/>
<rectangle x1="93.6371" y1="31.4071" x2="95.7961" y2="31.4325" layer="94"/>
<rectangle x1="96.4311" y1="31.4071" x2="96.7105" y2="31.4325" layer="94"/>
<rectangle x1="96.8121" y1="31.4071" x2="96.9137" y2="31.4325" layer="94"/>
<rectangle x1="97.8535" y1="31.4071" x2="98.2345" y2="31.4325" layer="94"/>
<rectangle x1="88.3285" y1="31.4325" x2="88.9889" y2="31.4579" layer="94"/>
<rectangle x1="89.1921" y1="31.4325" x2="90.0303" y2="31.4579" layer="94"/>
<rectangle x1="90.2589" y1="31.4325" x2="90.8939" y2="31.4579" layer="94"/>
<rectangle x1="92.5957" y1="31.4325" x2="92.6719" y2="31.4579" layer="94"/>
<rectangle x1="93.4085" y1="31.4325" x2="93.4847" y2="31.4579" layer="94"/>
<rectangle x1="93.7133" y1="31.4325" x2="95.7707" y2="31.4579" layer="94"/>
<rectangle x1="96.4565" y1="31.4325" x2="96.6851" y2="31.4579" layer="94"/>
<rectangle x1="96.8121" y1="31.4325" x2="96.9137" y2="31.4579" layer="94"/>
<rectangle x1="97.8789" y1="31.4325" x2="98.2599" y2="31.4579" layer="94"/>
<rectangle x1="88.3285" y1="31.4579" x2="88.9889" y2="31.4833" layer="94"/>
<rectangle x1="89.2175" y1="31.4579" x2="90.0557" y2="31.4833" layer="94"/>
<rectangle x1="90.2335" y1="31.4579" x2="90.8685" y2="31.4833" layer="94"/>
<rectangle x1="92.5195" y1="31.4579" x2="92.5957" y2="31.4833" layer="94"/>
<rectangle x1="92.6211" y1="31.4579" x2="92.6465" y2="31.4833" layer="94"/>
<rectangle x1="93.4847" y1="31.4579" x2="93.5609" y2="31.4833" layer="94"/>
<rectangle x1="93.7387" y1="31.4579" x2="95.7707" y2="31.4833" layer="94"/>
<rectangle x1="96.4311" y1="31.4579" x2="96.6851" y2="31.4833" layer="94"/>
<rectangle x1="96.8375" y1="31.4579" x2="96.9137" y2="31.4833" layer="94"/>
<rectangle x1="97.9043" y1="31.4579" x2="98.2853" y2="31.4833" layer="94"/>
<rectangle x1="88.3285" y1="31.4833" x2="89.0143" y2="31.5087" layer="94"/>
<rectangle x1="89.2175" y1="31.4833" x2="90.0303" y2="31.5087" layer="94"/>
<rectangle x1="90.2081" y1="31.4833" x2="90.8431" y2="31.5087" layer="94"/>
<rectangle x1="92.4941" y1="31.4833" x2="92.5195" y2="31.5087" layer="94"/>
<rectangle x1="93.5609" y1="31.4833" x2="93.6371" y2="31.5087" layer="94"/>
<rectangle x1="93.8149" y1="31.4833" x2="95.7199" y2="31.5087" layer="94"/>
<rectangle x1="96.4311" y1="31.4833" x2="96.6851" y2="31.5087" layer="94"/>
<rectangle x1="96.8375" y1="31.4833" x2="96.8883" y2="31.5087" layer="94"/>
<rectangle x1="97.9297" y1="31.4833" x2="98.3107" y2="31.5087" layer="94"/>
<rectangle x1="88.3285" y1="31.5087" x2="89.0143" y2="31.5341" layer="94"/>
<rectangle x1="89.2175" y1="31.5087" x2="90.0557" y2="31.5341" layer="94"/>
<rectangle x1="90.1827" y1="31.5087" x2="90.8177" y2="31.5341" layer="94"/>
<rectangle x1="92.4179" y1="31.5087" x2="92.4941" y2="31.5341" layer="94"/>
<rectangle x1="93.5863" y1="31.5087" x2="93.6625" y2="31.5341" layer="94"/>
<rectangle x1="93.8403" y1="31.5087" x2="95.7199" y2="31.5341" layer="94"/>
<rectangle x1="96.4057" y1="31.5087" x2="96.6597" y2="31.5341" layer="94"/>
<rectangle x1="96.8375" y1="31.5087" x2="96.8629" y2="31.5341" layer="94"/>
<rectangle x1="97.9551" y1="31.5087" x2="98.3361" y2="31.5341" layer="94"/>
<rectangle x1="88.3285" y1="31.5341" x2="89.0143" y2="31.5595" layer="94"/>
<rectangle x1="89.2175" y1="31.5341" x2="90.0557" y2="31.5595" layer="94"/>
<rectangle x1="90.2081" y1="31.5341" x2="90.7923" y2="31.5595" layer="94"/>
<rectangle x1="92.3671" y1="31.5341" x2="92.4179" y2="31.5595" layer="94"/>
<rectangle x1="93.6625" y1="31.5341" x2="93.7387" y2="31.5595" layer="94"/>
<rectangle x1="93.8657" y1="31.5341" x2="95.6945" y2="31.5595" layer="94"/>
<rectangle x1="96.4057" y1="31.5341" x2="96.6597" y2="31.5595" layer="94"/>
<rectangle x1="97.9805" y1="31.5341" x2="98.3107" y2="31.5595" layer="94"/>
<rectangle x1="88.3539" y1="31.5595" x2="89.0397" y2="31.5849" layer="94"/>
<rectangle x1="89.2175" y1="31.5595" x2="90.0557" y2="31.5849" layer="94"/>
<rectangle x1="90.1827" y1="31.5595" x2="90.7923" y2="31.5849" layer="94"/>
<rectangle x1="92.3163" y1="31.5595" x2="92.3925" y2="31.5849" layer="94"/>
<rectangle x1="93.6879" y1="31.5595" x2="93.7641" y2="31.5849" layer="94"/>
<rectangle x1="93.8911" y1="31.5595" x2="95.6691" y2="31.5849" layer="94"/>
<rectangle x1="96.3803" y1="31.5595" x2="96.6597" y2="31.5849" layer="94"/>
<rectangle x1="98.0059" y1="31.5595" x2="98.3361" y2="31.5849" layer="94"/>
<rectangle x1="88.3539" y1="31.5849" x2="89.0143" y2="31.6103" layer="94"/>
<rectangle x1="89.1921" y1="31.5849" x2="90.0557" y2="31.6103" layer="94"/>
<rectangle x1="90.1573" y1="31.5849" x2="90.7415" y2="31.6103" layer="94"/>
<rectangle x1="92.2909" y1="31.5849" x2="92.3163" y2="31.6103" layer="94"/>
<rectangle x1="93.7641" y1="31.5849" x2="93.7895" y2="31.6103" layer="94"/>
<rectangle x1="93.9673" y1="31.5849" x2="95.6183" y2="31.6103" layer="94"/>
<rectangle x1="96.3803" y1="31.5849" x2="96.6343" y2="31.6103" layer="94"/>
<rectangle x1="98.0313" y1="31.5849" x2="98.3361" y2="31.6103" layer="94"/>
<rectangle x1="88.3539" y1="31.6103" x2="89.0397" y2="31.6357" layer="94"/>
<rectangle x1="89.1667" y1="31.6103" x2="90.0557" y2="31.6357" layer="94"/>
<rectangle x1="90.1319" y1="31.6103" x2="90.7669" y2="31.6357" layer="94"/>
<rectangle x1="92.2655" y1="31.6103" x2="92.2909" y2="31.6357" layer="94"/>
<rectangle x1="93.7895" y1="31.6103" x2="93.8657" y2="31.6357" layer="94"/>
<rectangle x1="93.9673" y1="31.6103" x2="95.6437" y2="31.6357" layer="94"/>
<rectangle x1="96.3803" y1="31.6103" x2="96.6343" y2="31.6357" layer="94"/>
<rectangle x1="98.0313" y1="31.6103" x2="98.3361" y2="31.6357" layer="94"/>
<rectangle x1="88.3793" y1="31.6357" x2="89.1159" y2="31.6611" layer="94"/>
<rectangle x1="89.1413" y1="31.6357" x2="90.0811" y2="31.6611" layer="94"/>
<rectangle x1="90.1065" y1="31.6357" x2="90.7415" y2="31.6611" layer="94"/>
<rectangle x1="92.2401" y1="31.6357" x2="92.2655" y2="31.6611" layer="94"/>
<rectangle x1="92.7481" y1="31.6357" x2="92.7735" y2="31.6611" layer="94"/>
<rectangle x1="92.7989" y1="31.6357" x2="92.8243" y2="31.6611" layer="94"/>
<rectangle x1="92.8497" y1="31.6357" x2="92.8751" y2="31.6611" layer="94"/>
<rectangle x1="93.8403" y1="31.6357" x2="93.8911" y2="31.6611" layer="94"/>
<rectangle x1="94.0181" y1="31.6357" x2="95.5929" y2="31.6611" layer="94"/>
<rectangle x1="96.3549" y1="31.6357" x2="96.6343" y2="31.6611" layer="94"/>
<rectangle x1="98.0313" y1="31.6357" x2="98.3615" y2="31.6611" layer="94"/>
<rectangle x1="88.3539" y1="31.6611" x2="90.7161" y2="31.6865" layer="94"/>
<rectangle x1="92.2147" y1="31.6611" x2="92.2655" y2="31.6865" layer="94"/>
<rectangle x1="92.5195" y1="31.6611" x2="92.5449" y2="31.6865" layer="94"/>
<rectangle x1="92.5703" y1="31.6611" x2="93.0529" y2="31.6865" layer="94"/>
<rectangle x1="93.0783" y1="31.6611" x2="93.1037" y2="31.6865" layer="94"/>
<rectangle x1="93.8657" y1="31.6611" x2="93.9165" y2="31.6865" layer="94"/>
<rectangle x1="94.0435" y1="31.6611" x2="95.5929" y2="31.6865" layer="94"/>
<rectangle x1="96.3549" y1="31.6611" x2="96.6089" y2="31.6865" layer="94"/>
<rectangle x1="98.0567" y1="31.6611" x2="98.3615" y2="31.6865" layer="94"/>
<rectangle x1="88.3793" y1="31.6865" x2="89.4715" y2="31.7119" layer="94"/>
<rectangle x1="89.4969" y1="31.6865" x2="90.6907" y2="31.7119" layer="94"/>
<rectangle x1="92.1893" y1="31.6865" x2="92.2147" y2="31.7119" layer="94"/>
<rectangle x1="92.4433" y1="31.6865" x2="93.0275" y2="31.7119" layer="94"/>
<rectangle x1="93.0529" y1="31.6865" x2="93.1291" y2="31.7119" layer="94"/>
<rectangle x1="93.1545" y1="31.6865" x2="93.1799" y2="31.7119" layer="94"/>
<rectangle x1="93.9165" y1="31.6865" x2="93.9419" y2="31.7119" layer="94"/>
<rectangle x1="94.0689" y1="31.6865" x2="95.5167" y2="31.7119" layer="94"/>
<rectangle x1="96.3549" y1="31.6865" x2="96.5835" y2="31.7119" layer="94"/>
<rectangle x1="98.0313" y1="31.6865" x2="98.3615" y2="31.7119" layer="94"/>
<rectangle x1="88.3793" y1="31.7119" x2="90.6653" y2="31.7373" layer="94"/>
<rectangle x1="92.1639" y1="31.7119" x2="92.2401" y2="31.7373" layer="94"/>
<rectangle x1="92.3163" y1="31.7119" x2="92.3417" y2="31.7373" layer="94"/>
<rectangle x1="92.3671" y1="31.7119" x2="93.2561" y2="31.7373" layer="94"/>
<rectangle x1="93.9419" y1="31.7119" x2="93.9673" y2="31.7373" layer="94"/>
<rectangle x1="94.0943" y1="31.7119" x2="95.5167" y2="31.7373" layer="94"/>
<rectangle x1="96.3295" y1="31.7119" x2="96.6089" y2="31.7373" layer="94"/>
<rectangle x1="98.0567" y1="31.7119" x2="98.3869" y2="31.7373" layer="94"/>
<rectangle x1="88.3793" y1="31.7373" x2="89.4715" y2="31.7627" layer="94"/>
<rectangle x1="89.4969" y1="31.7373" x2="90.6399" y2="31.7627" layer="94"/>
<rectangle x1="92.1639" y1="31.7373" x2="92.1893" y2="31.7627" layer="94"/>
<rectangle x1="92.2909" y1="31.7373" x2="93.2307" y2="31.7627" layer="94"/>
<rectangle x1="93.2561" y1="31.7373" x2="93.3323" y2="31.7627" layer="94"/>
<rectangle x1="93.9673" y1="31.7373" x2="93.9927" y2="31.7627" layer="94"/>
<rectangle x1="94.1197" y1="31.7373" x2="95.4659" y2="31.7627" layer="94"/>
<rectangle x1="96.3295" y1="31.7373" x2="96.5835" y2="31.7627" layer="94"/>
<rectangle x1="98.0567" y1="31.7373" x2="98.3615" y2="31.7627" layer="94"/>
<rectangle x1="88.4047" y1="31.7627" x2="89.4715" y2="31.7881" layer="94"/>
<rectangle x1="89.4969" y1="31.7627" x2="90.6399" y2="31.7881" layer="94"/>
<rectangle x1="92.1385" y1="31.7627" x2="92.1893" y2="31.7881" layer="94"/>
<rectangle x1="92.2147" y1="31.7627" x2="93.3577" y2="31.7881" layer="94"/>
<rectangle x1="93.3831" y1="31.7627" x2="93.4085" y2="31.7881" layer="94"/>
<rectangle x1="93.9927" y1="31.7627" x2="94.0181" y2="31.7881" layer="94"/>
<rectangle x1="94.1451" y1="31.7627" x2="95.4405" y2="31.7881" layer="94"/>
<rectangle x1="96.3295" y1="31.7627" x2="96.5835" y2="31.7881" layer="94"/>
<rectangle x1="98.0567" y1="31.7627" x2="98.3869" y2="31.7881" layer="94"/>
<rectangle x1="88.4047" y1="31.7881" x2="89.4715" y2="31.8135" layer="94"/>
<rectangle x1="89.4969" y1="31.7881" x2="90.6145" y2="31.8135" layer="94"/>
<rectangle x1="92.1385" y1="31.7881" x2="92.1639" y2="31.8135" layer="94"/>
<rectangle x1="92.1893" y1="31.7881" x2="93.4339" y2="31.8135" layer="94"/>
<rectangle x1="94.0181" y1="31.7881" x2="94.0435" y2="31.8135" layer="94"/>
<rectangle x1="94.1705" y1="31.7881" x2="95.4151" y2="31.8135" layer="94"/>
<rectangle x1="96.3041" y1="31.7881" x2="96.5581" y2="31.8135" layer="94"/>
<rectangle x1="98.0821" y1="31.7881" x2="98.3869" y2="31.8135" layer="94"/>
<rectangle x1="88.4047" y1="31.8135" x2="89.4461" y2="31.8389" layer="94"/>
<rectangle x1="89.4969" y1="31.8135" x2="90.6145" y2="31.8389" layer="94"/>
<rectangle x1="92.0877" y1="31.8135" x2="93.5101" y2="31.8389" layer="94"/>
<rectangle x1="94.0435" y1="31.8135" x2="94.0689" y2="31.8389" layer="94"/>
<rectangle x1="94.1705" y1="31.8135" x2="95.3897" y2="31.8389" layer="94"/>
<rectangle x1="96.3041" y1="31.8135" x2="96.5581" y2="31.8389" layer="94"/>
<rectangle x1="98.0567" y1="31.8135" x2="98.3869" y2="31.8389" layer="94"/>
<rectangle x1="88.4301" y1="31.8389" x2="89.4207" y2="31.8643" layer="94"/>
<rectangle x1="89.4969" y1="31.8389" x2="90.5891" y2="31.8643" layer="94"/>
<rectangle x1="92.0877" y1="31.8389" x2="93.5355" y2="31.8643" layer="94"/>
<rectangle x1="94.0689" y1="31.8389" x2="94.0943" y2="31.8643" layer="94"/>
<rectangle x1="94.2213" y1="31.8389" x2="95.3135" y2="31.8643" layer="94"/>
<rectangle x1="96.3041" y1="31.8389" x2="96.5327" y2="31.8643" layer="94"/>
<rectangle x1="98.0821" y1="31.8389" x2="98.4123" y2="31.8643" layer="94"/>
<rectangle x1="88.4047" y1="31.8643" x2="89.3953" y2="31.8897" layer="94"/>
<rectangle x1="89.5223" y1="31.8643" x2="90.5637" y2="31.8897" layer="94"/>
<rectangle x1="92.0623" y1="31.8643" x2="93.5609" y2="31.8897" layer="94"/>
<rectangle x1="94.0943" y1="31.8643" x2="94.1197" y2="31.8897" layer="94"/>
<rectangle x1="94.2213" y1="31.8643" x2="95.2881" y2="31.8897" layer="94"/>
<rectangle x1="96.2787" y1="31.8643" x2="96.5581" y2="31.8897" layer="94"/>
<rectangle x1="98.0821" y1="31.8643" x2="98.4123" y2="31.8897" layer="94"/>
<rectangle x1="88.4301" y1="31.8897" x2="89.1159" y2="31.9151" layer="94"/>
<rectangle x1="89.1413" y1="31.8897" x2="89.1667" y2="31.9151" layer="94"/>
<rectangle x1="89.1921" y1="31.8897" x2="89.3191" y2="31.9151" layer="94"/>
<rectangle x1="89.5223" y1="31.8897" x2="90.5383" y2="31.9151" layer="94"/>
<rectangle x1="92.0369" y1="31.8897" x2="93.5863" y2="31.9151" layer="94"/>
<rectangle x1="94.1197" y1="31.8897" x2="94.1451" y2="31.9151" layer="94"/>
<rectangle x1="94.2467" y1="31.8897" x2="95.2627" y2="31.9151" layer="94"/>
<rectangle x1="96.2787" y1="31.8897" x2="96.5327" y2="31.9151" layer="94"/>
<rectangle x1="98.0821" y1="31.8897" x2="98.4123" y2="31.9151" layer="94"/>
<rectangle x1="88.4301" y1="31.9151" x2="89.1159" y2="31.9405" layer="94"/>
<rectangle x1="89.5223" y1="31.9151" x2="90.5129" y2="31.9405" layer="94"/>
<rectangle x1="91.9861" y1="31.9151" x2="93.6625" y2="31.9405" layer="94"/>
<rectangle x1="94.1197" y1="31.9151" x2="94.1705" y2="31.9405" layer="94"/>
<rectangle x1="94.2467" y1="31.9151" x2="95.1865" y2="31.9405" layer="94"/>
<rectangle x1="96.2533" y1="31.9151" x2="96.5073" y2="31.9405" layer="94"/>
<rectangle x1="98.0567" y1="31.9151" x2="98.4377" y2="31.9405" layer="94"/>
<rectangle x1="88.4301" y1="31.9405" x2="89.1159" y2="31.9659" layer="94"/>
<rectangle x1="89.5223" y1="31.9405" x2="90.4875" y2="31.9659" layer="94"/>
<rectangle x1="91.9861" y1="31.9405" x2="93.6625" y2="31.9659" layer="94"/>
<rectangle x1="94.1705" y1="31.9405" x2="94.1959" y2="31.9659" layer="94"/>
<rectangle x1="94.2721" y1="31.9405" x2="95.1611" y2="31.9659" layer="94"/>
<rectangle x1="96.2533" y1="31.9405" x2="96.5327" y2="31.9659" layer="94"/>
<rectangle x1="98.0313" y1="31.9405" x2="98.4123" y2="31.9659" layer="94"/>
<rectangle x1="88.4555" y1="31.9659" x2="89.1413" y2="31.9913" layer="94"/>
<rectangle x1="89.5223" y1="31.9659" x2="90.4875" y2="31.9913" layer="94"/>
<rectangle x1="91.9607" y1="31.9659" x2="93.7133" y2="31.9913" layer="94"/>
<rectangle x1="94.1705" y1="31.9659" x2="94.2213" y2="31.9913" layer="94"/>
<rectangle x1="94.2975" y1="31.9659" x2="95.0849" y2="31.9913" layer="94"/>
<rectangle x1="96.2279" y1="31.9659" x2="96.5327" y2="31.9913" layer="94"/>
<rectangle x1="97.9551" y1="31.9659" x2="98.4377" y2="31.9913" layer="94"/>
<rectangle x1="88.4555" y1="31.9913" x2="89.1159" y2="32.0167" layer="94"/>
<rectangle x1="89.5477" y1="31.9913" x2="90.4621" y2="32.0167" layer="94"/>
<rectangle x1="91.9353" y1="31.9913" x2="93.7387" y2="32.0167" layer="94"/>
<rectangle x1="94.1705" y1="31.9913" x2="94.1959" y2="32.0167" layer="94"/>
<rectangle x1="94.3229" y1="31.9913" x2="95.0087" y2="32.0167" layer="94"/>
<rectangle x1="96.2533" y1="31.9913" x2="96.5327" y2="32.0167" layer="94"/>
<rectangle x1="97.9297" y1="31.9913" x2="98.4631" y2="32.0167" layer="94"/>
<rectangle x1="88.4555" y1="32.0167" x2="89.1413" y2="32.0421" layer="94"/>
<rectangle x1="89.5223" y1="32.0167" x2="90.4621" y2="32.0421" layer="94"/>
<rectangle x1="91.9099" y1="32.0167" x2="93.7641" y2="32.0421" layer="94"/>
<rectangle x1="94.1959" y1="32.0167" x2="94.2213" y2="32.0421" layer="94"/>
<rectangle x1="94.2975" y1="32.0167" x2="94.9325" y2="32.0421" layer="94"/>
<rectangle x1="94.9579" y1="32.0167" x2="94.9833" y2="32.0421" layer="94"/>
<rectangle x1="96.2279" y1="32.0167" x2="96.5581" y2="32.0421" layer="94"/>
<rectangle x1="97.8535" y1="32.0167" x2="98.4631" y2="32.0421" layer="94"/>
<rectangle x1="88.4555" y1="32.0421" x2="89.1413" y2="32.0675" layer="94"/>
<rectangle x1="89.5731" y1="32.0421" x2="90.4367" y2="32.0675" layer="94"/>
<rectangle x1="91.9099" y1="32.0421" x2="93.7895" y2="32.0675" layer="94"/>
<rectangle x1="94.2213" y1="32.0421" x2="94.2467" y2="32.0675" layer="94"/>
<rectangle x1="94.3229" y1="32.0421" x2="94.8055" y2="32.0675" layer="94"/>
<rectangle x1="94.8309" y1="32.0421" x2="94.8563" y2="32.0675" layer="94"/>
<rectangle x1="96.2533" y1="32.0421" x2="96.5327" y2="32.0675" layer="94"/>
<rectangle x1="97.8281" y1="32.0421" x2="98.4631" y2="32.0675" layer="94"/>
<rectangle x1="88.4555" y1="32.0675" x2="89.1413" y2="32.0929" layer="94"/>
<rectangle x1="89.6239" y1="32.0675" x2="90.4113" y2="32.0929" layer="94"/>
<rectangle x1="91.9099" y1="32.0675" x2="93.8149" y2="32.0929" layer="94"/>
<rectangle x1="94.2467" y1="32.0675" x2="94.2721" y2="32.0929" layer="94"/>
<rectangle x1="94.3483" y1="32.0675" x2="94.7293" y2="32.0929" layer="94"/>
<rectangle x1="94.7547" y1="32.0675" x2="94.7801" y2="32.0929" layer="94"/>
<rectangle x1="96.2279" y1="32.0675" x2="96.5581" y2="32.0929" layer="94"/>
<rectangle x1="97.7519" y1="32.0675" x2="98.4885" y2="32.0929" layer="94"/>
<rectangle x1="88.4809" y1="32.0929" x2="89.1667" y2="32.1183" layer="94"/>
<rectangle x1="89.6493" y1="32.0929" x2="89.6747" y2="32.1183" layer="94"/>
<rectangle x1="89.7001" y1="32.0929" x2="90.3859" y2="32.1183" layer="94"/>
<rectangle x1="91.8845" y1="32.0929" x2="93.8403" y2="32.1183" layer="94"/>
<rectangle x1="94.3737" y1="32.0929" x2="94.3991" y2="32.1183" layer="94"/>
<rectangle x1="94.4245" y1="32.0929" x2="94.4499" y2="32.1183" layer="94"/>
<rectangle x1="94.4753" y1="32.0929" x2="94.5007" y2="32.1183" layer="94"/>
<rectangle x1="94.5261" y1="32.0929" x2="94.5515" y2="32.1183" layer="94"/>
<rectangle x1="96.2533" y1="32.0929" x2="96.5835" y2="32.1183" layer="94"/>
<rectangle x1="97.7265" y1="32.0929" x2="98.4631" y2="32.1183" layer="94"/>
<rectangle x1="88.4555" y1="32.1183" x2="89.1667" y2="32.1437" layer="94"/>
<rectangle x1="89.6747" y1="32.1183" x2="89.7001" y2="32.1437" layer="94"/>
<rectangle x1="89.7255" y1="32.1183" x2="90.3859" y2="32.1437" layer="94"/>
<rectangle x1="91.8591" y1="32.1183" x2="93.8657" y2="32.1437" layer="94"/>
<rectangle x1="94.2467" y1="32.1183" x2="94.2975" y2="32.1437" layer="94"/>
<rectangle x1="96.2533" y1="32.1183" x2="96.5835" y2="32.1437" layer="94"/>
<rectangle x1="97.6757" y1="32.1183" x2="98.4885" y2="32.1437" layer="94"/>
<rectangle x1="88.4809" y1="32.1437" x2="89.1667" y2="32.1691" layer="94"/>
<rectangle x1="89.7509" y1="32.1437" x2="89.7763" y2="32.1691" layer="94"/>
<rectangle x1="89.8017" y1="32.1437" x2="89.8271" y2="32.1691" layer="94"/>
<rectangle x1="89.8525" y1="32.1437" x2="89.8779" y2="32.1691" layer="94"/>
<rectangle x1="89.9033" y1="32.1437" x2="89.9287" y2="32.1691" layer="94"/>
<rectangle x1="89.9541" y1="32.1437" x2="89.9795" y2="32.1691" layer="94"/>
<rectangle x1="90.0049" y1="32.1437" x2="90.0303" y2="32.1691" layer="94"/>
<rectangle x1="90.0557" y1="32.1437" x2="90.0811" y2="32.1691" layer="94"/>
<rectangle x1="90.1065" y1="32.1437" x2="90.1319" y2="32.1691" layer="94"/>
<rectangle x1="90.1573" y1="32.1437" x2="90.1827" y2="32.1691" layer="94"/>
<rectangle x1="90.2081" y1="32.1437" x2="90.2335" y2="32.1691" layer="94"/>
<rectangle x1="90.2589" y1="32.1437" x2="90.2843" y2="32.1691" layer="94"/>
<rectangle x1="90.3097" y1="32.1437" x2="90.3351" y2="32.1691" layer="94"/>
<rectangle x1="91.8845" y1="32.1437" x2="93.8403" y2="32.1691" layer="94"/>
<rectangle x1="93.8657" y1="32.1437" x2="93.8911" y2="32.1691" layer="94"/>
<rectangle x1="94.2721" y1="32.1437" x2="94.2975" y2="32.1691" layer="94"/>
<rectangle x1="96.2533" y1="32.1437" x2="96.5835" y2="32.1691" layer="94"/>
<rectangle x1="97.6249" y1="32.1437" x2="98.4885" y2="32.1691" layer="94"/>
<rectangle x1="88.4809" y1="32.1691" x2="89.1667" y2="32.1945" layer="94"/>
<rectangle x1="91.8591" y1="32.1691" x2="93.9165" y2="32.1945" layer="94"/>
<rectangle x1="93.9927" y1="32.1691" x2="94.0181" y2="32.1945" layer="94"/>
<rectangle x1="94.2975" y1="32.1691" x2="94.3229" y2="32.1945" layer="94"/>
<rectangle x1="96.2787" y1="32.1691" x2="96.5835" y2="32.1945" layer="94"/>
<rectangle x1="97.5995" y1="32.1691" x2="98.4885" y2="32.1945" layer="94"/>
<rectangle x1="88.4809" y1="32.1945" x2="89.1667" y2="32.2199" layer="94"/>
<rectangle x1="91.8337" y1="32.1945" x2="93.8911" y2="32.2199" layer="94"/>
<rectangle x1="93.9165" y1="32.1945" x2="93.9419" y2="32.2199" layer="94"/>
<rectangle x1="93.9673" y1="32.1945" x2="94.0435" y2="32.2199" layer="94"/>
<rectangle x1="96.2787" y1="32.1945" x2="96.5835" y2="32.2199" layer="94"/>
<rectangle x1="97.5741" y1="32.1945" x2="98.5139" y2="32.2199" layer="94"/>
<rectangle x1="88.5063" y1="32.2199" x2="89.1921" y2="32.2453" layer="94"/>
<rectangle x1="91.8083" y1="32.2199" x2="92.4433" y2="32.2453" layer="94"/>
<rectangle x1="92.4687" y1="32.2199" x2="92.7989" y2="32.2453" layer="94"/>
<rectangle x1="92.8243" y1="32.2199" x2="94.0689" y2="32.2453" layer="94"/>
<rectangle x1="94.2975" y1="32.2199" x2="94.3483" y2="32.2453" layer="94"/>
<rectangle x1="96.2787" y1="32.2199" x2="96.6089" y2="32.2453" layer="94"/>
<rectangle x1="97.4979" y1="32.2199" x2="98.5139" y2="32.2453" layer="94"/>
<rectangle x1="88.5063" y1="32.2453" x2="89.1921" y2="32.2707" layer="94"/>
<rectangle x1="91.7829" y1="32.2453" x2="92.3671" y2="32.2707" layer="94"/>
<rectangle x1="92.4941" y1="32.2453" x2="92.7735" y2="32.2707" layer="94"/>
<rectangle x1="92.9005" y1="32.2453" x2="94.0943" y2="32.2707" layer="94"/>
<rectangle x1="94.3229" y1="32.2453" x2="94.3483" y2="32.2707" layer="94"/>
<rectangle x1="96.3041" y1="32.2453" x2="96.6089" y2="32.2707" layer="94"/>
<rectangle x1="97.4725" y1="32.2453" x2="98.5139" y2="32.2707" layer="94"/>
<rectangle x1="88.5063" y1="32.2707" x2="89.1921" y2="32.2961" layer="94"/>
<rectangle x1="91.7575" y1="32.2707" x2="92.3417" y2="32.2961" layer="94"/>
<rectangle x1="92.5195" y1="32.2707" x2="92.7481" y2="32.2961" layer="94"/>
<rectangle x1="92.9259" y1="32.2707" x2="94.1197" y2="32.2961" layer="94"/>
<rectangle x1="94.1959" y1="32.2707" x2="94.3737" y2="32.2961" layer="94"/>
<rectangle x1="96.2787" y1="32.2707" x2="97.0661" y2="32.2961" layer="94"/>
<rectangle x1="97.0915" y1="32.2707" x2="97.1169" y2="32.2961" layer="94"/>
<rectangle x1="97.1423" y1="32.2707" x2="97.1677" y2="32.2961" layer="94"/>
<rectangle x1="97.1931" y1="32.2707" x2="97.2185" y2="32.2961" layer="94"/>
<rectangle x1="97.2439" y1="32.2707" x2="97.2693" y2="32.2961" layer="94"/>
<rectangle x1="97.2947" y1="32.2707" x2="97.3201" y2="32.2961" layer="94"/>
<rectangle x1="97.3455" y1="32.2707" x2="97.3709" y2="32.2961" layer="94"/>
<rectangle x1="97.3963" y1="32.2707" x2="98.5393" y2="32.2961" layer="94"/>
<rectangle x1="88.5317" y1="32.2961" x2="89.1921" y2="32.3215" layer="94"/>
<rectangle x1="91.7321" y1="32.2961" x2="92.3163" y2="32.3215" layer="94"/>
<rectangle x1="92.5449" y1="32.2961" x2="92.7227" y2="32.3215" layer="94"/>
<rectangle x1="92.9513" y1="32.2961" x2="94.1197" y2="32.3215" layer="94"/>
<rectangle x1="94.1959" y1="32.2961" x2="94.3483" y2="32.3215" layer="94"/>
<rectangle x1="96.3041" y1="32.2961" x2="98.5139" y2="32.3215" layer="94"/>
<rectangle x1="88.5063" y1="32.3215" x2="89.1921" y2="32.3469" layer="94"/>
<rectangle x1="91.7067" y1="32.3215" x2="92.3163" y2="32.3469" layer="94"/>
<rectangle x1="92.5703" y1="32.3215" x2="92.5957" y2="32.3469" layer="94"/>
<rectangle x1="92.6211" y1="32.3215" x2="92.6465" y2="32.3469" layer="94"/>
<rectangle x1="92.6719" y1="32.3215" x2="92.6973" y2="32.3469" layer="94"/>
<rectangle x1="92.9259" y1="32.3215" x2="94.3737" y2="32.3469" layer="94"/>
<rectangle x1="96.2787" y1="32.3215" x2="98.5393" y2="32.3469" layer="94"/>
<rectangle x1="88.5317" y1="32.3469" x2="89.2175" y2="32.3723" layer="94"/>
<rectangle x1="91.6813" y1="32.3469" x2="92.3163" y2="32.3723" layer="94"/>
<rectangle x1="92.9513" y1="32.3469" x2="94.1451" y2="32.3723" layer="94"/>
<rectangle x1="94.1705" y1="32.3469" x2="94.3991" y2="32.3723" layer="94"/>
<rectangle x1="96.3041" y1="32.3469" x2="98.5647" y2="32.3723" layer="94"/>
<rectangle x1="88.5317" y1="32.3723" x2="89.2175" y2="32.3977" layer="94"/>
<rectangle x1="91.6305" y1="32.3723" x2="92.3163" y2="32.3977" layer="94"/>
<rectangle x1="92.9259" y1="32.3723" x2="94.4245" y2="32.3977" layer="94"/>
<rectangle x1="96.3041" y1="32.3723" x2="98.5647" y2="32.3977" layer="94"/>
<rectangle x1="88.5317" y1="32.3977" x2="89.2175" y2="32.4231" layer="94"/>
<rectangle x1="91.6305" y1="32.3977" x2="92.3163" y2="32.4231" layer="94"/>
<rectangle x1="92.9259" y1="32.3977" x2="94.3991" y2="32.4231" layer="94"/>
<rectangle x1="96.3041" y1="32.3977" x2="98.0567" y2="32.4231" layer="94"/>
<rectangle x1="98.1583" y1="32.3977" x2="98.5647" y2="32.4231" layer="94"/>
<rectangle x1="88.5571" y1="32.4231" x2="89.2429" y2="32.4485" layer="94"/>
<rectangle x1="91.5543" y1="32.4231" x2="92.2909" y2="32.4485" layer="94"/>
<rectangle x1="92.9259" y1="32.4231" x2="94.4245" y2="32.4485" layer="94"/>
<rectangle x1="96.3295" y1="32.4231" x2="97.9805" y2="32.4485" layer="94"/>
<rectangle x1="98.1583" y1="32.4231" x2="98.5901" y2="32.4485" layer="94"/>
<rectangle x1="88.1761" y1="32.4485" x2="88.2015" y2="32.4739" layer="94"/>
<rectangle x1="88.2269" y1="32.4485" x2="88.2523" y2="32.4739" layer="94"/>
<rectangle x1="88.2777" y1="32.4485" x2="88.3031" y2="32.4739" layer="94"/>
<rectangle x1="88.3285" y1="32.4485" x2="88.3539" y2="32.4739" layer="94"/>
<rectangle x1="88.3793" y1="32.4485" x2="88.4047" y2="32.4739" layer="94"/>
<rectangle x1="88.4301" y1="32.4485" x2="88.4555" y2="32.4739" layer="94"/>
<rectangle x1="88.4809" y1="32.4485" x2="88.5063" y2="32.4739" layer="94"/>
<rectangle x1="88.5317" y1="32.4485" x2="89.2175" y2="32.4739" layer="94"/>
<rectangle x1="91.5289" y1="32.4485" x2="92.2655" y2="32.4739" layer="94"/>
<rectangle x1="92.9513" y1="32.4485" x2="94.4245" y2="32.4739" layer="94"/>
<rectangle x1="96.3295" y1="32.4485" x2="97.8535" y2="32.4739" layer="94"/>
<rectangle x1="98.1837" y1="32.4485" x2="98.5901" y2="32.4739" layer="94"/>
<rectangle x1="87.9983" y1="32.4739" x2="88.0237" y2="32.4993" layer="94"/>
<rectangle x1="88.0491" y1="32.4739" x2="88.1761" y2="32.4993" layer="94"/>
<rectangle x1="88.2015" y1="32.4739" x2="88.2269" y2="32.4993" layer="94"/>
<rectangle x1="88.2523" y1="32.4739" x2="88.2777" y2="32.4993" layer="94"/>
<rectangle x1="88.3031" y1="32.4739" x2="88.3285" y2="32.4993" layer="94"/>
<rectangle x1="88.3539" y1="32.4739" x2="88.3793" y2="32.4993" layer="94"/>
<rectangle x1="88.4047" y1="32.4739" x2="88.4301" y2="32.4993" layer="94"/>
<rectangle x1="88.4555" y1="32.4739" x2="88.4809" y2="32.4993" layer="94"/>
<rectangle x1="88.5063" y1="32.4739" x2="89.2429" y2="32.4993" layer="94"/>
<rectangle x1="91.5035" y1="32.4739" x2="92.2401" y2="32.4993" layer="94"/>
<rectangle x1="92.9767" y1="32.4739" x2="94.4499" y2="32.4993" layer="94"/>
<rectangle x1="96.3295" y1="32.4739" x2="97.7773" y2="32.4993" layer="94"/>
<rectangle x1="98.1837" y1="32.4739" x2="98.6155" y2="32.4993" layer="94"/>
<rectangle x1="87.9221" y1="32.4993" x2="87.9475" y2="32.5247" layer="94"/>
<rectangle x1="87.9729" y1="32.4993" x2="87.9983" y2="32.5247" layer="94"/>
<rectangle x1="88.0237" y1="32.4993" x2="88.0491" y2="32.5247" layer="94"/>
<rectangle x1="88.5825" y1="32.4993" x2="89.2429" y2="32.5247" layer="94"/>
<rectangle x1="91.4781" y1="32.4993" x2="92.0623" y2="32.5247" layer="94"/>
<rectangle x1="92.0877" y1="32.4993" x2="92.2147" y2="32.5247" layer="94"/>
<rectangle x1="93.0021" y1="32.4993" x2="93.1291" y2="32.5247" layer="94"/>
<rectangle x1="93.1545" y1="32.4993" x2="94.4499" y2="32.5247" layer="94"/>
<rectangle x1="96.3549" y1="32.4993" x2="97.6503" y2="32.5247" layer="94"/>
<rectangle x1="98.2091" y1="32.4993" x2="98.6155" y2="32.5247" layer="94"/>
<rectangle x1="87.8459" y1="32.5247" x2="87.9729" y2="32.5501" layer="94"/>
<rectangle x1="88.6079" y1="32.5247" x2="89.2429" y2="32.5501" layer="94"/>
<rectangle x1="91.4527" y1="32.5247" x2="92.0369" y2="32.5501" layer="94"/>
<rectangle x1="92.1131" y1="32.5247" x2="92.1385" y2="32.5501" layer="94"/>
<rectangle x1="92.4687" y1="32.5247" x2="92.4941" y2="32.5501" layer="94"/>
<rectangle x1="92.5195" y1="32.5247" x2="92.5957" y2="32.5501" layer="94"/>
<rectangle x1="92.6211" y1="32.5247" x2="92.6465" y2="32.5501" layer="94"/>
<rectangle x1="93.0275" y1="32.5247" x2="93.0529" y2="32.5501" layer="94"/>
<rectangle x1="93.0783" y1="32.5247" x2="93.1037" y2="32.5501" layer="94"/>
<rectangle x1="93.1291" y1="32.5247" x2="94.4753" y2="32.5501" layer="94"/>
<rectangle x1="96.3295" y1="32.5247" x2="97.5741" y2="32.5501" layer="94"/>
<rectangle x1="97.5995" y1="32.5247" x2="97.6249" y2="32.5501" layer="94"/>
<rectangle x1="98.2091" y1="32.5247" x2="98.6155" y2="32.5501" layer="94"/>
<rectangle x1="87.8205" y1="32.5501" x2="87.8967" y2="32.5755" layer="94"/>
<rectangle x1="88.7349" y1="32.5501" x2="89.2683" y2="32.5755" layer="94"/>
<rectangle x1="91.4273" y1="32.5501" x2="92.0115" y2="32.5755" layer="94"/>
<rectangle x1="92.4433" y1="32.5501" x2="92.6719" y2="32.5755" layer="94"/>
<rectangle x1="93.1799" y1="32.5501" x2="94.4753" y2="32.5755" layer="94"/>
<rectangle x1="96.3549" y1="32.5501" x2="97.4979" y2="32.5755" layer="94"/>
<rectangle x1="98.2345" y1="32.5501" x2="98.6155" y2="32.5755" layer="94"/>
<rectangle x1="87.7951" y1="32.5755" x2="87.8205" y2="32.6009" layer="94"/>
<rectangle x1="88.8111" y1="32.5755" x2="89.2683" y2="32.6009" layer="94"/>
<rectangle x1="91.4019" y1="32.5755" x2="92.0115" y2="32.6009" layer="94"/>
<rectangle x1="92.3671" y1="32.5755" x2="92.7481" y2="32.6009" layer="94"/>
<rectangle x1="93.1799" y1="32.5755" x2="94.5007" y2="32.6009" layer="94"/>
<rectangle x1="96.3549" y1="32.5755" x2="97.3709" y2="32.6009" layer="94"/>
<rectangle x1="97.4471" y1="32.5755" x2="97.4725" y2="32.6009" layer="94"/>
<rectangle x1="98.2091" y1="32.5755" x2="98.6155" y2="32.6009" layer="94"/>
<rectangle x1="87.7443" y1="32.6009" x2="87.7951" y2="32.6263" layer="94"/>
<rectangle x1="88.8873" y1="32.6009" x2="88.9127" y2="32.6263" layer="94"/>
<rectangle x1="88.9381" y1="32.6009" x2="89.2683" y2="32.6263" layer="94"/>
<rectangle x1="91.3765" y1="32.6009" x2="91.9861" y2="32.6263" layer="94"/>
<rectangle x1="92.3417" y1="32.6009" x2="92.7735" y2="32.6263" layer="94"/>
<rectangle x1="93.2053" y1="32.6009" x2="94.5007" y2="32.6263" layer="94"/>
<rectangle x1="96.3549" y1="32.6009" x2="97.2439" y2="32.6263" layer="94"/>
<rectangle x1="97.4725" y1="32.6009" x2="97.4979" y2="32.6263" layer="94"/>
<rectangle x1="98.1837" y1="32.6009" x2="98.6155" y2="32.6263" layer="94"/>
<rectangle x1="87.6935" y1="32.6263" x2="87.7697" y2="32.6517" layer="94"/>
<rectangle x1="88.9635" y1="32.6263" x2="88.9889" y2="32.6517" layer="94"/>
<rectangle x1="89.0143" y1="32.6263" x2="89.2937" y2="32.6517" layer="94"/>
<rectangle x1="91.3003" y1="32.6263" x2="91.9861" y2="32.6517" layer="94"/>
<rectangle x1="92.3163" y1="32.6263" x2="92.7989" y2="32.6517" layer="94"/>
<rectangle x1="93.1799" y1="32.6263" x2="94.5261" y2="32.6517" layer="94"/>
<rectangle x1="96.3803" y1="32.6263" x2="97.1677" y2="32.6517" layer="94"/>
<rectangle x1="97.4471" y1="32.6263" x2="97.5233" y2="32.6517" layer="94"/>
<rectangle x1="98.1075" y1="32.6263" x2="98.6155" y2="32.6517" layer="94"/>
<rectangle x1="87.6681" y1="32.6517" x2="87.7189" y2="32.6771" layer="94"/>
<rectangle x1="89.0905" y1="32.6517" x2="89.1159" y2="32.6771" layer="94"/>
<rectangle x1="89.1413" y1="32.6517" x2="89.2937" y2="32.6771" layer="94"/>
<rectangle x1="91.3003" y1="32.6517" x2="91.9607" y2="32.6771" layer="94"/>
<rectangle x1="92.2909" y1="32.6517" x2="92.7989" y2="32.6771" layer="94"/>
<rectangle x1="93.2053" y1="32.6517" x2="94.5261" y2="32.6771" layer="94"/>
<rectangle x1="96.3803" y1="32.6517" x2="96.9899" y2="32.6771" layer="94"/>
<rectangle x1="97.0153" y1="32.6517" x2="97.0407" y2="32.6771" layer="94"/>
<rectangle x1="97.4725" y1="32.6517" x2="97.5487" y2="32.6771" layer="94"/>
<rectangle x1="98.1075" y1="32.6517" x2="98.5901" y2="32.6771" layer="94"/>
<rectangle x1="87.6427" y1="32.6771" x2="87.6935" y2="32.7025" layer="94"/>
<rectangle x1="89.1667" y1="32.6771" x2="89.1921" y2="32.7025" layer="94"/>
<rectangle x1="89.2175" y1="32.6771" x2="89.3445" y2="32.7025" layer="94"/>
<rectangle x1="91.2495" y1="32.6771" x2="91.9861" y2="32.7025" layer="94"/>
<rectangle x1="92.2655" y1="32.6771" x2="92.7989" y2="32.7025" layer="94"/>
<rectangle x1="93.1799" y1="32.6771" x2="94.5515" y2="32.7025" layer="94"/>
<rectangle x1="96.3803" y1="32.6771" x2="96.9137" y2="32.7025" layer="94"/>
<rectangle x1="97.4471" y1="32.6771" x2="97.5487" y2="32.7025" layer="94"/>
<rectangle x1="98.0567" y1="32.6771" x2="98.5901" y2="32.7025" layer="94"/>
<rectangle x1="89.3445" y1="32.7025" x2="89.3699" y2="32.7279" layer="94"/>
<rectangle x1="89.3953" y1="32.7025" x2="89.4207" y2="32.7279" layer="94"/>
<rectangle x1="91.2241" y1="32.7025" x2="92.0115" y2="32.7279" layer="94"/>
<rectangle x1="92.2401" y1="32.7025" x2="92.8243" y2="32.7279" layer="94"/>
<rectangle x1="93.1545" y1="32.7025" x2="94.5515" y2="32.7279" layer="94"/>
<rectangle x1="96.4057" y1="32.7025" x2="96.7867" y2="32.7279" layer="94"/>
<rectangle x1="97.4725" y1="32.7025" x2="97.5487" y2="32.7279" layer="94"/>
<rectangle x1="98.0313" y1="32.7025" x2="98.5647" y2="32.7279" layer="94"/>
<rectangle x1="87.6173" y1="32.7279" x2="87.6681" y2="32.7533" layer="94"/>
<rectangle x1="89.3699" y1="32.7279" x2="89.4969" y2="32.7533" layer="94"/>
<rectangle x1="91.1987" y1="32.7279" x2="92.0369" y2="32.7533" layer="94"/>
<rectangle x1="92.2147" y1="32.7279" x2="92.8497" y2="32.7533" layer="94"/>
<rectangle x1="93.1037" y1="32.7279" x2="94.5769" y2="32.7533" layer="94"/>
<rectangle x1="96.3803" y1="32.7279" x2="96.7867" y2="32.7533" layer="94"/>
<rectangle x1="97.4471" y1="32.7279" x2="97.5741" y2="32.7533" layer="94"/>
<rectangle x1="98.0059" y1="32.7279" x2="98.5393" y2="32.7533" layer="94"/>
<rectangle x1="87.6173" y1="32.7533" x2="87.6427" y2="32.7787" layer="94"/>
<rectangle x1="89.4461" y1="32.7533" x2="89.5223" y2="32.7787" layer="94"/>
<rectangle x1="91.1733" y1="32.7533" x2="92.0623" y2="32.7787" layer="94"/>
<rectangle x1="92.2401" y1="32.7533" x2="92.8243" y2="32.7787" layer="94"/>
<rectangle x1="93.1037" y1="32.7533" x2="94.6023" y2="32.7787" layer="94"/>
<rectangle x1="96.4057" y1="32.7533" x2="96.7867" y2="32.7787" layer="94"/>
<rectangle x1="97.4725" y1="32.7533" x2="97.5995" y2="32.7787" layer="94"/>
<rectangle x1="97.9805" y1="32.7533" x2="98.4631" y2="32.7787" layer="94"/>
<rectangle x1="87.5919" y1="32.7787" x2="87.6173" y2="32.8041" layer="94"/>
<rectangle x1="89.4969" y1="32.7787" x2="89.5477" y2="32.8041" layer="94"/>
<rectangle x1="91.1479" y1="32.7787" x2="92.0623" y2="32.8041" layer="94"/>
<rectangle x1="92.2147" y1="32.7787" x2="92.8497" y2="32.8041" layer="94"/>
<rectangle x1="93.0783" y1="32.7787" x2="94.6023" y2="32.8041" layer="94"/>
<rectangle x1="96.3803" y1="32.7787" x2="96.7867" y2="32.8041" layer="94"/>
<rectangle x1="97.4471" y1="32.7787" x2="97.6249" y2="32.8041" layer="94"/>
<rectangle x1="97.9297" y1="32.7787" x2="98.4377" y2="32.8041" layer="94"/>
<rectangle x1="87.5665" y1="32.8041" x2="87.5919" y2="32.8295" layer="94"/>
<rectangle x1="89.5477" y1="32.8041" x2="89.6239" y2="32.8295" layer="94"/>
<rectangle x1="91.1225" y1="32.8041" x2="92.0623" y2="32.8295" layer="94"/>
<rectangle x1="92.2147" y1="32.8041" x2="92.8243" y2="32.8295" layer="94"/>
<rectangle x1="93.0529" y1="32.8041" x2="94.6023" y2="32.8295" layer="94"/>
<rectangle x1="96.4057" y1="32.8041" x2="96.7867" y2="32.8295" layer="94"/>
<rectangle x1="97.4725" y1="32.8041" x2="97.6503" y2="32.8295" layer="94"/>
<rectangle x1="97.9043" y1="32.8041" x2="98.3615" y2="32.8295" layer="94"/>
<rectangle x1="87.5665" y1="32.8295" x2="87.6173" y2="32.8549" layer="94"/>
<rectangle x1="89.5985" y1="32.8295" x2="89.6493" y2="32.8549" layer="94"/>
<rectangle x1="91.0463" y1="32.8295" x2="92.0623" y2="32.8549" layer="94"/>
<rectangle x1="92.2147" y1="32.8295" x2="92.8497" y2="32.8549" layer="94"/>
<rectangle x1="93.0783" y1="32.8295" x2="94.5769" y2="32.8549" layer="94"/>
<rectangle x1="96.4057" y1="32.8295" x2="96.7867" y2="32.8549" layer="94"/>
<rectangle x1="97.4471" y1="32.8295" x2="97.6757" y2="32.8549" layer="94"/>
<rectangle x1="97.8535" y1="32.8295" x2="98.3869" y2="32.8549" layer="94"/>
<rectangle x1="87.5665" y1="32.8549" x2="87.5919" y2="32.8803" layer="94"/>
<rectangle x1="89.6493" y1="32.8549" x2="89.7255" y2="32.8803" layer="94"/>
<rectangle x1="91.0463" y1="32.8549" x2="92.0623" y2="32.8803" layer="94"/>
<rectangle x1="92.2147" y1="32.8549" x2="92.8243" y2="32.8803" layer="94"/>
<rectangle x1="93.0529" y1="32.8549" x2="94.5515" y2="32.8803" layer="94"/>
<rectangle x1="96.4057" y1="32.8549" x2="96.7867" y2="32.8803" layer="94"/>
<rectangle x1="97.4471" y1="32.8549" x2="97.6503" y2="32.8803" layer="94"/>
<rectangle x1="97.8281" y1="32.8549" x2="98.3361" y2="32.8803" layer="94"/>
<rectangle x1="87.5411" y1="32.8803" x2="87.5665" y2="32.9057" layer="94"/>
<rectangle x1="89.6747" y1="32.8803" x2="89.7509" y2="32.9057" layer="94"/>
<rectangle x1="90.9955" y1="32.8803" x2="92.0369" y2="32.9057" layer="94"/>
<rectangle x1="92.2147" y1="32.8803" x2="92.8243" y2="32.9057" layer="94"/>
<rectangle x1="93.0783" y1="32.8803" x2="94.5769" y2="32.9057" layer="94"/>
<rectangle x1="96.4311" y1="32.8803" x2="96.7867" y2="32.9057" layer="94"/>
<rectangle x1="97.4471" y1="32.8803" x2="97.6757" y2="32.9057" layer="94"/>
<rectangle x1="97.8027" y1="32.8803" x2="98.3361" y2="32.9057" layer="94"/>
<rectangle x1="87.5411" y1="32.9057" x2="87.5665" y2="32.9311" layer="94"/>
<rectangle x1="89.7509" y1="32.9057" x2="89.7763" y2="32.9311" layer="94"/>
<rectangle x1="90.9701" y1="32.9057" x2="92.0115" y2="32.9311" layer="94"/>
<rectangle x1="92.2147" y1="32.9057" x2="92.8243" y2="32.9311" layer="94"/>
<rectangle x1="93.0783" y1="32.9057" x2="94.5515" y2="32.9311" layer="94"/>
<rectangle x1="96.4057" y1="32.9057" x2="96.7867" y2="32.9311" layer="94"/>
<rectangle x1="97.4471" y1="32.9057" x2="97.7011" y2="32.9311" layer="94"/>
<rectangle x1="97.7773" y1="32.9057" x2="98.3107" y2="32.9311" layer="94"/>
<rectangle x1="87.5411" y1="32.9311" x2="87.5665" y2="32.9565" layer="94"/>
<rectangle x1="89.7763" y1="32.9311" x2="89.8525" y2="32.9565" layer="94"/>
<rectangle x1="90.9447" y1="32.9311" x2="92.0369" y2="32.9565" layer="94"/>
<rectangle x1="92.2147" y1="32.9311" x2="92.7989" y2="32.9565" layer="94"/>
<rectangle x1="93.0783" y1="32.9311" x2="94.5261" y2="32.9565" layer="94"/>
<rectangle x1="96.4311" y1="32.9311" x2="96.9137" y2="32.9565" layer="94"/>
<rectangle x1="96.9391" y1="32.9311" x2="96.9645" y2="32.9565" layer="94"/>
<rectangle x1="96.9899" y1="32.9311" x2="97.0153" y2="32.9565" layer="94"/>
<rectangle x1="97.4471" y1="32.9311" x2="97.7265" y2="32.9565" layer="94"/>
<rectangle x1="97.7519" y1="32.9311" x2="98.2853" y2="32.9565" layer="94"/>
<rectangle x1="87.5157" y1="32.9565" x2="87.5411" y2="32.9819" layer="94"/>
<rectangle x1="89.8525" y1="32.9565" x2="89.8779" y2="32.9819" layer="94"/>
<rectangle x1="90.9193" y1="32.9565" x2="91.9607" y2="32.9819" layer="94"/>
<rectangle x1="92.2401" y1="32.9565" x2="92.7735" y2="32.9819" layer="94"/>
<rectangle x1="93.1037" y1="32.9565" x2="94.5007" y2="32.9819" layer="94"/>
<rectangle x1="96.4057" y1="32.9565" x2="97.0407" y2="32.9819" layer="94"/>
<rectangle x1="97.0661" y1="32.9565" x2="97.0915" y2="32.9819" layer="94"/>
<rectangle x1="97.4471" y1="32.9565" x2="98.2345" y2="32.9819" layer="94"/>
<rectangle x1="87.5157" y1="32.9819" x2="87.5411" y2="33.0073" layer="94"/>
<rectangle x1="89.8779" y1="32.9819" x2="89.9541" y2="33.0073" layer="94"/>
<rectangle x1="90.8939" y1="32.9819" x2="91.9353" y2="33.0073" layer="94"/>
<rectangle x1="92.2147" y1="32.9819" x2="92.7735" y2="33.0073" layer="94"/>
<rectangle x1="93.1291" y1="32.9819" x2="94.5261" y2="33.0073" layer="94"/>
<rectangle x1="96.4311" y1="32.9819" x2="97.2185" y2="33.0073" layer="94"/>
<rectangle x1="97.2439" y1="32.9819" x2="97.2693" y2="33.0073" layer="94"/>
<rectangle x1="97.4471" y1="32.9819" x2="98.2345" y2="33.0073" layer="94"/>
<rectangle x1="87.5157" y1="33.0073" x2="87.5411" y2="33.0327" layer="94"/>
<rectangle x1="89.9033" y1="33.0073" x2="89.9287" y2="33.0327" layer="94"/>
<rectangle x1="89.9541" y1="33.0073" x2="89.9795" y2="33.0327" layer="94"/>
<rectangle x1="90.8685" y1="33.0073" x2="91.9353" y2="33.0327" layer="94"/>
<rectangle x1="92.2401" y1="33.0073" x2="92.7481" y2="33.0327" layer="94"/>
<rectangle x1="93.1545" y1="33.0073" x2="94.5007" y2="33.0327" layer="94"/>
<rectangle x1="96.4311" y1="33.0073" x2="97.3455" y2="33.0327" layer="94"/>
<rectangle x1="97.3709" y1="33.0073" x2="97.3963" y2="33.0327" layer="94"/>
<rectangle x1="97.4471" y1="33.0073" x2="98.1837" y2="33.0327" layer="94"/>
<rectangle x1="87.4903" y1="33.0327" x2="87.5411" y2="33.0581" layer="94"/>
<rectangle x1="89.9287" y1="33.0327" x2="90.1573" y2="33.0581" layer="94"/>
<rectangle x1="90.1827" y1="33.0327" x2="90.2081" y2="33.0581" layer="94"/>
<rectangle x1="90.2335" y1="33.0327" x2="90.2589" y2="33.0581" layer="94"/>
<rectangle x1="90.8177" y1="33.0327" x2="91.9353" y2="33.0581" layer="94"/>
<rectangle x1="92.2655" y1="33.0327" x2="92.7481" y2="33.0581" layer="94"/>
<rectangle x1="93.1291" y1="33.0327" x2="94.4753" y2="33.0581" layer="94"/>
<rectangle x1="96.4311" y1="33.0327" x2="98.1837" y2="33.0581" layer="94"/>
<rectangle x1="87.5157" y1="33.0581" x2="87.5411" y2="33.0835" layer="94"/>
<rectangle x1="90.1573" y1="33.0581" x2="90.1827" y2="33.0835" layer="94"/>
<rectangle x1="90.2081" y1="33.0581" x2="90.3351" y2="33.0835" layer="94"/>
<rectangle x1="90.7923" y1="33.0581" x2="91.9607" y2="33.0835" layer="94"/>
<rectangle x1="92.2909" y1="33.0581" x2="92.6719" y2="33.0835" layer="94"/>
<rectangle x1="93.1291" y1="33.0581" x2="94.4753" y2="33.0835" layer="94"/>
<rectangle x1="96.4565" y1="33.0581" x2="98.1583" y2="33.0835" layer="94"/>
<rectangle x1="87.4903" y1="33.0835" x2="87.5157" y2="33.1089" layer="94"/>
<rectangle x1="90.2843" y1="33.0835" x2="90.3097" y2="33.1089" layer="94"/>
<rectangle x1="90.3351" y1="33.0835" x2="90.4113" y2="33.1089" layer="94"/>
<rectangle x1="90.4367" y1="33.0835" x2="90.4621" y2="33.1089" layer="94"/>
<rectangle x1="90.7415" y1="33.0835" x2="91.9353" y2="33.1089" layer="94"/>
<rectangle x1="92.3163" y1="33.0835" x2="92.6465" y2="33.1089" layer="94"/>
<rectangle x1="93.1037" y1="33.0835" x2="94.4753" y2="33.1089" layer="94"/>
<rectangle x1="96.4311" y1="33.0835" x2="98.1329" y2="33.1089" layer="94"/>
<rectangle x1="87.4903" y1="33.1089" x2="87.5157" y2="33.1343" layer="94"/>
<rectangle x1="90.4621" y1="33.1089" x2="90.4875" y2="33.1343" layer="94"/>
<rectangle x1="90.5129" y1="33.1089" x2="90.5383" y2="33.1343" layer="94"/>
<rectangle x1="90.7161" y1="33.1089" x2="91.9607" y2="33.1343" layer="94"/>
<rectangle x1="92.3925" y1="33.1089" x2="92.6211" y2="33.1343" layer="94"/>
<rectangle x1="93.1037" y1="33.1089" x2="94.4499" y2="33.1343" layer="94"/>
<rectangle x1="96.4565" y1="33.1089" x2="98.1075" y2="33.1343" layer="94"/>
<rectangle x1="87.4903" y1="33.1343" x2="87.5157" y2="33.1597" layer="94"/>
<rectangle x1="90.4875" y1="33.1343" x2="90.5129" y2="33.1597" layer="94"/>
<rectangle x1="90.5383" y1="33.1343" x2="90.6145" y2="33.1597" layer="94"/>
<rectangle x1="90.6907" y1="33.1343" x2="91.9861" y2="33.1597" layer="94"/>
<rectangle x1="92.0115" y1="33.1343" x2="92.1385" y2="33.1597" layer="94"/>
<rectangle x1="92.4179" y1="33.1343" x2="92.4433" y2="33.1597" layer="94"/>
<rectangle x1="92.4687" y1="33.1343" x2="92.4941" y2="33.1597" layer="94"/>
<rectangle x1="92.5195" y1="33.1343" x2="92.5449" y2="33.1597" layer="94"/>
<rectangle x1="92.9259" y1="33.1343" x2="93.0529" y2="33.1597" layer="94"/>
<rectangle x1="93.0783" y1="33.1343" x2="94.4245" y2="33.1597" layer="94"/>
<rectangle x1="96.4819" y1="33.1343" x2="98.0821" y2="33.1597" layer="94"/>
<rectangle x1="90.5637" y1="33.1597" x2="90.5891" y2="33.1851" layer="94"/>
<rectangle x1="90.6145" y1="33.1597" x2="92.1639" y2="33.1851" layer="94"/>
<rectangle x1="92.9005" y1="33.1597" x2="94.3991" y2="33.1851" layer="94"/>
<rectangle x1="96.5073" y1="33.1597" x2="98.0567" y2="33.1851" layer="94"/>
<rectangle x1="87.4903" y1="33.1851" x2="87.5157" y2="33.2105" layer="94"/>
<rectangle x1="90.6399" y1="33.1851" x2="92.1893" y2="33.2105" layer="94"/>
<rectangle x1="92.8497" y1="33.1851" x2="94.3991" y2="33.2105" layer="94"/>
<rectangle x1="96.5327" y1="33.1851" x2="96.5581" y2="33.2105" layer="94"/>
<rectangle x1="96.5835" y1="33.1851" x2="98.0313" y2="33.2105" layer="94"/>
<rectangle x1="98.2091" y1="33.1851" x2="98.2853" y2="33.2105" layer="94"/>
<rectangle x1="87.4649" y1="33.2105" x2="87.4903" y2="33.2359" layer="94"/>
<rectangle x1="90.7161" y1="33.2105" x2="92.1639" y2="33.2359" layer="94"/>
<rectangle x1="92.8497" y1="33.2105" x2="94.3991" y2="33.2359" layer="94"/>
<rectangle x1="96.8121" y1="33.2105" x2="98.0059" y2="33.2359" layer="94"/>
<rectangle x1="98.1329" y1="33.2105" x2="98.1583" y2="33.2359" layer="94"/>
<rectangle x1="98.1837" y1="33.2105" x2="98.2599" y2="33.2359" layer="94"/>
<rectangle x1="87.4395" y1="33.2359" x2="87.4903" y2="33.2613" layer="94"/>
<rectangle x1="90.7415" y1="33.2359" x2="92.1893" y2="33.2613" layer="94"/>
<rectangle x1="92.8243" y1="33.2359" x2="94.3737" y2="33.2613" layer="94"/>
<rectangle x1="96.8375" y1="33.2359" x2="96.8629" y2="33.2613" layer="94"/>
<rectangle x1="96.8883" y1="33.2359" x2="97.9805" y2="33.2613" layer="94"/>
<rectangle x1="98.0567" y1="33.2359" x2="98.2853" y2="33.2613" layer="94"/>
<rectangle x1="87.4649" y1="33.2613" x2="87.4903" y2="33.2867" layer="94"/>
<rectangle x1="90.8177" y1="33.2613" x2="92.0369" y2="33.2867" layer="94"/>
<rectangle x1="92.0877" y1="33.2613" x2="92.2147" y2="33.2867" layer="94"/>
<rectangle x1="92.7989" y1="33.2613" x2="94.3483" y2="33.2867" layer="94"/>
<rectangle x1="96.9645" y1="33.2613" x2="97.9551" y2="33.2867" layer="94"/>
<rectangle x1="97.9805" y1="33.2613" x2="98.2853" y2="33.2867" layer="94"/>
<rectangle x1="87.4395" y1="33.2867" x2="87.4649" y2="33.3121" layer="94"/>
<rectangle x1="90.8431" y1="33.2867" x2="92.0115" y2="33.3121" layer="94"/>
<rectangle x1="92.1131" y1="33.2867" x2="92.1893" y2="33.3121" layer="94"/>
<rectangle x1="92.7989" y1="33.2867" x2="94.3483" y2="33.3121" layer="94"/>
<rectangle x1="96.9899" y1="33.2867" x2="97.0153" y2="33.3121" layer="94"/>
<rectangle x1="97.0407" y1="33.2867" x2="98.2853" y2="33.3121" layer="94"/>
<rectangle x1="87.4141" y1="33.3121" x2="87.4395" y2="33.3375" layer="94"/>
<rectangle x1="90.9193" y1="33.3121" x2="91.9861" y2="33.3375" layer="94"/>
<rectangle x1="92.1385" y1="33.3121" x2="92.1893" y2="33.3375" layer="94"/>
<rectangle x1="92.7989" y1="33.3121" x2="94.3483" y2="33.3375" layer="94"/>
<rectangle x1="97.1169" y1="33.3121" x2="98.3107" y2="33.3375" layer="94"/>
<rectangle x1="87.4141" y1="33.3375" x2="87.4649" y2="33.3629" layer="94"/>
<rectangle x1="90.9447" y1="33.3375" x2="91.9861" y2="33.3629" layer="94"/>
<rectangle x1="92.1131" y1="33.3375" x2="92.1893" y2="33.3629" layer="94"/>
<rectangle x1="92.4179" y1="33.3375" x2="92.5957" y2="33.3629" layer="94"/>
<rectangle x1="92.8243" y1="33.3375" x2="94.3737" y2="33.3629" layer="94"/>
<rectangle x1="97.1931" y1="33.3375" x2="98.3107" y2="33.3629" layer="94"/>
<rectangle x1="87.4141" y1="33.3629" x2="87.4395" y2="33.3883" layer="94"/>
<rectangle x1="90.9701" y1="33.3629" x2="91.9607" y2="33.3883" layer="94"/>
<rectangle x1="92.1131" y1="33.3629" x2="92.1639" y2="33.3883" layer="94"/>
<rectangle x1="92.3925" y1="33.3629" x2="92.6211" y2="33.3883" layer="94"/>
<rectangle x1="92.7989" y1="33.3629" x2="94.3483" y2="33.3883" layer="94"/>
<rectangle x1="97.2693" y1="33.3629" x2="98.3107" y2="33.3883" layer="94"/>
<rectangle x1="87.3887" y1="33.3883" x2="87.4395" y2="33.4137" layer="94"/>
<rectangle x1="91.0209" y1="33.3883" x2="91.9353" y2="33.4137" layer="94"/>
<rectangle x1="92.0877" y1="33.3883" x2="92.2401" y2="33.4137" layer="94"/>
<rectangle x1="92.3671" y1="33.3883" x2="92.6211" y2="33.4137" layer="94"/>
<rectangle x1="92.7735" y1="33.3883" x2="94.3737" y2="33.4137" layer="94"/>
<rectangle x1="97.3455" y1="33.3883" x2="98.3361" y2="33.4137" layer="94"/>
<rectangle x1="87.4141" y1="33.4137" x2="87.4395" y2="33.4391" layer="94"/>
<rectangle x1="91.0717" y1="33.4137" x2="91.9099" y2="33.4391" layer="94"/>
<rectangle x1="92.0877" y1="33.4137" x2="92.2655" y2="33.4391" layer="94"/>
<rectangle x1="92.3417" y1="33.4137" x2="92.6211" y2="33.4391" layer="94"/>
<rectangle x1="92.6973" y1="33.4137" x2="94.3483" y2="33.4391" layer="94"/>
<rectangle x1="97.4217" y1="33.4137" x2="98.3107" y2="33.4391" layer="94"/>
<rectangle x1="87.3887" y1="33.4391" x2="87.4141" y2="33.4645" layer="94"/>
<rectangle x1="91.0971" y1="33.4391" x2="91.8845" y2="33.4645" layer="94"/>
<rectangle x1="92.0623" y1="33.4391" x2="94.3737" y2="33.4645" layer="94"/>
<rectangle x1="97.3455" y1="33.4391" x2="97.3709" y2="33.4645" layer="94"/>
<rectangle x1="97.3963" y1="33.4391" x2="98.3361" y2="33.4645" layer="94"/>
<rectangle x1="91.1225" y1="33.4645" x2="91.8591" y2="33.4899" layer="94"/>
<rectangle x1="92.0369" y1="33.4645" x2="94.3483" y2="33.4899" layer="94"/>
<rectangle x1="97.3201" y1="33.4645" x2="98.3615" y2="33.4899" layer="94"/>
<rectangle x1="87.3887" y1="33.4899" x2="87.4141" y2="33.5153" layer="94"/>
<rectangle x1="91.1479" y1="33.4899" x2="91.8337" y2="33.5153" layer="94"/>
<rectangle x1="92.0115" y1="33.4899" x2="92.3417" y2="33.5153" layer="94"/>
<rectangle x1="92.4179" y1="33.4899" x2="94.3737" y2="33.5153" layer="94"/>
<rectangle x1="97.1931" y1="33.4899" x2="98.3361" y2="33.5153" layer="94"/>
<rectangle x1="87.3887" y1="33.5153" x2="87.4141" y2="33.5407" layer="94"/>
<rectangle x1="91.1733" y1="33.5153" x2="91.8083" y2="33.5407" layer="94"/>
<rectangle x1="91.9861" y1="33.5153" x2="92.2147" y2="33.5407" layer="94"/>
<rectangle x1="92.3925" y1="33.5153" x2="94.3483" y2="33.5407" layer="94"/>
<rectangle x1="97.1169" y1="33.5153" x2="98.3615" y2="33.5407" layer="94"/>
<rectangle x1="87.3887" y1="33.5407" x2="87.4141" y2="33.5661" layer="94"/>
<rectangle x1="91.1987" y1="33.5407" x2="91.8337" y2="33.5661" layer="94"/>
<rectangle x1="91.9607" y1="33.5407" x2="92.1893" y2="33.5661" layer="94"/>
<rectangle x1="92.3163" y1="33.5407" x2="94.3737" y2="33.5661" layer="94"/>
<rectangle x1="97.0407" y1="33.5407" x2="98.3869" y2="33.5661" layer="94"/>
<rectangle x1="91.2495" y1="33.5661" x2="91.7829" y2="33.5915" layer="94"/>
<rectangle x1="91.9607" y1="33.5661" x2="92.1639" y2="33.5915" layer="94"/>
<rectangle x1="92.2909" y1="33.5661" x2="94.3483" y2="33.5915" layer="94"/>
<rectangle x1="97.0661" y1="33.5661" x2="98.3107" y2="33.5915" layer="94"/>
<rectangle x1="87.3887" y1="33.5915" x2="87.4141" y2="33.6169" layer="94"/>
<rectangle x1="91.3003" y1="33.5915" x2="91.7829" y2="33.6169" layer="94"/>
<rectangle x1="91.9353" y1="33.5915" x2="92.1639" y2="33.6169" layer="94"/>
<rectangle x1="92.3163" y1="33.5915" x2="94.3737" y2="33.6169" layer="94"/>
<rectangle x1="97.0661" y1="33.5915" x2="98.2345" y2="33.6169" layer="94"/>
<rectangle x1="87.3633" y1="33.6169" x2="87.3887" y2="33.6423" layer="94"/>
<rectangle x1="91.3257" y1="33.6169" x2="91.7575" y2="33.6423" layer="94"/>
<rectangle x1="91.9353" y1="33.6169" x2="92.1131" y2="33.6423" layer="94"/>
<rectangle x1="92.3417" y1="33.6169" x2="92.6719" y2="33.6423" layer="94"/>
<rectangle x1="92.6973" y1="33.6169" x2="92.7227" y2="33.6423" layer="94"/>
<rectangle x1="92.7481" y1="33.6169" x2="94.3483" y2="33.6423" layer="94"/>
<rectangle x1="97.0661" y1="33.6169" x2="98.1583" y2="33.6423" layer="94"/>
<rectangle x1="87.3887" y1="33.6423" x2="87.4141" y2="33.6677" layer="94"/>
<rectangle x1="91.3511" y1="33.6423" x2="91.7321" y2="33.6677" layer="94"/>
<rectangle x1="91.9099" y1="33.6423" x2="92.1385" y2="33.6677" layer="94"/>
<rectangle x1="92.3671" y1="33.6423" x2="92.6465" y2="33.6677" layer="94"/>
<rectangle x1="92.7227" y1="33.6423" x2="94.3737" y2="33.6677" layer="94"/>
<rectangle x1="97.0915" y1="33.6423" x2="98.1837" y2="33.6677" layer="94"/>
<rectangle x1="87.3633" y1="33.6677" x2="87.3887" y2="33.6931" layer="94"/>
<rectangle x1="91.3765" y1="33.6677" x2="91.7067" y2="33.6931" layer="94"/>
<rectangle x1="91.8845" y1="33.6677" x2="92.0877" y2="33.6931" layer="94"/>
<rectangle x1="92.3671" y1="33.6677" x2="92.6211" y2="33.6931" layer="94"/>
<rectangle x1="92.7227" y1="33.6677" x2="94.3483" y2="33.6931" layer="94"/>
<rectangle x1="97.0915" y1="33.6677" x2="98.1837" y2="33.6931" layer="94"/>
<rectangle x1="87.3633" y1="33.6931" x2="87.4141" y2="33.7185" layer="94"/>
<rectangle x1="91.4019" y1="33.6931" x2="91.6813" y2="33.7185" layer="94"/>
<rectangle x1="91.8591" y1="33.6931" x2="92.0877" y2="33.7185" layer="94"/>
<rectangle x1="92.3671" y1="33.6931" x2="92.6211" y2="33.7185" layer="94"/>
<rectangle x1="92.6973" y1="33.6931" x2="94.3737" y2="33.7185" layer="94"/>
<rectangle x1="97.0915" y1="33.6931" x2="98.2091" y2="33.7185" layer="94"/>
<rectangle x1="87.3633" y1="33.7185" x2="87.3887" y2="33.7439" layer="94"/>
<rectangle x1="91.4273" y1="33.7185" x2="91.6559" y2="33.7439" layer="94"/>
<rectangle x1="91.8337" y1="33.7185" x2="92.0623" y2="33.7439" layer="94"/>
<rectangle x1="92.3671" y1="33.7185" x2="92.6211" y2="33.7439" layer="94"/>
<rectangle x1="92.6973" y1="33.7185" x2="94.3483" y2="33.7439" layer="94"/>
<rectangle x1="97.1169" y1="33.7185" x2="98.2091" y2="33.7439" layer="94"/>
<rectangle x1="87.3633" y1="33.7439" x2="87.4141" y2="33.7693" layer="94"/>
<rectangle x1="91.4527" y1="33.7439" x2="91.6305" y2="33.7693" layer="94"/>
<rectangle x1="91.8083" y1="33.7439" x2="92.0369" y2="33.7693" layer="94"/>
<rectangle x1="92.3163" y1="33.7439" x2="92.6211" y2="33.7693" layer="94"/>
<rectangle x1="92.6719" y1="33.7439" x2="94.4245" y2="33.7693" layer="94"/>
<rectangle x1="94.4499" y1="33.7439" x2="94.4753" y2="33.7693" layer="94"/>
<rectangle x1="97.0915" y1="33.7439" x2="98.1837" y2="33.7693" layer="94"/>
<rectangle x1="87.3633" y1="33.7693" x2="87.3887" y2="33.7947" layer="94"/>
<rectangle x1="91.5289" y1="33.7693" x2="91.6051" y2="33.7947" layer="94"/>
<rectangle x1="91.7829" y1="33.7693" x2="92.0115" y2="33.7947" layer="94"/>
<rectangle x1="92.3417" y1="33.7693" x2="92.6211" y2="33.7947" layer="94"/>
<rectangle x1="92.6465" y1="33.7693" x2="92.8751" y2="33.7947" layer="94"/>
<rectangle x1="92.9005" y1="33.7693" x2="94.5007" y2="33.7947" layer="94"/>
<rectangle x1="94.5261" y1="33.7693" x2="94.5515" y2="33.7947" layer="94"/>
<rectangle x1="97.1169" y1="33.7693" x2="98.1837" y2="33.7947" layer="94"/>
<rectangle x1="87.3633" y1="33.7947" x2="87.3887" y2="33.8201" layer="94"/>
<rectangle x1="91.5289" y1="33.7947" x2="91.6051" y2="33.8201" layer="94"/>
<rectangle x1="91.7575" y1="33.7947" x2="91.9861" y2="33.8201" layer="94"/>
<rectangle x1="92.3163" y1="33.7947" x2="92.8497" y2="33.8201" layer="94"/>
<rectangle x1="92.8751" y1="33.7947" x2="94.6277" y2="33.8201" layer="94"/>
<rectangle x1="94.6531" y1="33.7947" x2="94.6785" y2="33.8201" layer="94"/>
<rectangle x1="97.1169" y1="33.7947" x2="98.1837" y2="33.8201" layer="94"/>
<rectangle x1="87.3633" y1="33.8201" x2="87.3887" y2="33.8455" layer="94"/>
<rectangle x1="91.5797" y1="33.8201" x2="91.6051" y2="33.8455" layer="94"/>
<rectangle x1="91.7829" y1="33.8201" x2="91.9607" y2="33.8455" layer="94"/>
<rectangle x1="92.3417" y1="33.8201" x2="92.8243" y2="33.8455" layer="94"/>
<rectangle x1="92.9005" y1="33.8201" x2="94.7039" y2="33.8455" layer="94"/>
<rectangle x1="94.7293" y1="33.8201" x2="94.7547" y2="33.8455" layer="94"/>
<rectangle x1="97.1169" y1="33.8201" x2="98.1583" y2="33.8455" layer="94"/>
<rectangle x1="87.3633" y1="33.8455" x2="87.3887" y2="33.8709" layer="94"/>
<rectangle x1="91.6051" y1="33.8455" x2="91.6305" y2="33.8709" layer="94"/>
<rectangle x1="91.7321" y1="33.8455" x2="91.9607" y2="33.8709" layer="94"/>
<rectangle x1="92.4179" y1="33.8455" x2="92.7989" y2="33.8709" layer="94"/>
<rectangle x1="92.8751" y1="33.8455" x2="94.8817" y2="33.8709" layer="94"/>
<rectangle x1="97.1423" y1="33.8455" x2="98.1837" y2="33.8709" layer="94"/>
<rectangle x1="87.3633" y1="33.8709" x2="87.3887" y2="33.8963" layer="94"/>
<rectangle x1="91.6305" y1="33.8709" x2="91.6559" y2="33.8963" layer="94"/>
<rectangle x1="91.7321" y1="33.8709" x2="91.9353" y2="33.8963" layer="94"/>
<rectangle x1="92.4433" y1="33.8709" x2="92.7735" y2="33.8963" layer="94"/>
<rectangle x1="92.8497" y1="33.8709" x2="94.9579" y2="33.8963" layer="94"/>
<rectangle x1="94.9833" y1="33.8709" x2="95.0087" y2="33.8963" layer="94"/>
<rectangle x1="97.1423" y1="33.8709" x2="98.1583" y2="33.8963" layer="94"/>
<rectangle x1="87.3633" y1="33.8963" x2="87.3887" y2="33.9217" layer="94"/>
<rectangle x1="91.6559" y1="33.8963" x2="91.9353" y2="33.9217" layer="94"/>
<rectangle x1="92.4433" y1="33.8963" x2="92.7989" y2="33.9217" layer="94"/>
<rectangle x1="92.8243" y1="33.8963" x2="95.0849" y2="33.9217" layer="94"/>
<rectangle x1="95.1103" y1="33.8963" x2="95.1357" y2="33.9217" layer="94"/>
<rectangle x1="97.1423" y1="33.8963" x2="98.1837" y2="33.9217" layer="94"/>
<rectangle x1="87.3633" y1="33.9217" x2="87.3887" y2="33.9471" layer="94"/>
<rectangle x1="91.6813" y1="33.9217" x2="91.9099" y2="33.9471" layer="94"/>
<rectangle x1="92.4433" y1="33.9217" x2="95.1611" y2="33.9471" layer="94"/>
<rectangle x1="95.1865" y1="33.9217" x2="95.2119" y2="33.9471" layer="94"/>
<rectangle x1="97.1677" y1="33.9217" x2="98.1583" y2="33.9471" layer="94"/>
<rectangle x1="87.3633" y1="33.9471" x2="87.3887" y2="33.9725" layer="94"/>
<rectangle x1="91.7067" y1="33.9471" x2="91.8845" y2="33.9725" layer="94"/>
<rectangle x1="92.4179" y1="33.9471" x2="95.3389" y2="33.9725" layer="94"/>
<rectangle x1="95.3643" y1="33.9471" x2="95.3897" y2="33.9725" layer="94"/>
<rectangle x1="95.4151" y1="33.9471" x2="95.4405" y2="33.9725" layer="94"/>
<rectangle x1="97.1423" y1="33.9471" x2="98.1837" y2="33.9725" layer="94"/>
<rectangle x1="87.3633" y1="33.9725" x2="87.3887" y2="33.9979" layer="94"/>
<rectangle x1="91.7575" y1="33.9725" x2="91.8591" y2="33.9979" layer="94"/>
<rectangle x1="92.4433" y1="33.9725" x2="93.2307" y2="33.9979" layer="94"/>
<rectangle x1="93.2561" y1="33.9725" x2="95.5167" y2="33.9979" layer="94"/>
<rectangle x1="95.5421" y1="33.9725" x2="95.5675" y2="33.9979" layer="94"/>
<rectangle x1="97.1169" y1="33.9725" x2="98.2091" y2="33.9979" layer="94"/>
<rectangle x1="87.3633" y1="33.9979" x2="87.4141" y2="34.0233" layer="94"/>
<rectangle x1="91.7829" y1="33.9979" x2="91.8337" y2="34.0233" layer="94"/>
<rectangle x1="92.4687" y1="33.9979" x2="95.6437" y2="34.0233" layer="94"/>
<rectangle x1="96.9899" y1="33.9979" x2="97.5233" y2="34.0233" layer="94"/>
<rectangle x1="97.5487" y1="33.9979" x2="97.5741" y2="34.0233" layer="94"/>
<rectangle x1="97.5995" y1="33.9979" x2="98.2853" y2="34.0233" layer="94"/>
<rectangle x1="87.3633" y1="34.0233" x2="87.3887" y2="34.0487" layer="94"/>
<rectangle x1="91.8337" y1="34.0233" x2="91.8591" y2="34.0487" layer="94"/>
<rectangle x1="92.4433" y1="34.0233" x2="93.2053" y2="34.0487" layer="94"/>
<rectangle x1="93.2561" y1="34.0233" x2="95.7199" y2="34.0487" layer="94"/>
<rectangle x1="96.9645" y1="34.0233" x2="97.4471" y2="34.0487" layer="94"/>
<rectangle x1="97.6757" y1="34.0233" x2="98.3107" y2="34.0487" layer="94"/>
<rectangle x1="87.3887" y1="34.0487" x2="87.4141" y2="34.0741" layer="94"/>
<rectangle x1="91.8591" y1="34.0487" x2="91.8845" y2="34.0741" layer="94"/>
<rectangle x1="92.4179" y1="34.0487" x2="93.2053" y2="34.0741" layer="94"/>
<rectangle x1="93.2561" y1="34.0487" x2="95.7453" y2="34.0741" layer="94"/>
<rectangle x1="96.9645" y1="34.0487" x2="97.3709" y2="34.0741" layer="94"/>
<rectangle x1="97.7011" y1="34.0487" x2="98.3361" y2="34.0741" layer="94"/>
<rectangle x1="87.3633" y1="34.0741" x2="87.3887" y2="34.0995" layer="94"/>
<rectangle x1="91.8845" y1="34.0741" x2="91.9099" y2="34.0995" layer="94"/>
<rectangle x1="92.3925" y1="34.0741" x2="92.6211" y2="34.0995" layer="94"/>
<rectangle x1="92.6465" y1="34.0741" x2="93.1799" y2="34.0995" layer="94"/>
<rectangle x1="93.2561" y1="34.0741" x2="95.8215" y2="34.0995" layer="94"/>
<rectangle x1="96.9645" y1="34.0741" x2="97.3455" y2="34.0995" layer="94"/>
<rectangle x1="97.7519" y1="34.0741" x2="98.3615" y2="34.0995" layer="94"/>
<rectangle x1="87.3887" y1="34.0995" x2="87.4141" y2="34.1249" layer="94"/>
<rectangle x1="91.9099" y1="34.0995" x2="91.9607" y2="34.1249" layer="94"/>
<rectangle x1="92.3671" y1="34.0995" x2="92.5957" y2="34.1249" layer="94"/>
<rectangle x1="92.6211" y1="34.0995" x2="93.1545" y2="34.1249" layer="94"/>
<rectangle x1="93.2307" y1="34.0995" x2="95.8469" y2="34.1249" layer="94"/>
<rectangle x1="96.9391" y1="34.0995" x2="97.3201" y2="34.1249" layer="94"/>
<rectangle x1="97.7773" y1="34.0995" x2="98.3869" y2="34.1249" layer="94"/>
<rectangle x1="87.3887" y1="34.1249" x2="87.4141" y2="34.1503" layer="94"/>
<rectangle x1="91.9353" y1="34.1249" x2="91.9861" y2="34.1503" layer="94"/>
<rectangle x1="92.3671" y1="34.1249" x2="92.5703" y2="34.1503" layer="94"/>
<rectangle x1="92.6465" y1="34.1249" x2="92.7227" y2="34.1503" layer="94"/>
<rectangle x1="92.7481" y1="34.1249" x2="93.1291" y2="34.1503" layer="94"/>
<rectangle x1="93.2307" y1="34.1249" x2="95.8723" y2="34.1503" layer="94"/>
<rectangle x1="96.9645" y1="34.1249" x2="97.2947" y2="34.1503" layer="94"/>
<rectangle x1="97.8027" y1="34.1249" x2="98.3869" y2="34.1503" layer="94"/>
<rectangle x1="87.3887" y1="34.1503" x2="87.4141" y2="34.1757" layer="94"/>
<rectangle x1="91.9607" y1="34.1503" x2="92.0369" y2="34.1757" layer="94"/>
<rectangle x1="92.3163" y1="34.1503" x2="92.5449" y2="34.1757" layer="94"/>
<rectangle x1="92.6719" y1="34.1503" x2="93.1037" y2="34.1757" layer="94"/>
<rectangle x1="93.2053" y1="34.1503" x2="95.9485" y2="34.1757" layer="94"/>
<rectangle x1="96.9391" y1="34.1503" x2="97.2947" y2="34.1757" layer="94"/>
<rectangle x1="97.8027" y1="34.1503" x2="98.3869" y2="34.1757" layer="94"/>
<rectangle x1="87.3887" y1="34.1757" x2="87.4141" y2="34.2011" layer="94"/>
<rectangle x1="92.0115" y1="34.1757" x2="92.0623" y2="34.2011" layer="94"/>
<rectangle x1="92.3417" y1="34.1757" x2="92.5195" y2="34.2011" layer="94"/>
<rectangle x1="92.6973" y1="34.1757" x2="93.0783" y2="34.2011" layer="94"/>
<rectangle x1="93.2053" y1="34.1757" x2="95.9739" y2="34.2011" layer="94"/>
<rectangle x1="97.0153" y1="34.1757" x2="97.2947" y2="34.2011" layer="94"/>
<rectangle x1="97.8281" y1="34.1757" x2="98.4123" y2="34.2011" layer="94"/>
<rectangle x1="87.3887" y1="34.2011" x2="87.4141" y2="34.2265" layer="94"/>
<rectangle x1="92.0369" y1="34.2011" x2="92.0877" y2="34.2265" layer="94"/>
<rectangle x1="92.3163" y1="34.2011" x2="92.5195" y2="34.2265" layer="94"/>
<rectangle x1="92.6719" y1="34.2011" x2="93.0783" y2="34.2265" layer="94"/>
<rectangle x1="93.1799" y1="34.2011" x2="95.9993" y2="34.2265" layer="94"/>
<rectangle x1="96.9899" y1="34.2011" x2="97.2693" y2="34.2265" layer="94"/>
<rectangle x1="97.8281" y1="34.2011" x2="98.4123" y2="34.2265" layer="94"/>
<rectangle x1="87.4141" y1="34.2265" x2="87.4395" y2="34.2519" layer="94"/>
<rectangle x1="92.0877" y1="34.2265" x2="92.1131" y2="34.2519" layer="94"/>
<rectangle x1="92.2909" y1="34.2265" x2="92.4687" y2="34.2519" layer="94"/>
<rectangle x1="92.6719" y1="34.2265" x2="93.0529" y2="34.2519" layer="94"/>
<rectangle x1="93.1799" y1="34.2265" x2="96.0247" y2="34.2519" layer="94"/>
<rectangle x1="97.0153" y1="34.2265" x2="97.2439" y2="34.2519" layer="94"/>
<rectangle x1="97.8281" y1="34.2265" x2="98.4123" y2="34.2519" layer="94"/>
<rectangle x1="87.3887" y1="34.2519" x2="87.4395" y2="34.2773" layer="94"/>
<rectangle x1="92.1131" y1="34.2519" x2="92.1385" y2="34.2773" layer="94"/>
<rectangle x1="92.2655" y1="34.2519" x2="92.4941" y2="34.2773" layer="94"/>
<rectangle x1="92.6465" y1="34.2519" x2="93.0529" y2="34.2773" layer="94"/>
<rectangle x1="93.1545" y1="34.2519" x2="96.0501" y2="34.2773" layer="94"/>
<rectangle x1="97.0153" y1="34.2519" x2="97.2693" y2="34.2773" layer="94"/>
<rectangle x1="97.8535" y1="34.2519" x2="98.4123" y2="34.2773" layer="94"/>
<rectangle x1="87.4141" y1="34.2773" x2="87.4395" y2="34.3027" layer="94"/>
<rectangle x1="92.1385" y1="34.2773" x2="92.1639" y2="34.3027" layer="94"/>
<rectangle x1="92.2401" y1="34.2773" x2="92.4687" y2="34.3027" layer="94"/>
<rectangle x1="92.6465" y1="34.2773" x2="93.0021" y2="34.3027" layer="94"/>
<rectangle x1="93.1545" y1="34.2773" x2="96.0755" y2="34.3027" layer="94"/>
<rectangle x1="97.0153" y1="34.2773" x2="97.2439" y2="34.3027" layer="94"/>
<rectangle x1="97.8535" y1="34.2773" x2="98.4123" y2="34.3027" layer="94"/>
<rectangle x1="87.4141" y1="34.3027" x2="87.4649" y2="34.3281" layer="94"/>
<rectangle x1="92.1639" y1="34.3027" x2="92.4433" y2="34.3281" layer="94"/>
<rectangle x1="92.6211" y1="34.3027" x2="93.0021" y2="34.3281" layer="94"/>
<rectangle x1="93.1291" y1="34.3027" x2="96.1009" y2="34.3281" layer="94"/>
<rectangle x1="96.9899" y1="34.3027" x2="97.2693" y2="34.3281" layer="94"/>
<rectangle x1="97.8535" y1="34.3027" x2="98.3869" y2="34.3281" layer="94"/>
<rectangle x1="87.4141" y1="34.3281" x2="87.4395" y2="34.3535" layer="94"/>
<rectangle x1="92.1893" y1="34.3281" x2="92.4179" y2="34.3535" layer="94"/>
<rectangle x1="92.5957" y1="34.3281" x2="92.9767" y2="34.3535" layer="94"/>
<rectangle x1="93.1545" y1="34.3281" x2="96.1263" y2="34.3535" layer="94"/>
<rectangle x1="97.0153" y1="34.3281" x2="97.2439" y2="34.3535" layer="94"/>
<rectangle x1="97.8535" y1="34.3281" x2="98.3869" y2="34.3535" layer="94"/>
<rectangle x1="87.4395" y1="34.3535" x2="87.4649" y2="34.3789" layer="94"/>
<rectangle x1="92.2147" y1="34.3535" x2="92.3925" y2="34.3789" layer="94"/>
<rectangle x1="92.5703" y1="34.3535" x2="92.9513" y2="34.3789" layer="94"/>
<rectangle x1="93.1291" y1="34.3535" x2="96.1517" y2="34.3789" layer="94"/>
<rectangle x1="96.9391" y1="34.3535" x2="97.2693" y2="34.3789" layer="94"/>
<rectangle x1="97.8535" y1="34.3535" x2="98.3869" y2="34.3789" layer="94"/>
<rectangle x1="98.4123" y1="34.3535" x2="98.5139" y2="34.3789" layer="94"/>
<rectangle x1="87.4395" y1="34.3789" x2="87.4649" y2="34.4043" layer="94"/>
<rectangle x1="92.2401" y1="34.3789" x2="92.3671" y2="34.4043" layer="94"/>
<rectangle x1="92.5449" y1="34.3789" x2="92.9259" y2="34.4043" layer="94"/>
<rectangle x1="93.1037" y1="34.3789" x2="96.1771" y2="34.4043" layer="94"/>
<rectangle x1="96.9137" y1="34.3789" x2="97.2693" y2="34.4043" layer="94"/>
<rectangle x1="97.8281" y1="34.3789" x2="98.5139" y2="34.4043" layer="94"/>
<rectangle x1="87.4395" y1="34.4043" x2="87.4649" y2="34.4297" layer="94"/>
<rectangle x1="92.2655" y1="34.4043" x2="92.3417" y2="34.4297" layer="94"/>
<rectangle x1="92.5195" y1="34.4043" x2="92.9005" y2="34.4297" layer="94"/>
<rectangle x1="93.0783" y1="34.4043" x2="96.2025" y2="34.4297" layer="94"/>
<rectangle x1="96.9391" y1="34.4043" x2="97.2693" y2="34.4297" layer="94"/>
<rectangle x1="97.8281" y1="34.4043" x2="98.5393" y2="34.4297" layer="94"/>
<rectangle x1="87.4649" y1="34.4297" x2="87.4903" y2="34.4551" layer="94"/>
<rectangle x1="92.3163" y1="34.4297" x2="92.3671" y2="34.4551" layer="94"/>
<rectangle x1="92.4941" y1="34.4297" x2="92.8751" y2="34.4551" layer="94"/>
<rectangle x1="93.1037" y1="34.4297" x2="96.2025" y2="34.4551" layer="94"/>
<rectangle x1="96.9137" y1="34.4297" x2="97.2947" y2="34.4551" layer="94"/>
<rectangle x1="97.8281" y1="34.4297" x2="98.5139" y2="34.4551" layer="94"/>
<rectangle x1="87.4395" y1="34.4551" x2="87.4903" y2="34.4805" layer="94"/>
<rectangle x1="92.3417" y1="34.4551" x2="92.3925" y2="34.4805" layer="94"/>
<rectangle x1="92.4687" y1="34.4551" x2="92.9005" y2="34.4805" layer="94"/>
<rectangle x1="93.0783" y1="34.4551" x2="96.2533" y2="34.4805" layer="94"/>
<rectangle x1="96.9391" y1="34.4551" x2="97.3201" y2="34.4805" layer="94"/>
<rectangle x1="97.8027" y1="34.4551" x2="98.5393" y2="34.4805" layer="94"/>
<rectangle x1="87.4649" y1="34.4805" x2="87.4903" y2="34.5059" layer="94"/>
<rectangle x1="92.3925" y1="34.4805" x2="92.4179" y2="34.5059" layer="94"/>
<rectangle x1="92.4687" y1="34.4805" x2="92.8497" y2="34.5059" layer="94"/>
<rectangle x1="93.0529" y1="34.4805" x2="96.2279" y2="34.5059" layer="94"/>
<rectangle x1="96.9645" y1="34.4805" x2="97.3201" y2="34.5059" layer="94"/>
<rectangle x1="97.7773" y1="34.4805" x2="98.5393" y2="34.5059" layer="94"/>
<rectangle x1="87.4903" y1="34.5059" x2="87.5157" y2="34.5313" layer="94"/>
<rectangle x1="92.4179" y1="34.5059" x2="92.8497" y2="34.5313" layer="94"/>
<rectangle x1="93.0275" y1="34.5059" x2="96.2533" y2="34.5313" layer="94"/>
<rectangle x1="96.9391" y1="34.5059" x2="97.3455" y2="34.5313" layer="94"/>
<rectangle x1="97.7519" y1="34.5059" x2="98.5393" y2="34.5313" layer="94"/>
<rectangle x1="92.4433" y1="34.5313" x2="92.8243" y2="34.5567" layer="94"/>
<rectangle x1="93.0529" y1="34.5313" x2="96.2787" y2="34.5567" layer="94"/>
<rectangle x1="97.0661" y1="34.5313" x2="97.3455" y2="34.5567" layer="94"/>
<rectangle x1="97.7265" y1="34.5313" x2="98.5647" y2="34.5567" layer="94"/>
<rectangle x1="87.4903" y1="34.5567" x2="87.5157" y2="34.5821" layer="94"/>
<rectangle x1="92.4687" y1="34.5567" x2="92.7989" y2="34.5821" layer="94"/>
<rectangle x1="93.0275" y1="34.5567" x2="96.3041" y2="34.5821" layer="94"/>
<rectangle x1="97.0661" y1="34.5567" x2="97.4217" y2="34.5821" layer="94"/>
<rectangle x1="97.7011" y1="34.5567" x2="98.5647" y2="34.5821" layer="94"/>
<rectangle x1="87.5157" y1="34.5821" x2="87.5411" y2="34.6075" layer="94"/>
<rectangle x1="92.4941" y1="34.5821" x2="92.5195" y2="34.6075" layer="94"/>
<rectangle x1="92.5449" y1="34.5821" x2="92.7735" y2="34.6075" layer="94"/>
<rectangle x1="93.0021" y1="34.5821" x2="96.2787" y2="34.6075" layer="94"/>
<rectangle x1="97.0915" y1="34.5821" x2="97.4471" y2="34.6075" layer="94"/>
<rectangle x1="97.4725" y1="34.5821" x2="97.4979" y2="34.6075" layer="94"/>
<rectangle x1="97.6249" y1="34.5821" x2="98.5647" y2="34.6075" layer="94"/>
<rectangle x1="87.4903" y1="34.6075" x2="87.5411" y2="34.6329" layer="94"/>
<rectangle x1="92.5195" y1="34.6075" x2="92.7481" y2="34.6329" layer="94"/>
<rectangle x1="92.9767" y1="34.6075" x2="96.3041" y2="34.6329" layer="94"/>
<rectangle x1="97.0915" y1="34.6075" x2="98.5901" y2="34.6329" layer="94"/>
<rectangle x1="87.5157" y1="34.6329" x2="87.5411" y2="34.6583" layer="94"/>
<rectangle x1="92.5449" y1="34.6329" x2="92.5703" y2="34.6583" layer="94"/>
<rectangle x1="92.5957" y1="34.6329" x2="92.7227" y2="34.6583" layer="94"/>
<rectangle x1="93.0021" y1="34.6329" x2="96.3295" y2="34.6583" layer="94"/>
<rectangle x1="97.1169" y1="34.6329" x2="98.5647" y2="34.6583" layer="94"/>
<rectangle x1="87.5411" y1="34.6583" x2="87.5665" y2="34.6837" layer="94"/>
<rectangle x1="92.5703" y1="34.6583" x2="92.6973" y2="34.6837" layer="94"/>
<rectangle x1="92.9767" y1="34.6583" x2="96.3549" y2="34.6837" layer="94"/>
<rectangle x1="97.1169" y1="34.6583" x2="98.5901" y2="34.6837" layer="94"/>
<rectangle x1="87.5411" y1="34.6837" x2="87.5665" y2="34.7091" layer="94"/>
<rectangle x1="92.5957" y1="34.6837" x2="92.6719" y2="34.7091" layer="94"/>
<rectangle x1="93.0021" y1="34.6837" x2="96.3295" y2="34.7091" layer="94"/>
<rectangle x1="97.1169" y1="34.6837" x2="98.5901" y2="34.7091" layer="94"/>
<rectangle x1="87.5411" y1="34.7091" x2="87.5665" y2="34.7345" layer="94"/>
<rectangle x1="92.6211" y1="34.7091" x2="92.6973" y2="34.7345" layer="94"/>
<rectangle x1="92.9767" y1="34.7091" x2="96.3549" y2="34.7345" layer="94"/>
<rectangle x1="97.0915" y1="34.7091" x2="98.5901" y2="34.7345" layer="94"/>
<rectangle x1="87.5665" y1="34.7345" x2="87.5919" y2="34.7599" layer="94"/>
<rectangle x1="92.6719" y1="34.7345" x2="92.7227" y2="34.7599" layer="94"/>
<rectangle x1="93.0021" y1="34.7345" x2="96.3549" y2="34.7599" layer="94"/>
<rectangle x1="97.1169" y1="34.7345" x2="98.6155" y2="34.7599" layer="94"/>
<rectangle x1="87.5411" y1="34.7599" x2="87.5919" y2="34.7853" layer="94"/>
<rectangle x1="92.6719" y1="34.7599" x2="92.7481" y2="34.7853" layer="94"/>
<rectangle x1="92.9767" y1="34.7599" x2="96.3803" y2="34.7853" layer="94"/>
<rectangle x1="97.0915" y1="34.7599" x2="98.6155" y2="34.7853" layer="94"/>
<rectangle x1="87.5665" y1="34.7853" x2="87.5919" y2="34.8107" layer="94"/>
<rectangle x1="92.7227" y1="34.7853" x2="92.7735" y2="34.8107" layer="94"/>
<rectangle x1="92.9767" y1="34.7853" x2="96.3803" y2="34.8107" layer="94"/>
<rectangle x1="97.1423" y1="34.7853" x2="97.2439" y2="34.8107" layer="94"/>
<rectangle x1="97.2693" y1="34.7853" x2="97.2947" y2="34.8107" layer="94"/>
<rectangle x1="97.3201" y1="34.7853" x2="98.6155" y2="34.8107" layer="94"/>
<rectangle x1="87.5919" y1="34.8107" x2="87.6173" y2="34.8361" layer="94"/>
<rectangle x1="92.7481" y1="34.8107" x2="92.7989" y2="34.8361" layer="94"/>
<rectangle x1="92.9767" y1="34.8107" x2="96.3803" y2="34.8361" layer="94"/>
<rectangle x1="97.1931" y1="34.8107" x2="97.2185" y2="34.8361" layer="94"/>
<rectangle x1="97.3455" y1="34.8107" x2="98.6409" y2="34.8361" layer="94"/>
<rectangle x1="92.7989" y1="34.8361" x2="92.8243" y2="34.8615" layer="94"/>
<rectangle x1="92.9767" y1="34.8361" x2="96.3803" y2="34.8615" layer="94"/>
<rectangle x1="97.4217" y1="34.8361" x2="98.6155" y2="34.8615" layer="94"/>
<rectangle x1="87.5919" y1="34.8615" x2="87.6427" y2="34.8869" layer="94"/>
<rectangle x1="92.7735" y1="34.8615" x2="92.8497" y2="34.8869" layer="94"/>
<rectangle x1="92.9767" y1="34.8615" x2="96.4057" y2="34.8869" layer="94"/>
<rectangle x1="97.3963" y1="34.8615" x2="97.6249" y2="34.8869" layer="94"/>
<rectangle x1="97.6503" y1="34.8615" x2="98.6409" y2="34.8869" layer="94"/>
<rectangle x1="87.6173" y1="34.8869" x2="87.6427" y2="34.9123" layer="94"/>
<rectangle x1="92.8243" y1="34.8869" x2="92.8751" y2="34.9123" layer="94"/>
<rectangle x1="92.9767" y1="34.8869" x2="96.4057" y2="34.9123" layer="94"/>
<rectangle x1="97.4217" y1="34.8869" x2="97.5995" y2="34.9123" layer="94"/>
<rectangle x1="97.6757" y1="34.8869" x2="98.6409" y2="34.9123" layer="94"/>
<rectangle x1="87.6173" y1="34.9123" x2="87.6681" y2="34.9377" layer="94"/>
<rectangle x1="92.8497" y1="34.9123" x2="92.9005" y2="34.9377" layer="94"/>
<rectangle x1="92.9767" y1="34.9123" x2="96.4057" y2="34.9377" layer="94"/>
<rectangle x1="97.4471" y1="34.9123" x2="97.5741" y2="34.9377" layer="94"/>
<rectangle x1="97.6757" y1="34.9123" x2="98.6409" y2="34.9377" layer="94"/>
<rectangle x1="87.6427" y1="34.9377" x2="87.6681" y2="34.9631" layer="94"/>
<rectangle x1="92.9005" y1="34.9377" x2="92.9259" y2="34.9631" layer="94"/>
<rectangle x1="92.9513" y1="34.9377" x2="96.4057" y2="34.9631" layer="94"/>
<rectangle x1="97.6757" y1="34.9377" x2="98.6663" y2="34.9631" layer="94"/>
<rectangle x1="87.6427" y1="34.9631" x2="87.6681" y2="34.9885" layer="94"/>
<rectangle x1="92.9005" y1="34.9631" x2="92.9513" y2="34.9885" layer="94"/>
<rectangle x1="92.9767" y1="34.9631" x2="96.4057" y2="34.9885" layer="94"/>
<rectangle x1="97.7011" y1="34.9631" x2="98.6663" y2="34.9885" layer="94"/>
<rectangle x1="87.6681" y1="34.9885" x2="87.6935" y2="35.0139" layer="94"/>
<rectangle x1="92.9513" y1="34.9885" x2="96.4311" y2="35.0139" layer="94"/>
<rectangle x1="97.7011" y1="34.9885" x2="98.6663" y2="35.0139" layer="94"/>
<rectangle x1="87.6681" y1="35.0139" x2="87.7189" y2="35.0393" layer="94"/>
<rectangle x1="92.9513" y1="35.0139" x2="96.4311" y2="35.0393" layer="94"/>
<rectangle x1="97.7011" y1="35.0139" x2="98.6917" y2="35.0393" layer="94"/>
<rectangle x1="93.0021" y1="35.0393" x2="93.0275" y2="35.0647" layer="94"/>
<rectangle x1="93.0529" y1="35.0393" x2="93.0783" y2="35.0647" layer="94"/>
<rectangle x1="93.1037" y1="35.0393" x2="96.4311" y2="35.0647" layer="94"/>
<rectangle x1="97.7265" y1="35.0393" x2="98.6663" y2="35.0647" layer="94"/>
<rectangle x1="87.6935" y1="35.0647" x2="87.7189" y2="35.0901" layer="94"/>
<rectangle x1="92.9767" y1="35.0647" x2="93.0529" y2="35.0901" layer="94"/>
<rectangle x1="93.1291" y1="35.0647" x2="96.5581" y2="35.0901" layer="94"/>
<rectangle x1="96.5835" y1="35.0647" x2="96.6089" y2="35.0901" layer="94"/>
<rectangle x1="96.6343" y1="35.0647" x2="96.6597" y2="35.0901" layer="94"/>
<rectangle x1="97.7265" y1="35.0647" x2="98.6917" y2="35.0901" layer="94"/>
<rectangle x1="87.7189" y1="35.0901" x2="87.7443" y2="35.1155" layer="94"/>
<rectangle x1="90.1065" y1="35.0901" x2="90.1319" y2="35.1155" layer="94"/>
<rectangle x1="90.1573" y1="35.0901" x2="90.3859" y2="35.1155" layer="94"/>
<rectangle x1="90.4113" y1="35.0901" x2="90.4367" y2="35.1155" layer="94"/>
<rectangle x1="93.0275" y1="35.0901" x2="93.0783" y2="35.1155" layer="94"/>
<rectangle x1="93.2053" y1="35.0901" x2="96.7867" y2="35.1155" layer="94"/>
<rectangle x1="96.8121" y1="35.0901" x2="96.8375" y2="35.1155" layer="94"/>
<rectangle x1="96.8629" y1="35.0901" x2="96.8883" y2="35.1155" layer="94"/>
<rectangle x1="96.9137" y1="35.0901" x2="96.9391" y2="35.1155" layer="94"/>
<rectangle x1="97.7265" y1="35.0901" x2="98.6917" y2="35.1155" layer="94"/>
<rectangle x1="87.7189" y1="35.1155" x2="87.7697" y2="35.1409" layer="94"/>
<rectangle x1="89.9795" y1="35.1155" x2="90.5129" y2="35.1409" layer="94"/>
<rectangle x1="90.5383" y1="35.1155" x2="90.5637" y2="35.1409" layer="94"/>
<rectangle x1="93.0275" y1="35.1155" x2="93.1037" y2="35.1409" layer="94"/>
<rectangle x1="93.2815" y1="35.1155" x2="97.1677" y2="35.1409" layer="94"/>
<rectangle x1="97.1931" y1="35.1155" x2="97.2185" y2="35.1409" layer="94"/>
<rectangle x1="97.2439" y1="35.1155" x2="97.2693" y2="35.1409" layer="94"/>
<rectangle x1="97.2947" y1="35.1155" x2="97.3201" y2="35.1409" layer="94"/>
<rectangle x1="97.8027" y1="35.1155" x2="97.8281" y2="35.1409" layer="94"/>
<rectangle x1="97.8535" y1="35.1155" x2="97.8789" y2="35.1409" layer="94"/>
<rectangle x1="97.9043" y1="35.1155" x2="97.9297" y2="35.1409" layer="94"/>
<rectangle x1="97.9551" y1="35.1155" x2="98.6917" y2="35.1409" layer="94"/>
<rectangle x1="89.9541" y1="35.1409" x2="90.5891" y2="35.1663" layer="94"/>
<rectangle x1="90.6145" y1="35.1409" x2="90.6399" y2="35.1663" layer="94"/>
<rectangle x1="93.0783" y1="35.1409" x2="93.1037" y2="35.1663" layer="94"/>
<rectangle x1="93.3577" y1="35.1409" x2="96.4311" y2="35.1663" layer="94"/>
<rectangle x1="96.5581" y1="35.1409" x2="96.5835" y2="35.1663" layer="94"/>
<rectangle x1="96.6089" y1="35.1409" x2="96.6343" y2="35.1663" layer="94"/>
<rectangle x1="96.6597" y1="35.1409" x2="96.6851" y2="35.1663" layer="94"/>
<rectangle x1="96.7105" y1="35.1409" x2="97.3963" y2="35.1663" layer="94"/>
<rectangle x1="97.4217" y1="35.1409" x2="97.4471" y2="35.1663" layer="94"/>
<rectangle x1="97.4725" y1="35.1409" x2="97.4979" y2="35.1663" layer="94"/>
<rectangle x1="97.5233" y1="35.1409" x2="97.5487" y2="35.1663" layer="94"/>
<rectangle x1="98.1837" y1="35.1409" x2="98.2091" y2="35.1663" layer="94"/>
<rectangle x1="98.2345" y1="35.1409" x2="98.2599" y2="35.1663" layer="94"/>
<rectangle x1="98.3361" y1="35.1409" x2="98.3615" y2="35.1663" layer="94"/>
<rectangle x1="98.3869" y1="35.1409" x2="98.4123" y2="35.1663" layer="94"/>
<rectangle x1="98.4377" y1="35.1409" x2="98.7171" y2="35.1663" layer="94"/>
<rectangle x1="87.7443" y1="35.1663" x2="87.7697" y2="35.1917" layer="94"/>
<rectangle x1="89.8525" y1="35.1663" x2="90.7161" y2="35.1917" layer="94"/>
<rectangle x1="93.0783" y1="35.1663" x2="93.1545" y2="35.1917" layer="94"/>
<rectangle x1="93.3577" y1="35.1663" x2="96.4311" y2="35.1917" layer="94"/>
<rectangle x1="96.7867" y1="35.1663" x2="96.8121" y2="35.1917" layer="94"/>
<rectangle x1="96.8375" y1="35.1663" x2="96.8629" y2="35.1917" layer="94"/>
<rectangle x1="96.8883" y1="35.1663" x2="96.9137" y2="35.1917" layer="94"/>
<rectangle x1="96.9391" y1="35.1663" x2="97.8281" y2="35.1917" layer="94"/>
<rectangle x1="97.8535" y1="35.1663" x2="97.8789" y2="35.1917" layer="94"/>
<rectangle x1="97.9043" y1="35.1663" x2="97.9297" y2="35.1917" layer="94"/>
<rectangle x1="98.4631" y1="35.1663" x2="98.7171" y2="35.1917" layer="94"/>
<rectangle x1="87.7697" y1="35.1917" x2="87.7951" y2="35.2171" layer="94"/>
<rectangle x1="89.8017" y1="35.1917" x2="90.7923" y2="35.2171" layer="94"/>
<rectangle x1="93.1037" y1="35.1917" x2="93.1291" y2="35.2171" layer="94"/>
<rectangle x1="93.3577" y1="35.1917" x2="96.4311" y2="35.2171" layer="94"/>
<rectangle x1="97.1677" y1="35.1917" x2="97.1931" y2="35.2171" layer="94"/>
<rectangle x1="97.2185" y1="35.1917" x2="97.2439" y2="35.2171" layer="94"/>
<rectangle x1="97.2693" y1="35.1917" x2="97.2947" y2="35.2171" layer="94"/>
<rectangle x1="97.3201" y1="35.1917" x2="98.0059" y2="35.2171" layer="94"/>
<rectangle x1="98.0313" y1="35.1917" x2="98.0567" y2="35.2171" layer="94"/>
<rectangle x1="98.0821" y1="35.1917" x2="98.1075" y2="35.2171" layer="94"/>
<rectangle x1="98.1329" y1="35.1917" x2="98.1583" y2="35.2171" layer="94"/>
<rectangle x1="98.1837" y1="35.1917" x2="98.2091" y2="35.2171" layer="94"/>
<rectangle x1="98.2345" y1="35.1917" x2="98.2599" y2="35.2171" layer="94"/>
<rectangle x1="98.2853" y1="35.1917" x2="98.3107" y2="35.2171" layer="94"/>
<rectangle x1="98.5393" y1="35.1917" x2="98.7171" y2="35.2171" layer="94"/>
<rectangle x1="87.7697" y1="35.2171" x2="87.8205" y2="35.2425" layer="94"/>
<rectangle x1="89.7255" y1="35.2171" x2="89.7509" y2="35.2425" layer="94"/>
<rectangle x1="89.7763" y1="35.2171" x2="90.8177" y2="35.2425" layer="94"/>
<rectangle x1="90.8431" y1="35.2171" x2="90.8685" y2="35.2425" layer="94"/>
<rectangle x1="93.1291" y1="35.2171" x2="93.1799" y2="35.2425" layer="94"/>
<rectangle x1="93.3577" y1="35.2171" x2="96.4311" y2="35.2425" layer="94"/>
<rectangle x1="97.4471" y1="35.2171" x2="97.4725" y2="35.2425" layer="94"/>
<rectangle x1="97.4979" y1="35.2171" x2="97.5233" y2="35.2425" layer="94"/>
<rectangle x1="97.5487" y1="35.2171" x2="98.3869" y2="35.2425" layer="94"/>
<rectangle x1="98.4123" y1="35.2171" x2="98.4377" y2="35.2425" layer="94"/>
<rectangle x1="98.6155" y1="35.2171" x2="98.7425" y2="35.2425" layer="94"/>
<rectangle x1="87.7951" y1="35.2425" x2="87.8205" y2="35.2679" layer="94"/>
<rectangle x1="89.7001" y1="35.2425" x2="89.7255" y2="35.2679" layer="94"/>
<rectangle x1="89.7509" y1="35.2425" x2="90.8939" y2="35.2679" layer="94"/>
<rectangle x1="93.1545" y1="35.2425" x2="93.1799" y2="35.2679" layer="94"/>
<rectangle x1="93.3577" y1="35.2425" x2="94.3991" y2="35.2679" layer="94"/>
<rectangle x1="94.4245" y1="35.2425" x2="96.4311" y2="35.2679" layer="94"/>
<rectangle x1="97.8281" y1="35.2425" x2="97.8535" y2="35.2679" layer="94"/>
<rectangle x1="97.8789" y1="35.2425" x2="97.9043" y2="35.2679" layer="94"/>
<rectangle x1="97.9297" y1="35.2425" x2="98.4631" y2="35.2679" layer="94"/>
<rectangle x1="98.6409" y1="35.2425" x2="98.7171" y2="35.2679" layer="94"/>
<rectangle x1="87.7951" y1="35.2679" x2="87.8459" y2="35.2933" layer="94"/>
<rectangle x1="89.6747" y1="35.2679" x2="90.9701" y2="35.2933" layer="94"/>
<rectangle x1="93.1799" y1="35.2679" x2="93.2053" y2="35.2933" layer="94"/>
<rectangle x1="93.3577" y1="35.2679" x2="96.5581" y2="35.2933" layer="94"/>
<rectangle x1="96.5835" y1="35.2679" x2="96.6089" y2="35.2933" layer="94"/>
<rectangle x1="96.6343" y1="35.2679" x2="96.6597" y2="35.2933" layer="94"/>
<rectangle x1="97.9043" y1="35.2679" x2="98.5393" y2="35.2933" layer="94"/>
<rectangle x1="98.6663" y1="35.2679" x2="98.7425" y2="35.2933" layer="94"/>
<rectangle x1="87.8205" y1="35.2933" x2="87.8459" y2="35.3187" layer="94"/>
<rectangle x1="89.6493" y1="35.2933" x2="90.9955" y2="35.3187" layer="94"/>
<rectangle x1="93.2053" y1="35.2933" x2="93.2307" y2="35.3187" layer="94"/>
<rectangle x1="93.3577" y1="35.2933" x2="96.7867" y2="35.3187" layer="94"/>
<rectangle x1="96.8121" y1="35.2933" x2="96.8375" y2="35.3187" layer="94"/>
<rectangle x1="96.8629" y1="35.2933" x2="96.8883" y2="35.3187" layer="94"/>
<rectangle x1="97.8789" y1="35.2933" x2="98.5647" y2="35.3187" layer="94"/>
<rectangle x1="98.7171" y1="35.2933" x2="98.7425" y2="35.3187" layer="94"/>
<rectangle x1="87.8459" y1="35.3187" x2="87.8713" y2="35.3441" layer="94"/>
<rectangle x1="89.5985" y1="35.3187" x2="91.0209" y2="35.3441" layer="94"/>
<rectangle x1="93.2053" y1="35.3187" x2="93.2561" y2="35.3441" layer="94"/>
<rectangle x1="93.3831" y1="35.3187" x2="97.1169" y2="35.3441" layer="94"/>
<rectangle x1="97.1423" y1="35.3187" x2="97.1677" y2="35.3441" layer="94"/>
<rectangle x1="97.1931" y1="35.3187" x2="97.2185" y2="35.3441" layer="94"/>
<rectangle x1="97.8027" y1="35.3187" x2="98.6409" y2="35.3441" layer="94"/>
<rectangle x1="89.5985" y1="35.3441" x2="91.0971" y2="35.3695" layer="94"/>
<rectangle x1="93.3577" y1="35.3441" x2="97.2947" y2="35.3695" layer="94"/>
<rectangle x1="97.3201" y1="35.3441" x2="97.3455" y2="35.3695" layer="94"/>
<rectangle x1="97.3709" y1="35.3441" x2="97.3963" y2="35.3695" layer="94"/>
<rectangle x1="97.7773" y1="35.3441" x2="98.6663" y2="35.3695" layer="94"/>
<rectangle x1="87.8459" y1="35.3695" x2="87.8967" y2="35.3949" layer="94"/>
<rectangle x1="89.5477" y1="35.3695" x2="91.1225" y2="35.3949" layer="94"/>
<rectangle x1="93.2307" y1="35.3695" x2="93.2815" y2="35.3949" layer="94"/>
<rectangle x1="93.3831" y1="35.3695" x2="97.4725" y2="35.3949" layer="94"/>
<rectangle x1="97.7519" y1="35.3695" x2="98.6917" y2="35.3949" layer="94"/>
<rectangle x1="87.8713" y1="35.3949" x2="87.8967" y2="35.4203" layer="94"/>
<rectangle x1="89.5477" y1="35.3949" x2="91.1479" y2="35.4203" layer="94"/>
<rectangle x1="93.2561" y1="35.3949" x2="93.2815" y2="35.4203" layer="94"/>
<rectangle x1="93.3831" y1="35.3949" x2="97.4979" y2="35.4203" layer="94"/>
<rectangle x1="97.7265" y1="35.3949" x2="98.7171" y2="35.4203" layer="94"/>
<rectangle x1="87.8967" y1="35.4203" x2="87.9221" y2="35.4457" layer="94"/>
<rectangle x1="89.5223" y1="35.4203" x2="91.2241" y2="35.4457" layer="94"/>
<rectangle x1="93.2815" y1="35.4203" x2="93.3069" y2="35.4457" layer="94"/>
<rectangle x1="93.3831" y1="35.4203" x2="97.5233" y2="35.4457" layer="94"/>
<rectangle x1="97.7011" y1="35.4203" x2="98.7425" y2="35.4457" layer="94"/>
<rectangle x1="87.9221" y1="35.4457" x2="87.9475" y2="35.4711" layer="94"/>
<rectangle x1="89.4969" y1="35.4457" x2="91.2495" y2="35.4711" layer="94"/>
<rectangle x1="93.3069" y1="35.4457" x2="93.3323" y2="35.4711" layer="94"/>
<rectangle x1="93.3831" y1="35.4457" x2="97.5487" y2="35.4711" layer="94"/>
<rectangle x1="97.6757" y1="35.4457" x2="98.7679" y2="35.4711" layer="94"/>
<rectangle x1="87.9221" y1="35.4711" x2="87.9729" y2="35.4965" layer="94"/>
<rectangle x1="89.4715" y1="35.4711" x2="91.2749" y2="35.4965" layer="94"/>
<rectangle x1="93.2815" y1="35.4711" x2="93.3323" y2="35.4965" layer="94"/>
<rectangle x1="93.3831" y1="35.4711" x2="97.5741" y2="35.4965" layer="94"/>
<rectangle x1="97.6503" y1="35.4711" x2="98.7933" y2="35.4965" layer="94"/>
<rectangle x1="87.9475" y1="35.4965" x2="87.9729" y2="35.5219" layer="94"/>
<rectangle x1="89.4715" y1="35.4965" x2="91.3003" y2="35.5219" layer="94"/>
<rectangle x1="93.3069" y1="35.4965" x2="93.3323" y2="35.5219" layer="94"/>
<rectangle x1="93.4085" y1="35.4965" x2="97.5487" y2="35.5219" layer="94"/>
<rectangle x1="97.6249" y1="35.4965" x2="98.8187" y2="35.5219" layer="94"/>
<rectangle x1="87.9475" y1="35.5219" x2="87.9729" y2="35.5473" layer="94"/>
<rectangle x1="89.4715" y1="35.5219" x2="91.3765" y2="35.5473" layer="94"/>
<rectangle x1="93.3323" y1="35.5219" x2="93.3577" y2="35.5473" layer="94"/>
<rectangle x1="93.3831" y1="35.5219" x2="97.5741" y2="35.5473" layer="94"/>
<rectangle x1="97.6249" y1="35.5219" x2="98.8441" y2="35.5473" layer="94"/>
<rectangle x1="87.9729" y1="35.5473" x2="87.9983" y2="35.5727" layer="94"/>
<rectangle x1="89.4461" y1="35.5473" x2="91.4019" y2="35.5727" layer="94"/>
<rectangle x1="93.4085" y1="35.5473" x2="94.3483" y2="35.5727" layer="94"/>
<rectangle x1="94.3737" y1="35.5473" x2="97.5741" y2="35.5727" layer="94"/>
<rectangle x1="97.6249" y1="35.5473" x2="98.8187" y2="35.5727" layer="94"/>
<rectangle x1="87.9983" y1="35.5727" x2="88.0237" y2="35.5981" layer="94"/>
<rectangle x1="89.4461" y1="35.5727" x2="91.4273" y2="35.5981" layer="94"/>
<rectangle x1="93.3323" y1="35.5727" x2="93.3577" y2="35.5981" layer="94"/>
<rectangle x1="93.3831" y1="35.5727" x2="97.5741" y2="35.5981" layer="94"/>
<rectangle x1="97.5995" y1="35.5727" x2="98.1837" y2="35.5981" layer="94"/>
<rectangle x1="98.2091" y1="35.5727" x2="98.2345" y2="35.5981" layer="94"/>
<rectangle x1="98.2599" y1="35.5727" x2="98.8441" y2="35.5981" layer="94"/>
<rectangle x1="88.0237" y1="35.5981" x2="88.0491" y2="35.6235" layer="94"/>
<rectangle x1="89.4461" y1="35.5981" x2="91.4527" y2="35.6235" layer="94"/>
<rectangle x1="93.3577" y1="35.5981" x2="93.3831" y2="35.6235" layer="94"/>
<rectangle x1="93.4085" y1="35.5981" x2="94.3483" y2="35.6235" layer="94"/>
<rectangle x1="94.3737" y1="35.5981" x2="98.0567" y2="35.6235" layer="94"/>
<rectangle x1="98.0821" y1="35.5981" x2="98.1075" y2="35.6235" layer="94"/>
<rectangle x1="98.3361" y1="35.5981" x2="98.8695" y2="35.6235" layer="94"/>
<rectangle x1="87.9983" y1="35.6235" x2="88.0745" y2="35.6489" layer="94"/>
<rectangle x1="89.4207" y1="35.6235" x2="91.4781" y2="35.6489" layer="94"/>
<rectangle x1="93.3577" y1="35.6235" x2="98.0313" y2="35.6489" layer="94"/>
<rectangle x1="98.3615" y1="35.6235" x2="98.8949" y2="35.6489" layer="94"/>
<rectangle x1="89.4461" y1="35.6489" x2="91.5035" y2="35.6743" layer="94"/>
<rectangle x1="93.3577" y1="35.6489" x2="93.3831" y2="35.6743" layer="94"/>
<rectangle x1="93.4085" y1="35.6489" x2="98.0059" y2="35.6743" layer="94"/>
<rectangle x1="98.4377" y1="35.6489" x2="98.8695" y2="35.6743" layer="94"/>
<rectangle x1="88.0491" y1="35.6743" x2="88.0745" y2="35.6997" layer="94"/>
<rectangle x1="89.4207" y1="35.6743" x2="91.5543" y2="35.6997" layer="94"/>
<rectangle x1="93.3577" y1="35.6743" x2="97.9805" y2="35.6997" layer="94"/>
<rectangle x1="98.4377" y1="35.6743" x2="98.8949" y2="35.6997" layer="94"/>
<rectangle x1="88.0745" y1="35.6997" x2="88.0999" y2="35.7251" layer="94"/>
<rectangle x1="89.4461" y1="35.6997" x2="91.5543" y2="35.7251" layer="94"/>
<rectangle x1="93.3577" y1="35.6997" x2="93.3831" y2="35.7251" layer="94"/>
<rectangle x1="93.4085" y1="35.6997" x2="97.9551" y2="35.7251" layer="94"/>
<rectangle x1="98.4631" y1="35.6997" x2="98.8949" y2="35.7251" layer="94"/>
<rectangle x1="88.0999" y1="35.7251" x2="88.1253" y2="35.7505" layer="94"/>
<rectangle x1="89.4207" y1="35.7251" x2="91.6051" y2="35.7505" layer="94"/>
<rectangle x1="93.3831" y1="35.7251" x2="97.9297" y2="35.7505" layer="94"/>
<rectangle x1="98.4631" y1="35.7251" x2="98.8949" y2="35.7505" layer="94"/>
<rectangle x1="88.1253" y1="35.7505" x2="88.1507" y2="35.7759" layer="94"/>
<rectangle x1="89.4461" y1="35.7505" x2="91.6051" y2="35.7759" layer="94"/>
<rectangle x1="93.3831" y1="35.7505" x2="97.9043" y2="35.7759" layer="94"/>
<rectangle x1="98.4885" y1="35.7505" x2="98.9203" y2="35.7759" layer="94"/>
<rectangle x1="88.1253" y1="35.7759" x2="88.1761" y2="35.8013" layer="94"/>
<rectangle x1="89.4207" y1="35.7759" x2="91.6559" y2="35.8013" layer="94"/>
<rectangle x1="93.3831" y1="35.7759" x2="97.9297" y2="35.8013" layer="94"/>
<rectangle x1="98.5139" y1="35.7759" x2="98.9203" y2="35.8013" layer="94"/>
<rectangle x1="88.1253" y1="35.8013" x2="88.1507" y2="35.8267" layer="94"/>
<rectangle x1="89.4461" y1="35.8013" x2="91.6813" y2="35.8267" layer="94"/>
<rectangle x1="93.4085" y1="35.8013" x2="97.4979" y2="35.8267" layer="94"/>
<rectangle x1="97.5233" y1="35.8013" x2="97.9043" y2="35.8267" layer="94"/>
<rectangle x1="98.5139" y1="35.8013" x2="98.9203" y2="35.8267" layer="94"/>
<rectangle x1="88.1507" y1="35.8267" x2="88.2015" y2="35.8521" layer="94"/>
<rectangle x1="89.4207" y1="35.8267" x2="91.7067" y2="35.8521" layer="94"/>
<rectangle x1="93.3831" y1="35.8267" x2="97.9043" y2="35.8521" layer="94"/>
<rectangle x1="98.5139" y1="35.8267" x2="98.9203" y2="35.8521" layer="94"/>
<rectangle x1="88.1761" y1="35.8521" x2="88.2015" y2="35.8775" layer="94"/>
<rectangle x1="89.4461" y1="35.8521" x2="91.7321" y2="35.8775" layer="94"/>
<rectangle x1="93.4085" y1="35.8521" x2="94.3991" y2="35.8775" layer="94"/>
<rectangle x1="94.4245" y1="35.8521" x2="96.2279" y2="35.8775" layer="94"/>
<rectangle x1="96.3041" y1="35.8521" x2="96.3295" y2="35.8775" layer="94"/>
<rectangle x1="96.3549" y1="35.8521" x2="96.3803" y2="35.8775" layer="94"/>
<rectangle x1="96.4057" y1="35.8521" x2="97.9043" y2="35.8775" layer="94"/>
<rectangle x1="98.5393" y1="35.8521" x2="98.9203" y2="35.8775" layer="94"/>
<rectangle x1="88.2015" y1="35.8775" x2="88.2269" y2="35.9029" layer="94"/>
<rectangle x1="89.4207" y1="35.8775" x2="91.7829" y2="35.9029" layer="94"/>
<rectangle x1="93.4085" y1="35.8775" x2="96.2025" y2="35.9029" layer="94"/>
<rectangle x1="96.5327" y1="35.8775" x2="96.5581" y2="35.9029" layer="94"/>
<rectangle x1="96.5835" y1="35.8775" x2="96.6089" y2="35.9029" layer="94"/>
<rectangle x1="96.6343" y1="35.8775" x2="97.8789" y2="35.9029" layer="94"/>
<rectangle x1="98.5139" y1="35.8775" x2="98.9457" y2="35.9029" layer="94"/>
<rectangle x1="88.2269" y1="35.9029" x2="88.2523" y2="35.9283" layer="94"/>
<rectangle x1="89.4461" y1="35.9029" x2="91.7575" y2="35.9283" layer="94"/>
<rectangle x1="93.4085" y1="35.9029" x2="96.1771" y2="35.9283" layer="94"/>
<rectangle x1="96.8629" y1="35.9029" x2="96.8883" y2="35.9283" layer="94"/>
<rectangle x1="96.9137" y1="35.9029" x2="96.9391" y2="35.9283" layer="94"/>
<rectangle x1="96.9645" y1="35.9029" x2="97.9043" y2="35.9283" layer="94"/>
<rectangle x1="98.5393" y1="35.9029" x2="98.9203" y2="35.9283" layer="94"/>
<rectangle x1="88.2269" y1="35.9283" x2="88.2777" y2="35.9537" layer="94"/>
<rectangle x1="89.4207" y1="35.9283" x2="91.8083" y2="35.9537" layer="94"/>
<rectangle x1="93.4085" y1="35.9283" x2="96.2025" y2="35.9537" layer="94"/>
<rectangle x1="96.2279" y1="35.9283" x2="96.2533" y2="35.9537" layer="94"/>
<rectangle x1="96.2787" y1="35.9283" x2="96.3041" y2="35.9537" layer="94"/>
<rectangle x1="97.0915" y1="35.9283" x2="97.1169" y2="35.9537" layer="94"/>
<rectangle x1="97.1423" y1="35.9283" x2="97.1677" y2="35.9537" layer="94"/>
<rectangle x1="97.1931" y1="35.9283" x2="97.8789" y2="35.9537" layer="94"/>
<rectangle x1="98.5139" y1="35.9283" x2="98.9457" y2="35.9537" layer="94"/>
<rectangle x1="88.2269" y1="35.9537" x2="88.2777" y2="35.9791" layer="94"/>
<rectangle x1="89.4461" y1="35.9537" x2="91.8083" y2="35.9791" layer="94"/>
<rectangle x1="93.4085" y1="35.9537" x2="96.4311" y2="35.9791" layer="94"/>
<rectangle x1="96.4565" y1="35.9537" x2="96.4819" y2="35.9791" layer="94"/>
<rectangle x1="96.5073" y1="35.9537" x2="96.5327" y2="35.9791" layer="94"/>
<rectangle x1="97.4725" y1="35.9537" x2="97.4979" y2="35.9791" layer="94"/>
<rectangle x1="97.5233" y1="35.9537" x2="97.9043" y2="35.9791" layer="94"/>
<rectangle x1="98.5393" y1="35.9537" x2="98.9203" y2="35.9791" layer="94"/>
<rectangle x1="88.2269" y1="35.9791" x2="88.3031" y2="36.0045" layer="94"/>
<rectangle x1="89.4461" y1="35.9791" x2="91.8337" y2="36.0045" layer="94"/>
<rectangle x1="93.4085" y1="35.9791" x2="96.7613" y2="36.0045" layer="94"/>
<rectangle x1="96.7867" y1="35.9791" x2="96.8121" y2="36.0045" layer="94"/>
<rectangle x1="96.8375" y1="35.9791" x2="96.8629" y2="36.0045" layer="94"/>
<rectangle x1="97.5233" y1="35.9791" x2="97.9043" y2="36.0045" layer="94"/>
<rectangle x1="98.5139" y1="35.9791" x2="98.9203" y2="36.0045" layer="94"/>
<rectangle x1="88.2269" y1="36.0045" x2="88.3285" y2="36.0299" layer="94"/>
<rectangle x1="89.4461" y1="36.0045" x2="91.8591" y2="36.0299" layer="94"/>
<rectangle x1="93.4085" y1="36.0045" x2="96.9899" y2="36.0299" layer="94"/>
<rectangle x1="97.0153" y1="36.0045" x2="97.0407" y2="36.0299" layer="94"/>
<rectangle x1="97.0661" y1="36.0045" x2="97.0915" y2="36.0299" layer="94"/>
<rectangle x1="97.5233" y1="36.0045" x2="97.9043" y2="36.0299" layer="94"/>
<rectangle x1="98.4885" y1="36.0045" x2="98.9203" y2="36.0299" layer="94"/>
<rectangle x1="88.2015" y1="36.0299" x2="88.3285" y2="36.0553" layer="94"/>
<rectangle x1="89.4715" y1="36.0299" x2="91.8845" y2="36.0553" layer="94"/>
<rectangle x1="93.4339" y1="36.0299" x2="97.2693" y2="36.0553" layer="94"/>
<rectangle x1="97.2947" y1="36.0299" x2="97.3201" y2="36.0553" layer="94"/>
<rectangle x1="97.3455" y1="36.0299" x2="97.3709" y2="36.0553" layer="94"/>
<rectangle x1="97.5233" y1="36.0299" x2="97.9297" y2="36.0553" layer="94"/>
<rectangle x1="98.4885" y1="36.0299" x2="98.9203" y2="36.0553" layer="94"/>
<rectangle x1="88.2269" y1="36.0553" x2="88.3539" y2="36.0807" layer="94"/>
<rectangle x1="89.4715" y1="36.0553" x2="91.9099" y2="36.0807" layer="94"/>
<rectangle x1="93.4339" y1="36.0553" x2="94.3991" y2="36.0807" layer="94"/>
<rectangle x1="94.4245" y1="36.0553" x2="97.4979" y2="36.0807" layer="94"/>
<rectangle x1="97.5233" y1="36.0553" x2="97.9297" y2="36.0807" layer="94"/>
<rectangle x1="98.4885" y1="36.0553" x2="98.9203" y2="36.0807" layer="94"/>
<rectangle x1="88.2015" y1="36.0807" x2="88.3793" y2="36.1061" layer="94"/>
<rectangle x1="89.4715" y1="36.0807" x2="91.9353" y2="36.1061" layer="94"/>
<rectangle x1="93.4339" y1="36.0807" x2="97.9805" y2="36.1061" layer="94"/>
<rectangle x1="98.4631" y1="36.0807" x2="98.8949" y2="36.1061" layer="94"/>
<rectangle x1="88.1761" y1="36.1061" x2="88.4047" y2="36.1315" layer="94"/>
<rectangle x1="89.4969" y1="36.1061" x2="91.9607" y2="36.1315" layer="94"/>
<rectangle x1="93.4339" y1="36.1061" x2="97.9551" y2="36.1315" layer="94"/>
<rectangle x1="98.4377" y1="36.1061" x2="98.8949" y2="36.1315" layer="94"/>
<rectangle x1="88.2015" y1="36.1315" x2="88.4301" y2="36.1569" layer="94"/>
<rectangle x1="89.4969" y1="36.1315" x2="91.9861" y2="36.1569" layer="94"/>
<rectangle x1="93.4339" y1="36.1315" x2="98.0059" y2="36.1569" layer="94"/>
<rectangle x1="98.4123" y1="36.1315" x2="98.8949" y2="36.1569" layer="94"/>
<rectangle x1="88.1761" y1="36.1569" x2="88.4555" y2="36.1823" layer="94"/>
<rectangle x1="89.5223" y1="36.1569" x2="92.0115" y2="36.1823" layer="94"/>
<rectangle x1="93.4339" y1="36.1569" x2="98.0059" y2="36.1823" layer="94"/>
<rectangle x1="98.3869" y1="36.1569" x2="98.8695" y2="36.1823" layer="94"/>
<rectangle x1="88.1507" y1="36.1823" x2="88.4809" y2="36.2077" layer="94"/>
<rectangle x1="89.5223" y1="36.1823" x2="92.0369" y2="36.2077" layer="94"/>
<rectangle x1="93.4339" y1="36.1823" x2="98.0821" y2="36.2077" layer="94"/>
<rectangle x1="98.3107" y1="36.1823" x2="98.8695" y2="36.2077" layer="94"/>
<rectangle x1="88.1761" y1="36.2077" x2="88.4809" y2="36.2331" layer="94"/>
<rectangle x1="89.5477" y1="36.2077" x2="92.0369" y2="36.2331" layer="94"/>
<rectangle x1="93.4339" y1="36.2077" x2="98.1583" y2="36.2331" layer="94"/>
<rectangle x1="98.1837" y1="36.2077" x2="98.2091" y2="36.2331" layer="94"/>
<rectangle x1="98.2345" y1="36.2077" x2="98.2599" y2="36.2331" layer="94"/>
<rectangle x1="98.2853" y1="36.2077" x2="98.8441" y2="36.2331" layer="94"/>
<rectangle x1="88.1507" y1="36.2331" x2="88.5063" y2="36.2585" layer="94"/>
<rectangle x1="89.5223" y1="36.2331" x2="92.0623" y2="36.2585" layer="94"/>
<rectangle x1="93.4339" y1="36.2331" x2="98.8441" y2="36.2585" layer="94"/>
<rectangle x1="88.1761" y1="36.2585" x2="88.5063" y2="36.2839" layer="94"/>
<rectangle x1="89.5477" y1="36.2585" x2="92.0623" y2="36.2839" layer="94"/>
<rectangle x1="93.4593" y1="36.2585" x2="98.8187" y2="36.2839" layer="94"/>
<rectangle x1="88.1507" y1="36.2839" x2="88.5317" y2="36.3093" layer="94"/>
<rectangle x1="89.5731" y1="36.2839" x2="92.0877" y2="36.3093" layer="94"/>
<rectangle x1="93.4339" y1="36.2839" x2="98.8187" y2="36.3093" layer="94"/>
<rectangle x1="88.1507" y1="36.3093" x2="88.5571" y2="36.3347" layer="94"/>
<rectangle x1="89.5731" y1="36.3093" x2="92.1131" y2="36.3347" layer="94"/>
<rectangle x1="93.4593" y1="36.3093" x2="95.8215" y2="36.3347" layer="94"/>
<rectangle x1="96.0501" y1="36.3093" x2="96.0755" y2="36.3347" layer="94"/>
<rectangle x1="96.1009" y1="36.3093" x2="96.1263" y2="36.3347" layer="94"/>
<rectangle x1="96.1517" y1="36.3093" x2="96.1771" y2="36.3347" layer="94"/>
<rectangle x1="96.2025" y1="36.3093" x2="98.7933" y2="36.3347" layer="94"/>
<rectangle x1="88.1507" y1="36.3347" x2="88.5825" y2="36.3601" layer="94"/>
<rectangle x1="89.5731" y1="36.3347" x2="92.1385" y2="36.3601" layer="94"/>
<rectangle x1="93.4339" y1="36.3347" x2="95.7961" y2="36.3601" layer="94"/>
<rectangle x1="95.8215" y1="36.3347" x2="95.8469" y2="36.3601" layer="94"/>
<rectangle x1="95.8723" y1="36.3347" x2="95.8977" y2="36.3601" layer="94"/>
<rectangle x1="96.3295" y1="36.3347" x2="96.3549" y2="36.3601" layer="94"/>
<rectangle x1="96.3803" y1="36.3347" x2="96.4057" y2="36.3601" layer="94"/>
<rectangle x1="96.4311" y1="36.3347" x2="96.4565" y2="36.3601" layer="94"/>
<rectangle x1="96.4819" y1="36.3347" x2="98.7933" y2="36.3601" layer="94"/>
<rectangle x1="88.1253" y1="36.3601" x2="88.6079" y2="36.3855" layer="94"/>
<rectangle x1="89.5985" y1="36.3601" x2="92.1385" y2="36.3855" layer="94"/>
<rectangle x1="93.4593" y1="36.3601" x2="95.9739" y2="36.3855" layer="94"/>
<rectangle x1="95.9993" y1="36.3601" x2="96.0247" y2="36.3855" layer="94"/>
<rectangle x1="96.0501" y1="36.3601" x2="96.0755" y2="36.3855" layer="94"/>
<rectangle x1="96.1009" y1="36.3601" x2="96.1263" y2="36.3855" layer="94"/>
<rectangle x1="96.1517" y1="36.3601" x2="96.1771" y2="36.3855" layer="94"/>
<rectangle x1="96.7613" y1="36.3601" x2="96.7867" y2="36.3855" layer="94"/>
<rectangle x1="96.8121" y1="36.3601" x2="96.8375" y2="36.3855" layer="94"/>
<rectangle x1="96.8629" y1="36.3601" x2="96.8883" y2="36.3855" layer="94"/>
<rectangle x1="96.9137" y1="36.3601" x2="98.7425" y2="36.3855" layer="94"/>
<rectangle x1="88.1507" y1="36.3855" x2="88.6333" y2="36.4109" layer="94"/>
<rectangle x1="89.6239" y1="36.3855" x2="92.1639" y2="36.4109" layer="94"/>
<rectangle x1="93.4339" y1="36.3855" x2="96.5073" y2="36.4109" layer="94"/>
<rectangle x1="96.5327" y1="36.3855" x2="96.5581" y2="36.4109" layer="94"/>
<rectangle x1="96.5835" y1="36.3855" x2="96.6089" y2="36.4109" layer="94"/>
<rectangle x1="96.6343" y1="36.3855" x2="96.6597" y2="36.4109" layer="94"/>
<rectangle x1="97.0407" y1="36.3855" x2="97.0661" y2="36.4109" layer="94"/>
<rectangle x1="97.0915" y1="36.3855" x2="97.1169" y2="36.4109" layer="94"/>
<rectangle x1="97.1423" y1="36.3855" x2="97.1677" y2="36.4109" layer="94"/>
<rectangle x1="97.1931" y1="36.3855" x2="98.7425" y2="36.4109" layer="94"/>
<rectangle x1="88.1253" y1="36.4109" x2="88.6587" y2="36.4363" layer="94"/>
<rectangle x1="89.6239" y1="36.4109" x2="92.1639" y2="36.4363" layer="94"/>
<rectangle x1="93.4085" y1="36.4109" x2="93.4339" y2="36.4363" layer="94"/>
<rectangle x1="93.4593" y1="36.4109" x2="95.8723" y2="36.4363" layer="94"/>
<rectangle x1="95.8977" y1="36.4109" x2="96.7867" y2="36.4363" layer="94"/>
<rectangle x1="96.8121" y1="36.4109" x2="96.8375" y2="36.4363" layer="94"/>
<rectangle x1="96.8629" y1="36.4109" x2="96.8883" y2="36.4363" layer="94"/>
<rectangle x1="96.9137" y1="36.4109" x2="96.9391" y2="36.4363" layer="94"/>
<rectangle x1="97.4725" y1="36.4109" x2="97.4979" y2="36.4363" layer="94"/>
<rectangle x1="97.5233" y1="36.4109" x2="97.5487" y2="36.4363" layer="94"/>
<rectangle x1="97.5741" y1="36.4109" x2="97.5995" y2="36.4363" layer="94"/>
<rectangle x1="97.6249" y1="36.4109" x2="98.7171" y2="36.4363" layer="94"/>
<rectangle x1="88.1507" y1="36.4363" x2="88.6841" y2="36.4617" layer="94"/>
<rectangle x1="89.6239" y1="36.4363" x2="92.1893" y2="36.4617" layer="94"/>
<rectangle x1="93.4339" y1="36.4363" x2="93.4593" y2="36.4617" layer="94"/>
<rectangle x1="93.4847" y1="36.4363" x2="95.8977" y2="36.4617" layer="94"/>
<rectangle x1="96.0247" y1="36.4363" x2="96.0501" y2="36.4617" layer="94"/>
<rectangle x1="96.0755" y1="36.4363" x2="96.1009" y2="36.4617" layer="94"/>
<rectangle x1="96.1263" y1="36.4363" x2="96.1517" y2="36.4617" layer="94"/>
<rectangle x1="96.1771" y1="36.4363" x2="97.2693" y2="36.4617" layer="94"/>
<rectangle x1="97.2947" y1="36.4363" x2="97.3201" y2="36.4617" layer="94"/>
<rectangle x1="97.3455" y1="36.4363" x2="97.3709" y2="36.4617" layer="94"/>
<rectangle x1="97.3963" y1="36.4363" x2="97.4217" y2="36.4617" layer="94"/>
<rectangle x1="97.7519" y1="36.4363" x2="98.6917" y2="36.4617" layer="94"/>
<rectangle x1="88.1253" y1="36.4617" x2="88.7095" y2="36.4871" layer="94"/>
<rectangle x1="89.6493" y1="36.4617" x2="92.1893" y2="36.4871" layer="94"/>
<rectangle x1="93.4085" y1="36.4617" x2="93.4339" y2="36.4871" layer="94"/>
<rectangle x1="93.4593" y1="36.4617" x2="95.8977" y2="36.4871" layer="94"/>
<rectangle x1="96.5073" y1="36.4617" x2="96.5327" y2="36.4871" layer="94"/>
<rectangle x1="96.5581" y1="36.4617" x2="96.5835" y2="36.4871" layer="94"/>
<rectangle x1="96.6089" y1="36.4617" x2="96.6343" y2="36.4871" layer="94"/>
<rectangle x1="96.6597" y1="36.4617" x2="97.5487" y2="36.4871" layer="94"/>
<rectangle x1="97.5741" y1="36.4617" x2="97.5995" y2="36.4871" layer="94"/>
<rectangle x1="97.6249" y1="36.4617" x2="97.6503" y2="36.4871" layer="94"/>
<rectangle x1="97.6757" y1="36.4617" x2="97.7011" y2="36.4871" layer="94"/>
<rectangle x1="97.8027" y1="36.4617" x2="98.6155" y2="36.4871" layer="94"/>
<rectangle x1="88.1507" y1="36.4871" x2="88.7349" y2="36.5125" layer="94"/>
<rectangle x1="89.6747" y1="36.4871" x2="92.2147" y2="36.5125" layer="94"/>
<rectangle x1="93.4085" y1="36.4871" x2="93.4593" y2="36.5125" layer="94"/>
<rectangle x1="93.4847" y1="36.4871" x2="95.9485" y2="36.5125" layer="94"/>
<rectangle x1="96.7867" y1="36.4871" x2="96.8121" y2="36.5125" layer="94"/>
<rectangle x1="96.8375" y1="36.4871" x2="96.8629" y2="36.5125" layer="94"/>
<rectangle x1="96.8883" y1="36.4871" x2="96.9137" y2="36.5125" layer="94"/>
<rectangle x1="96.9391" y1="36.4871" x2="96.9645" y2="36.5125" layer="94"/>
<rectangle x1="96.9899" y1="36.4871" x2="98.5901" y2="36.5125" layer="94"/>
<rectangle x1="88.1253" y1="36.5125" x2="88.7349" y2="36.5379" layer="94"/>
<rectangle x1="89.7001" y1="36.5125" x2="92.2147" y2="36.5379" layer="94"/>
<rectangle x1="93.4085" y1="36.5125" x2="93.4339" y2="36.5379" layer="94"/>
<rectangle x1="93.4847" y1="36.5125" x2="95.9231" y2="36.5379" layer="94"/>
<rectangle x1="97.2693" y1="36.5125" x2="97.2947" y2="36.5379" layer="94"/>
<rectangle x1="97.3201" y1="36.5125" x2="97.3455" y2="36.5379" layer="94"/>
<rectangle x1="97.3709" y1="36.5125" x2="97.3963" y2="36.5379" layer="94"/>
<rectangle x1="97.4217" y1="36.5125" x2="97.4471" y2="36.5379" layer="94"/>
<rectangle x1="97.4725" y1="36.5125" x2="98.5647" y2="36.5379" layer="94"/>
<rectangle x1="88.1507" y1="36.5379" x2="88.7603" y2="36.5633" layer="94"/>
<rectangle x1="89.6747" y1="36.5379" x2="92.2401" y2="36.5633" layer="94"/>
<rectangle x1="93.4085" y1="36.5379" x2="93.4339" y2="36.5633" layer="94"/>
<rectangle x1="93.4847" y1="36.5379" x2="95.9739" y2="36.5633" layer="94"/>
<rectangle x1="97.5995" y1="36.5379" x2="97.6249" y2="36.5633" layer="94"/>
<rectangle x1="97.6503" y1="36.5379" x2="97.6757" y2="36.5633" layer="94"/>
<rectangle x1="97.7011" y1="36.5379" x2="97.7265" y2="36.5633" layer="94"/>
<rectangle x1="97.7519" y1="36.5379" x2="98.5393" y2="36.5633" layer="94"/>
<rectangle x1="88.1253" y1="36.5633" x2="88.7603" y2="36.5887" layer="94"/>
<rectangle x1="89.7001" y1="36.5633" x2="92.2147" y2="36.5887" layer="94"/>
<rectangle x1="93.4085" y1="36.5633" x2="93.4339" y2="36.5887" layer="94"/>
<rectangle x1="93.4847" y1="36.5633" x2="95.9739" y2="36.5887" layer="94"/>
<rectangle x1="97.9805" y1="36.5633" x2="98.0059" y2="36.5887" layer="94"/>
<rectangle x1="98.0313" y1="36.5633" x2="98.4123" y2="36.5887" layer="94"/>
<rectangle x1="88.1507" y1="36.5887" x2="88.8111" y2="36.6141" layer="94"/>
<rectangle x1="89.7255" y1="36.5887" x2="92.2401" y2="36.6141" layer="94"/>
<rectangle x1="93.4085" y1="36.5887" x2="93.4593" y2="36.6141" layer="94"/>
<rectangle x1="93.4847" y1="36.5887" x2="95.9993" y2="36.6141" layer="94"/>
<rectangle x1="98.0567" y1="36.5887" x2="98.0821" y2="36.6141" layer="94"/>
<rectangle x1="98.1075" y1="36.5887" x2="98.3361" y2="36.6141" layer="94"/>
<rectangle x1="98.3615" y1="36.5887" x2="98.3869" y2="36.6141" layer="94"/>
<rectangle x1="88.1507" y1="36.6141" x2="88.8111" y2="36.6395" layer="94"/>
<rectangle x1="89.7509" y1="36.6141" x2="92.2401" y2="36.6395" layer="94"/>
<rectangle x1="93.4085" y1="36.6141" x2="93.4339" y2="36.6395" layer="94"/>
<rectangle x1="93.4847" y1="36.6141" x2="96.0247" y2="36.6395" layer="94"/>
<rectangle x1="88.1507" y1="36.6395" x2="88.8365" y2="36.6649" layer="94"/>
<rectangle x1="89.7509" y1="36.6395" x2="92.2401" y2="36.6649" layer="94"/>
<rectangle x1="93.4085" y1="36.6395" x2="93.4593" y2="36.6649" layer="94"/>
<rectangle x1="93.4847" y1="36.6395" x2="96.0501" y2="36.6649" layer="94"/>
<rectangle x1="88.1761" y1="36.6649" x2="88.8619" y2="36.6903" layer="94"/>
<rectangle x1="89.7763" y1="36.6649" x2="92.2655" y2="36.6903" layer="94"/>
<rectangle x1="93.4085" y1="36.6649" x2="93.4339" y2="36.6903" layer="94"/>
<rectangle x1="93.5101" y1="36.6649" x2="96.0247" y2="36.6903" layer="94"/>
<rectangle x1="88.1507" y1="36.6903" x2="88.8873" y2="36.7157" layer="94"/>
<rectangle x1="89.7763" y1="36.6903" x2="92.2655" y2="36.7157" layer="94"/>
<rectangle x1="93.4339" y1="36.6903" x2="93.4593" y2="36.7157" layer="94"/>
<rectangle x1="93.4847" y1="36.6903" x2="96.0501" y2="36.7157" layer="94"/>
<rectangle x1="88.1761" y1="36.7157" x2="88.9127" y2="36.7411" layer="94"/>
<rectangle x1="89.8017" y1="36.7157" x2="92.2655" y2="36.7411" layer="94"/>
<rectangle x1="93.4085" y1="36.7157" x2="93.4339" y2="36.7411" layer="94"/>
<rectangle x1="93.5101" y1="36.7157" x2="96.0755" y2="36.7411" layer="94"/>
<rectangle x1="88.2015" y1="36.7411" x2="88.9381" y2="36.7665" layer="94"/>
<rectangle x1="89.8271" y1="36.7411" x2="92.2655" y2="36.7665" layer="94"/>
<rectangle x1="93.4339" y1="36.7411" x2="93.4593" y2="36.7665" layer="94"/>
<rectangle x1="93.4847" y1="36.7411" x2="96.1009" y2="36.7665" layer="94"/>
<rectangle x1="88.2015" y1="36.7665" x2="88.9635" y2="36.7919" layer="94"/>
<rectangle x1="89.8525" y1="36.7665" x2="92.2655" y2="36.7919" layer="94"/>
<rectangle x1="93.4085" y1="36.7665" x2="93.4339" y2="36.7919" layer="94"/>
<rectangle x1="93.5101" y1="36.7665" x2="96.0755" y2="36.7919" layer="94"/>
<rectangle x1="88.2015" y1="36.7919" x2="88.9889" y2="36.8173" layer="94"/>
<rectangle x1="89.8525" y1="36.7919" x2="92.2655" y2="36.8173" layer="94"/>
<rectangle x1="93.4085" y1="36.7919" x2="93.4593" y2="36.8173" layer="94"/>
<rectangle x1="93.4847" y1="36.7919" x2="96.1009" y2="36.8173" layer="94"/>
<rectangle x1="88.2269" y1="36.8173" x2="89.0143" y2="36.8427" layer="94"/>
<rectangle x1="89.8779" y1="36.8173" x2="92.2655" y2="36.8427" layer="94"/>
<rectangle x1="93.4085" y1="36.8173" x2="93.4339" y2="36.8427" layer="94"/>
<rectangle x1="93.5101" y1="36.8173" x2="96.1263" y2="36.8427" layer="94"/>
<rectangle x1="88.2269" y1="36.8427" x2="89.0397" y2="36.8681" layer="94"/>
<rectangle x1="89.8779" y1="36.8427" x2="92.2655" y2="36.8681" layer="94"/>
<rectangle x1="93.4085" y1="36.8427" x2="93.4339" y2="36.8681" layer="94"/>
<rectangle x1="93.4847" y1="36.8427" x2="96.1263" y2="36.8681" layer="94"/>
<rectangle x1="88.2523" y1="36.8681" x2="89.0651" y2="36.8935" layer="94"/>
<rectangle x1="89.9033" y1="36.8681" x2="92.2655" y2="36.8935" layer="94"/>
<rectangle x1="93.4085" y1="36.8681" x2="93.4339" y2="36.8935" layer="94"/>
<rectangle x1="93.5101" y1="36.8681" x2="96.1263" y2="36.8935" layer="94"/>
<rectangle x1="88.2523" y1="36.8935" x2="89.0905" y2="36.9189" layer="94"/>
<rectangle x1="89.9287" y1="36.8935" x2="92.2655" y2="36.9189" layer="94"/>
<rectangle x1="93.3831" y1="36.8935" x2="93.4339" y2="36.9189" layer="94"/>
<rectangle x1="93.5101" y1="36.8935" x2="96.1517" y2="36.9189" layer="94"/>
<rectangle x1="88.2777" y1="36.9189" x2="89.1159" y2="36.9443" layer="94"/>
<rectangle x1="89.9541" y1="36.9189" x2="92.2655" y2="36.9443" layer="94"/>
<rectangle x1="93.4085" y1="36.9189" x2="93.4339" y2="36.9443" layer="94"/>
<rectangle x1="93.5101" y1="36.9189" x2="96.1517" y2="36.9443" layer="94"/>
<rectangle x1="88.3031" y1="36.9443" x2="89.1413" y2="36.9697" layer="94"/>
<rectangle x1="89.9541" y1="36.9443" x2="92.2401" y2="36.9697" layer="94"/>
<rectangle x1="93.3831" y1="36.9443" x2="93.4085" y2="36.9697" layer="94"/>
<rectangle x1="93.5101" y1="36.9443" x2="96.1517" y2="36.9697" layer="94"/>
<rectangle x1="88.3285" y1="36.9697" x2="89.1667" y2="36.9951" layer="94"/>
<rectangle x1="90.0049" y1="36.9697" x2="92.2401" y2="36.9951" layer="94"/>
<rectangle x1="93.5101" y1="36.9697" x2="96.1771" y2="36.9951" layer="94"/>
<rectangle x1="88.3285" y1="36.9951" x2="89.1921" y2="37.0205" layer="94"/>
<rectangle x1="89.9795" y1="36.9951" x2="92.2401" y2="37.0205" layer="94"/>
<rectangle x1="93.3831" y1="36.9951" x2="93.4085" y2="37.0205" layer="94"/>
<rectangle x1="93.5101" y1="36.9951" x2="96.1771" y2="37.0205" layer="94"/>
<rectangle x1="88.3793" y1="37.0205" x2="89.2175" y2="37.0459" layer="94"/>
<rectangle x1="90.0303" y1="37.0205" x2="92.2401" y2="37.0459" layer="94"/>
<rectangle x1="93.3831" y1="37.0205" x2="93.4085" y2="37.0459" layer="94"/>
<rectangle x1="93.5101" y1="37.0205" x2="96.1771" y2="37.0459" layer="94"/>
<rectangle x1="88.3793" y1="37.0459" x2="89.2429" y2="37.0713" layer="94"/>
<rectangle x1="90.0303" y1="37.0459" x2="92.2401" y2="37.0713" layer="94"/>
<rectangle x1="93.3577" y1="37.0459" x2="93.4085" y2="37.0713" layer="94"/>
<rectangle x1="93.5355" y1="37.0459" x2="96.2025" y2="37.0713" layer="94"/>
<rectangle x1="88.4301" y1="37.0713" x2="89.2683" y2="37.0967" layer="94"/>
<rectangle x1="90.0557" y1="37.0713" x2="92.2147" y2="37.0967" layer="94"/>
<rectangle x1="93.3577" y1="37.0713" x2="93.3831" y2="37.0967" layer="94"/>
<rectangle x1="93.5355" y1="37.0713" x2="96.1771" y2="37.0967" layer="94"/>
<rectangle x1="88.4047" y1="37.0967" x2="89.2937" y2="37.1221" layer="94"/>
<rectangle x1="90.0811" y1="37.0967" x2="92.2401" y2="37.1221" layer="94"/>
<rectangle x1="93.3323" y1="37.0967" x2="93.3831" y2="37.1221" layer="94"/>
<rectangle x1="93.5355" y1="37.0967" x2="96.2025" y2="37.1221" layer="94"/>
<rectangle x1="88.4555" y1="37.1221" x2="89.3191" y2="37.1475" layer="94"/>
<rectangle x1="90.1065" y1="37.1221" x2="92.2147" y2="37.1475" layer="94"/>
<rectangle x1="93.3577" y1="37.1221" x2="93.3831" y2="37.1475" layer="94"/>
<rectangle x1="93.5355" y1="37.1221" x2="96.2025" y2="37.1475" layer="94"/>
<rectangle x1="88.4555" y1="37.1475" x2="89.3699" y2="37.1729" layer="94"/>
<rectangle x1="90.1319" y1="37.1475" x2="92.2147" y2="37.1729" layer="94"/>
<rectangle x1="93.3323" y1="37.1475" x2="93.3577" y2="37.1729" layer="94"/>
<rectangle x1="93.5355" y1="37.1475" x2="96.2025" y2="37.1729" layer="94"/>
<rectangle x1="88.5063" y1="37.1729" x2="89.3699" y2="37.1983" layer="94"/>
<rectangle x1="90.1573" y1="37.1729" x2="92.2147" y2="37.1983" layer="94"/>
<rectangle x1="93.3069" y1="37.1729" x2="93.3323" y2="37.1983" layer="94"/>
<rectangle x1="93.5355" y1="37.1729" x2="96.2025" y2="37.1983" layer="94"/>
<rectangle x1="88.5063" y1="37.1983" x2="89.4207" y2="37.2237" layer="94"/>
<rectangle x1="90.1827" y1="37.1983" x2="92.1893" y2="37.2237" layer="94"/>
<rectangle x1="93.3069" y1="37.1983" x2="93.3577" y2="37.2237" layer="94"/>
<rectangle x1="93.5355" y1="37.1983" x2="96.2025" y2="37.2237" layer="94"/>
<rectangle x1="88.5317" y1="37.2237" x2="89.4461" y2="37.2491" layer="94"/>
<rectangle x1="90.2081" y1="37.2237" x2="92.1639" y2="37.2491" layer="94"/>
<rectangle x1="93.3069" y1="37.2237" x2="93.3323" y2="37.2491" layer="94"/>
<rectangle x1="93.5609" y1="37.2237" x2="96.2025" y2="37.2491" layer="94"/>
<rectangle x1="88.5571" y1="37.2491" x2="89.4715" y2="37.2745" layer="94"/>
<rectangle x1="90.2335" y1="37.2491" x2="92.1893" y2="37.2745" layer="94"/>
<rectangle x1="93.2815" y1="37.2491" x2="93.3069" y2="37.2745" layer="94"/>
<rectangle x1="93.5355" y1="37.2491" x2="96.2025" y2="37.2745" layer="94"/>
<rectangle x1="88.5825" y1="37.2745" x2="89.4969" y2="37.2999" layer="94"/>
<rectangle x1="90.2589" y1="37.2745" x2="92.1639" y2="37.2999" layer="94"/>
<rectangle x1="93.2561" y1="37.2745" x2="93.2815" y2="37.2999" layer="94"/>
<rectangle x1="93.5609" y1="37.2745" x2="96.2279" y2="37.2999" layer="94"/>
<rectangle x1="88.6079" y1="37.2999" x2="89.5477" y2="37.3253" layer="94"/>
<rectangle x1="90.2843" y1="37.2999" x2="92.1385" y2="37.3253" layer="94"/>
<rectangle x1="93.2307" y1="37.2999" x2="93.3069" y2="37.3253" layer="94"/>
<rectangle x1="93.5355" y1="37.2999" x2="96.2025" y2="37.3253" layer="94"/>
<rectangle x1="88.6333" y1="37.3253" x2="89.5731" y2="37.3507" layer="94"/>
<rectangle x1="90.3097" y1="37.3253" x2="92.1385" y2="37.3507" layer="94"/>
<rectangle x1="93.2561" y1="37.3253" x2="93.2815" y2="37.3507" layer="94"/>
<rectangle x1="93.5609" y1="37.3253" x2="96.2279" y2="37.3507" layer="94"/>
<rectangle x1="88.6587" y1="37.3507" x2="89.5985" y2="37.3761" layer="94"/>
<rectangle x1="90.3351" y1="37.3507" x2="92.1385" y2="37.3761" layer="94"/>
<rectangle x1="93.2307" y1="37.3507" x2="93.2561" y2="37.3761" layer="94"/>
<rectangle x1="93.5355" y1="37.3507" x2="96.2025" y2="37.3761" layer="94"/>
<rectangle x1="88.6841" y1="37.3761" x2="89.6239" y2="37.4015" layer="94"/>
<rectangle x1="90.3605" y1="37.3761" x2="92.1131" y2="37.4015" layer="94"/>
<rectangle x1="93.2053" y1="37.3761" x2="93.2307" y2="37.4015" layer="94"/>
<rectangle x1="93.5609" y1="37.3761" x2="96.2279" y2="37.4015" layer="94"/>
<rectangle x1="88.7095" y1="37.4015" x2="89.6493" y2="37.4269" layer="94"/>
<rectangle x1="90.3859" y1="37.4015" x2="92.0877" y2="37.4269" layer="94"/>
<rectangle x1="93.1799" y1="37.4015" x2="93.2307" y2="37.4269" layer="94"/>
<rectangle x1="93.5355" y1="37.4015" x2="96.2025" y2="37.4269" layer="94"/>
<rectangle x1="88.7349" y1="37.4269" x2="89.6747" y2="37.4523" layer="94"/>
<rectangle x1="90.4113" y1="37.4269" x2="92.0623" y2="37.4523" layer="94"/>
<rectangle x1="93.1545" y1="37.4269" x2="93.2053" y2="37.4523" layer="94"/>
<rectangle x1="93.5609" y1="37.4269" x2="96.2279" y2="37.4523" layer="94"/>
<rectangle x1="88.7603" y1="37.4523" x2="89.7001" y2="37.4777" layer="94"/>
<rectangle x1="90.4367" y1="37.4523" x2="92.0369" y2="37.4777" layer="94"/>
<rectangle x1="93.1291" y1="37.4523" x2="93.2053" y2="37.4777" layer="94"/>
<rectangle x1="93.5609" y1="37.4523" x2="96.2025" y2="37.4777" layer="94"/>
<rectangle x1="88.7857" y1="37.4777" x2="89.7255" y2="37.5031" layer="94"/>
<rectangle x1="90.4875" y1="37.4777" x2="92.0115" y2="37.5031" layer="94"/>
<rectangle x1="93.1291" y1="37.4777" x2="93.1799" y2="37.5031" layer="94"/>
<rectangle x1="93.5609" y1="37.4777" x2="96.2025" y2="37.5031" layer="94"/>
<rectangle x1="88.7857" y1="37.5031" x2="89.7763" y2="37.5285" layer="94"/>
<rectangle x1="90.4875" y1="37.5031" x2="92.0115" y2="37.5285" layer="94"/>
<rectangle x1="93.0783" y1="37.5031" x2="93.1545" y2="37.5285" layer="94"/>
<rectangle x1="93.5609" y1="37.5031" x2="96.2025" y2="37.5285" layer="94"/>
<rectangle x1="88.8365" y1="37.5285" x2="89.8017" y2="37.5539" layer="94"/>
<rectangle x1="90.5637" y1="37.5285" x2="91.9607" y2="37.5539" layer="94"/>
<rectangle x1="93.1037" y1="37.5285" x2="93.1291" y2="37.5539" layer="94"/>
<rectangle x1="93.5609" y1="37.5285" x2="96.2025" y2="37.5539" layer="94"/>
<rectangle x1="88.8365" y1="37.5539" x2="89.8525" y2="37.5793" layer="94"/>
<rectangle x1="90.5891" y1="37.5539" x2="91.9607" y2="37.5793" layer="94"/>
<rectangle x1="93.0783" y1="37.5539" x2="93.1037" y2="37.5793" layer="94"/>
<rectangle x1="93.5609" y1="37.5539" x2="96.2025" y2="37.5793" layer="94"/>
<rectangle x1="88.8873" y1="37.5793" x2="89.8779" y2="37.6047" layer="94"/>
<rectangle x1="90.6145" y1="37.5793" x2="91.9099" y2="37.6047" layer="94"/>
<rectangle x1="93.0529" y1="37.5793" x2="93.0783" y2="37.6047" layer="94"/>
<rectangle x1="93.5609" y1="37.5793" x2="96.2025" y2="37.6047" layer="94"/>
<rectangle x1="88.9127" y1="37.6047" x2="89.9033" y2="37.6301" layer="94"/>
<rectangle x1="90.6399" y1="37.6047" x2="91.9099" y2="37.6301" layer="94"/>
<rectangle x1="93.0021" y1="37.6047" x2="93.0529" y2="37.6301" layer="94"/>
<rectangle x1="93.5609" y1="37.6047" x2="96.2025" y2="37.6301" layer="94"/>
<rectangle x1="88.9381" y1="37.6301" x2="89.9287" y2="37.6555" layer="94"/>
<rectangle x1="90.7161" y1="37.6301" x2="91.8591" y2="37.6555" layer="94"/>
<rectangle x1="93.0021" y1="37.6301" x2="93.0275" y2="37.6555" layer="94"/>
<rectangle x1="93.5609" y1="37.6301" x2="96.1771" y2="37.6555" layer="94"/>
<rectangle x1="88.9635" y1="37.6555" x2="89.9541" y2="37.6809" layer="94"/>
<rectangle x1="90.7415" y1="37.6555" x2="91.8337" y2="37.6809" layer="94"/>
<rectangle x1="92.9513" y1="37.6555" x2="93.0021" y2="37.6809" layer="94"/>
<rectangle x1="93.5863" y1="37.6555" x2="96.2025" y2="37.6809" layer="94"/>
<rectangle x1="88.9889" y1="37.6809" x2="89.9795" y2="37.7063" layer="94"/>
<rectangle x1="90.7923" y1="37.6809" x2="91.7575" y2="37.7063" layer="94"/>
<rectangle x1="92.9513" y1="37.6809" x2="92.9767" y2="37.7063" layer="94"/>
<rectangle x1="93.5609" y1="37.6809" x2="96.1771" y2="37.7063" layer="94"/>
<rectangle x1="88.9889" y1="37.7063" x2="90.0557" y2="37.7317" layer="94"/>
<rectangle x1="90.8431" y1="37.7063" x2="91.7321" y2="37.7317" layer="94"/>
<rectangle x1="92.8751" y1="37.7063" x2="92.9513" y2="37.7317" layer="94"/>
<rectangle x1="93.5863" y1="37.7063" x2="96.1771" y2="37.7317" layer="94"/>
<rectangle x1="89.0397" y1="37.7317" x2="90.0811" y2="37.7571" layer="94"/>
<rectangle x1="90.9193" y1="37.7317" x2="91.6559" y2="37.7571" layer="94"/>
<rectangle x1="92.8751" y1="37.7317" x2="92.9259" y2="37.7571" layer="94"/>
<rectangle x1="93.5863" y1="37.7317" x2="96.1771" y2="37.7571" layer="94"/>
<rectangle x1="89.0397" y1="37.7571" x2="90.1065" y2="37.7825" layer="94"/>
<rectangle x1="90.9955" y1="37.7571" x2="91.6305" y2="37.7825" layer="94"/>
<rectangle x1="92.8243" y1="37.7571" x2="92.9005" y2="37.7825" layer="94"/>
<rectangle x1="93.5863" y1="37.7571" x2="96.1517" y2="37.7825" layer="94"/>
<rectangle x1="89.0905" y1="37.7825" x2="90.1319" y2="37.8079" layer="94"/>
<rectangle x1="91.0717" y1="37.7825" x2="91.0971" y2="37.8079" layer="94"/>
<rectangle x1="91.1225" y1="37.7825" x2="91.4527" y2="37.8079" layer="94"/>
<rectangle x1="91.4781" y1="37.7825" x2="91.5035" y2="37.8079" layer="94"/>
<rectangle x1="92.7989" y1="37.7825" x2="92.8243" y2="37.8079" layer="94"/>
<rectangle x1="93.5863" y1="37.7825" x2="96.1517" y2="37.8079" layer="94"/>
<rectangle x1="89.1159" y1="37.8079" x2="90.2081" y2="37.8333" layer="94"/>
<rectangle x1="91.1987" y1="37.8079" x2="91.2241" y2="37.8333" layer="94"/>
<rectangle x1="91.2495" y1="37.8079" x2="91.2749" y2="37.8333" layer="94"/>
<rectangle x1="91.3003" y1="37.8079" x2="91.3257" y2="37.8333" layer="94"/>
<rectangle x1="91.3511" y1="37.8079" x2="91.3765" y2="37.8333" layer="94"/>
<rectangle x1="91.4019" y1="37.8079" x2="91.4273" y2="37.8333" layer="94"/>
<rectangle x1="92.7735" y1="37.8079" x2="92.8497" y2="37.8333" layer="94"/>
<rectangle x1="93.5863" y1="37.8079" x2="96.1517" y2="37.8333" layer="94"/>
<rectangle x1="89.1413" y1="37.8333" x2="90.2335" y2="37.8587" layer="94"/>
<rectangle x1="92.7481" y1="37.8333" x2="92.7735" y2="37.8587" layer="94"/>
<rectangle x1="93.6117" y1="37.8333" x2="96.1263" y2="37.8587" layer="94"/>
<rectangle x1="89.1667" y1="37.8587" x2="90.2589" y2="37.8841" layer="94"/>
<rectangle x1="92.6719" y1="37.8587" x2="92.7481" y2="37.8841" layer="94"/>
<rectangle x1="93.5863" y1="37.8587" x2="96.1517" y2="37.8841" layer="94"/>
<rectangle x1="89.1921" y1="37.8841" x2="90.2843" y2="37.9095" layer="94"/>
<rectangle x1="92.6465" y1="37.8841" x2="92.7227" y2="37.9095" layer="94"/>
<rectangle x1="93.6117" y1="37.8841" x2="96.1263" y2="37.9095" layer="94"/>
<rectangle x1="89.2175" y1="37.9095" x2="90.3605" y2="37.9349" layer="94"/>
<rectangle x1="92.6211" y1="37.9095" x2="92.6973" y2="37.9349" layer="94"/>
<rectangle x1="93.6117" y1="37.9095" x2="96.1263" y2="37.9349" layer="94"/>
<rectangle x1="89.2429" y1="37.9349" x2="90.3859" y2="37.9603" layer="94"/>
<rectangle x1="92.5957" y1="37.9349" x2="92.6211" y2="37.9603" layer="94"/>
<rectangle x1="93.6117" y1="37.9349" x2="96.1009" y2="37.9603" layer="94"/>
<rectangle x1="89.2683" y1="37.9603" x2="90.4113" y2="37.9857" layer="94"/>
<rectangle x1="92.5195" y1="37.9603" x2="92.5957" y2="37.9857" layer="94"/>
<rectangle x1="93.6371" y1="37.9603" x2="96.1009" y2="37.9857" layer="94"/>
<rectangle x1="89.3445" y1="37.9857" x2="90.4621" y2="38.0111" layer="94"/>
<rectangle x1="92.4941" y1="37.9857" x2="92.5195" y2="38.0111" layer="94"/>
<rectangle x1="93.6625" y1="37.9857" x2="96.0755" y2="38.0111" layer="94"/>
<rectangle x1="89.3445" y1="38.0111" x2="90.5129" y2="38.0365" layer="94"/>
<rectangle x1="92.4179" y1="38.0111" x2="92.4941" y2="38.0365" layer="94"/>
<rectangle x1="93.6371" y1="38.0111" x2="96.0755" y2="38.0365" layer="94"/>
<rectangle x1="89.3953" y1="38.0365" x2="90.3859" y2="38.0619" layer="94"/>
<rectangle x1="90.5129" y1="38.0365" x2="90.5383" y2="38.0619" layer="94"/>
<rectangle x1="92.3925" y1="38.0365" x2="92.4179" y2="38.0619" layer="94"/>
<rectangle x1="93.6625" y1="38.0365" x2="96.0755" y2="38.0619" layer="94"/>
<rectangle x1="89.4207" y1="38.0619" x2="90.3605" y2="38.0873" layer="94"/>
<rectangle x1="90.5383" y1="38.0619" x2="90.6145" y2="38.0873" layer="94"/>
<rectangle x1="92.3163" y1="38.0619" x2="92.3925" y2="38.0873" layer="94"/>
<rectangle x1="93.6625" y1="38.0619" x2="96.0501" y2="38.0873" layer="94"/>
<rectangle x1="89.4969" y1="38.0873" x2="90.2335" y2="38.1127" layer="94"/>
<rectangle x1="90.2589" y1="38.0873" x2="90.2843" y2="38.1127" layer="94"/>
<rectangle x1="90.6145" y1="38.0873" x2="90.6399" y2="38.1127" layer="94"/>
<rectangle x1="92.2401" y1="38.0873" x2="92.3163" y2="38.1127" layer="94"/>
<rectangle x1="93.6879" y1="38.0873" x2="96.0247" y2="38.1127" layer="94"/>
<rectangle x1="89.5223" y1="38.1127" x2="90.2081" y2="38.1381" layer="94"/>
<rectangle x1="90.6399" y1="38.1127" x2="90.7161" y2="38.1381" layer="94"/>
<rectangle x1="92.1639" y1="38.1127" x2="92.2401" y2="38.1381" layer="94"/>
<rectangle x1="92.2655" y1="38.1127" x2="92.2909" y2="38.1381" layer="94"/>
<rectangle x1="93.6879" y1="38.1127" x2="96.0247" y2="38.1381" layer="94"/>
<rectangle x1="89.5985" y1="38.1381" x2="89.6239" y2="38.1635" layer="94"/>
<rectangle x1="89.6493" y1="38.1381" x2="90.0811" y2="38.1635" layer="94"/>
<rectangle x1="90.1065" y1="38.1381" x2="90.1319" y2="38.1635" layer="94"/>
<rectangle x1="90.7161" y1="38.1381" x2="90.7415" y2="38.1635" layer="94"/>
<rectangle x1="92.0877" y1="38.1381" x2="92.1639" y2="38.1635" layer="94"/>
<rectangle x1="93.7133" y1="38.1381" x2="95.9993" y2="38.1635" layer="94"/>
<rectangle x1="89.6747" y1="38.1635" x2="89.7001" y2="38.1889" layer="94"/>
<rectangle x1="89.7255" y1="38.1635" x2="89.9541" y2="38.1889" layer="94"/>
<rectangle x1="89.9795" y1="38.1635" x2="90.0049" y2="38.1889" layer="94"/>
<rectangle x1="90.7415" y1="38.1635" x2="90.8177" y2="38.1889" layer="94"/>
<rectangle x1="91.9607" y1="38.1635" x2="92.0877" y2="38.1889" layer="94"/>
<rectangle x1="92.1131" y1="38.1635" x2="92.1385" y2="38.1889" layer="94"/>
<rectangle x1="93.7133" y1="38.1635" x2="95.9993" y2="38.1889" layer="94"/>
<rectangle x1="90.8177" y1="38.1889" x2="90.8939" y2="38.2143" layer="94"/>
<rectangle x1="91.8845" y1="38.1889" x2="91.9099" y2="38.2143" layer="94"/>
<rectangle x1="91.9353" y1="38.1889" x2="91.9607" y2="38.2143" layer="94"/>
<rectangle x1="91.9861" y1="38.1889" x2="92.0115" y2="38.2143" layer="94"/>
<rectangle x1="93.7387" y1="38.1889" x2="95.9739" y2="38.2143" layer="94"/>
<rectangle x1="90.8939" y1="38.2143" x2="91.0209" y2="38.2397" layer="94"/>
<rectangle x1="91.7067" y1="38.2143" x2="91.8845" y2="38.2397" layer="94"/>
<rectangle x1="91.9099" y1="38.2143" x2="91.9353" y2="38.2397" layer="94"/>
<rectangle x1="93.7387" y1="38.2143" x2="95.9485" y2="38.2397" layer="94"/>
<rectangle x1="90.9701" y1="38.2397" x2="91.0971" y2="38.2651" layer="94"/>
<rectangle x1="91.5797" y1="38.2397" x2="91.6051" y2="38.2651" layer="94"/>
<rectangle x1="91.6305" y1="38.2397" x2="91.7067" y2="38.2651" layer="94"/>
<rectangle x1="93.7641" y1="38.2397" x2="95.9231" y2="38.2651" layer="94"/>
<rectangle x1="90.9447" y1="38.2651" x2="91.0717" y2="38.2905" layer="94"/>
<rectangle x1="91.0971" y1="38.2651" x2="91.5797" y2="38.2905" layer="94"/>
<rectangle x1="91.6051" y1="38.2651" x2="91.6305" y2="38.2905" layer="94"/>
<rectangle x1="93.7895" y1="38.2651" x2="95.8977" y2="38.2905" layer="94"/>
<rectangle x1="90.9447" y1="38.2905" x2="91.0463" y2="38.3159" layer="94"/>
<rectangle x1="91.4781" y1="38.2905" x2="91.5543" y2="38.3159" layer="94"/>
<rectangle x1="93.8149" y1="38.2905" x2="95.8723" y2="38.3159" layer="94"/>
<rectangle x1="90.9193" y1="38.3159" x2="91.0463" y2="38.3413" layer="94"/>
<rectangle x1="91.4527" y1="38.3159" x2="91.5797" y2="38.3413" layer="94"/>
<rectangle x1="93.7895" y1="38.3159" x2="95.8469" y2="38.3413" layer="94"/>
<rectangle x1="90.9193" y1="38.3413" x2="91.0463" y2="38.3667" layer="94"/>
<rectangle x1="91.4273" y1="38.3413" x2="91.5543" y2="38.3667" layer="94"/>
<rectangle x1="93.8403" y1="38.3413" x2="95.8215" y2="38.3667" layer="94"/>
<rectangle x1="90.8939" y1="38.3667" x2="91.0209" y2="38.3921" layer="94"/>
<rectangle x1="91.4527" y1="38.3667" x2="91.5289" y2="38.3921" layer="94"/>
<rectangle x1="93.8403" y1="38.3667" x2="95.7961" y2="38.3921" layer="94"/>
<rectangle x1="90.9193" y1="38.3921" x2="90.9955" y2="38.4175" layer="94"/>
<rectangle x1="91.4273" y1="38.3921" x2="91.5035" y2="38.4175" layer="94"/>
<rectangle x1="93.8657" y1="38.3921" x2="95.7707" y2="38.4175" layer="94"/>
<rectangle x1="90.8939" y1="38.4175" x2="91.0209" y2="38.4429" layer="94"/>
<rectangle x1="91.4019" y1="38.4175" x2="91.5289" y2="38.4429" layer="94"/>
<rectangle x1="93.8911" y1="38.4175" x2="95.7453" y2="38.4429" layer="94"/>
<rectangle x1="90.8685" y1="38.4429" x2="90.9955" y2="38.4683" layer="94"/>
<rectangle x1="91.4273" y1="38.4429" x2="91.5035" y2="38.4683" layer="94"/>
<rectangle x1="93.9165" y1="38.4429" x2="95.7199" y2="38.4683" layer="94"/>
<rectangle x1="90.8431" y1="38.4683" x2="90.9701" y2="38.4937" layer="94"/>
<rectangle x1="91.4019" y1="38.4683" x2="91.5035" y2="38.4937" layer="94"/>
<rectangle x1="93.9419" y1="38.4683" x2="95.6945" y2="38.4937" layer="94"/>
<rectangle x1="90.8685" y1="38.4937" x2="90.9447" y2="38.5191" layer="94"/>
<rectangle x1="91.3765" y1="38.4937" x2="91.4781" y2="38.5191" layer="94"/>
<rectangle x1="93.9673" y1="38.4937" x2="95.6183" y2="38.5191" layer="94"/>
<rectangle x1="90.8431" y1="38.5191" x2="90.9701" y2="38.5445" layer="94"/>
<rectangle x1="91.3765" y1="38.5191" x2="91.4781" y2="38.5445" layer="94"/>
<rectangle x1="93.9927" y1="38.5191" x2="95.5929" y2="38.5445" layer="94"/>
<rectangle x1="95.6183" y1="38.5191" x2="95.6437" y2="38.5445" layer="94"/>
<rectangle x1="90.8177" y1="38.5445" x2="90.9447" y2="38.5699" layer="94"/>
<rectangle x1="91.3765" y1="38.5445" x2="91.4527" y2="38.5699" layer="94"/>
<rectangle x1="94.0181" y1="38.5445" x2="95.5675" y2="38.5699" layer="94"/>
<rectangle x1="90.7923" y1="38.5699" x2="90.9193" y2="38.5953" layer="94"/>
<rectangle x1="91.3511" y1="38.5699" x2="91.4781" y2="38.5953" layer="94"/>
<rectangle x1="94.0435" y1="38.5699" x2="95.4913" y2="38.5953" layer="94"/>
<rectangle x1="90.8177" y1="38.5953" x2="90.8939" y2="38.6207" layer="94"/>
<rectangle x1="91.3511" y1="38.5953" x2="91.4527" y2="38.6207" layer="94"/>
<rectangle x1="94.1197" y1="38.5953" x2="95.4151" y2="38.6207" layer="94"/>
<rectangle x1="90.7923" y1="38.6207" x2="90.9193" y2="38.6461" layer="94"/>
<rectangle x1="91.3511" y1="38.6207" x2="91.4273" y2="38.6461" layer="94"/>
<rectangle x1="94.1451" y1="38.6207" x2="95.3389" y2="38.6461" layer="94"/>
<rectangle x1="95.3643" y1="38.6207" x2="95.3897" y2="38.6461" layer="94"/>
<rectangle x1="90.7669" y1="38.6461" x2="90.8939" y2="38.6715" layer="94"/>
<rectangle x1="91.3257" y1="38.6461" x2="91.4273" y2="38.6715" layer="94"/>
<rectangle x1="94.1705" y1="38.6461" x2="95.1103" y2="38.6715" layer="94"/>
<rectangle x1="95.1357" y1="38.6461" x2="95.1611" y2="38.6715" layer="94"/>
<rectangle x1="95.1865" y1="38.6461" x2="95.2119" y2="38.6715" layer="94"/>
<rectangle x1="90.7415" y1="38.6715" x2="90.8685" y2="38.6969" layer="94"/>
<rectangle x1="91.3257" y1="38.6715" x2="91.4273" y2="38.6969" layer="94"/>
<rectangle x1="94.1959" y1="38.6715" x2="94.2213" y2="38.6969" layer="94"/>
<rectangle x1="94.2467" y1="38.6715" x2="95.0849" y2="38.6969" layer="94"/>
<rectangle x1="90.7669" y1="38.6969" x2="90.8431" y2="38.7223" layer="94"/>
<rectangle x1="91.3257" y1="38.6969" x2="91.4019" y2="38.7223" layer="94"/>
<rectangle x1="94.2721" y1="38.6969" x2="94.2975" y2="38.7223" layer="94"/>
<rectangle x1="94.3229" y1="38.6969" x2="95.0087" y2="38.7223" layer="94"/>
<rectangle x1="90.7415" y1="38.7223" x2="90.8685" y2="38.7477" layer="94"/>
<rectangle x1="91.3003" y1="38.7223" x2="91.4019" y2="38.7477" layer="94"/>
<rectangle x1="94.3483" y1="38.7223" x2="94.9325" y2="38.7477" layer="94"/>
<rectangle x1="94.9579" y1="38.7223" x2="94.9833" y2="38.7477" layer="94"/>
<rectangle x1="90.7161" y1="38.7477" x2="90.8431" y2="38.7731" layer="94"/>
<rectangle x1="91.3003" y1="38.7477" x2="91.4019" y2="38.7731" layer="94"/>
<rectangle x1="94.4245" y1="38.7477" x2="94.4499" y2="38.7731" layer="94"/>
<rectangle x1="94.4753" y1="38.7477" x2="94.8055" y2="38.7731" layer="94"/>
<rectangle x1="94.8309" y1="38.7477" x2="94.8563" y2="38.7731" layer="94"/>
<rectangle x1="90.6907" y1="38.7731" x2="90.8177" y2="38.7985" layer="94"/>
<rectangle x1="91.2749" y1="38.7731" x2="91.3765" y2="38.7985" layer="94"/>
<rectangle x1="94.5515" y1="38.7731" x2="94.5769" y2="38.7985" layer="94"/>
<rectangle x1="94.6023" y1="38.7731" x2="94.6277" y2="38.7985" layer="94"/>
<rectangle x1="94.6531" y1="38.7731" x2="94.6785" y2="38.7985" layer="94"/>
<rectangle x1="94.7039" y1="38.7731" x2="94.7293" y2="38.7985" layer="94"/>
<rectangle x1="90.7161" y1="38.7985" x2="90.7923" y2="38.8239" layer="94"/>
<rectangle x1="91.2749" y1="38.7985" x2="91.3765" y2="38.8239" layer="94"/>
<rectangle x1="90.6907" y1="38.8239" x2="90.8177" y2="38.8493" layer="94"/>
<rectangle x1="91.2495" y1="38.8239" x2="91.3765" y2="38.8493" layer="94"/>
<rectangle x1="90.6653" y1="38.8493" x2="90.7923" y2="38.8747" layer="94"/>
<rectangle x1="91.2749" y1="38.8493" x2="91.3511" y2="38.8747" layer="94"/>
<rectangle x1="90.6399" y1="38.8747" x2="90.7669" y2="38.9001" layer="94"/>
<rectangle x1="91.2495" y1="38.8747" x2="91.3511" y2="38.9001" layer="94"/>
<rectangle x1="90.6653" y1="38.9001" x2="90.7415" y2="38.9255" layer="94"/>
<rectangle x1="91.2241" y1="38.9001" x2="91.3511" y2="38.9255" layer="94"/>
<rectangle x1="90.6399" y1="38.9255" x2="90.7669" y2="38.9509" layer="94"/>
<rectangle x1="91.2241" y1="38.9255" x2="91.3257" y2="38.9509" layer="94"/>
<rectangle x1="90.6145" y1="38.9509" x2="90.7415" y2="38.9763" layer="94"/>
<rectangle x1="91.2241" y1="38.9509" x2="91.3003" y2="38.9763" layer="94"/>
<rectangle x1="90.5891" y1="38.9763" x2="90.7161" y2="39.0017" layer="94"/>
<rectangle x1="91.1987" y1="38.9763" x2="91.3257" y2="39.0017" layer="94"/>
<rectangle x1="90.6145" y1="39.0017" x2="90.6907" y2="39.0271" layer="94"/>
<rectangle x1="91.2241" y1="39.0017" x2="91.3003" y2="39.0271" layer="94"/>
<rectangle x1="90.5891" y1="39.0271" x2="90.7161" y2="39.0525" layer="94"/>
<rectangle x1="91.1987" y1="39.0271" x2="91.3003" y2="39.0525" layer="94"/>
<rectangle x1="90.5637" y1="39.0525" x2="90.6907" y2="39.0779" layer="94"/>
<rectangle x1="91.1733" y1="39.0525" x2="91.2749" y2="39.0779" layer="94"/>
<rectangle x1="90.5383" y1="39.0779" x2="90.6653" y2="39.1033" layer="94"/>
<rectangle x1="91.1479" y1="39.0779" x2="91.2749" y2="39.1033" layer="94"/>
<rectangle x1="90.5383" y1="39.1033" x2="90.6399" y2="39.1287" layer="94"/>
<rectangle x1="91.1733" y1="39.1033" x2="91.2495" y2="39.1287" layer="94"/>
<rectangle x1="90.5129" y1="39.1287" x2="90.6399" y2="39.1541" layer="94"/>
<rectangle x1="91.1479" y1="39.1287" x2="91.2749" y2="39.1541" layer="94"/>
<rectangle x1="90.5129" y1="39.1541" x2="90.6145" y2="39.1795" layer="94"/>
<rectangle x1="91.1479" y1="39.1541" x2="91.2495" y2="39.1795" layer="94"/>
<rectangle x1="90.4875" y1="39.1795" x2="90.6145" y2="39.2049" layer="94"/>
<rectangle x1="91.1479" y1="39.1795" x2="91.2241" y2="39.2049" layer="94"/>
<rectangle x1="90.4621" y1="39.2049" x2="90.5891" y2="39.2303" layer="94"/>
<rectangle x1="91.1225" y1="39.2049" x2="91.1987" y2="39.2303" layer="94"/>
<rectangle x1="90.4621" y1="39.2303" x2="90.5637" y2="39.2557" layer="94"/>
<rectangle x1="91.0971" y1="39.2303" x2="91.2241" y2="39.2557" layer="94"/>
<rectangle x1="90.4621" y1="39.2557" x2="90.5637" y2="39.2811" layer="94"/>
<rectangle x1="91.1225" y1="39.2557" x2="91.1987" y2="39.2811" layer="94"/>
<rectangle x1="90.4367" y1="39.2811" x2="90.5637" y2="39.3065" layer="94"/>
<rectangle x1="91.0971" y1="39.2811" x2="91.1733" y2="39.3065" layer="94"/>
<rectangle x1="90.4113" y1="39.3065" x2="90.5383" y2="39.3319" layer="94"/>
<rectangle x1="91.0717" y1="39.3065" x2="91.1733" y2="39.3319" layer="94"/>
<rectangle x1="90.3859" y1="39.3319" x2="90.5129" y2="39.3573" layer="94"/>
<rectangle x1="91.0717" y1="39.3319" x2="91.1733" y2="39.3573" layer="94"/>
<rectangle x1="90.3859" y1="39.3573" x2="90.4875" y2="39.3827" layer="94"/>
<rectangle x1="91.0717" y1="39.3573" x2="91.1479" y2="39.3827" layer="94"/>
<rectangle x1="90.3859" y1="39.3827" x2="90.4875" y2="39.4081" layer="94"/>
<rectangle x1="91.0463" y1="39.3827" x2="91.1479" y2="39.4081" layer="94"/>
<rectangle x1="90.3605" y1="39.4081" x2="90.4875" y2="39.4335" layer="94"/>
<rectangle x1="91.0463" y1="39.4081" x2="91.1479" y2="39.4335" layer="94"/>
<rectangle x1="90.3351" y1="39.4335" x2="90.4621" y2="39.4589" layer="94"/>
<rectangle x1="91.0463" y1="39.4335" x2="91.1225" y2="39.4589" layer="94"/>
<rectangle x1="90.3351" y1="39.4589" x2="90.4367" y2="39.4843" layer="94"/>
<rectangle x1="91.0209" y1="39.4589" x2="91.0971" y2="39.4843" layer="94"/>
<rectangle x1="90.3097" y1="39.4843" x2="90.4113" y2="39.5097" layer="94"/>
<rectangle x1="90.9955" y1="39.4843" x2="91.1225" y2="39.5097" layer="94"/>
<rectangle x1="90.3097" y1="39.5097" x2="90.4113" y2="39.5351" layer="94"/>
<rectangle x1="91.0209" y1="39.5097" x2="91.0971" y2="39.5351" layer="94"/>
<rectangle x1="90.2843" y1="39.5351" x2="90.4113" y2="39.5605" layer="94"/>
<rectangle x1="90.9955" y1="39.5351" x2="91.0971" y2="39.5605" layer="94"/>
<rectangle x1="90.2589" y1="39.5605" x2="90.3859" y2="39.5859" layer="94"/>
<rectangle x1="90.9701" y1="39.5605" x2="91.0717" y2="39.5859" layer="94"/>
<rectangle x1="90.2335" y1="39.5859" x2="90.3605" y2="39.6113" layer="94"/>
<rectangle x1="90.9701" y1="39.5859" x2="91.0717" y2="39.6113" layer="94"/>
<rectangle x1="90.2335" y1="39.6113" x2="90.3351" y2="39.6367" layer="94"/>
<rectangle x1="90.9701" y1="39.6113" x2="91.0463" y2="39.6367" layer="94"/>
<rectangle x1="90.2081" y1="39.6367" x2="90.3351" y2="39.6621" layer="94"/>
<rectangle x1="90.9447" y1="39.6367" x2="91.0463" y2="39.6621" layer="94"/>
<rectangle x1="90.2081" y1="39.6621" x2="90.3097" y2="39.6875" layer="94"/>
<rectangle x1="90.9447" y1="39.6621" x2="91.0463" y2="39.6875" layer="94"/>
<rectangle x1="90.1827" y1="39.6875" x2="90.3097" y2="39.7129" layer="94"/>
<rectangle x1="90.9447" y1="39.6875" x2="91.0209" y2="39.7129" layer="94"/>
<rectangle x1="90.1573" y1="39.7129" x2="90.2843" y2="39.7383" layer="94"/>
<rectangle x1="90.9193" y1="39.7129" x2="90.9955" y2="39.7383" layer="94"/>
<rectangle x1="90.1319" y1="39.7383" x2="90.2589" y2="39.7637" layer="94"/>
<rectangle x1="90.8939" y1="39.7383" x2="91.0209" y2="39.7637" layer="94"/>
<rectangle x1="90.1573" y1="39.7637" x2="90.2335" y2="39.7891" layer="94"/>
<rectangle x1="90.9193" y1="39.7637" x2="90.9955" y2="39.7891" layer="94"/>
<rectangle x1="90.1319" y1="39.7891" x2="90.2335" y2="39.8145" layer="94"/>
<rectangle x1="90.8939" y1="39.7891" x2="90.9701" y2="39.8145" layer="94"/>
<rectangle x1="90.1065" y1="39.8145" x2="90.2081" y2="39.8399" layer="94"/>
<rectangle x1="90.8685" y1="39.8145" x2="90.9701" y2="39.8399" layer="94"/>
<rectangle x1="90.0811" y1="39.8399" x2="90.2081" y2="39.8653" layer="94"/>
<rectangle x1="90.8685" y1="39.8399" x2="90.9701" y2="39.8653" layer="94"/>
<rectangle x1="90.0557" y1="39.8653" x2="90.1827" y2="39.8907" layer="94"/>
<rectangle x1="90.8685" y1="39.8653" x2="90.9447" y2="39.8907" layer="94"/>
<rectangle x1="90.0303" y1="39.8907" x2="90.1573" y2="39.9161" layer="94"/>
<rectangle x1="90.8431" y1="39.8907" x2="90.9447" y2="39.9161" layer="94"/>
<rectangle x1="90.0557" y1="39.9161" x2="90.1319" y2="39.9415" layer="94"/>
<rectangle x1="90.8431" y1="39.9161" x2="90.9447" y2="39.9415" layer="94"/>
<rectangle x1="90.0049" y1="39.9415" x2="90.1573" y2="39.9669" layer="94"/>
<rectangle x1="90.8177" y1="39.9415" x2="90.9193" y2="39.9669" layer="94"/>
<rectangle x1="90.0049" y1="39.9669" x2="90.1065" y2="39.9923" layer="94"/>
<rectangle x1="90.8177" y1="39.9669" x2="90.8939" y2="39.9923" layer="94"/>
<rectangle x1="89.9795" y1="39.9923" x2="90.1065" y2="40.0177" layer="94"/>
<rectangle x1="90.7923" y1="39.9923" x2="90.9193" y2="40.0177" layer="94"/>
<rectangle x1="89.9541" y1="40.0177" x2="90.0811" y2="40.0431" layer="94"/>
<rectangle x1="90.8177" y1="40.0177" x2="90.8939" y2="40.0431" layer="94"/>
<rectangle x1="89.9287" y1="40.0431" x2="90.0557" y2="40.0685" layer="94"/>
<rectangle x1="90.7923" y1="40.0431" x2="90.8685" y2="40.0685" layer="94"/>
<rectangle x1="89.9287" y1="40.0685" x2="90.0303" y2="40.0939" layer="94"/>
<rectangle x1="90.7669" y1="40.0685" x2="90.8431" y2="40.0939" layer="94"/>
<rectangle x1="89.9033" y1="40.0939" x2="90.0303" y2="40.1193" layer="94"/>
<rectangle x1="90.7415" y1="40.0939" x2="90.8685" y2="40.1193" layer="94"/>
<rectangle x1="89.9033" y1="40.1193" x2="90.0049" y2="40.1447" layer="94"/>
<rectangle x1="90.7669" y1="40.1193" x2="90.8431" y2="40.1447" layer="94"/>
<rectangle x1="89.8779" y1="40.1447" x2="90.0049" y2="40.1701" layer="94"/>
<rectangle x1="90.7415" y1="40.1447" x2="90.8177" y2="40.1701" layer="94"/>
<rectangle x1="89.8525" y1="40.1701" x2="89.9795" y2="40.1955" layer="94"/>
<rectangle x1="90.7161" y1="40.1701" x2="90.8177" y2="40.1955" layer="94"/>
<rectangle x1="89.8271" y1="40.1955" x2="89.9541" y2="40.2209" layer="94"/>
<rectangle x1="90.7161" y1="40.1955" x2="90.8177" y2="40.2209" layer="94"/>
<rectangle x1="89.8271" y1="40.2209" x2="89.9287" y2="40.2463" layer="94"/>
<rectangle x1="90.7161" y1="40.2209" x2="90.7923" y2="40.2463" layer="94"/>
<rectangle x1="89.7763" y1="40.2463" x2="89.9033" y2="40.2717" layer="94"/>
<rectangle x1="90.6907" y1="40.2463" x2="90.7669" y2="40.2717" layer="94"/>
<rectangle x1="89.8017" y1="40.2717" x2="89.8779" y2="40.2971" layer="94"/>
<rectangle x1="90.6653" y1="40.2717" x2="90.7669" y2="40.2971" layer="94"/>
<rectangle x1="89.7763" y1="40.2971" x2="89.8779" y2="40.3225" layer="94"/>
<rectangle x1="90.6653" y1="40.2971" x2="90.7669" y2="40.3225" layer="94"/>
<rectangle x1="89.7509" y1="40.3225" x2="89.8525" y2="40.3479" layer="94"/>
<rectangle x1="90.6653" y1="40.3225" x2="90.7415" y2="40.3479" layer="94"/>
<rectangle x1="89.7255" y1="40.3479" x2="89.8525" y2="40.3733" layer="94"/>
<rectangle x1="90.6399" y1="40.3479" x2="90.7415" y2="40.3733" layer="94"/>
<rectangle x1="89.7001" y1="40.3733" x2="89.8271" y2="40.3987" layer="94"/>
<rectangle x1="90.6145" y1="40.3733" x2="90.7161" y2="40.3987" layer="94"/>
<rectangle x1="89.6747" y1="40.3987" x2="89.8017" y2="40.4241" layer="94"/>
<rectangle x1="90.6145" y1="40.3987" x2="90.7161" y2="40.4241" layer="94"/>
<rectangle x1="89.7001" y1="40.4241" x2="89.7763" y2="40.4495" layer="94"/>
<rectangle x1="90.6145" y1="40.4241" x2="90.6907" y2="40.4495" layer="94"/>
<rectangle x1="89.6493" y1="40.4495" x2="89.7509" y2="40.4749" layer="94"/>
<rectangle x1="90.5891" y1="40.4495" x2="90.6907" y2="40.4749" layer="94"/>
<rectangle x1="89.6493" y1="40.4749" x2="89.7255" y2="40.5003" layer="94"/>
<rectangle x1="90.5637" y1="40.4749" x2="90.6653" y2="40.5003" layer="94"/>
<rectangle x1="89.6239" y1="40.5003" x2="89.7255" y2="40.5257" layer="94"/>
<rectangle x1="90.5637" y1="40.5003" x2="90.6653" y2="40.5257" layer="94"/>
<rectangle x1="89.5985" y1="40.5257" x2="89.7001" y2="40.5511" layer="94"/>
<rectangle x1="90.5637" y1="40.5257" x2="90.6399" y2="40.5511" layer="94"/>
<rectangle x1="89.5731" y1="40.5511" x2="89.7001" y2="40.5765" layer="94"/>
<rectangle x1="90.5383" y1="40.5511" x2="90.6399" y2="40.5765" layer="94"/>
<rectangle x1="89.5477" y1="40.5765" x2="89.6747" y2="40.6019" layer="94"/>
<rectangle x1="90.5129" y1="40.5765" x2="90.6145" y2="40.6019" layer="94"/>
<rectangle x1="89.5223" y1="40.6019" x2="89.6493" y2="40.6273" layer="94"/>
<rectangle x1="90.5129" y1="40.6019" x2="90.6145" y2="40.6273" layer="94"/>
<rectangle x1="89.5223" y1="40.6273" x2="89.6239" y2="40.6527" layer="94"/>
<rectangle x1="90.5129" y1="40.6273" x2="90.5891" y2="40.6527" layer="94"/>
<rectangle x1="89.4969" y1="40.6527" x2="89.5985" y2="40.6781" layer="94"/>
<rectangle x1="90.4875" y1="40.6527" x2="90.5891" y2="40.6781" layer="94"/>
<rectangle x1="89.4969" y1="40.6781" x2="89.5731" y2="40.7035" layer="94"/>
<rectangle x1="90.4621" y1="40.6781" x2="90.5637" y2="40.7035" layer="94"/>
<rectangle x1="89.4715" y1="40.7035" x2="89.5731" y2="40.7289" layer="94"/>
<rectangle x1="90.4621" y1="40.7035" x2="90.5637" y2="40.7289" layer="94"/>
<rectangle x1="89.4461" y1="40.7289" x2="89.5223" y2="40.7543" layer="94"/>
<rectangle x1="90.4621" y1="40.7289" x2="90.5383" y2="40.7543" layer="94"/>
<rectangle x1="89.4207" y1="40.7543" x2="89.5477" y2="40.7797" layer="94"/>
<rectangle x1="90.4367" y1="40.7543" x2="90.5129" y2="40.7797" layer="94"/>
<rectangle x1="89.3953" y1="40.7797" x2="89.5223" y2="40.8051" layer="94"/>
<rectangle x1="90.4113" y1="40.7797" x2="90.5129" y2="40.8051" layer="94"/>
<rectangle x1="89.3699" y1="40.8051" x2="89.4969" y2="40.8305" layer="94"/>
<rectangle x1="90.3859" y1="40.8051" x2="90.5129" y2="40.8305" layer="94"/>
<rectangle x1="89.3699" y1="40.8305" x2="89.4715" y2="40.8559" layer="94"/>
<rectangle x1="90.4113" y1="40.8305" x2="90.4875" y2="40.8559" layer="94"/>
<rectangle x1="89.3445" y1="40.8559" x2="89.4461" y2="40.8813" layer="94"/>
<rectangle x1="90.3859" y1="40.8559" x2="90.4621" y2="40.8813" layer="94"/>
<rectangle x1="89.3191" y1="40.8813" x2="89.4207" y2="40.9067" layer="94"/>
<rectangle x1="90.3605" y1="40.8813" x2="90.4367" y2="40.9067" layer="94"/>
<rectangle x1="89.2937" y1="40.9067" x2="89.3953" y2="40.9321" layer="94"/>
<rectangle x1="90.3351" y1="40.9067" x2="90.4621" y2="40.9321" layer="94"/>
<rectangle x1="89.2937" y1="40.9321" x2="89.3699" y2="40.9575" layer="94"/>
<rectangle x1="90.3605" y1="40.9321" x2="90.4367" y2="40.9575" layer="94"/>
<rectangle x1="89.2683" y1="40.9575" x2="89.3699" y2="40.9829" layer="94"/>
<rectangle x1="90.3351" y1="40.9575" x2="90.4113" y2="40.9829" layer="94"/>
<rectangle x1="89.2429" y1="40.9829" x2="89.3191" y2="41.0083" layer="94"/>
<rectangle x1="90.3097" y1="40.9829" x2="90.3859" y2="41.0083" layer="94"/>
<rectangle x1="89.2175" y1="41.0083" x2="89.3191" y2="41.0337" layer="94"/>
<rectangle x1="90.2843" y1="41.0083" x2="90.3859" y2="41.0337" layer="94"/>
<rectangle x1="89.1921" y1="41.0337" x2="89.2937" y2="41.0591" layer="94"/>
<rectangle x1="90.2843" y1="41.0337" x2="90.3605" y2="41.0591" layer="94"/>
<rectangle x1="89.1667" y1="41.0591" x2="89.2937" y2="41.0845" layer="94"/>
<rectangle x1="90.2589" y1="41.0591" x2="90.3605" y2="41.0845" layer="94"/>
<rectangle x1="89.1667" y1="41.0845" x2="89.2683" y2="41.1099" layer="94"/>
<rectangle x1="90.2589" y1="41.0845" x2="90.3351" y2="41.1099" layer="94"/>
<rectangle x1="89.1159" y1="41.1099" x2="89.2429" y2="41.1353" layer="94"/>
<rectangle x1="90.2335" y1="41.1099" x2="90.3097" y2="41.1353" layer="94"/>
<rectangle x1="89.1413" y1="41.1353" x2="89.2175" y2="41.1607" layer="94"/>
<rectangle x1="90.2081" y1="41.1353" x2="90.2843" y2="41.1607" layer="94"/>
<rectangle x1="89.0905" y1="41.1607" x2="89.1921" y2="41.1861" layer="94"/>
<rectangle x1="90.1827" y1="41.1607" x2="90.3097" y2="41.1861" layer="94"/>
<rectangle x1="89.0905" y1="41.1861" x2="89.1667" y2="41.2115" layer="94"/>
<rectangle x1="90.1827" y1="41.1861" x2="90.2843" y2="41.2115" layer="94"/>
<rectangle x1="89.0651" y1="41.2115" x2="89.1413" y2="41.2369" layer="94"/>
<rectangle x1="90.1827" y1="41.2115" x2="90.2589" y2="41.2369" layer="94"/>
<rectangle x1="89.0397" y1="41.2369" x2="89.1159" y2="41.2623" layer="94"/>
<rectangle x1="90.1573" y1="41.2369" x2="90.2335" y2="41.2623" layer="94"/>
<rectangle x1="89.0143" y1="41.2623" x2="89.1159" y2="41.2877" layer="94"/>
<rectangle x1="90.1319" y1="41.2623" x2="90.2335" y2="41.2877" layer="94"/>
<rectangle x1="88.9889" y1="41.2877" x2="89.0905" y2="41.3131" layer="94"/>
<rectangle x1="90.1065" y1="41.2877" x2="90.2081" y2="41.3131" layer="94"/>
<rectangle x1="88.9635" y1="41.3131" x2="89.0651" y2="41.3385" layer="94"/>
<rectangle x1="90.1065" y1="41.3131" x2="90.2081" y2="41.3385" layer="94"/>
<rectangle x1="88.9635" y1="41.3385" x2="89.0397" y2="41.3639" layer="94"/>
<rectangle x1="90.1065" y1="41.3385" x2="90.1827" y2="41.3639" layer="94"/>
<rectangle x1="88.9127" y1="41.3639" x2="89.0397" y2="41.3893" layer="94"/>
<rectangle x1="90.0811" y1="41.3639" x2="90.1573" y2="41.3893" layer="94"/>
<rectangle x1="88.9127" y1="41.3893" x2="89.0143" y2="41.4147" layer="94"/>
<rectangle x1="90.0557" y1="41.3893" x2="90.1319" y2="41.4147" layer="94"/>
<rectangle x1="88.8873" y1="41.4147" x2="88.9889" y2="41.4401" layer="94"/>
<rectangle x1="90.0303" y1="41.4147" x2="90.1319" y2="41.4401" layer="94"/>
<rectangle x1="88.8873" y1="41.4401" x2="88.9635" y2="41.4655" layer="94"/>
<rectangle x1="90.0303" y1="41.4401" x2="90.1065" y2="41.4655" layer="94"/>
<rectangle x1="88.8365" y1="41.4655" x2="88.9381" y2="41.4909" layer="94"/>
<rectangle x1="89.9795" y1="41.4655" x2="90.1065" y2="41.4909" layer="94"/>
<rectangle x1="88.8365" y1="41.4909" x2="88.9127" y2="41.5163" layer="94"/>
<rectangle x1="90.0049" y1="41.4909" x2="90.0811" y2="41.5163" layer="94"/>
<rectangle x1="88.8111" y1="41.5163" x2="88.8873" y2="41.5417" layer="94"/>
<rectangle x1="89.9795" y1="41.5163" x2="90.0557" y2="41.5417" layer="94"/>
<rectangle x1="88.7857" y1="41.5417" x2="88.8619" y2="41.5671" layer="94"/>
<rectangle x1="89.9541" y1="41.5417" x2="90.0303" y2="41.5671" layer="94"/>
<rectangle x1="88.7603" y1="41.5671" x2="88.8619" y2="41.5925" layer="94"/>
<rectangle x1="89.9287" y1="41.5671" x2="90.0303" y2="41.5925" layer="94"/>
<rectangle x1="88.7349" y1="41.5925" x2="88.8111" y2="41.6179" layer="94"/>
<rectangle x1="89.9033" y1="41.5925" x2="90.0049" y2="41.6179" layer="94"/>
<rectangle x1="88.7095" y1="41.6179" x2="88.8111" y2="41.6433" layer="94"/>
<rectangle x1="89.8779" y1="41.6179" x2="90.0049" y2="41.6433" layer="94"/>
<rectangle x1="88.7095" y1="41.6433" x2="88.7603" y2="41.6687" layer="94"/>
<rectangle x1="89.9033" y1="41.6433" x2="89.9795" y2="41.6687" layer="94"/>
<rectangle x1="88.6587" y1="41.6687" x2="88.7857" y2="41.6941" layer="94"/>
<rectangle x1="89.8525" y1="41.6687" x2="89.9541" y2="41.6941" layer="94"/>
<rectangle x1="88.6587" y1="41.6941" x2="88.7603" y2="41.7195" layer="94"/>
<rectangle x1="89.8525" y1="41.6941" x2="89.9287" y2="41.7195" layer="94"/>
<rectangle x1="88.6333" y1="41.7195" x2="88.7349" y2="41.7449" layer="94"/>
<rectangle x1="89.8271" y1="41.7195" x2="89.9033" y2="41.7449" layer="94"/>
<rectangle x1="88.6333" y1="41.7449" x2="88.7095" y2="41.7703" layer="94"/>
<rectangle x1="89.8017" y1="41.7449" x2="89.8779" y2="41.7703" layer="94"/>
<rectangle x1="88.5825" y1="41.7703" x2="88.6841" y2="41.7957" layer="94"/>
<rectangle x1="89.7763" y1="41.7703" x2="89.8779" y2="41.7957" layer="94"/>
<rectangle x1="88.5825" y1="41.7957" x2="88.6587" y2="41.8211" layer="94"/>
<rectangle x1="89.7763" y1="41.7957" x2="89.8525" y2="41.8211" layer="94"/>
<rectangle x1="88.5571" y1="41.8211" x2="88.6333" y2="41.8465" layer="94"/>
<rectangle x1="89.7509" y1="41.8211" x2="89.8525" y2="41.8465" layer="94"/>
<rectangle x1="88.5317" y1="41.8465" x2="88.6079" y2="41.8719" layer="94"/>
<rectangle x1="89.7509" y1="41.8465" x2="89.8271" y2="41.8719" layer="94"/>
<rectangle x1="88.5063" y1="41.8719" x2="88.5825" y2="41.8973" layer="94"/>
<rectangle x1="89.7255" y1="41.8719" x2="89.8017" y2="41.8973" layer="94"/>
<rectangle x1="88.4809" y1="41.8973" x2="88.5571" y2="41.9227" layer="94"/>
<rectangle x1="89.7001" y1="41.8973" x2="89.7763" y2="41.9227" layer="94"/>
<rectangle x1="88.4555" y1="41.9227" x2="88.5571" y2="41.9481" layer="94"/>
<rectangle x1="89.6747" y1="41.9227" x2="89.7509" y2="41.9481" layer="94"/>
<rectangle x1="88.4301" y1="41.9481" x2="88.5063" y2="41.9735" layer="94"/>
<rectangle x1="89.6493" y1="41.9481" x2="89.7255" y2="41.9735" layer="94"/>
<rectangle x1="88.4047" y1="41.9735" x2="88.5317" y2="41.9989" layer="94"/>
<rectangle x1="89.6239" y1="41.9735" x2="89.7509" y2="41.9989" layer="94"/>
<rectangle x1="88.3793" y1="41.9989" x2="88.4809" y2="42.0243" layer="94"/>
<rectangle x1="89.5985" y1="41.9989" x2="89.7001" y2="42.0243" layer="94"/>
<rectangle x1="88.3539" y1="42.0243" x2="88.4809" y2="42.0497" layer="94"/>
<rectangle x1="89.5731" y1="42.0243" x2="89.7001" y2="42.0497" layer="94"/>
<rectangle x1="88.3793" y1="42.0497" x2="88.4555" y2="42.0751" layer="94"/>
<rectangle x1="89.5985" y1="42.0497" x2="89.6747" y2="42.0751" layer="94"/>
<rectangle x1="88.3285" y1="42.0751" x2="88.4301" y2="42.1005" layer="94"/>
<rectangle x1="89.5477" y1="42.0751" x2="89.6493" y2="42.1005" layer="94"/>
<rectangle x1="88.3285" y1="42.1005" x2="88.4047" y2="42.1259" layer="94"/>
<rectangle x1="89.5477" y1="42.1005" x2="89.6239" y2="42.1259" layer="94"/>
<rectangle x1="88.3031" y1="42.1259" x2="88.3793" y2="42.1513" layer="94"/>
<rectangle x1="89.5223" y1="42.1259" x2="89.5985" y2="42.1513" layer="94"/>
<rectangle x1="88.2777" y1="42.1513" x2="88.3539" y2="42.1767" layer="94"/>
<rectangle x1="89.4969" y1="42.1513" x2="89.5731" y2="42.1767" layer="94"/>
<rectangle x1="88.2523" y1="42.1767" x2="88.3285" y2="42.2021" layer="94"/>
<rectangle x1="89.4715" y1="42.1767" x2="89.5477" y2="42.2021" layer="94"/>
<rectangle x1="88.2269" y1="42.2021" x2="88.3031" y2="42.2275" layer="94"/>
<rectangle x1="89.4461" y1="42.2021" x2="89.5223" y2="42.2275" layer="94"/>
<rectangle x1="88.2015" y1="42.2275" x2="88.2777" y2="42.2529" layer="94"/>
<rectangle x1="89.4207" y1="42.2275" x2="89.5223" y2="42.2529" layer="94"/>
<rectangle x1="88.1761" y1="42.2529" x2="88.2523" y2="42.2783" layer="94"/>
<rectangle x1="89.4461" y1="42.2529" x2="89.4715" y2="42.2783" layer="94"/>
<rectangle x1="88.1507" y1="42.2783" x2="88.2523" y2="42.3037" layer="94"/>
<rectangle x1="89.4207" y1="42.2783" x2="89.4969" y2="42.3037" layer="94"/>
<rectangle x1="88.1253" y1="42.3037" x2="88.2269" y2="42.3291" layer="94"/>
<rectangle x1="89.4461" y1="42.3037" x2="89.4715" y2="42.3291" layer="94"/>
<rectangle x1="88.0999" y1="42.3291" x2="88.2269" y2="42.3545" layer="94"/>
<rectangle x1="88.1253" y1="42.3545" x2="88.1761" y2="42.3799" layer="94"/>
<rectangle x1="88.0745" y1="42.3799" x2="88.1761" y2="42.4053" layer="94"/>
<rectangle x1="88.0491" y1="42.4053" x2="88.1507" y2="42.4307" layer="94"/>
<rectangle x1="88.0491" y1="42.4307" x2="88.1253" y2="42.4561" layer="94"/>
<rectangle x1="88.0237" y1="42.4561" x2="88.0999" y2="42.4815" layer="94"/>
<rectangle x1="88.0491" y1="42.4815" x2="88.0745" y2="42.5069" layer="94"/>
<rectangle x1="88.0237" y1="42.5069" x2="88.0491" y2="42.5323" layer="94"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="FRAME_B_L" prefix="FRAME">
<description>&lt;b&gt;FRAME&lt;/b&gt; B Size , 11 x 17 INCH, Landscape&lt;p&gt;</description>
<gates>
<gate name="G$1" symbol="FRAME_B_L" x="0" y="0" addlevel="always"/>
<gate name="G$2" symbol="DOCFIELD" x="325.12" y="0" addlevel="always"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name="">
<attribute name="SCH_DESC" value="insert_description" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="led" urn="urn:adsk.eagle:library:259">
<description>&lt;b&gt;LEDs&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;&lt;br&gt;
Extended by Federico Battaglin &lt;author&gt;&amp;lt;federico.rd@fdpinternational.com&amp;gt;&lt;/author&gt; with DUOLED</description>
<packages>
<package name="1206" urn="urn:adsk.eagle:footprint:15651/1" library_version="2">
<description>&lt;b&gt;CHICAGO MINIATURE LAMP, INC.&lt;/b&gt;&lt;p&gt;
7022X Series SMT LEDs 1206 Package Size</description>
<wire x1="1.55" y1="-0.75" x2="-1.55" y2="-0.75" width="0.1016" layer="51"/>
<wire x1="-1.55" y1="-0.75" x2="-1.55" y2="0.75" width="0.1016" layer="51"/>
<wire x1="-1.55" y1="0.75" x2="1.55" y2="0.75" width="0.1016" layer="51"/>
<wire x1="1.55" y1="0.75" x2="1.55" y2="-0.75" width="0.1016" layer="51"/>
<wire x1="-0.55" y1="-0.5" x2="0.55" y2="-0.5" width="0.1016" layer="21" curve="95.452622"/>
<wire x1="-0.55" y1="-0.5" x2="-0.55" y2="0.5" width="0.1016" layer="51" curve="-84.547378"/>
<wire x1="-0.55" y1="0.5" x2="0.55" y2="0.5" width="0.1016" layer="21" curve="-95.452622"/>
<wire x1="0.55" y1="0.5" x2="0.55" y2="-0.5" width="0.1016" layer="51" curve="-84.547378"/>
<smd name="A" x="-1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<smd name="C" x="1.422" y="0" dx="1.6" dy="1.803" layer="1"/>
<text x="-1.27" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.27" y="-2.54" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.1" y1="-0.1" x2="0.1" y2="0.1" layer="21"/>
<rectangle x1="0.45" y1="-0.7" x2="0.8" y2="-0.45" layer="51"/>
<rectangle x1="0.8" y1="-0.7" x2="0.9" y2="0.5" layer="51"/>
<rectangle x1="0.8" y1="0.55" x2="0.9" y2="0.7" layer="51"/>
<rectangle x1="-0.9" y1="-0.7" x2="-0.8" y2="0.5" layer="51"/>
<rectangle x1="-0.9" y1="0.55" x2="-0.8" y2="0.7" layer="51"/>
<rectangle x1="0.45" y1="-0.7" x2="0.6" y2="-0.45" layer="21"/>
</package>
<package name="LD260" urn="urn:adsk.eagle:footprint:15652/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
5 mm, square, Siemens</description>
<wire x1="-1.27" y1="-1.27" x2="0" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="-1.27" x2="1.27" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.27" x2="0" y2="1.27" width="0.1524" layer="21"/>
<wire x1="0" y1="1.27" x2="-1.27" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.27" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.889" x2="1.27" y2="0" width="0.1524" layer="51"/>
<wire x1="1.27" y1="0" x2="1.27" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.889" x2="-1.27" y2="0" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="0" x2="-1.27" y2="0.889" width="0.1524" layer="51"/>
<wire x1="0" y1="1.27" x2="0.9917" y2="0.7934" width="0.1524" layer="21" curve="-51.33923"/>
<wire x1="-0.9917" y1="0.7934" x2="0" y2="1.27" width="0.1524" layer="21" curve="-51.33923"/>
<wire x1="0" y1="-1.27" x2="0.9917" y2="-0.7934" width="0.1524" layer="21" curve="51.33923"/>
<wire x1="-0.9917" y1="-0.7934" x2="0" y2="-1.27" width="0.1524" layer="21" curve="51.33923"/>
<wire x1="0.9558" y1="-0.8363" x2="1.27" y2="0" width="0.1524" layer="51" curve="41.185419"/>
<wire x1="0.9756" y1="0.813" x2="1.2699" y2="0" width="0.1524" layer="51" curve="-39.806332"/>
<wire x1="-1.27" y1="0" x2="-0.9643" y2="-0.8265" width="0.1524" layer="51" curve="40.600331"/>
<wire x1="-1.27" y1="0" x2="-0.9643" y2="0.8265" width="0.1524" layer="51" curve="-40.600331"/>
<wire x1="-0.889" y1="0" x2="0" y2="0.889" width="0.1524" layer="51" curve="-90"/>
<wire x1="-0.508" y1="0" x2="0" y2="0.508" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-0.508" x2="0.508" y2="0" width="0.1524" layer="21" curve="90"/>
<wire x1="0" y1="-0.889" x2="0.889" y2="0" width="0.1524" layer="51" curve="90"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.2954" y="1.4732" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-2.4892" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="1.27" y1="-0.635" x2="2.032" y2="0.635" layer="51"/>
<rectangle x1="1.905" y1="-0.635" x2="2.032" y2="0.635" layer="21"/>
</package>
<package name="LED2X5" urn="urn:adsk.eagle:footprint:15653/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
2 x 5 mm, rectangle</description>
<wire x1="-2.54" y1="-1.27" x2="2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="2.54" y1="1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.27" x2="-2.54" y2="1.27" width="0.1524" layer="21"/>
<wire x1="-1.905" y1="0" x2="0.508" y2="0" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="0.381" x2="-0.508" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="-0.508" y1="0.381" x2="0.508" y2="0" width="0.1524" layer="51"/>
<wire x1="0.508" y1="0" x2="1.778" y2="0" width="0.1524" layer="51"/>
<wire x1="0.508" y1="0" x2="-0.508" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="0.508" y1="0.381" x2="0.508" y2="0" width="0.1524" layer="51"/>
<wire x1="0.508" y1="0" x2="0.508" y2="-0.381" width="0.1524" layer="51"/>
<wire x1="0.889" y1="-0.254" x2="1.143" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.762" x2="1.143" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="1.143" y1="-0.762" x2="0.9398" y2="-0.6096" width="0.1524" layer="51"/>
<wire x1="0.9398" y1="-0.6096" x2="1.143" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="1.397" y1="-0.254" x2="1.651" y2="-0.762" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-0.762" x2="1.651" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="1.651" y1="-0.762" x2="1.4478" y2="-0.6096" width="0.1524" layer="51"/>
<wire x1="1.4478" y1="-0.6096" x2="1.651" y2="-0.508" width="0.1524" layer="51"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-2.54" y="1.397" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-2.54" y="-2.413" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.159" y1="-1.27" x2="2.413" y2="1.27" layer="21"/>
</package>
<package name="LED3MM" urn="urn:adsk.eagle:footprint:15654/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
3 mm, round</description>
<wire x1="1.5748" y1="-1.27" x2="1.5748" y2="1.27" width="0.254" layer="51"/>
<wire x1="-1.524" y1="0" x2="-1.1708" y2="0.9756" width="0.1524" layer="51" curve="-39.80361"/>
<wire x1="-1.524" y1="0" x2="-1.1391" y2="-1.0125" width="0.1524" layer="51" curve="41.633208"/>
<wire x1="1.1571" y1="0.9918" x2="1.524" y2="0" width="0.1524" layer="51" curve="-40.601165"/>
<wire x1="1.1708" y1="-0.9756" x2="1.524" y2="0" width="0.1524" layer="51" curve="39.80361"/>
<wire x1="0" y1="1.524" x2="1.2401" y2="0.8858" width="0.1524" layer="21" curve="-54.461337"/>
<wire x1="-1.2192" y1="0.9144" x2="0" y2="1.524" width="0.1524" layer="21" curve="-53.130102"/>
<wire x1="0" y1="-1.524" x2="1.203" y2="-0.9356" width="0.1524" layer="21" curve="52.126876"/>
<wire x1="-1.203" y1="-0.9356" x2="0" y2="-1.524" width="0.1524" layer="21" curve="52.126876"/>
<wire x1="-0.635" y1="0" x2="0" y2="0.635" width="0.1524" layer="51" curve="-90"/>
<wire x1="-1.016" y1="0" x2="0" y2="1.016" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="0" y1="-1.016" x2="1.016" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="0" y1="2.032" x2="1.561" y2="1.3009" width="0.254" layer="21" curve="-50.193108"/>
<wire x1="-1.7929" y1="0.9562" x2="0" y2="2.032" width="0.254" layer="21" curve="-61.926949"/>
<wire x1="0" y1="-2.032" x2="1.5512" y2="-1.3126" width="0.254" layer="21" curve="49.763022"/>
<wire x1="-1.7643" y1="-1.0082" x2="0" y2="-2.032" width="0.254" layer="21" curve="60.255215"/>
<wire x1="-2.032" y1="0" x2="-1.7891" y2="0.9634" width="0.254" layer="51" curve="-28.301701"/>
<wire x1="-2.032" y1="0" x2="-1.7306" y2="-1.065" width="0.254" layer="51" curve="31.60822"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="1.905" y="0.381" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="1.905" y="-1.651" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="LED5MM" urn="urn:adsk.eagle:footprint:15655/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
5 mm, round</description>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="1.905" width="0.2032" layer="21"/>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="1.905" width="0.254" layer="21" curve="-286.260205"/>
<wire x1="-1.143" y1="0" x2="0" y2="1.143" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-1.143" x2="1.143" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-1.651" y1="0" x2="0" y2="1.651" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-1.651" x2="1.651" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-2.159" y1="0" x2="0" y2="2.159" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-2.159" x2="2.159" y2="0" width="0.1524" layer="51" curve="90"/>
<circle x="0" y="0" radius="2.54" width="0.1524" layer="21"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="3.175" y="0.5334" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.2004" y="-1.8034" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="LSU260" urn="urn:adsk.eagle:footprint:15656/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
1 mm, round, Siemens</description>
<wire x1="0" y1="-0.508" x2="-1.143" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="-0.508" x2="-1.143" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="0.508" x2="0" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="-0.254" x2="-1.397" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="-0.254" x2="-1.143" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-1.397" y1="-0.254" x2="-1.397" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-1.397" y1="0.254" x2="-1.143" y2="0.254" width="0.1524" layer="51"/>
<wire x1="-1.143" y1="0.254" x2="-1.143" y2="0.508" width="0.1524" layer="51"/>
<wire x1="0.508" y1="-0.254" x2="1.397" y2="-0.254" width="0.1524" layer="51"/>
<wire x1="1.397" y1="-0.254" x2="1.397" y2="0.254" width="0.1524" layer="51"/>
<wire x1="1.397" y1="0.254" x2="0.508" y2="0.254" width="0.1524" layer="51"/>
<wire x1="0.381" y1="-0.381" x2="0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.254" y1="-0.508" x2="-0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="-0.381" x2="-0.254" y2="-0.508" width="0.1524" layer="21"/>
<wire x1="0.381" y1="0.381" x2="0.254" y2="0.508" width="0.1524" layer="21"/>
<wire x1="0.254" y1="0.508" x2="-0.254" y2="0.508" width="0.1524" layer="21"/>
<wire x1="-0.381" y1="0.381" x2="-0.254" y2="0.508" width="0.1524" layer="21"/>
<wire x1="0" y1="-0.254" x2="0.254" y2="0" width="0.1524" layer="21" curve="90"/>
<wire x1="-0.254" y1="0" x2="0" y2="0.254" width="0.1524" layer="21" curve="-90"/>
<wire x1="0.381" y1="-0.381" x2="0.381" y2="0.381" width="0.1524" layer="21" curve="90"/>
<circle x="0" y="0" radius="0.508" width="0.1524" layer="51"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.2954" y="0.8382" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-1.8542" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="-1.397" y1="-0.254" x2="-1.143" y2="0.254" layer="51"/>
<rectangle x1="0.508" y1="-0.254" x2="1.397" y2="0.254" layer="51"/>
</package>
<package name="LZR181" urn="urn:adsk.eagle:footprint:15657/1" library_version="2">
<description>&lt;B&gt;LED BLOCK&lt;/B&gt;&lt;p&gt;
1 LED, Siemens</description>
<wire x1="-1.27" y1="-1.27" x2="1.27" y2="-1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="-1.27" x2="1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="1.27" y1="0.889" x2="1.27" y2="-0.889" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="0.889" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-1.27" x2="-1.27" y2="-0.889" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-0.889" x2="-1.27" y2="0.889" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="0" x2="0" y2="0.889" width="0.1524" layer="51" curve="-90"/>
<wire x1="-0.508" y1="0" x2="0" y2="0.508" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-0.508" x2="0.508" y2="0" width="0.1524" layer="21" curve="90"/>
<wire x1="0" y1="-0.889" x2="0.889" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-0.8678" y1="0.7439" x2="0" y2="1.143" width="0.1524" layer="21" curve="-49.396139"/>
<wire x1="0" y1="1.143" x2="0.8678" y2="0.7439" width="0.1524" layer="21" curve="-49.396139"/>
<wire x1="-0.8678" y1="-0.7439" x2="0" y2="-1.143" width="0.1524" layer="21" curve="49.396139"/>
<wire x1="0" y1="-1.143" x2="0.8678" y2="-0.7439" width="0.1524" layer="21" curve="49.396139"/>
<wire x1="0.8678" y1="0.7439" x2="1.143" y2="0" width="0.1524" layer="51" curve="-40.604135"/>
<wire x1="0.8678" y1="-0.7439" x2="1.143" y2="0" width="0.1524" layer="51" curve="40.604135"/>
<wire x1="-1.143" y1="0" x2="-0.8678" y2="0.7439" width="0.1524" layer="51" curve="-40.604135"/>
<wire x1="-1.143" y1="0" x2="-0.8678" y2="-0.7439" width="0.1524" layer="51" curve="40.604135"/>
<wire x1="-1.27" y1="1.27" x2="1.27" y2="1.27" width="0.1524" layer="21"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="octagon"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="octagon"/>
<text x="-1.2954" y="1.4732" size="1.016" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-2.4892" size="1.016" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="1.27" y1="-0.889" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.27" y2="0.254" layer="51"/>
</package>
<package name="Q62902-B152" urn="urn:adsk.eagle:footprint:15658/1" library_version="2">
<description>&lt;b&gt;LED HOLDER&lt;/b&gt;&lt;p&gt;
Siemens</description>
<wire x1="-2.9718" y1="-1.8542" x2="-2.9718" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="-0.254" x2="-2.9718" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="0.254" x2="-2.9718" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="2.9718" y1="-1.8542" x2="-2.1082" y2="-1.8542" width="0.1524" layer="21"/>
<wire x1="-2.1082" y1="-1.8542" x2="-2.54" y2="-1.8542" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.8542" x2="-2.1082" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="-2.1082" y1="1.8542" x2="2.9718" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.8542" x2="-2.54" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-1.8542" x2="-2.9718" y2="-1.8542" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.8542" x2="-2.9718" y2="1.8542" width="0.1524" layer="21"/>
<wire x1="-2.9718" y1="0.254" x2="-2.9718" y2="-0.254" width="0.1524" layer="21" curve="180"/>
<wire x1="-1.1486" y1="0.8814" x2="0" y2="1.4478" width="0.1524" layer="21" curve="-52.498642"/>
<wire x1="0" y1="1.4478" x2="1.1476" y2="0.8827" width="0.1524" layer="21" curve="-52.433716"/>
<wire x1="-1.1351" y1="-0.8987" x2="0" y2="-1.4478" width="0.1524" layer="21" curve="51.629985"/>
<wire x1="0" y1="-1.4478" x2="1.1305" y2="-0.9044" width="0.1524" layer="21" curve="51.339172"/>
<wire x1="1.1281" y1="-0.9074" x2="1.4478" y2="0" width="0.1524" layer="51" curve="38.811177"/>
<wire x1="1.1401" y1="0.8923" x2="1.4478" y2="0" width="0.1524" layer="51" curve="-38.048073"/>
<wire x1="-1.4478" y1="0" x2="-1.1305" y2="-0.9044" width="0.1524" layer="51" curve="38.659064"/>
<wire x1="-1.4478" y1="0" x2="-1.1456" y2="0.8853" width="0.1524" layer="51" curve="-37.696376"/>
<wire x1="0" y1="1.7018" x2="1.4674" y2="0.8618" width="0.1524" layer="21" curve="-59.573488"/>
<wire x1="-1.4618" y1="0.8714" x2="0" y2="1.7018" width="0.1524" layer="21" curve="-59.200638"/>
<wire x1="0" y1="-1.7018" x2="1.4571" y2="-0.8793" width="0.1524" layer="21" curve="58.891781"/>
<wire x1="-1.4571" y1="-0.8793" x2="0" y2="-1.7018" width="0.1524" layer="21" curve="58.891781"/>
<wire x1="-1.7018" y1="0" x2="-1.4447" y2="0.8995" width="0.1524" layer="51" curve="-31.907626"/>
<wire x1="-1.7018" y1="0" x2="-1.4502" y2="-0.8905" width="0.1524" layer="51" curve="31.551992"/>
<wire x1="1.4521" y1="0.8874" x2="1.7018" y2="0" width="0.1524" layer="51" curve="-31.429586"/>
<wire x1="1.4459" y1="-0.8975" x2="1.7018" y2="0" width="0.1524" layer="51" curve="31.828757"/>
<wire x1="-2.1082" y1="1.8542" x2="-2.1082" y2="-1.8542" width="0.1524" layer="21"/>
<wire x1="-0.635" y1="0" x2="0" y2="0.635" width="0.1524" layer="21" curve="-90"/>
<wire x1="-1.016" y1="0" x2="0" y2="1.016" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="0.0539" y1="-1.0699" x2="1.0699" y2="-0.0539" width="0.1524" layer="51" curve="90"/>
<wire x1="2.9718" y1="1.8542" x2="2.9718" y2="-1.8542" width="0.1524" layer="21"/>
<pad name="K" x="-1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="A" x="1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-1.905" y="2.286" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.905" y="-3.556" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="Q62902-B153" urn="urn:adsk.eagle:footprint:15659/1" library_version="2">
<description>&lt;b&gt;LED HOLDER&lt;/b&gt;&lt;p&gt;
Siemens</description>
<wire x1="-5.5118" y1="-3.5052" x2="-5.5118" y2="-0.254" width="0.1524" layer="21"/>
<wire x1="-5.5118" y1="-0.254" x2="-5.5118" y2="0.254" width="0.1524" layer="21"/>
<wire x1="-5.5118" y1="0.254" x2="-5.5118" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="5.5118" y1="-3.5052" x2="-4.6482" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-4.6482" y1="-3.5052" x2="-5.08" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.5052" x2="-4.6482" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-4.6482" y1="3.5052" x2="5.5118" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-3.5052" x2="-5.08" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="-3.5052" x2="-5.5118" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-5.08" y1="3.5052" x2="-5.5118" y2="3.5052" width="0.1524" layer="21"/>
<wire x1="-5.5118" y1="0.254" x2="-5.5118" y2="-0.254" width="0.1524" layer="21" curve="180"/>
<wire x1="-4.6482" y1="3.5052" x2="-4.6482" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="5.5118" y1="3.5052" x2="5.5118" y2="-3.5052" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.905" x2="-2.54" y2="-1.905" width="0.254" layer="21"/>
<wire x1="0" y1="-1.143" x2="1.143" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-1.143" y1="0" x2="0" y2="1.143" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-1.651" x2="1.651" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-1.651" y1="0" x2="0" y2="1.651" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-2.159" x2="2.159" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-2.2129" y1="0.0539" x2="-0.0539" y2="2.2129" width="0.1524" layer="51" curve="-90.010616"/>
<circle x="0" y="0" radius="2.54" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.175" width="0.254" layer="21"/>
<pad name="A" x="1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="K" x="-1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-4.191" y="3.937" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-4.318" y="-5.08" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="Q62902-B155" urn="urn:adsk.eagle:footprint:15660/1" library_version="2">
<description>&lt;b&gt;LED HOLDER&lt;/b&gt;&lt;p&gt;
Siemens</description>
<wire x1="-1.27" y1="-3.048" x2="-1.27" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="10.033" y1="3.048" x2="2.921" y2="3.048" width="0.1524" layer="21"/>
<wire x1="10.033" y1="3.048" x2="10.033" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-3.048" x2="2.921" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-3.048" x2="2.921" y2="3.048" width="0.1524" layer="21"/>
<wire x1="2.921" y1="-3.048" x2="10.033" y2="-3.048" width="0.1524" layer="21"/>
<wire x1="2.921" y1="3.048" x2="-1.27" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-5.207" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="2.54" x2="-1.27" y2="3.048" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="-2.54" x2="-1.27" y2="-2.54" width="0.1524" layer="21"/>
<wire x1="-1.27" y1="-2.54" x2="-1.27" y2="2.54" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="2.54" x2="-5.207" y2="-2.54" width="0.1524" layer="21" curve="180"/>
<wire x1="-6.985" y1="0.635" x2="-6.985" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="-6.096" y1="1.397" x2="-6.096" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-5.207" y1="1.905" x2="-5.207" y2="-1.905" width="0.1524" layer="21"/>
<pad name="K" x="7.62" y="1.27" drill="0.8128" shape="long"/>
<pad name="A" x="7.62" y="-1.27" drill="0.8128" shape="long"/>
<text x="3.302" y="-2.794" size="1.016" layer="21" ratio="14">A+</text>
<text x="3.302" y="1.778" size="1.016" layer="21" ratio="14">K-</text>
<text x="11.684" y="-2.794" size="1.27" layer="25" ratio="10" rot="R90">&gt;NAME</text>
<text x="0.635" y="-4.445" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="2.921" y1="1.016" x2="6.731" y2="1.524" layer="21"/>
<rectangle x1="2.921" y1="-1.524" x2="6.731" y2="-1.016" layer="21"/>
<hole x="0" y="0" drill="0.8128"/>
</package>
<package name="Q62902-B156" urn="urn:adsk.eagle:footprint:15661/1" library_version="2">
<description>&lt;b&gt;LED HOLDER&lt;/b&gt;&lt;p&gt;
Siemens</description>
<wire x1="2.54" y1="-1.905" x2="2.54" y2="1.905" width="0.1524" layer="21"/>
<wire x1="-1.143" y1="0" x2="0" y2="1.143" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-1.143" x2="1.143" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-1.651" y1="0" x2="0" y2="1.651" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-1.651" x2="1.651" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="-2.159" y1="0" x2="0" y2="2.159" width="0.1524" layer="51" curve="-90"/>
<wire x1="0.0539" y1="-2.2129" x2="2.2129" y2="-0.0539" width="0.1524" layer="51" curve="90.005308"/>
<wire x1="2.54" y1="3.81" x2="3.81" y2="2.54" width="0.1524" layer="21"/>
<wire x1="2.54" y1="3.81" x2="-3.81" y2="3.81" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.81" x2="-3.81" y2="3.81" width="0.1524" layer="21"/>
<wire x1="3.81" y1="2.54" x2="3.81" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-3.81" y1="-3.81" x2="-2.54" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="-3.302" x2="-2.54" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="3.81" y1="-3.81" x2="2.54" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-3.302" x2="2.54" y2="-3.81" width="0.1524" layer="21"/>
<wire x1="2.54" y1="-3.302" x2="-2.54" y2="-3.302" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.54" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="3.175" width="0.254" layer="21"/>
<pad name="A" x="-1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="K" x="1.27" y="0" drill="1.016" shape="long" rot="R90"/>
<text x="-3.81" y="4.0894" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-3.7846" y="-5.3594" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
<text x="-3.556" y="-3.302" size="1.016" layer="21" ratio="14">+</text>
<text x="2.794" y="-3.302" size="1.016" layer="21" ratio="14">-</text>
</package>
<package name="SFH480" urn="urn:adsk.eagle:footprint:15662/1" library_version="2">
<description>&lt;B&gt;IR LED&lt;/B&gt;&lt;p&gt;
infrared emitting diode, Infineon
TO-18, lead spacing 2.54 mm, cathode marking&lt;p&gt;
Inifineon</description>
<wire x1="-2.159" y1="1.524" x2="-2.794" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.159" x2="-2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.159" x2="-2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0" y1="1.778" x2="1.5358" y2="0.8959" width="0.1524" layer="21" curve="-59.743278"/>
<wire x1="-1.5358" y1="0.8959" x2="0" y2="1.778" width="0.1524" layer="21" curve="-59.743278"/>
<wire x1="-1.5358" y1="-0.8959" x2="0" y2="-1.778" width="0.1524" layer="21" curve="59.743278"/>
<wire x1="0" y1="-1.778" x2="1.5358" y2="-0.8959" width="0.1524" layer="21" curve="59.743278"/>
<wire x1="1.5142" y1="0.9318" x2="1.778" y2="0" width="0.1524" layer="51" curve="-31.606487"/>
<wire x1="1.5" y1="-0.9546" x2="1.778" y2="0" width="0.1524" layer="51" curve="32.472615"/>
<wire x1="-1.778" y1="0" x2="-1.5142" y2="-0.9318" width="0.1524" layer="51" curve="31.606487"/>
<wire x1="-1.778" y1="0" x2="-1.5" y2="0.9546" width="0.1524" layer="51" curve="-32.472615"/>
<wire x1="-0.635" y1="0" x2="0" y2="0.635" width="0.1524" layer="51" curve="-90"/>
<wire x1="-1.016" y1="0" x2="0" y2="1.016" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="0.0539" y1="-1.0699" x2="1.0699" y2="-0.0539" width="0.1524" layer="51" curve="90"/>
<circle x="0" y="0" radius="2.667" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.413" width="0.254" layer="21"/>
<pad name="K" x="-1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="A" x="1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-1.27" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-4.318" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="SFH482" urn="urn:adsk.eagle:footprint:15650/1" library_version="2">
<description>&lt;B&gt;IR LED&lt;/B&gt;&lt;p&gt;
infrared emitting diode, Infineon
TO-18, lead spacing 2.54 mm, cathode marking&lt;p&gt;
Inifineon</description>
<wire x1="-2.159" y1="1.524" x2="-2.794" y2="2.159" width="0.1524" layer="21"/>
<wire x1="-2.794" y1="2.159" x2="-2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="-1.524" y1="2.159" x2="-2.159" y2="2.794" width="0.1524" layer="21"/>
<wire x1="0" y1="1.778" x2="1.5358" y2="0.8959" width="0.1524" layer="21" curve="-59.743278"/>
<wire x1="-1.5358" y1="0.8959" x2="0" y2="1.778" width="0.1524" layer="21" curve="-59.743278"/>
<wire x1="-1.5358" y1="-0.8959" x2="0" y2="-1.778" width="0.1524" layer="21" curve="59.743278"/>
<wire x1="0" y1="-1.778" x2="1.5358" y2="-0.8959" width="0.1524" layer="21" curve="59.743278"/>
<wire x1="1.5142" y1="0.9318" x2="1.778" y2="0" width="0.1524" layer="51" curve="-31.606487"/>
<wire x1="1.5" y1="-0.9546" x2="1.778" y2="0" width="0.1524" layer="51" curve="32.472615"/>
<wire x1="-1.778" y1="0" x2="-1.5142" y2="-0.9318" width="0.1524" layer="51" curve="31.606487"/>
<wire x1="-1.778" y1="0" x2="-1.5" y2="0.9546" width="0.1524" layer="51" curve="-32.472615"/>
<wire x1="-0.635" y1="0" x2="0" y2="0.635" width="0.1524" layer="51" curve="-90"/>
<wire x1="-1.016" y1="0" x2="0" y2="1.016" width="0.1524" layer="51" curve="-90"/>
<wire x1="0" y1="-0.635" x2="0.635" y2="0" width="0.1524" layer="51" curve="90"/>
<wire x1="0.0539" y1="-1.0699" x2="1.0699" y2="-0.0539" width="0.1524" layer="51" curve="90"/>
<circle x="0" y="0" radius="2.667" width="0.1524" layer="21"/>
<circle x="0" y="0" radius="2.413" width="0.254" layer="21"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="-1.27" y="3.048" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="-1.27" y="-4.318" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="U57X32" urn="urn:adsk.eagle:footprint:15640/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
rectangle, 5.7 x 3.2 mm</description>
<wire x1="-3.175" y1="1.905" x2="3.175" y2="1.905" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.905" x2="3.175" y2="1.905" width="0.1524" layer="21"/>
<wire x1="3.175" y1="-1.905" x2="-3.175" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-3.175" y1="1.905" x2="-3.175" y2="-1.905" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="1.397" x2="2.667" y2="1.397" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.397" x2="2.667" y2="1.397" width="0.1524" layer="21"/>
<wire x1="2.667" y1="-1.397" x2="-2.667" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-2.667" y1="1.397" x2="-2.667" y2="-1.397" width="0.1524" layer="21"/>
<wire x1="-2.54" y1="1.016" x2="2.54" y2="1.016" width="0.1524" layer="51"/>
<wire x1="2.286" y1="1.27" x2="2.286" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0.508" x2="2.54" y2="0.508" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="0" x2="2.54" y2="0" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-0.508" x2="2.54" y2="-0.508" width="0.1524" layer="51"/>
<wire x1="-2.54" y1="-1.016" x2="2.54" y2="-1.016" width="0.1524" layer="51"/>
<wire x1="-2.286" y1="1.27" x2="-2.286" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.778" y1="1.27" x2="-1.778" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.762" y1="1.27" x2="-0.762" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="-0.254" y1="1.27" x2="-0.254" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="0.254" y1="1.27" x2="0.254" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="0.762" y1="1.27" x2="0.762" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.27" y1="1.27" x2="1.27" y2="-1.27" width="0.1524" layer="51"/>
<wire x1="1.778" y1="1.27" x2="1.778" y2="-1.27" width="0.1524" layer="51"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<pad name="K" x="1.27" y="0" drill="0.8128" shape="long" rot="R90"/>
<text x="3.683" y="0.254" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="3.683" y="-1.524" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="IRL80A" urn="urn:adsk.eagle:footprint:15663/1" library_version="2">
<description>&lt;B&gt;IR LED&lt;/B&gt;&lt;p&gt;
IR transmitter Siemens</description>
<wire x1="0.889" y1="2.286" x2="0.889" y2="1.778" width="0.1524" layer="21"/>
<wire x1="0.889" y1="1.778" x2="0.889" y2="0.762" width="0.1524" layer="51"/>
<wire x1="0.889" y1="0.762" x2="0.889" y2="-0.635" width="0.1524" layer="21"/>
<wire x1="0.889" y1="-0.635" x2="0.889" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="0.889" y1="-1.778" x2="0.889" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="0.889" y1="-2.286" x2="-0.889" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="2.286" x2="-0.889" y2="1.778" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="1.778" x2="-0.889" y2="0.762" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="0.762" x2="-0.889" y2="-0.762" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-0.762" x2="-0.889" y2="-1.778" width="0.1524" layer="51"/>
<wire x1="-0.889" y1="-1.778" x2="-0.889" y2="-2.286" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="2.286" x2="0.889" y2="2.286" width="0.1524" layer="21"/>
<wire x1="-0.889" y1="-0.762" x2="-0.889" y2="0.762" width="0.1524" layer="21" curve="-180"/>
<wire x1="-1.397" y1="0.254" x2="-1.397" y2="-0.254" width="0.0508" layer="21"/>
<wire x1="-1.143" y1="0.508" x2="-1.143" y2="-0.508" width="0.0508" layer="21"/>
<pad name="K" x="0" y="1.27" drill="0.8128" shape="octagon"/>
<pad name="A" x="0" y="-1.27" drill="0.8128" shape="octagon"/>
<text x="1.27" y="0.381" size="1.27" layer="25" ratio="10">&gt;NAME</text>
<text x="1.27" y="-1.651" size="1.27" layer="27" ratio="10">&gt;VALUE</text>
</package>
<package name="P-LCC-2" urn="urn:adsk.eagle:footprint:15664/1" library_version="2">
<description>&lt;b&gt;TOPLED® High-optical Power LED (HOP)&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... ls_t675.pdf</description>
<wire x1="-1.4" y1="-1.05" x2="-1.4" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="-1.6" x2="-1.1" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="-1.6" x2="-0.85" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-0.85" y1="-1.6" x2="1.1" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="1.1" y1="-1.6" x2="1.4" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="1.4" y1="-1.6" x2="1.4" y2="1.6" width="0.2032" layer="51"/>
<wire x1="1.4" y1="1.6" x2="1.1" y2="1.6" width="0.2032" layer="51"/>
<wire x1="1.1" y1="1.6" x2="-1.1" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="-1.4" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="-1.1" y2="1.8" width="0.1016" layer="51"/>
<wire x1="-1.1" y1="1.8" x2="1.1" y2="1.8" width="0.1016" layer="51"/>
<wire x1="1.1" y1="1.8" x2="1.1" y2="1.6" width="0.1016" layer="51"/>
<wire x1="-1.1" y1="-1.6" x2="-1.1" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="-1.1" y1="-1.8" x2="1.1" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="1.1" y1="-1.8" x2="1.1" y2="-1.6" width="0.1016" layer="51"/>
<wire x1="-0.85" y1="-1.6" x2="-1.4" y2="-1.05" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="1.6" x2="-1.4" y2="-1.05" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="1.1" width="0.2032" layer="51"/>
<smd name="C" x="0" y="-2.75" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<smd name="A" x="0" y="2.75" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<text x="-2.54" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.81" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="-0.635" y="2.54" size="1.27" layer="21">A</text>
<text x="-0.635" y="-3.81" size="1.27" layer="21">C</text>
<rectangle x1="-1.3" y1="-2.25" x2="1.3" y2="-0.75" layer="31"/>
<rectangle x1="-1.3" y1="0.75" x2="1.3" y2="2.25" layer="31"/>
<rectangle x1="-0.25" y1="-0.25" x2="0.25" y2="0.25" layer="21"/>
<rectangle x1="-1.4" y1="0.65" x2="1.4" y2="2.35" layer="29"/>
<rectangle x1="-1.4" y1="-2.35" x2="1.4" y2="-0.65" layer="29"/>
</package>
<package name="OSRAM-MINI-TOP-LED" urn="urn:adsk.eagle:footprint:15665/1" library_version="2">
<description>&lt;b&gt;BLUE LINETM Hyper Mini TOPLED® Hyper-Bright LED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LB M676.pdf</description>
<wire x1="-0.6" y1="0.9" x2="-0.6" y2="-0.7" width="0.1016" layer="51"/>
<wire x1="-0.45" y1="-0.9" x2="-0.4" y2="-0.9" width="0.1016" layer="51"/>
<wire x1="-0.4" y1="-0.9" x2="0.6" y2="-0.9" width="0.1016" layer="51"/>
<wire x1="0.6" y1="-0.9" x2="0.6" y2="0.9" width="0.1016" layer="51"/>
<wire x1="0.6" y1="0.9" x2="-0.6" y2="0.9" width="0.1016" layer="51"/>
<wire x1="-0.45" y1="0.95" x2="-0.45" y2="1.1" width="0.1016" layer="51"/>
<wire x1="-0.45" y1="1.1" x2="0.45" y2="1.1" width="0.1016" layer="51"/>
<wire x1="0.45" y1="1.1" x2="0.45" y2="0.95" width="0.1016" layer="51"/>
<wire x1="-0.6" y1="-0.7" x2="-0.4" y2="-0.9" width="0.1016" layer="51"/>
<wire x1="-0.45" y1="-0.9" x2="-0.45" y2="-1.1" width="0.1016" layer="51"/>
<wire x1="-0.45" y1="-1.1" x2="0.45" y2="-1.1" width="0.1016" layer="51"/>
<wire x1="0.45" y1="-1.1" x2="0.45" y2="-0.95" width="0.1016" layer="51"/>
<smd name="A" x="0" y="2.6" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<smd name="C" x="0" y="-2.6" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<text x="-0.635" y="1.905" size="1.27" layer="21">A</text>
<text x="-0.635" y="-3.175" size="1.27" layer="21">C</text>
<text x="-2.54" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.81" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.5" y1="0.6" x2="0.5" y2="1.4" layer="29"/>
<rectangle x1="-0.5" y1="-1.4" x2="0.5" y2="-0.6" layer="29"/>
<rectangle x1="-0.15" y1="-0.6" x2="0.15" y2="-0.3" layer="51"/>
<rectangle x1="-0.45" y1="0.65" x2="0.45" y2="1.35" layer="31"/>
<rectangle x1="-0.45" y1="-1.35" x2="0.45" y2="-0.65" layer="31"/>
</package>
<package name="OSRAM-SIDELED" urn="urn:adsk.eagle:footprint:15666/1" library_version="2">
<description>&lt;b&gt;Super SIDELED® High-Current LED&lt;/b&gt;&lt;p&gt;
LG A672, LP A672 &lt;br&gt;
Source: http://www.osram.convergy.de/ ... LG_LP_A672.pdf (2004.05.13)</description>
<wire x1="-1.85" y1="-2.05" x2="-1.85" y2="-0.75" width="0.1016" layer="51"/>
<wire x1="-1.85" y1="-0.75" x2="-1.7" y2="-0.75" width="0.1016" layer="51"/>
<wire x1="-1.7" y1="-0.75" x2="-1.7" y2="0.75" width="0.1016" layer="51"/>
<wire x1="-1.7" y1="0.75" x2="-1.85" y2="0.75" width="0.1016" layer="51"/>
<wire x1="-1.85" y1="0.75" x2="-1.85" y2="2.05" width="0.1016" layer="51"/>
<wire x1="-1.85" y1="2.05" x2="0.9" y2="2.05" width="0.1016" layer="51"/>
<wire x1="0.9" y1="2.05" x2="0.9" y2="-2.05" width="0.1016" layer="51"/>
<wire x1="0.9" y1="-2.05" x2="-1.85" y2="-2.05" width="0.1016" layer="51"/>
<wire x1="0.9" y1="-2.05" x2="1.05" y2="-2.05" width="0.1016" layer="51"/>
<wire x1="1.05" y1="-2.05" x2="1.85" y2="-1.85" width="0.1016" layer="51"/>
<wire x1="1.85" y1="-1.85" x2="1.85" y2="1.85" width="0.1016" layer="51"/>
<wire x1="1.85" y1="1.85" x2="1.05" y2="2.05" width="0.1016" layer="51"/>
<wire x1="1.05" y1="2.05" x2="0.9" y2="2.05" width="0.1016" layer="51"/>
<wire x1="1.05" y1="2.05" x2="1.05" y2="-2.05" width="0.1016" layer="51"/>
<wire x1="-0.55" y1="-0.9" x2="-0.55" y2="0.9" width="0.1016" layer="51" curve="-167.319617"/>
<wire x1="-0.55" y1="-0.9" x2="0.85" y2="-1.2" width="0.1016" layer="51" style="shortdash"/>
<wire x1="-0.55" y1="0.9" x2="0.85" y2="1.2" width="0.1016" layer="51" style="shortdash"/>
<smd name="C" x="0" y="-2.5" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<smd name="A" x="0" y="2.5" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<text x="0.635" y="-3.175" size="1.27" layer="21" rot="R90">C</text>
<text x="0.635" y="2.54" size="1.27" layer="21" rot="R90">A</text>
<text x="-2.54" y="-2.54" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.81" y="-2.54" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-2.1" y1="-2.2" x2="2.1" y2="-0.4" layer="29"/>
<rectangle x1="-2.1" y1="0.4" x2="2.1" y2="2.2" layer="29"/>
<rectangle x1="-1.9" y1="-2.1" x2="1.9" y2="-0.6" layer="31"/>
<rectangle x1="-1.9" y1="0.6" x2="1.9" y2="2.1" layer="31"/>
<rectangle x1="-1.85" y1="-2.05" x2="-0.7" y2="-1" layer="51"/>
</package>
<package name="SMART-LED" urn="urn:adsk.eagle:footprint:15667/1" library_version="2">
<description>&lt;b&gt;SmartLEDTM Hyper-Bright LED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LA_LO_LS_LY L896.pdf</description>
<wire x1="-0.35" y1="0.6" x2="0.35" y2="0.6" width="0.1016" layer="51" style="shortdash"/>
<wire x1="0.35" y1="0.6" x2="0.35" y2="-0.6" width="0.1016" layer="21" style="shortdash"/>
<wire x1="0.35" y1="-0.6" x2="0.15" y2="-0.6" width="0.1016" layer="51" style="shortdash"/>
<wire x1="0.15" y1="-0.6" x2="-0.35" y2="-0.6" width="0.1016" layer="51" style="shortdash"/>
<wire x1="-0.35" y1="-0.6" x2="-0.35" y2="0.6" width="0.1016" layer="21" style="shortdash"/>
<wire x1="0.35" y1="-0.4" x2="0.15" y2="-0.6" width="0.1016" layer="51" style="shortdash"/>
<smd name="A" x="0" y="0.725" dx="0.35" dy="0.35" layer="1"/>
<smd name="B" x="0" y="-0.725" dx="0.35" dy="0.35" layer="1"/>
<text x="-0.635" y="-0.635" size="1.016" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-0.635" size="1.016" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.15" y1="-0.35" x2="0.15" y2="-0.05" layer="21"/>
<rectangle x1="-0.15" y1="0.6" x2="0.15" y2="0.85" layer="51"/>
<rectangle x1="-0.15" y1="-0.85" x2="0.15" y2="-0.6" layer="51"/>
</package>
<package name="P-LCC-2-TOPLED-RG" urn="urn:adsk.eagle:footprint:15668/1" library_version="2">
<description>&lt;b&gt;Hyper TOPLED® RG Hyper-Bright LED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LA_LO_LS_LY T776.pdf</description>
<wire x1="-1.4" y1="-1.05" x2="-1.4" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="-1.6" x2="-1.1" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="-1.6" x2="-0.85" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-0.85" y1="-1.6" x2="1.1" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="1.1" y1="-1.6" x2="1.4" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="1.4" y1="-1.6" x2="1.4" y2="1.6" width="0.2032" layer="51"/>
<wire x1="1.4" y1="1.6" x2="1.1" y2="1.6" width="0.2032" layer="51"/>
<wire x1="1.1" y1="1.6" x2="-1.1" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="-1.4" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-1.1" y1="1.6" x2="-1.1" y2="2.45" width="0.1016" layer="51"/>
<wire x1="1.1" y1="2.45" x2="1.1" y2="1.6" width="0.1016" layer="51"/>
<wire x1="-1.1" y1="-1.6" x2="-1.1" y2="-2.45" width="0.1016" layer="51"/>
<wire x1="1.1" y1="-2.45" x2="1.1" y2="-1.6" width="0.1016" layer="51"/>
<wire x1="-0.85" y1="-1.6" x2="-1.4" y2="-1.05" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="1.6" x2="-1.4" y2="-1.05" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="1.1" width="0.2032" layer="21"/>
<smd name="C" x="0" y="-3.5" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<smd name="A" x="0" y="3.5" dx="4" dy="4" layer="1" stop="no" cream="no"/>
<text x="-2.54" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="3.81" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="-0.635" y="3.29" size="1.27" layer="21">A</text>
<text x="-0.635" y="-4.56" size="1.27" layer="21">C</text>
<rectangle x1="-1.3" y1="-3" x2="1.3" y2="-1.5" layer="31"/>
<rectangle x1="-1.3" y1="1.5" x2="1.3" y2="3" layer="31"/>
<rectangle x1="-0.25" y1="-0.25" x2="0.25" y2="0.25" layer="21"/>
<rectangle x1="-1.15" y1="2.4" x2="1.15" y2="2.7" layer="51"/>
<rectangle x1="-1.15" y1="-2.7" x2="1.15" y2="-2.4" layer="51"/>
<rectangle x1="-1.5" y1="1.5" x2="1.5" y2="3.2" layer="29"/>
<rectangle x1="-1.5" y1="-3.2" x2="1.5" y2="-1.5" layer="29"/>
<hole x="0" y="0" drill="2.8"/>
</package>
<package name="MICRO-SIDELED" urn="urn:adsk.eagle:footprint:15669/1" library_version="2">
<description>&lt;b&gt;Hyper Micro SIDELED®&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LA_LO_LS_LY Y876.pdf</description>
<wire x1="0.65" y1="1.1" x2="-0.1" y2="1.1" width="0.1016" layer="51"/>
<wire x1="-0.1" y1="1.1" x2="-0.35" y2="1" width="0.1016" layer="51"/>
<wire x1="-0.35" y1="1" x2="-0.35" y2="-0.9" width="0.1016" layer="21"/>
<wire x1="-0.35" y1="-0.9" x2="-0.1" y2="-1.1" width="0.1016" layer="51"/>
<wire x1="-0.1" y1="-1.1" x2="0.65" y2="-1.1" width="0.1016" layer="51"/>
<wire x1="0.65" y1="-1.1" x2="0.65" y2="1.1" width="0.1016" layer="21"/>
<wire x1="0.6" y1="0.9" x2="0.25" y2="0.7" width="0.0508" layer="21"/>
<wire x1="0.25" y1="0.7" x2="0.25" y2="-0.7" width="0.0508" layer="21"/>
<wire x1="0.25" y1="-0.7" x2="0.6" y2="-0.9" width="0.0508" layer="21"/>
<smd name="A" x="0" y="1.95" dx="1.6" dy="1.6" layer="1" stop="no" cream="no"/>
<smd name="C" x="0" y="-1.95" dx="1.6" dy="1.6" layer="1" stop="no" cream="no"/>
<text x="-1.27" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.54" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.4" y1="1.1" x2="0.4" y2="1.8" layer="29"/>
<rectangle x1="-0.4" y1="-1.8" x2="0.4" y2="-1.1" layer="29"/>
<rectangle x1="-0.35" y1="-1.75" x2="0.35" y2="-1.15" layer="31"/>
<rectangle x1="-0.35" y1="1.15" x2="0.35" y2="1.75" layer="31"/>
<rectangle x1="-0.125" y1="1.125" x2="0.125" y2="1.75" layer="51"/>
<rectangle x1="-0.125" y1="-1.75" x2="0.125" y2="-1.125" layer="51"/>
</package>
<package name="P-LCC-4" urn="urn:adsk.eagle:footprint:15670/1" library_version="2">
<description>&lt;b&gt;Power TOPLED®&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LA_LO_LA_LY E67B.pdf</description>
<wire x1="-1.4" y1="-1.05" x2="-1.4" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="-1.6" x2="-1" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-1" y1="-1.6" x2="-0.85" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="-0.85" y1="-1.6" x2="1" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="1" y1="-1.6" x2="1.4" y2="-1.6" width="0.2032" layer="51"/>
<wire x1="1.4" y1="-1.6" x2="1.4" y2="1.6" width="0.2032" layer="51"/>
<wire x1="1.4" y1="1.6" x2="1.1" y2="1.6" width="0.2032" layer="51"/>
<wire x1="1.1" y1="1.6" x2="-1" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-1" y1="1.6" x2="-1.4" y2="1.6" width="0.2032" layer="51"/>
<wire x1="-1" y1="1.6" x2="-1" y2="1.8" width="0.1016" layer="51"/>
<wire x1="-1" y1="1.8" x2="-0.5" y2="1.8" width="0.1016" layer="51"/>
<wire x1="-0.5" y1="1.8" x2="-0.5" y2="1.65" width="0.1016" layer="51"/>
<wire x1="0.5" y1="1.65" x2="0.5" y2="1.8" width="0.1016" layer="51"/>
<wire x1="0.5" y1="1.8" x2="1.1" y2="1.8" width="0.1016" layer="51"/>
<wire x1="1.1" y1="1.8" x2="1.1" y2="1.6" width="0.1016" layer="51"/>
<wire x1="-1" y1="-1.6" x2="-1" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="-1" y1="-1.8" x2="-0.5" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="-0.5" y1="-1.8" x2="-0.5" y2="-1.65" width="0.1016" layer="51"/>
<wire x1="0.5" y1="-1.65" x2="0.5" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="0.5" y1="-1.8" x2="1" y2="-1.8" width="0.1016" layer="51"/>
<wire x1="1" y1="-1.8" x2="1" y2="-1.6" width="0.1016" layer="51"/>
<wire x1="-0.85" y1="-1.6" x2="-1.4" y2="-1.05" width="0.2032" layer="51"/>
<wire x1="-1.4" y1="1.6" x2="-1.4" y2="-1.05" width="0.2032" layer="51"/>
<circle x="0" y="0" radius="1.1" width="0.2032" layer="51"/>
<smd name="A" x="-2" y="3.15" dx="3.3" dy="4.8" layer="1" stop="no" cream="no"/>
<smd name="C@3" x="2" y="3.15" dx="3.3" dy="4.8" layer="1" stop="no" cream="no"/>
<smd name="C@4" x="2" y="-3.15" dx="3.3" dy="4.8" layer="1" stop="no" cream="no"/>
<smd name="C@1" x="-2" y="-3.15" dx="3.3" dy="4.8" layer="1" stop="no" cream="no"/>
<text x="-3.81" y="-2.54" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="5.08" y="-2.54" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<text x="-1.905" y="-3.81" size="1.27" layer="21">C</text>
<text x="-1.905" y="2.54" size="1.27" layer="21">A</text>
<text x="1.27" y="2.54" size="1.27" layer="21">C</text>
<text x="1.27" y="-3.81" size="1.27" layer="21">C</text>
<rectangle x1="-1.15" y1="0.75" x2="-0.35" y2="1.85" layer="29"/>
<rectangle x1="0.35" y1="0.75" x2="1.15" y2="1.85" layer="29"/>
<rectangle x1="0.35" y1="-1.85" x2="1.15" y2="-0.75" layer="29"/>
<rectangle x1="-1.15" y1="-1.85" x2="-0.35" y2="-0.75" layer="29"/>
<rectangle x1="-1.1" y1="-1.8" x2="-0.4" y2="-0.8" layer="31"/>
<rectangle x1="0.4" y1="-1.8" x2="1.1" y2="-0.8" layer="31"/>
<rectangle x1="0.4" y1="0.8" x2="1.1" y2="1.8" layer="31"/>
<rectangle x1="-1.1" y1="0.8" x2="-0.4" y2="1.8" layer="31"/>
<rectangle x1="-0.2" y1="-0.2" x2="0.2" y2="0.2" layer="21"/>
</package>
<package name="CHIP-LED0603" urn="urn:adsk.eagle:footprint:15671/1" library_version="2">
<description>&lt;b&gt;Hyper CHIPLED Hyper-Bright LED&lt;/b&gt;&lt;p&gt;
LB Q993&lt;br&gt;
Source: http://www.osram.convergy.de/ ... Lb_q993.pdf</description>
<wire x1="-0.4" y1="0.45" x2="-0.4" y2="-0.45" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.45" x2="0.4" y2="-0.45" width="0.1016" layer="51"/>
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.635" y="-0.635" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-0.635" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.45" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="0.45" y2="-0.45" layer="51"/>
<rectangle x1="-0.45" y1="0" x2="-0.3" y2="0.3" layer="21"/>
<rectangle x1="0.3" y1="0" x2="0.45" y2="0.3" layer="21"/>
<rectangle x1="-0.15" y1="0" x2="0.15" y2="0.3" layer="21"/>
</package>
<package name="CHIP-LED0805" urn="urn:adsk.eagle:footprint:15672/1" library_version="2">
<description>&lt;b&gt;Hyper CHIPLED Hyper-Bright LED&lt;/b&gt;&lt;p&gt;
LB R99A&lt;br&gt;
Source: http://www.osram.convergy.de/ ... lb_r99a.pdf</description>
<wire x1="-0.625" y1="0.45" x2="-0.625" y2="-0.45" width="0.1016" layer="51"/>
<wire x1="0.625" y1="0.45" x2="0.625" y2="-0.475" width="0.1016" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.27" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.54" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.675" y1="0" x2="-0.525" y2="0.3" layer="21"/>
<rectangle x1="0.525" y1="0" x2="0.675" y2="0.3" layer="21"/>
<rectangle x1="-0.15" y1="0" x2="0.15" y2="0.3" layer="21"/>
<rectangle x1="-0.675" y1="0.45" x2="0.675" y2="1.05" layer="51"/>
<rectangle x1="-0.675" y1="-1.05" x2="0.675" y2="-0.45" layer="51"/>
</package>
<package name="MINI-TOPLED-SANTANA" urn="urn:adsk.eagle:footprint:15673/1" library_version="2">
<description>&lt;b&gt;Mini TOPLED Santana®&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG M470.pdf</description>
<wire x1="0.7" y1="-1" x2="0.35" y2="-1" width="0.1016" layer="21"/>
<wire x1="0.35" y1="-1" x2="-0.7" y2="-1" width="0.1016" layer="21"/>
<wire x1="-0.7" y1="-1" x2="-0.7" y2="1" width="0.1016" layer="21"/>
<wire x1="-0.7" y1="1" x2="0.7" y2="1" width="0.1016" layer="21"/>
<wire x1="0.7" y1="1" x2="0.7" y2="-0.65" width="0.1016" layer="21"/>
<wire x1="0.7" y1="-0.65" x2="0.7" y2="-1" width="0.1016" layer="21"/>
<wire x1="0.45" y1="-0.7" x2="-0.45" y2="-0.7" width="0.1016" layer="21"/>
<wire x1="-0.45" y1="-0.7" x2="-0.45" y2="0.7" width="0.1016" layer="21"/>
<wire x1="-0.45" y1="0.7" x2="0.45" y2="0.7" width="0.1016" layer="21"/>
<wire x1="0.45" y1="0.7" x2="0.45" y2="-0.7" width="0.1016" layer="21"/>
<wire x1="0.7" y1="-0.65" x2="0.35" y2="-1" width="0.1016" layer="21"/>
<smd name="C" x="0" y="-2.2" dx="1.6" dy="1.6" layer="1" stop="no" cream="no"/>
<smd name="A" x="0" y="2.2" dx="1.6" dy="1.6" layer="1" stop="no" cream="no"/>
<text x="-1.27" y="-1.905" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.54" y="-1.905" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.55" y1="1.5" x2="0.55" y2="2.1" layer="29"/>
<rectangle x1="-0.55" y1="-2.1" x2="0.55" y2="-1.5" layer="29"/>
<rectangle x1="-0.5" y1="-2.05" x2="0.5" y2="-1.55" layer="31"/>
<rectangle x1="-0.5" y1="1.55" x2="0.5" y2="2.05" layer="31"/>
<rectangle x1="-0.2" y1="-0.4" x2="0.15" y2="-0.05" layer="21"/>
<rectangle x1="-0.5" y1="-2.1" x2="0.5" y2="-1.4" layer="51"/>
<rectangle x1="-0.5" y1="1.4" x2="0.5" y2="2.05" layer="51"/>
<rectangle x1="-0.5" y1="1" x2="0.5" y2="1.4" layer="21"/>
<rectangle x1="-0.5" y1="-1.4" x2="0.5" y2="-1.05" layer="21"/>
<hole x="0" y="0" drill="2.7"/>
</package>
<package name="CHIPLED_0805" urn="urn:adsk.eagle:footprint:15674/1" library_version="2">
<description>&lt;b&gt;CHIPLED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG_R971.pdf</description>
<wire x1="-0.35" y1="0.925" x2="0.35" y2="0.925" width="0.1016" layer="51" curve="162.394521"/>
<wire x1="-0.35" y1="-0.925" x2="0.35" y2="-0.925" width="0.1016" layer="51" curve="-162.394521"/>
<wire x1="0.575" y1="0.525" x2="0.575" y2="-0.525" width="0.1016" layer="51"/>
<wire x1="-0.575" y1="-0.5" x2="-0.575" y2="0.925" width="0.1016" layer="51"/>
<circle x="-0.45" y="0.85" radius="0.103" width="0.1016" layer="51"/>
<smd name="C" x="0" y="1.05" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="0" y="-1.05" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.27" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.54" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="0.3" y1="0.5" x2="0.625" y2="1" layer="51"/>
<rectangle x1="-0.325" y1="0.5" x2="-0.175" y2="0.75" layer="51"/>
<rectangle x1="0.175" y1="0.5" x2="0.325" y2="0.75" layer="51"/>
<rectangle x1="-0.2" y1="0.5" x2="0.2" y2="0.675" layer="51"/>
<rectangle x1="0.3" y1="-1" x2="0.625" y2="-0.5" layer="51"/>
<rectangle x1="-0.625" y1="-1" x2="-0.3" y2="-0.5" layer="51"/>
<rectangle x1="0.175" y1="-0.75" x2="0.325" y2="-0.5" layer="51"/>
<rectangle x1="-0.325" y1="-0.75" x2="-0.175" y2="-0.5" layer="51"/>
<rectangle x1="-0.2" y1="-0.675" x2="0.2" y2="-0.5" layer="51"/>
<rectangle x1="-0.1" y1="0" x2="0.1" y2="0.2" layer="21"/>
<rectangle x1="-0.6" y1="0.5" x2="-0.3" y2="0.8" layer="51"/>
<rectangle x1="-0.625" y1="0.925" x2="-0.3" y2="1" layer="51"/>
</package>
<package name="CHIPLED_1206" urn="urn:adsk.eagle:footprint:15675/1" library_version="2">
<description>&lt;b&gt;CHIPLED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG_LY N971.pdf</description>
<wire x1="-0.4" y1="1.6" x2="0.4" y2="1.6" width="0.1016" layer="51" curve="172.619069"/>
<wire x1="-0.8" y1="-0.95" x2="-0.8" y2="0.95" width="0.1016" layer="51"/>
<wire x1="0.8" y1="0.95" x2="0.8" y2="-0.95" width="0.1016" layer="51"/>
<circle x="-0.55" y="1.425" radius="0.1" width="0.1016" layer="51"/>
<smd name="C" x="0" y="1.75" dx="1.5" dy="1.5" layer="1"/>
<smd name="A" x="0" y="-1.75" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.27" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="2.54" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.85" y1="1.525" x2="-0.35" y2="1.65" layer="51"/>
<rectangle x1="-0.85" y1="1.225" x2="-0.625" y2="1.55" layer="51"/>
<rectangle x1="-0.45" y1="1.225" x2="-0.325" y2="1.45" layer="51"/>
<rectangle x1="-0.65" y1="1.225" x2="-0.225" y2="1.35" layer="51"/>
<rectangle x1="0.35" y1="1.3" x2="0.85" y2="1.65" layer="51"/>
<rectangle x1="0.25" y1="1.225" x2="0.85" y2="1.35" layer="51"/>
<rectangle x1="-0.85" y1="0.95" x2="0.85" y2="1.25" layer="51"/>
<rectangle x1="-0.85" y1="-1.65" x2="0.85" y2="-0.95" layer="51"/>
<rectangle x1="-0.85" y1="0.35" x2="-0.525" y2="0.775" layer="21"/>
<rectangle x1="0.525" y1="0.35" x2="0.85" y2="0.775" layer="21"/>
<rectangle x1="-0.175" y1="0" x2="0.175" y2="0.35" layer="21"/>
</package>
<package name="CHIPLED_0603" urn="urn:adsk.eagle:footprint:15676/1" library_version="2">
<description>&lt;b&gt;CHIPLED&lt;/b&gt;&lt;p&gt;
Source: http://www.osram.convergy.de/ ... LG_LY Q971.pdf</description>
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574"/>
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180"/>
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51"/>
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51"/>
<smd name="C" x="0" y="0.75" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0" y="-0.75" dx="0.8" dy="0.8" layer="1"/>
<text x="-0.635" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51"/>
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51"/>
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51"/>
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51"/>
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51"/>
<rectangle x1="-0.125" y1="0" x2="0.125" y2="0.25" layer="21"/>
</package>
<package name="CHIPLED-0603-TTW" urn="urn:adsk.eagle:footprint:15677/1" library_version="2">
<description>&lt;b&gt;CHIPLED-0603&lt;/b&gt;&lt;p&gt;
Recommended Solder Pad useable for SmartLEDTM and Chipled - Package 0603&lt;br&gt;
Package able to withstand TTW-soldering heat&lt;br&gt;
Package suitable for TTW-soldering&lt;br&gt;
Source: http://www.osram.convergy.de/ ... LO_LS_LY L89K.pdf</description>
<wire x1="-0.3" y1="0.8" x2="0.3" y2="0.8" width="0.1016" layer="51" curve="170.055574"/>
<wire x1="-0.275" y1="-0.825" x2="0.275" y2="-0.825" width="0.0508" layer="51" curve="-180"/>
<wire x1="-0.4" y1="0.375" x2="-0.4" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.4" y1="0.35" x2="0.4" y2="-0.35" width="0.1016" layer="51"/>
<circle x="-0.35" y="0.625" radius="0.075" width="0.0508" layer="51"/>
<smd name="C" x="0" y="0.875" dx="0.8" dy="0.5" layer="1" stop="no" cream="no"/>
<smd name="A" x="0" y="-0.875" dx="0.8" dy="0.5" layer="1" stop="no" cream="no"/>
<smd name="A@1" x="0" y="-0.5" dx="0.35" dy="0.35" layer="1"/>
<smd name="C@1" x="0" y="0.5" dx="0.35" dy="0.35" layer="1"/>
<text x="-0.635" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.45" y1="0.7" x2="-0.25" y2="0.85" layer="51"/>
<rectangle x1="-0.275" y1="0.55" x2="-0.225" y2="0.6" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="-0.4" y2="0.725" layer="51"/>
<rectangle x1="0.25" y1="0.55" x2="0.45" y2="0.85" layer="51"/>
<rectangle x1="-0.45" y1="0.35" x2="0.45" y2="0.575" layer="51"/>
<rectangle x1="-0.45" y1="-0.85" x2="-0.25" y2="-0.35" layer="51"/>
<rectangle x1="0.25" y1="-0.85" x2="0.45" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.575" x2="0.275" y2="-0.35" layer="51"/>
<rectangle x1="-0.275" y1="-0.65" x2="-0.175" y2="-0.55" layer="51"/>
<rectangle x1="0.175" y1="-0.65" x2="0.275" y2="-0.55" layer="51"/>
<rectangle x1="-0.125" y1="0" x2="0.125" y2="0.25" layer="21"/>
<rectangle x1="-0.175" y1="0.325" x2="0.175" y2="0.7" layer="29"/>
<rectangle x1="-0.4" y1="0.625" x2="0.4" y2="1.125" layer="29"/>
<rectangle x1="-0.4" y1="-1.125" x2="0.4" y2="-0.625" layer="29"/>
<rectangle x1="-0.175" y1="-0.675" x2="0.175" y2="-0.325" layer="29"/>
</package>
<package name="SMARTLED-TTW" urn="urn:adsk.eagle:footprint:15678/1" library_version="2">
<description>&lt;b&gt;SmartLED TTW&lt;/b&gt;&lt;p&gt;
Recommended Solder Pad useable for SmartLEDTM and Chipled - Package 0603&lt;br&gt;
Package able to withstand TTW-soldering heat&lt;br&gt;
Package suitable for TTW-soldering&lt;br&gt;
Source: http://www.osram.convergy.de/ ... LO_LS_LY L89K.pdf</description>
<wire x1="-0.35" y1="0.6" x2="0.35" y2="0.6" width="0.1016" layer="51" style="shortdash"/>
<wire x1="0.35" y1="0.6" x2="0.35" y2="-0.6" width="0.1016" layer="21" style="shortdash"/>
<wire x1="0.35" y1="-0.6" x2="0.15" y2="-0.6" width="0.1016" layer="51" style="shortdash"/>
<wire x1="0.15" y1="-0.6" x2="-0.35" y2="-0.6" width="0.1016" layer="51" style="shortdash"/>
<wire x1="-0.35" y1="-0.6" x2="-0.35" y2="0.6" width="0.1016" layer="21" style="shortdash"/>
<wire x1="0.35" y1="-0.4" x2="0.15" y2="-0.6" width="0.1016" layer="51" style="shortdash"/>
<smd name="C" x="0" y="0.875" dx="0.8" dy="0.5" layer="1" stop="no" cream="no"/>
<smd name="A" x="0" y="-0.875" dx="0.8" dy="0.5" layer="1" stop="no" cream="no"/>
<smd name="A@1" x="0" y="-0.5" dx="0.35" dy="0.35" layer="1" stop="no" cream="no"/>
<smd name="C@1" x="0" y="0.5" dx="0.35" dy="0.35" layer="1" stop="no" cream="no"/>
<text x="-0.635" y="-1.27" size="1.27" layer="25" rot="R90">&gt;NAME</text>
<text x="1.905" y="-1.27" size="1.27" layer="27" rot="R90">&gt;VALUE</text>
<rectangle x1="-0.175" y1="0.325" x2="0.175" y2="0.7" layer="29"/>
<rectangle x1="-0.15" y1="-0.35" x2="0.15" y2="-0.05" layer="21"/>
<rectangle x1="-0.15" y1="0.6" x2="0.15" y2="0.85" layer="51"/>
<rectangle x1="-0.15" y1="-0.85" x2="0.15" y2="-0.6" layer="51"/>
<rectangle x1="-0.225" y1="0.3" x2="0.225" y2="0.975" layer="31"/>
<rectangle x1="-0.175" y1="-0.7" x2="0.175" y2="-0.325" layer="29" rot="R180"/>
<rectangle x1="-0.225" y1="-0.975" x2="0.225" y2="-0.3" layer="31" rot="R180"/>
</package>
<package name="LUMILED+" urn="urn:adsk.eagle:footprint:15679/1" library_version="2">
<description>&lt;b&gt;Lumileds Lighting. LUXEON®&lt;/b&gt; with cool pad&lt;p&gt;
Source: K2.pdf</description>
<wire x1="-3.575" y1="2.3375" x2="-2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="3.575" x2="2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="2.3375" x2="3.575" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="-3.575" x2="-2.3375" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="-3.575" x2="-2.5" y2="-3.4125" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="-3.4125" x2="-3.4125" y2="-2.5" width="0.2032" layer="21" curve="167.429893"/>
<wire x1="-3.4125" y1="-2.5" x2="-3.575" y2="-2.3375" width="0.2032" layer="21"/>
<wire x1="-3.575" y1="-2.3375" x2="-3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="2.3375" y1="3.575" x2="2.5" y2="3.4125" width="0.2032" layer="21"/>
<wire x1="2.5" y1="3.4125" x2="3.4125" y2="2.5" width="0.2032" layer="21" curve="167.429893"/>
<wire x1="3.4125" y1="2.5" x2="3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="-1.725" y1="2.225" x2="-1.0625" y2="2.5625" width="0.2032" layer="21" curve="-255.44999"/>
<wire x1="1.725" y1="-2.225" x2="1.0625" y2="-2.5625" width="0.2032" layer="21" curve="-255.44999"/>
<circle x="0" y="0" radius="2.725" width="0.2032" layer="51"/>
<smd name="1NC" x="-5.2" y="1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="2+" x="-5.2" y="-1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="3NC" x="5.2" y="-1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<smd name="4-" x="5.2" y="1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<text x="-3.175" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.975" y1="0.575" x2="-3.625" y2="1.6" layer="51"/>
<rectangle x1="-5.975" y1="-1.6" x2="-3.625" y2="-0.575" layer="51"/>
<rectangle x1="3.625" y1="-1.6" x2="5.975" y2="-0.575" layer="51" rot="R180"/>
<rectangle x1="3.625" y1="0.575" x2="5.975" y2="1.6" layer="51" rot="R180"/>
<polygon width="0.4064" layer="1">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
<polygon width="0.4064" layer="29">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
<polygon width="0.4064" layer="31">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
</package>
<package name="LUMILED" urn="urn:adsk.eagle:footprint:15680/1" library_version="2">
<description>&lt;b&gt;Lumileds Lighting. LUXEON®&lt;/b&gt; without cool pad&lt;p&gt;
Source: K2.pdf</description>
<wire x1="-3.575" y1="2.3375" x2="-2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="3.575" x2="2.3375" y2="3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="2.3375" x2="3.575" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="3.575" y1="-3.575" x2="-2.3375" y2="-3.575" width="0.2032" layer="21"/>
<wire x1="-2.3375" y1="-3.575" x2="-2.5" y2="-3.4125" width="0.2032" layer="21"/>
<wire x1="-2.5" y1="-3.4125" x2="-3.4125" y2="-2.5" width="0.2032" layer="21" curve="167.429893"/>
<wire x1="-3.4125" y1="-2.5" x2="-3.575" y2="-2.3375" width="0.2032" layer="21"/>
<wire x1="-3.575" y1="-2.3375" x2="-3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="2.3375" y1="3.575" x2="2.5" y2="3.4125" width="0.2032" layer="21"/>
<wire x1="2.5" y1="3.4125" x2="3.4125" y2="2.5" width="0.2032" layer="21" curve="167.429893"/>
<wire x1="3.4125" y1="2.5" x2="3.575" y2="2.3375" width="0.2032" layer="21"/>
<wire x1="-1.725" y1="2.225" x2="-1.0625" y2="2.5625" width="0.2032" layer="21" curve="-255.44999"/>
<wire x1="1.725" y1="-2.225" x2="1.0625" y2="-2.5625" width="0.2032" layer="21" curve="-255.44999"/>
<circle x="0" y="0" radius="2.725" width="0.2032" layer="51"/>
<smd name="1NC" x="-5.2" y="1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="2+" x="-5.2" y="-1.15" dx="2.9" dy="1.7" layer="1"/>
<smd name="3NC" x="5.2" y="-1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<smd name="4-" x="5.2" y="1.15" dx="2.9" dy="1.7" layer="1" rot="R180"/>
<text x="-3.175" y="3.81" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.175" y="-5.08" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-5.975" y1="0.575" x2="-3.625" y2="1.6" layer="51"/>
<rectangle x1="-5.975" y1="-1.6" x2="-3.625" y2="-0.575" layer="51"/>
<rectangle x1="3.625" y1="-1.6" x2="5.975" y2="-0.575" layer="51" rot="R180"/>
<rectangle x1="3.625" y1="0.575" x2="5.975" y2="1.6" layer="51" rot="R180"/>
<polygon width="0.4064" layer="29">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
<polygon width="0.4064" layer="31">
<vertex x="2.3383" y="1.35"/>
<vertex x="0" y="2.7"/>
<vertex x="-2.3383" y="1.35"/>
<vertex x="-2.3383" y="-1.35"/>
<vertex x="0" y="-2.7"/>
<vertex x="2.3383" y="-1.35"/>
</polygon>
</package>
<package name="LED10MM" urn="urn:adsk.eagle:footprint:15681/1" library_version="2">
<description>&lt;B&gt;LED&lt;/B&gt;&lt;p&gt;
10 mm, round</description>
<wire x1="5.08" y1="-2.54" x2="5.08" y2="2.54" width="0.254" layer="21" curve="-306.869898"/>
<wire x1="4.445" y1="0" x2="0" y2="-4.445" width="0.127" layer="21" curve="-90"/>
<wire x1="3.81" y1="0" x2="0" y2="-3.81" width="0.127" layer="21" curve="-90"/>
<wire x1="3.175" y1="0" x2="0" y2="-3.175" width="0.127" layer="21" curve="-90"/>
<wire x1="2.54" y1="0" x2="0" y2="-2.54" width="0.127" layer="21" curve="-90"/>
<wire x1="-4.445" y1="0" x2="0" y2="4.445" width="0.127" layer="21" curve="-90"/>
<wire x1="-3.81" y1="0" x2="0" y2="3.81" width="0.127" layer="21" curve="-90"/>
<wire x1="-3.175" y1="0" x2="0" y2="3.175" width="0.127" layer="21" curve="-90"/>
<wire x1="-2.54" y1="0" x2="0" y2="2.54" width="0.127" layer="21" curve="-90"/>
<wire x1="5.08" y1="2.54" x2="5.08" y2="-2.54" width="0.254" layer="21"/>
<circle x="0" y="0" radius="5.08" width="0.127" layer="21"/>
<pad name="K" x="1.27" y="0" drill="0.8128" diameter="1.6764" shape="square"/>
<pad name="A" x="-1.27" y="0" drill="0.8128" diameter="1.6764" shape="octagon"/>
<text x="6.35" y="1.27" size="1.27" layer="25">&gt;NAME</text>
<text x="6.35" y="-1.27" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="KA-3528ASYC" urn="urn:adsk.eagle:footprint:15682/1" library_version="2">
<description>&lt;b&gt;SURFACE MOUNT LED LAMP&lt;/b&gt; 3.5x2.8mm&lt;p&gt;
Source: http://www.kingbright.com/manager/upload/pdf/KA-3528ASYC(Ver1189474662.1)</description>
<wire x1="-1.55" y1="1.35" x2="1.55" y2="1.35" width="0.1016" layer="21"/>
<wire x1="1.55" y1="1.35" x2="1.55" y2="-1.35" width="0.1016" layer="51"/>
<wire x1="1.55" y1="-1.35" x2="-1.55" y2="-1.35" width="0.1016" layer="21"/>
<wire x1="-1.55" y1="-1.35" x2="-1.55" y2="1.35" width="0.1016" layer="51"/>
<wire x1="-0.65" y1="0.95" x2="0.65" y2="0.95" width="0.1016" layer="21" curve="-68.40813"/>
<wire x1="0.65" y1="-0.95" x2="-0.65" y2="-0.95" width="0.1016" layer="21" curve="-68.40813"/>
<circle x="0" y="0" radius="1.15" width="0.1016" layer="51"/>
<smd name="A" x="-1.55" y="0" dx="1.5" dy="2.2" layer="1"/>
<smd name="C" x="1.55" y="0" dx="1.5" dy="2.2" layer="1"/>
<text x="-1.905" y="1.905" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.905" y="-3.175" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.75" y1="0.6" x2="-1.6" y2="1.1" layer="51"/>
<rectangle x1="-1.75" y1="-1.1" x2="-1.6" y2="-0.6" layer="51"/>
<rectangle x1="1.6" y1="-1.1" x2="1.75" y2="-0.6" layer="51" rot="R180"/>
<rectangle x1="1.6" y1="0.6" x2="1.75" y2="1.1" layer="51" rot="R180"/>
<polygon width="0.1016" layer="51">
<vertex x="1.55" y="-1.35"/>
<vertex x="1.55" y="-0.625"/>
<vertex x="0.825" y="-1.35"/>
</polygon>
<polygon width="0.1016" layer="21">
<vertex x="1.55" y="-1.35"/>
<vertex x="1.55" y="-1.175"/>
<vertex x="1" y="-1.175"/>
<vertex x="0.825" y="-1.35"/>
</polygon>
</package>
<package name="SML0805" urn="urn:adsk.eagle:footprint:15683/1" library_version="2">
<description>&lt;b&gt;SML0805-2CW-TR (0805 PROFILE)&lt;/b&gt; COOL WHITE&lt;p&gt;
Source: http://www.ledtronics.com/ds/smd-0603/Dstr0093.pdf</description>
<wire x1="-0.95" y1="-0.55" x2="0.95" y2="-0.55" width="0.1016" layer="51"/>
<wire x1="0.95" y1="-0.55" x2="0.95" y2="0.55" width="0.1016" layer="51"/>
<wire x1="0.95" y1="0.55" x2="-0.95" y2="0.55" width="0.1016" layer="51"/>
<wire x1="-0.95" y1="0.55" x2="-0.95" y2="-0.55" width="0.1016" layer="51"/>
<wire x1="-0.175" y1="-0.025" x2="0" y2="0.15" width="0.0634" layer="21"/>
<wire x1="0" y1="0.15" x2="0.15" y2="0" width="0.0634" layer="21"/>
<wire x1="0.15" y1="0" x2="-0.025" y2="-0.175" width="0.0634" layer="21"/>
<wire x1="-0.025" y1="-0.175" x2="-0.175" y2="-0.025" width="0.0634" layer="21"/>
<circle x="-0.275" y="0.4" radius="0.125" width="0" layer="21"/>
<smd name="C" x="-1.05" y="0" dx="1.2" dy="1.2" layer="1"/>
<smd name="A" x="1.05" y="0" dx="1.2" dy="1.2" layer="1"/>
<text x="-1.5" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.5" y="-2" size="1.27" layer="27">&gt;VALUE</text>
</package>
<package name="SML1206" urn="urn:adsk.eagle:footprint:15684/1" library_version="2">
<description>&lt;b&gt;SML10XXKH-TR (HIGH INTENSITY) LED&lt;/b&gt;&lt;p&gt;
&lt;table&gt;
&lt;tr&gt;&lt;td&gt;SML10R3KH-TR&lt;/td&gt;&lt;td&gt;ULTRA RED&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10E3KH-TR&lt;/td&gt;&lt;td&gt;SUPER REDSUPER BLUE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10O3KH-TR&lt;/td&gt;&lt;td&gt;SUPER ORANGE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10PY3KH-TR&lt;/td&gt;&lt;td&gt;PURE YELLOW&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10OY3KH-TR&lt;/td&gt;&lt;td&gt;ULTRA YELLOW&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10AG3KH-TR&lt;/td&gt;&lt;td&gt;AQUA GREEN&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10BG3KH-TR&lt;/td&gt;&lt;td&gt;BLUE GREEN&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10PB1KH-TR&lt;/td&gt;&lt;td&gt;SUPER BLUE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;SML10CW1KH-TR&lt;/td&gt;&lt;td&gt;WHITE&lt;/td&gt;&lt;/tr&gt;
&lt;/table&gt;

Source: http://www.ledtronics.com/ds/smd-1206/dstr0094.PDF</description>
<wire x1="-1.5" y1="0.5" x2="-1.5" y2="-0.5" width="0.2032" layer="51" curve="-180"/>
<wire x1="1.5" y1="-0.5" x2="1.5" y2="0.5" width="0.2032" layer="51" curve="-180"/>
<wire x1="-1.55" y1="0.75" x2="1.55" y2="0.75" width="0.1016" layer="51"/>
<wire x1="1.55" y1="-0.75" x2="-1.55" y2="-0.75" width="0.1016" layer="51"/>
<circle x="-0.725" y="0.525" radius="0.125" width="0" layer="21"/>
<smd name="C" x="-1.75" y="0" dx="1.5" dy="1.5" layer="1"/>
<smd name="A" x="1.75" y="0" dx="1.5" dy="1.5" layer="1"/>
<text x="-1.5" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-1.5" y="-2.5" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-1.6" y1="0.4" x2="-1.15" y2="0.8" layer="51"/>
<rectangle x1="-1.6" y1="-0.8" x2="-1.15" y2="-0.4" layer="51"/>
<rectangle x1="-1.175" y1="-0.6" x2="-1" y2="-0.275" layer="51"/>
<rectangle x1="1.15" y1="-0.8" x2="1.6" y2="-0.4" layer="51" rot="R180"/>
<rectangle x1="1.15" y1="0.4" x2="1.6" y2="0.8" layer="51" rot="R180"/>
<rectangle x1="1" y1="0.275" x2="1.175" y2="0.6" layer="51" rot="R180"/>
<rectangle x1="-0.1" y1="-0.1" x2="0.1" y2="0.1" layer="21"/>
</package>
<package name="SML0603" urn="urn:adsk.eagle:footprint:15685/1" library_version="2">
<description>&lt;b&gt;SML0603-XXX (HIGH INTENSITY) LED&lt;/b&gt;&lt;p&gt;
&lt;table&gt;
&lt;tr&gt;&lt;td&gt;AG3K&lt;/td&gt;&lt;td&gt;AQUA GREEN&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;B1K&lt;/td&gt;&lt;td&gt;SUPER BLUE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;R1K&lt;/td&gt;&lt;td&gt;SUPER RED&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;R3K&lt;/td&gt;&lt;td&gt;ULTRA RED&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;O3K&lt;/td&gt;&lt;td&gt;SUPER ORANGE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;O3KH&lt;/td&gt;&lt;td&gt;SOFT ORANGE&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;Y3KH&lt;/td&gt;&lt;td&gt;SUPER YELLOW&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;Y3K&lt;/td&gt;&lt;td&gt;SUPER YELLOW&lt;/td&gt;&lt;/tr&gt;
&lt;tr&gt;&lt;td&gt;2CW&lt;/td&gt;&lt;td&gt;WHITE&lt;/td&gt;&lt;/tr&gt;
&lt;/table&gt;
Source: http://www.ledtronics.com/ds/smd-0603/Dstr0092.pdf</description>
<wire x1="-0.75" y1="0.35" x2="0.75" y2="0.35" width="0.1016" layer="51"/>
<wire x1="0.75" y1="0.35" x2="0.75" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="0.75" y1="-0.35" x2="-0.75" y2="-0.35" width="0.1016" layer="51"/>
<wire x1="-0.75" y1="-0.35" x2="-0.75" y2="0.35" width="0.1016" layer="51"/>
<wire x1="-0.45" y1="0.3" x2="-0.45" y2="-0.3" width="0.1016" layer="51"/>
<wire x1="0.45" y1="0.3" x2="0.45" y2="-0.3" width="0.1016" layer="51"/>
<wire x1="-0.2" y1="0.35" x2="0.2" y2="0.35" width="0.1016" layer="21"/>
<wire x1="-0.2" y1="-0.35" x2="0.2" y2="-0.35" width="0.1016" layer="21"/>
<smd name="C" x="-0.75" y="0" dx="0.8" dy="0.8" layer="1"/>
<smd name="A" x="0.75" y="0" dx="0.8" dy="0.8" layer="1"/>
<text x="-1" y="1" size="1.27" layer="25">&gt;NAME</text>
<text x="-1" y="-2" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.4" y1="0.175" x2="0" y2="0.4" layer="51"/>
<rectangle x1="-0.25" y1="0.175" x2="0" y2="0.4" layer="21"/>
</package>
</packages>
<packages3d>
<package3d name="1206" urn="urn:adsk.eagle:package:15796/1" type="box" library_version="2">
<description>CHICAGO MINIATURE LAMP, INC.
7022X Series SMT LEDs 1206 Package Size</description>
<packageinstances>
<packageinstance name="1206"/>
</packageinstances>
</package3d>
<package3d name="LD260" urn="urn:adsk.eagle:package:15794/1" type="box" library_version="2">
<description>LED
5 mm, square, Siemens</description>
<packageinstances>
<packageinstance name="LD260"/>
</packageinstances>
</package3d>
<package3d name="LED2X5" urn="urn:adsk.eagle:package:15800/1" type="box" library_version="2">
<description>LED
2 x 5 mm, rectangle</description>
<packageinstances>
<packageinstance name="LED2X5"/>
</packageinstances>
</package3d>
<package3d name="LED3MM" urn="urn:adsk.eagle:package:15797/1" type="box" library_version="2">
<description>LED
3 mm, round</description>
<packageinstances>
<packageinstance name="LED3MM"/>
</packageinstances>
</package3d>
<package3d name="LED5MM" urn="urn:adsk.eagle:package:15799/2" type="model" library_version="2">
<description>LED
5 mm, round</description>
<packageinstances>
<packageinstance name="LED5MM"/>
</packageinstances>
</package3d>
<package3d name="LSU260" urn="urn:adsk.eagle:package:15805/1" type="box" library_version="2">
<description>LED
1 mm, round, Siemens</description>
<packageinstances>
<packageinstance name="LSU260"/>
</packageinstances>
</package3d>
<package3d name="LZR181" urn="urn:adsk.eagle:package:15808/1" type="box" library_version="2">
<description>LED BLOCK
1 LED, Siemens</description>
<packageinstances>
<packageinstance name="LZR181"/>
</packageinstances>
</package3d>
<package3d name="Q62902-B152" urn="urn:adsk.eagle:package:15803/1" type="box" library_version="2">
<description>LED HOLDER
Siemens</description>
<packageinstances>
<packageinstance name="Q62902-B152"/>
</packageinstances>
</package3d>
<package3d name="Q62902-B153" urn="urn:adsk.eagle:package:15804/1" type="box" library_version="2">
<description>LED HOLDER
Siemens</description>
<packageinstances>
<packageinstance name="Q62902-B153"/>
</packageinstances>
</package3d>
<package3d name="Q62902-B155" urn="urn:adsk.eagle:package:15807/1" type="box" library_version="2">
<description>LED HOLDER
Siemens</description>
<packageinstances>
<packageinstance name="Q62902-B155"/>
</packageinstances>
</package3d>
<package3d name="Q62902-B156" urn="urn:adsk.eagle:package:15806/1" type="box" library_version="2">
<description>LED HOLDER
Siemens</description>
<packageinstances>
<packageinstance name="Q62902-B156"/>
</packageinstances>
</package3d>
<package3d name="SFH480" urn="urn:adsk.eagle:package:15809/1" type="box" library_version="2">
<description>IR LED
infrared emitting diode, Infineon
TO-18, lead spacing 2.54 mm, cathode marking
Inifineon</description>
<packageinstances>
<packageinstance name="SFH480"/>
</packageinstances>
</package3d>
<package3d name="SFH482" urn="urn:adsk.eagle:package:15795/1" type="box" library_version="2">
<description>IR LED
infrared emitting diode, Infineon
TO-18, lead spacing 2.54 mm, cathode marking
Inifineon</description>
<packageinstances>
<packageinstance name="SFH482"/>
</packageinstances>
</package3d>
<package3d name="U57X32" urn="urn:adsk.eagle:package:15789/1" type="box" library_version="2">
<description>LED
rectangle, 5.7 x 3.2 mm</description>
<packageinstances>
<packageinstance name="U57X32"/>
</packageinstances>
</package3d>
<package3d name="IRL80A" urn="urn:adsk.eagle:package:15810/1" type="box" library_version="2">
<description>IR LED
IR transmitter Siemens</description>
<packageinstances>
<packageinstance name="IRL80A"/>
</packageinstances>
</package3d>
<package3d name="P-LCC-2" urn="urn:adsk.eagle:package:15817/1" type="box" library_version="2">
<description>TOPLED® High-optical Power LED (HOP)
Source: http://www.osram.convergy.de/ ... ls_t675.pdf</description>
<packageinstances>
<packageinstance name="P-LCC-2"/>
</packageinstances>
</package3d>
<package3d name="OSRAM-MINI-TOP-LED" urn="urn:adsk.eagle:package:15811/1" type="box" library_version="2">
<description>BLUE LINETM Hyper Mini TOPLED® Hyper-Bright LED
Source: http://www.osram.convergy.de/ ... LB M676.pdf</description>
<packageinstances>
<packageinstance name="OSRAM-MINI-TOP-LED"/>
</packageinstances>
</package3d>
<package3d name="OSRAM-SIDELED" urn="urn:adsk.eagle:package:15812/1" type="box" library_version="2">
<description>Super SIDELED® High-Current LED
LG A672, LP A672 
Source: http://www.osram.convergy.de/ ... LG_LP_A672.pdf (2004.05.13)</description>
<packageinstances>
<packageinstance name="OSRAM-SIDELED"/>
</packageinstances>
</package3d>
<package3d name="SMART-LED" urn="urn:adsk.eagle:package:15814/1" type="box" library_version="2">
<description>SmartLEDTM Hyper-Bright LED
Source: http://www.osram.convergy.de/ ... LA_LO_LS_LY L896.pdf</description>
<packageinstances>
<packageinstance name="SMART-LED"/>
</packageinstances>
</package3d>
<package3d name="P-LCC-2-TOPLED-RG" urn="urn:adsk.eagle:package:15813/1" type="box" library_version="2">
<description>Hyper TOPLED® RG Hyper-Bright LED
Source: http://www.osram.convergy.de/ ... LA_LO_LS_LY T776.pdf</description>
<packageinstances>
<packageinstance name="P-LCC-2-TOPLED-RG"/>
</packageinstances>
</package3d>
<package3d name="MICRO-SIDELED" urn="urn:adsk.eagle:package:15815/1" type="box" library_version="2">
<description>Hyper Micro SIDELED®
Source: http://www.osram.convergy.de/ ... LA_LO_LS_LY Y876.pdf</description>
<packageinstances>
<packageinstance name="MICRO-SIDELED"/>
</packageinstances>
</package3d>
<package3d name="P-LCC-4" urn="urn:adsk.eagle:package:15816/1" type="box" library_version="2">
<description>Power TOPLED®
Source: http://www.osram.convergy.de/ ... LA_LO_LA_LY E67B.pdf</description>
<packageinstances>
<packageinstance name="P-LCC-4"/>
</packageinstances>
</package3d>
<package3d name="CHIP-LED0603" urn="urn:adsk.eagle:package:15819/3" type="model" library_version="2">
<description>Hyper CHIPLED Hyper-Bright LED
LB Q993
Source: http://www.osram.convergy.de/ ... Lb_q993.pdf</description>
<packageinstances>
<packageinstance name="CHIP-LED0603"/>
</packageinstances>
</package3d>
<package3d name="CHIP-LED0805" urn="urn:adsk.eagle:package:15818/2" type="model" library_version="2">
<description>Hyper CHIPLED Hyper-Bright LED
LB R99A
Source: http://www.osram.convergy.de/ ... lb_r99a.pdf</description>
<packageinstances>
<packageinstance name="CHIP-LED0805"/>
</packageinstances>
</package3d>
<package3d name="MINI-TOPLED-SANTANA" urn="urn:adsk.eagle:package:15820/1" type="box" library_version="2">
<description>Mini TOPLED Santana®
Source: http://www.osram.convergy.de/ ... LG M470.pdf</description>
<packageinstances>
<packageinstance name="MINI-TOPLED-SANTANA"/>
</packageinstances>
</package3d>
<package3d name="CHIPLED_0805" urn="urn:adsk.eagle:package:15821/2" type="model" library_version="2">
<description>CHIPLED
Source: http://www.osram.convergy.de/ ... LG_R971.pdf</description>
<packageinstances>
<packageinstance name="CHIPLED_0805"/>
</packageinstances>
</package3d>
<package3d name="CHIPLED_1206" urn="urn:adsk.eagle:package:15823/2" type="model" library_version="2">
<description>CHIPLED
Source: http://www.osram.convergy.de/ ... LG_LY N971.pdf</description>
<packageinstances>
<packageinstance name="CHIPLED_1206"/>
</packageinstances>
</package3d>
<package3d name="CHIPLED_0603" urn="urn:adsk.eagle:package:15822/2" type="model" library_version="2">
<description>CHIPLED
Source: http://www.osram.convergy.de/ ... LG_LY Q971.pdf</description>
<packageinstances>
<packageinstance name="CHIPLED_0603"/>
</packageinstances>
</package3d>
<package3d name="CHIPLED-0603-TTW" urn="urn:adsk.eagle:package:15824/1" type="box" library_version="2">
<description>CHIPLED-0603
Recommended Solder Pad useable for SmartLEDTM and Chipled - Package 0603
Package able to withstand TTW-soldering heat
Package suitable for TTW-soldering
Source: http://www.osram.convergy.de/ ... LO_LS_LY L89K.pdf</description>
<packageinstances>
<packageinstance name="CHIPLED-0603-TTW"/>
</packageinstances>
</package3d>
<package3d name="SMARTLED-TTW" urn="urn:adsk.eagle:package:15825/1" type="box" library_version="2">
<description>SmartLED TTW
Recommended Solder Pad useable for SmartLEDTM and Chipled - Package 0603
Package able to withstand TTW-soldering heat
Package suitable for TTW-soldering
Source: http://www.osram.convergy.de/ ... LO_LS_LY L89K.pdf</description>
<packageinstances>
<packageinstance name="SMARTLED-TTW"/>
</packageinstances>
</package3d>
<package3d name="LUMILED+" urn="urn:adsk.eagle:package:15826/1" type="box" library_version="2">
<description>Lumileds Lighting. LUXEON® with cool pad
Source: K2.pdf</description>
<packageinstances>
<packageinstance name="LUMILED+"/>
</packageinstances>
</package3d>
<package3d name="LUMILED" urn="urn:adsk.eagle:package:15827/1" type="box" library_version="2">
<description>Lumileds Lighting. LUXEON® without cool pad
Source: K2.pdf</description>
<packageinstances>
<packageinstance name="LUMILED"/>
</packageinstances>
</package3d>
<package3d name="LED10MM" urn="urn:adsk.eagle:package:15828/1" type="box" library_version="2">
<description>LED
10 mm, round</description>
<packageinstances>
<packageinstance name="LED10MM"/>
</packageinstances>
</package3d>
<package3d name="KA-3528ASYC" urn="urn:adsk.eagle:package:15831/1" type="box" library_version="2">
<description>SURFACE MOUNT LED LAMP 3.5x2.8mm
Source: http://www.kingbright.com/manager/upload/pdf/KA-3528ASYC(Ver1189474662.1)</description>
<packageinstances>
<packageinstance name="KA-3528ASYC"/>
</packageinstances>
</package3d>
<package3d name="SML0805" urn="urn:adsk.eagle:package:15830/1" type="box" library_version="2">
<description>SML0805-2CW-TR (0805 PROFILE) COOL WHITE
Source: http://www.ledtronics.com/ds/smd-0603/Dstr0093.pdf</description>
<packageinstances>
<packageinstance name="SML0805"/>
</packageinstances>
</package3d>
<package3d name="SML1206" urn="urn:adsk.eagle:package:15829/1" type="box" library_version="2">
<description>SML10XXKH-TR (HIGH INTENSITY) LED

SML10R3KH-TRULTRA RED
SML10E3KH-TRSUPER REDSUPER BLUE
SML10O3KH-TRSUPER ORANGE
SML10PY3KH-TRPURE YELLOW
SML10OY3KH-TRULTRA YELLOW
SML10AG3KH-TRAQUA GREEN
SML10BG3KH-TRBLUE GREEN
SML10PB1KH-TRSUPER BLUE
SML10CW1KH-TRWHITE


Source: http://www.ledtronics.com/ds/smd-1206/dstr0094.PDF</description>
<packageinstances>
<packageinstance name="SML1206"/>
</packageinstances>
</package3d>
<package3d name="SML0603" urn="urn:adsk.eagle:package:15832/1" type="box" library_version="2">
<description>SML0603-XXX (HIGH INTENSITY) LED

AG3KAQUA GREEN
B1KSUPER BLUE
R1KSUPER RED
R3KULTRA RED
O3KSUPER ORANGE
O3KHSOFT ORANGE
Y3KHSUPER YELLOW
Y3KSUPER YELLOW
2CWWHITE

Source: http://www.ledtronics.com/ds/smd-0603/Dstr0092.pdf</description>
<packageinstances>
<packageinstance name="SML0603"/>
</packageinstances>
</package3d>
</packages3d>
<symbols>
<symbol name="LED" urn="urn:adsk.eagle:symbol:15639/1" library_version="2">
<wire x1="1.27" y1="0" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="0" y2="-2.54" width="0.254" layer="94"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.254" layer="94"/>
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="0" y2="-2.54" width="0.1524" layer="94"/>
<wire x1="-2.032" y1="-0.762" x2="-3.429" y2="-2.159" width="0.1524" layer="94"/>
<wire x1="-1.905" y1="-1.905" x2="-3.302" y2="-3.302" width="0.1524" layer="94"/>
<text x="3.556" y="-4.572" size="1.778" layer="95" rot="R90">&gt;NAME</text>
<text x="5.715" y="-4.572" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="C" x="0" y="-5.08" visible="off" length="short" direction="pas" rot="R90"/>
<pin name="A" x="0" y="2.54" visible="off" length="short" direction="pas" rot="R270"/>
<polygon width="0.1524" layer="94">
<vertex x="-3.429" y="-2.159"/>
<vertex x="-3.048" y="-1.27"/>
<vertex x="-2.54" y="-1.778"/>
</polygon>
<polygon width="0.1524" layer="94">
<vertex x="-3.302" y="-3.302"/>
<vertex x="-2.921" y="-2.413"/>
<vertex x="-2.413" y="-2.921"/>
</polygon>
</symbol>
</symbols>
<devicesets>
<deviceset name="LED" urn="urn:adsk.eagle:component:15916/7" prefix="LED" uservalue="yes" library_version="2">
<description>&lt;b&gt;LED&lt;/b&gt;&lt;p&gt;
&lt;u&gt;OSRAM&lt;/u&gt;:&lt;br&gt;

- &lt;u&gt;CHIPLED&lt;/u&gt;&lt;br&gt;
LG R971, LG N971, LY N971, LG Q971, LY Q971, LO R971, LY R971
LH N974, LH R974&lt;br&gt;
LS Q976, LO Q976, LY Q976&lt;br&gt;
LO Q996&lt;br&gt;

- &lt;u&gt;Hyper CHIPLED&lt;/u&gt;&lt;br&gt;
LW Q18S&lt;br&gt;
LB Q993, LB Q99A, LB R99A&lt;br&gt;

- &lt;u&gt;SideLED&lt;/u&gt;&lt;br&gt;
LS A670, LO A670, LY A670, LG A670, LP A670&lt;br&gt;
LB A673, LV A673, LT A673, LW A673&lt;br&gt;
LH A674&lt;br&gt;
LY A675&lt;br&gt;
LS A676, LA A676, LO A676, LY A676, LW A676&lt;br&gt;
LS A679, LY A679, LG A679&lt;br&gt;

-  &lt;u&gt;Hyper Micro SIDELED®&lt;/u&gt;&lt;br&gt;
LS Y876, LA Y876, LO Y876, LY Y876&lt;br&gt;
LT Y87S&lt;br&gt;

- &lt;u&gt;SmartLED&lt;/u&gt;&lt;br&gt;
LW L88C, LW L88S&lt;br&gt;
LB L89C, LB L89S, LG L890&lt;br&gt;
LS L89K, LO L89K, LY L89K&lt;br&gt;
LS L896, LA L896, LO L896, LY L896&lt;br&gt;

- &lt;u&gt;TOPLED&lt;/u&gt;&lt;br&gt;
LS T670, LO T670, LY T670, LG T670, LP T670&lt;br&gt;
LSG T670, LSP T670, LSY T670, LOP T670, LYG T670&lt;br&gt;
LG T671, LOG T671, LSG T671&lt;br&gt;
LB T673, LV T673, LT T673, LW T673&lt;br&gt;
LH T674&lt;br&gt;
LS T676, LA T676, LO T676, LY T676, LB T676, LH T676, LSB T676, LW T676&lt;br&gt;
LB T67C, LV T67C, LT T67C, LS T67K, LO T67K, LY T67K, LW E67C&lt;br&gt;
LS E67B, LA E67B, LO E67B, LY E67B, LB E67C, LV E67C, LT E67C&lt;br&gt;
LW T67C&lt;br&gt;
LS T679, LY T679, LG T679&lt;br&gt;
LS T770, LO T770, LY T770, LG T770, LP T770&lt;br&gt;
LB T773, LV T773, LT T773, LW T773&lt;br&gt;
LH T774&lt;br&gt;
LS E675, LA E675, LY E675, LS T675&lt;br&gt;
LS T776, LA T776, LO T776, LY T776, LB T776&lt;br&gt;
LHGB T686&lt;br&gt;
LT T68C, LB T68C&lt;br&gt;

- &lt;u&gt;Hyper Mini TOPLED®&lt;/u&gt;&lt;br&gt;
LB M676&lt;br&gt;

- &lt;u&gt;Mini TOPLED Santana®&lt;/u&gt;&lt;br&gt;
LG M470&lt;br&gt;
LS M47K, LO M47K, LY M47K
&lt;p&gt;
Source: http://www.osram.convergy.de&lt;p&gt;

&lt;u&gt;LUXEON:&lt;/u&gt;&lt;br&gt;
- &lt;u&gt;LUMILED®&lt;/u&gt;&lt;br&gt;
LXK2-PW12-R00, LXK2-PW12-S00, LXK2-PW14-U00, LXK2-PW14-V00&lt;br&gt;
LXK2-PM12-R00, LXK2-PM12-S00, LXK2-PM14-U00&lt;br&gt;
LXK2-PE12-Q00, LXK2-PE12-R00, LXK2-PE12-S00, LXK2-PE14-T00, LXK2-PE14-U00&lt;br&gt;
LXK2-PB12-K00, LXK2-PB12-L00, LXK2-PB12-M00, LXK2-PB14-N00, LXK2-PB14-P00, LXK2-PB14-Q00&lt;br&gt;
LXK2-PR12-L00, LXK2-PR12-M00, LXK2-PR14-Q00, LXK2-PR14-R00&lt;br&gt;
LXK2-PD12-Q00, LXK2-PD12-R00, LXK2-PD12-S00&lt;br&gt;
LXK2-PH12-R00, LXK2-PH12-S00&lt;br&gt;
LXK2-PL12-P00, LXK2-PL12-Q00, LXK2-PL12-R00
&lt;p&gt;
Source: www.luxeon.com&lt;p&gt;

&lt;u&gt;KINGBRIGHT:&lt;/U&gt;&lt;p&gt;
KA-3528ASYC&lt;br&gt;
Source: www.kingbright.com</description>
<gates>
<gate name="G$1" symbol="LED" x="0" y="0"/>
</gates>
<devices>
<device name="SMT1206" package="1206">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15796/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LD260" package="LD260">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15794/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SQR2X5" package="LED2X5">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15800/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3MM" package="LED3MM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15797/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="5MM" package="LED5MM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15799/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LSU260" package="LSU260">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15805/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LZR181" package="LZR181">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15808/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B152" package="Q62902-B152">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15803/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B153" package="Q62902-B153">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15804/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B155" package="Q62902-B155">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15807/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="B156" package="Q62902-B156">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15806/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SFH480" package="SFH480">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15809/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SFH482" package="SFH482">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15795/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SQR5.7X3.2" package="U57X32">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15789/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="IRL80A" package="IRL80A">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15810/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="P-LCC-2" package="P-LCC-2">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15817/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MINI-TOP" package="OSRAM-MINI-TOP-LED">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15811/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SIDELED" package="OSRAM-SIDELED">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15812/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMART-LED" package="SMART-LED">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="B"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15814/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="P-LCC-2-BACK" package="P-LCC-2-TOPLED-RG">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15813/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="MICRO-SIDELED" package="MICRO-SIDELED">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15815/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="P-LCC-4" package="P-LCC-4">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C@4"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15816/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIP-LED0603" package="CHIP-LED0603">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15819/3"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIP-LED0805" package="CHIP-LED0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15818/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="TOPLED-SANTANA" package="MINI-TOPLED-SANTANA">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15820/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIPLED_0805" package="CHIPLED_0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15821/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIPLED_1206" package="CHIPLED_1206">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15823/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIPLED_0603" package="CHIPLED_0603">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15822/2"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="CHIPLED-0603-TTW" package="CHIPLED-0603-TTW">
<connects>
<connect gate="G$1" pin="A" pad="A@1"/>
<connect gate="G$1" pin="C" pad="C@1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15824/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="" package="SMARTLED-TTW">
<connects>
<connect gate="G$1" pin="A" pad="A@1"/>
<connect gate="G$1" pin="C" pad="C@1"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15825/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-LUMILED+" package="LUMILED+">
<connects>
<connect gate="G$1" pin="A" pad="2+"/>
<connect gate="G$1" pin="C" pad="4-"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15826/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="-LUMILED" package="LUMILED">
<connects>
<connect gate="G$1" pin="A" pad="2+"/>
<connect gate="G$1" pin="C" pad="4-"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15827/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="10MM" package="LED10MM">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="K"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15828/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="KA-3528ASYC" package="KA-3528ASYC">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15831/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SML0805" package="SML0805">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15830/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SML1206" package="SML1206">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15829/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SML0603" package="SML0603">
<connects>
<connect gate="G$1" pin="A" pad="A"/>
<connect gate="G$1" pin="C" pad="C"/>
</connects>
<package3dinstances>
<package3dinstance package3d_urn="urn:adsk.eagle:package:15832/1"/>
</package3dinstances>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="con-molex" urn="urn:adsk.eagle:library:165">
<description>&lt;b&gt;Molex Connectors&lt;/b&gt;&lt;p&gt;
&lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
<package name="87438-02" library_version="2">
<description>&lt;b&gt;1.50mm Pitch Pico-SPOX™ Wire-to-Board Header, Surface Mount, Right Angle, Shrouded, Nylon, 2 Circuits, Embossed Tape on Reel, Beige&lt;/b&gt;&lt;p&gt;&lt;a href =http://www.molex.com/pdm_docs/sd/874380243_sd.pdf&gt;Datasheet &lt;/a&gt;</description>
<wire x1="-4.8" y1="0.75" x2="-4.05" y2="0.75" width="0.2032" layer="21"/>
<wire x1="-4.05" y1="0.75" x2="-4.05" y2="2.05" width="0.2032" layer="21"/>
<wire x1="-4.05" y1="2.05" x2="0.75" y2="2.05" width="0.2032" layer="21"/>
<wire x1="0.75" y1="2.05" x2="0.75" y2="-2.05" width="0.2032" layer="51"/>
<wire x1="0.75" y1="-2.05" x2="-4.05" y2="-2.05" width="0.2032" layer="21"/>
<wire x1="-4.05" y1="-2.05" x2="-4.05" y2="-0.75" width="0.2032" layer="21"/>
<wire x1="-4.05" y1="-0.75" x2="-4.8" y2="-0.75" width="0.2032" layer="21"/>
<wire x1="-4.8" y1="-0.75" x2="-4.8" y2="0.75" width="0.2032" layer="21"/>
<smd name="1" x="0" y="0.75" dx="7" dy="0.85" layer="1"/>
<smd name="2" x="0" y="-0.75" dx="7" dy="0.85" layer="1"/>
<text x="-3.75" y="3" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.75" y="-3.75" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="0.8" y1="0.525" x2="2.85" y2="0.975" layer="51"/>
<rectangle x1="0.8" y1="-0.975" x2="2.85" y2="-0.525" layer="51"/>
</package>
</packages>
<symbols>
<symbol name="MV" library_version="2">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<text x="-0.762" y="1.397" size="1.778" layer="96">&gt;VALUE</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
<symbol name="M" library_version="2">
<wire x1="1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<text x="2.54" y="-0.762" size="1.524" layer="95">&gt;NAME</text>
<pin name="S" x="-2.54" y="0" visible="off" length="short" direction="pas"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="87438-02" prefix="X" library_version="2">
<description>&lt;b&gt;Wire-to-Board  1.50mm (.059") Pitch Header - Right Angle, SMT, Shrouded&lt;/b&gt;&lt;p&gt;
Source: http://www.molex.com/product/micro/87438.html</description>
<gates>
<gate name="-1" symbol="MV" x="0" y="0" addlevel="always" swaplevel="1"/>
<gate name="-2" symbol="M" x="0" y="-2.54" addlevel="always" swaplevel="1"/>
</gates>
<devices>
<device name="" package="87438-02">
<connects>
<connect gate="-1" pin="S" pad="1"/>
<connect gate="-2" pin="S" pad="2"/>
</connects>
<technologies>
<technology name="">
<attribute name="MF" value="MOLEX" constant="no"/>
<attribute name="MPN" value="" constant="no"/>
<attribute name="OC_FARNELL" value="1711327" constant="no"/>
<attribute name="OC_NEWARK" value="unknown" constant="no"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
<attribute name="DDRAWN" value="11/27/2018"/>
<attribute name="DWG_NO" value=""/>
<attribute name="FINISH" value="HASL"/>
<attribute name="MATERIAL" value="FR-4"/>
<attribute name="NCHECKED" value=""/>
<attribute name="NDRAWN" value="MM"/>
<attribute name="REV" value="1.0"/>
<attribute name="SCALE" value="1:1"/>
<attribute name="TITLE" value="SSL Breakbeam"/>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
</classes>
<parts>
<part name="FRAME1" library="RoboJackets-Frames" deviceset="FRAME_B_L" device=""/>
<part name="LED1" library="led" library_urn="urn:adsk.eagle:library:259" deviceset="LED" device="3MM" package3d_urn="urn:adsk.eagle:package:15797/1"/>
<part name="X1" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="87438-02" device=""/>
<part name="X2" library="con-molex" library_urn="urn:adsk.eagle:library:165" deviceset="87438-02" device=""/>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
<instance part="FRAME1" gate="G$1" x="0" y="33.02" smashed="yes"/>
<instance part="FRAME1" gate="G$2" x="325.12" y="33.02" smashed="yes">
<attribute name="LAST_DATE_TIME" x="337.82" y="34.29" size="2.54" layer="94" font="vector"/>
<attribute name="SHEET" x="411.48" y="34.29" size="2.54" layer="94" font="vector"/>
<attribute name="DRAWING_NAME" x="340.36" y="52.07" size="2.54" layer="94" font="vector"/>
<attribute name="SCH_DESC" x="326.39" y="39.37" size="2.54" layer="94"/>
</instance>
<instance part="LED1" gate="G$1" x="213.36" y="200.66" smashed="yes">
<attribute name="NAME" x="216.916" y="196.088" size="1.778" layer="95" rot="R90"/>
<attribute name="VALUE" x="219.075" y="196.088" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="X1" gate="-1" x="195.58" y="198.12" smashed="yes" rot="MR0">
<attribute name="NAME" x="193.04" y="197.358" size="1.524" layer="95" rot="MR0"/>
<attribute name="VALUE" x="196.342" y="199.517" size="1.778" layer="96" rot="MR0"/>
</instance>
<instance part="X1" gate="-2" x="195.58" y="195.58" smashed="yes" rot="MR0">
<attribute name="NAME" x="193.04" y="194.818" size="1.524" layer="95" rot="MR0"/>
</instance>
<instance part="X2" gate="-1" x="228.6" y="198.12" smashed="yes">
<attribute name="NAME" x="231.14" y="197.358" size="1.524" layer="95"/>
<attribute name="VALUE" x="227.838" y="199.517" size="1.778" layer="96"/>
</instance>
<instance part="X2" gate="-2" x="228.6" y="195.58" smashed="yes">
<attribute name="NAME" x="231.14" y="194.818" size="1.524" layer="95"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="N$1" class="0">
<segment>
<pinref part="X1" gate="-1" pin="S"/>
<wire x1="198.12" y1="198.12" x2="198.12" y2="205.74" width="0.1524" layer="91"/>
<pinref part="LED1" gate="G$1" pin="A"/>
<wire x1="198.12" y1="205.74" x2="213.36" y2="205.74" width="0.1524" layer="91"/>
<wire x1="213.36" y1="205.74" x2="213.36" y2="203.2" width="0.1524" layer="91"/>
<pinref part="X2" gate="-1" pin="S"/>
<wire x1="226.06" y1="198.12" x2="226.06" y2="205.74" width="0.1524" layer="91"/>
<wire x1="226.06" y1="205.74" x2="213.36" y2="205.74" width="0.1524" layer="91"/>
<junction x="213.36" y="205.74"/>
</segment>
</net>
<net name="N$3" class="0">
<segment>
<pinref part="X2" gate="-2" pin="S"/>
<pinref part="LED1" gate="G$1" pin="C"/>
<wire x1="226.06" y1="195.58" x2="213.36" y2="195.58" width="0.1524" layer="91"/>
<pinref part="X1" gate="-2" pin="S"/>
<wire x1="198.12" y1="195.58" x2="213.36" y2="195.58" width="0.1524" layer="91"/>
<junction x="213.36" y="195.58"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports the association of 3D packages
with devices in libraries, schematics, and board files. Those 3D
packages will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
