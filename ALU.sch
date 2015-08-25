<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="S(32:0)" />
        <signal name="XLXN_8(31:0)" />
        <signal name="XLXN_9(31:0)" />
        <signal name="XLXN_7(31:0)" />
        <signal name="S(31:0)" />
        <signal name="XLXN_1(31:0)" />
        <signal name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,S(32)" />
        <signal name="N0" />
        <signal name="res(31:0)" />
        <signal name="overflow" />
        <signal name="B(31:0)" />
        <signal name="XLXN_36(31:0)" />
        <signal name="A(31:0)" />
        <signal name="ALU_operation(2:0)" />
        <signal name="ALU_operation(2)" />
        <signal name="XLXN_48(31:0)" />
        <signal name="XLXN_88(31:0)" />
        <signal name="XLXN_89" />
        <signal name="zero" />
        <port polarity="Output" name="res(31:0)" />
        <port polarity="Output" name="overflow" />
        <port polarity="Input" name="B(31:0)" />
        <port polarity="Input" name="A(31:0)" />
        <port polarity="Input" name="ALU_operation(2:0)" />
        <port polarity="Output" name="zero" />
        <blockdef name="ADC32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <line x2="48" y1="-256" y2="-256" style="linewidth:W" x1="64" />
            <line x2="48" y1="-128" y2="-128" style="linewidth:W" x1="64" />
            <line x2="64" y1="-224" y2="-300" x1="64" />
            <line x2="112" y1="-224" y2="-192" x1="64" />
            <line x2="112" y1="-160" y2="-192" x1="64" />
            <line x2="64" y1="-160" y2="-76" x1="64" />
            <line x2="224" y1="-76" y2="-140" x1="64" />
            <line x2="224" y1="-300" y2="-236" x1="64" />
            <line x2="224" y1="-140" y2="-236" x1="224" />
            <line x2="240" y1="-192" y2="-192" style="linewidth:W" x1="224" />
            <line x2="128" y1="-304" y2="-276" x1="128" />
        </blockdef>
        <blockdef name="and32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <line x2="32" y1="-96" y2="-96" style="linewidth:W" x1="64" />
            <line x2="28" y1="-32" y2="-32" style="linewidth:W" x1="64" />
            <line x2="64" y1="-16" y2="-16" x1="144" />
            <line x2="64" y1="-16" y2="-112" x1="64" />
            <line x2="144" y1="-112" y2="-112" x1="64" />
            <arc ex="144" ey="-112" sx="144" sy="-16" r="48" cx="144" cy="-64" />
            <line x2="224" y1="-64" y2="-64" style="linewidth:W" x1="192" />
        </blockdef>
        <blockdef name="or32">
            <timestamp>2015-4-10T3:56:58</timestamp>
            <line x2="64" y1="-16" y2="-16" x1="128" />
            <arc ex="208" ey="-64" sx="128" sy="-16" r="88" cx="132" cy="-104" />
            <arc ex="128" ey="-112" sx="208" sy="-64" r="88" cx="132" cy="-24" />
            <line x2="64" y1="-112" y2="-112" x1="128" />
            <line x2="48" y1="-96" y2="-96" style="linewidth:W" x1="80" />
            <arc ex="64" ey="-112" sx="64" sy="-16" r="56" cx="32" cy="-64" />
            <line x2="48" y1="-32" y2="-32" style="linewidth:W" x1="80" />
            <line x2="240" y1="-64" y2="-64" style="linewidth:W" x1="208" />
        </blockdef>
        <blockdef name="xor32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <arc ex="80" ey="-112" sx="80" sy="-16" r="56" cx="48" cy="-64" />
            <line x2="80" y1="-112" y2="-112" x1="144" />
            <line x2="80" y1="-16" y2="-16" x1="144" />
            <arc ex="144" ey="-112" sx="224" sy="-64" r="88" cx="148" cy="-24" />
            <arc ex="60" ey="-112" sx="64" sy="-16" r="56" cx="32" cy="-64" />
            <arc ex="224" ey="-64" sx="144" sy="-16" r="88" cx="148" cy="-104" />
            <line x2="80" y1="-96" y2="-96" style="linewidth:W" x1="32" />
            <line x2="80" y1="-32" y2="-32" style="linewidth:W" x1="32" />
            <line x2="228" y1="-64" y2="-64" style="linewidth:W" x1="256" />
        </blockdef>
        <blockdef name="nor32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <line x2="64" y1="-112" y2="-112" x1="128" />
            <arc ex="64" ey="-112" sx="64" sy="-16" r="56" cx="32" cy="-64" />
            <line x2="64" y1="-16" y2="-16" x1="128" />
            <arc ex="208" ey="-64" sx="128" sy="-16" r="88" cx="132" cy="-104" />
            <arc ex="128" ey="-112" sx="208" sy="-64" r="88" cx="132" cy="-24" />
            <line x2="224" y1="-64" y2="-64" style="linewidth:W" x1="256" />
            <circle style="linewidth:W" r="8" cx="216" cy="-64" />
            <line x2="48" y1="-96" y2="-96" style="linewidth:W" x1="80" />
            <line x2="48" y1="-32" y2="-32" style="linewidth:W" x1="80" />
        </blockdef>
        <blockdef name="srl32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <rect width="184" x="64" y="-128" height="128" />
            <line x2="32" y1="-96" y2="-96" style="linewidth:W" x1="64" />
            <line x2="32" y1="-32" y2="-32" style="linewidth:W" x1="64" />
            <line x2="288" y1="-64" y2="-64" style="linewidth:W" x1="248" />
        </blockdef>
        <blockdef name="mux8to1_32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <rect width="256" x="64" y="-576" height="504" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-540" height="24" />
            <line x2="0" y1="-528" y2="-528" x1="64" />
            <rect width="64" x="320" y="-332" height="24" />
            <line x2="384" y1="-320" y2="-320" x1="320" />
            <rect width="64" x="0" y="-476" height="24" />
            <line x2="0" y1="-464" y2="-464" x1="64" />
            <rect width="64" x="0" y="-380" height="24" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="64" x="0" y="-332" height="24" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-188" height="24" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <rect width="64" x="0" y="-140" height="24" />
            <line x2="0" y1="-128" y2="-128" x1="64" />
        </blockdef>
        <blockdef name="or_bit_32">
            <timestamp>2015-4-2T9:7:0</timestamp>
            <rect width="220" x="64" y="-104" height="112" />
            <line x2="32" y1="-48" y2="-48" style="linewidth:W" x1="64" />
            <arc ex="260" ey="-48" sx="180" sy="0" r="88" cx="184" cy="-88" />
            <line x2="116" y1="0" y2="0" x1="180" />
            <line x2="116" y1="-96" y2="-96" x1="180" />
            <arc ex="116" ey="-96" sx="116" sy="0" r="56" cx="84" cy="-48" />
            <arc ex="180" ey="-96" sx="260" sy="-48" r="88" cx="184" cy="-8" />
            <line x2="120" y1="-96" y2="-96" x1="184" />
            <line x2="88" y1="-80" y2="-80" x1="128" />
            <line x2="92" y1="-16" y2="-16" x1="132" />
            <line x2="304" y1="-48" y2="-48" x1="284" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="SignalExt_32">
            <timestamp>2015-3-12T5:53:0</timestamp>
            <line x2="76" y1="-32" y2="-32" x1="64" />
            <line x2="208" y1="-32" y2="-32" style="linewidth:W" x1="196" />
            <rect width="120" x="76" y="-52" height="40" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and32" name="XLXI_6">
            <blockpin signalname="XLXN_1(31:0)" name="res(31:0)" />
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
        </block>
        <block symbolname="or32" name="XLXI_7">
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_88(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="xor32" name="XLXI_10">
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_7(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="nor32" name="XLXI_11">
            <blockpin signalname="XLXN_8(31:0)" name="res(31:0)" />
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
        </block>
        <block symbolname="srl32" name="XLXI_12">
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_9(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="mux8to1_32" name="XLXI_14">
            <blockpin signalname="XLXN_88(31:0)" name="x1(31:0)" />
            <blockpin signalname="ALU_operation(2:0)" name="sel(2:0)" />
            <blockpin signalname="res(31:0)" name="o(31:0)" />
            <blockpin signalname="XLXN_1(31:0)" name="x0(31:0)" />
            <blockpin signalname="S(31:0)" name="x2(31:0)" />
            <blockpin signalname="XLXN_7(31:0)" name="x3(31:0)" />
            <blockpin signalname="XLXN_8(31:0)" name="x4(31:0)" />
            <blockpin signalname="XLXN_9(31:0)" name="x5(31:0)" />
            <blockpin signalname="S(31:0)" name="x6(31:0)" />
            <blockpin signalname="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,S(32)" name="x7(31:0)" />
        </block>
        <block symbolname="gnd" name="XLXI_22">
            <blockpin signalname="N0" name="G" />
        </block>
        <block symbolname="or_bit_32" name="XLXI_15">
            <blockpin signalname="XLXN_89" name="o" />
            <blockpin signalname="res(31:0)" name="A(31:0)" />
        </block>
        <block symbolname="ADC32" name="XLXI_8">
            <blockpin signalname="XLXN_36(31:0)" name="B(31:0)" />
            <blockpin signalname="A(31:0)" name="A(31:0)" />
            <blockpin signalname="ALU_operation(2)" name="C0" />
            <blockpin signalname="S(32:0)" name="S(32:0)" />
        </block>
        <block symbolname="xor32" name="XLXI_13">
            <blockpin signalname="XLXN_48(31:0)" name="A(31:0)" />
            <blockpin signalname="B(31:0)" name="B(31:0)" />
            <blockpin signalname="XLXN_36(31:0)" name="res(31:0)" />
        </block>
        <block symbolname="SignalExt_32" name="XLXI_23">
            <blockpin signalname="XLXN_48(31:0)" name="So(31:0)" />
            <blockpin signalname="ALU_operation(2)" name="S" />
        </block>
        <block symbolname="inv" name="XLXI_24">
            <blockpin signalname="XLXN_89" name="I" />
            <blockpin signalname="zero" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1184" y="592" name="XLXI_6" orien="R0">
        </instance>
        <instance x="1168" y="1152" name="XLXI_10" orien="R0">
        </instance>
        <instance x="1184" y="1312" name="XLXI_11" orien="R0">
        </instance>
        <instance x="1152" y="1488" name="XLXI_12" orien="R0">
        </instance>
        <bustap x2="1584" y1="800" y2="800" x1="1488" />
        <bustap x2="2016" y1="1088" y2="1088" x1="1920" />
        <instance x="1984" y="1280" name="XLXI_22" orien="R0" />
        <iomarker fontsize="28" x="2544" y="752" name="res(31:0)" orien="R0" />
        <instance x="2192" y="1264" name="XLXI_15" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2544" y="1424" name="overflow" orien="R0" />
        <iomarker fontsize="28" x="816" y="432" name="ALU_operation(2:0)" orien="R180" />
        <bustap x2="928" y1="432" y2="528" x1="928" />
        <instance x="1168" y="1088" name="XLXI_8" orien="R0">
        </instance>
        <instance x="672" y="1024" name="XLXI_13" orien="R0">
        </instance>
        <iomarker fontsize="28" x="912" y="1392" name="A(31:0)" orien="R180" />
        <iomarker fontsize="28" x="912" y="1456" name="B(31:0)" orien="R180" />
        <instance x="944" y="784" name="XLXI_23" orien="M0">
        </instance>
        <branch name="S(32:0)">
            <wire x2="1488" y1="896" y2="896" x1="1408" />
            <wire x2="1488" y1="800" y2="896" x1="1488" />
        </branch>
        <branch name="XLXN_8(31:0)">
            <wire x2="1760" y1="1248" y2="1248" x1="1440" />
            <wire x2="1760" y1="800" y2="1248" x1="1760" />
            <wire x2="1984" y1="800" y2="800" x1="1760" />
        </branch>
        <branch name="XLXN_9(31:0)">
            <wire x2="1840" y1="1424" y2="1424" x1="1440" />
            <wire x2="1840" y1="848" y2="1424" x1="1840" />
            <wire x2="1984" y1="848" y2="848" x1="1840" />
        </branch>
        <branch name="N0">
            <wire x2="2048" y1="1088" y2="1088" x1="2016" />
            <wire x2="2048" y1="1088" y2="1152" x1="2048" />
        </branch>
        <branch name="overflow">
            <wire x2="2544" y1="1424" y2="1424" x1="2256" />
        </branch>
        <branch name="B(31:0)">
            <wire x2="704" y1="992" y2="992" x1="656" />
            <wire x2="656" y1="992" y2="1280" x1="656" />
            <wire x2="1024" y1="1280" y2="1280" x1="656" />
            <wire x2="1232" y1="1280" y2="1280" x1="1024" />
            <wire x2="1024" y1="1280" y2="1456" x1="1024" />
            <wire x2="1184" y1="1456" y2="1456" x1="1024" />
            <wire x2="1024" y1="1456" y2="1456" x1="912" />
            <wire x2="1216" y1="560" y2="560" x1="1024" />
            <wire x2="1024" y1="560" y2="688" x1="1024" />
            <wire x2="1024" y1="688" y2="1120" x1="1024" />
            <wire x2="1200" y1="1120" y2="1120" x1="1024" />
            <wire x2="1024" y1="1120" y2="1280" x1="1024" />
            <wire x2="1216" y1="688" y2="688" x1="1024" />
        </branch>
        <branch name="XLXN_36(31:0)">
            <wire x2="1216" y1="960" y2="960" x1="928" />
        </branch>
        <branch name="A(31:0)">
            <wire x2="1120" y1="1392" y2="1392" x1="912" />
            <wire x2="1184" y1="1392" y2="1392" x1="1120" />
            <wire x2="1216" y1="496" y2="496" x1="1120" />
            <wire x2="1120" y1="496" y2="624" x1="1120" />
            <wire x2="1120" y1="624" y2="832" x1="1120" />
            <wire x2="1120" y1="832" y2="1056" x1="1120" />
            <wire x2="1200" y1="1056" y2="1056" x1="1120" />
            <wire x2="1120" y1="1056" y2="1216" x1="1120" />
            <wire x2="1120" y1="1216" y2="1392" x1="1120" />
            <wire x2="1232" y1="1216" y2="1216" x1="1120" />
            <wire x2="1216" y1="832" y2="832" x1="1120" />
            <wire x2="1216" y1="624" y2="624" x1="1120" />
        </branch>
        <branch name="ALU_operation(2:0)">
            <wire x2="928" y1="432" y2="432" x1="816" />
            <wire x2="1664" y1="432" y2="432" x1="928" />
            <wire x2="1664" y1="432" y2="544" x1="1664" />
            <wire x2="1984" y1="544" y2="544" x1="1664" />
        </branch>
        <branch name="ALU_operation(2)">
            <wire x2="928" y1="752" y2="752" x1="880" />
            <wire x2="1296" y1="752" y2="752" x1="928" />
            <wire x2="1296" y1="752" y2="784" x1="1296" />
            <wire x2="928" y1="528" y2="752" x1="928" />
        </branch>
        <branch name="XLXN_48(31:0)">
            <wire x2="656" y1="752" y2="928" x1="656" />
            <wire x2="704" y1="928" y2="928" x1="656" />
            <wire x2="736" y1="752" y2="752" x1="656" />
        </branch>
        <branch name="res(31:0)">
            <wire x2="2464" y1="1088" y2="1088" x1="2160" />
            <wire x2="2160" y1="1088" y2="1216" x1="2160" />
            <wire x2="2224" y1="1216" y2="1216" x1="2160" />
            <wire x2="2464" y1="752" y2="752" x1="2368" />
            <wire x2="2544" y1="752" y2="752" x1="2464" />
            <wire x2="2464" y1="752" y2="1088" x1="2464" />
        </branch>
        <branch name="N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,N0,S(32)">
            <wire x2="1984" y1="944" y2="944" x1="1920" />
            <wire x2="1920" y1="944" y2="1088" x1="1920" />
        </branch>
        <branch name="S(31:0)">
            <wire x2="1600" y1="800" y2="800" x1="1584" />
            <wire x2="1600" y1="800" y2="896" x1="1600" />
            <wire x2="1984" y1="896" y2="896" x1="1600" />
            <wire x2="1600" y1="704" y2="800" x1="1600" />
            <wire x2="1984" y1="704" y2="704" x1="1600" />
        </branch>
        <branch name="XLXN_7(31:0)">
            <wire x2="1680" y1="1088" y2="1088" x1="1424" />
            <wire x2="1680" y1="752" y2="1088" x1="1680" />
            <wire x2="1984" y1="752" y2="752" x1="1680" />
        </branch>
        <branch name="XLXN_1(31:0)">
            <wire x2="1600" y1="528" y2="528" x1="1408" />
            <wire x2="1600" y1="528" y2="608" x1="1600" />
            <wire x2="1984" y1="608" y2="608" x1="1600" />
        </branch>
        <instance x="1984" y="1072" name="XLXI_14" orien="R0">
        </instance>
        <branch name="XLXN_88(31:0)">
            <wire x2="1984" y1="656" y2="656" x1="1408" />
        </branch>
        <instance x="1168" y="720" name="XLXI_7" orien="R0">
        </instance>
        <branch name="XLXN_89">
            <wire x2="2512" y1="1216" y2="1216" x1="2496" />
        </branch>
        <branch name="zero">
            <wire x2="2752" y1="1216" y2="1216" x1="2736" />
        </branch>
        <instance x="2512" y="1248" name="XLXI_24" orien="R0" />
        <iomarker fontsize="28" x="2752" y="1216" name="zero" orien="R0" />
    </sheet>
</drawing>