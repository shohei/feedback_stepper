<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_3" />
        <signal name="XLXN_4" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6(7:0)" />
        <signal name="XLXN_7" />
        <signal name="XLXN_8" />
        <signal name="XLXN_9" />
        <port polarity="Input" name="XLXN_1" />
        <port polarity="Input" name="XLXN_2" />
        <port polarity="Input" name="XLXN_3" />
        <port polarity="Input" name="XLXN_4" />
        <port polarity="Input" name="XLXN_5" />
        <port polarity="Input" name="XLXN_6(7:0)" />
        <port polarity="Output" name="XLXN_7" />
        <port polarity="Output" name="XLXN_8" />
        <port polarity="Output" name="XLXN_9" />
        <blockdef name="chat_filter">
            <timestamp>2016-11-22T5:16:11</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
        </blockdef>
        <blockdef name="pwm">
            <timestamp>2016-11-22T5:19:10</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="chat_filter" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="CLK" />
            <blockpin signalname="XLXN_2" name="CE" />
            <blockpin signalname="XLXN_3" name="DIN" />
            <blockpin signalname="XLXN_9" name="DOUT" />
        </block>
        <block symbolname="pwm" name="XLXI_2">
            <blockpin signalname="XLXN_4" name="CLK" />
            <blockpin signalname="XLXN_5" name="RST" />
            <blockpin signalname="XLXN_6(7:0)" name="SW(7:0)" />
            <blockpin signalname="XLXN_7" name="MD1" />
            <blockpin signalname="XLXN_8" name="MD2" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="944" y="1200" name="XLXI_1" orien="R0">
        </instance>
        <instance x="944" y="1504" name="XLXI_2" orien="R0">
        </instance>
        <branch name="XLXN_1">
            <wire x2="944" y1="1040" y2="1040" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1040" name="XLXN_1" orien="R180" />
        <branch name="XLXN_2">
            <wire x2="944" y1="1104" y2="1104" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1104" name="XLXN_2" orien="R180" />
        <branch name="XLXN_3">
            <wire x2="944" y1="1168" y2="1168" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1168" name="XLXN_3" orien="R180" />
        <branch name="XLXN_4">
            <wire x2="944" y1="1344" y2="1344" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1344" name="XLXN_4" orien="R180" />
        <branch name="XLXN_5">
            <wire x2="944" y1="1408" y2="1408" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1408" name="XLXN_5" orien="R180" />
        <branch name="XLXN_6(7:0)">
            <wire x2="944" y1="1472" y2="1472" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1472" name="XLXN_6(7:0)" orien="R180" />
        <branch name="XLXN_7">
            <wire x2="1360" y1="1344" y2="1344" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1344" name="XLXN_7" orien="R0" />
        <branch name="XLXN_8">
            <wire x2="1360" y1="1472" y2="1472" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1472" name="XLXN_8" orien="R0" />
        <branch name="XLXN_9">
            <wire x2="1360" y1="1040" y2="1040" x1="1328" />
        </branch>
        <iomarker fontsize="28" x="1360" y="1040" name="XLXN_9" orien="R0" />
    </sheet>
</drawing>