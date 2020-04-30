## Well Known Network Ports

|Port	|Description	|
|-------|---------------|
|1	|TCP Port Service Multiplexer (TCPMUX). Historic. Both TCP and UDP have been assigned to TCPMUX by IANA, but by design only TCP is specified.	|
|5	|Remote Job Entry was historically using socket 5 in its old socket form, while MIB PIM has identified it as TCP/5 and IANA has assigned both TCP and UDP 5 to it.	|
|7	|Echo Protocol	|
|9	|Unofficial	Wake-on-LAN	|
|11	|Active Users (systat service)	|
|13	|Daytime Protocol	|
|15|No	Unofficial	Previously netstat service	|
|17	|Quote of the Day (QOTD)	|
|18	|Message Send Protocol	|
|19	|Character Generator Protocol (CHARGEN)	|
|20	|File Transfer Protocol (FTP) data transfer	Yes |
|21	|File Transfer Protocol (FTP) control (command)	Yes|
|22	|Secure Shell (SSH), secure logins, file transfers (scp, sftp) and port forwarding|
|23	|Telnet protocol—unencrypted text communications	|
|25	|Simple Mail Transfer Protocol (SMTP), used for email routing between mail servers	|
|37	|Time Protocol	|
|42	|Host Name Server Protocol	|
|43	|WHOIS protocol	|
|47	|	|
|49	|TACACS Login Host protocol. TACACS+, still in draft which is an improved but distinct version of TACACS, only uses TCP 49.	|
|51	|Historically used for Interface Message Processor logical address management, entry has been removed by IANA on 2013-05-25	|
|52	|Xerox Network Systems (XNS) Time Protocol. Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|53	|Domain Name System (DNS)	|
|54	|Xerox Network Systems (XNS) Clearinghouse (Name Server). Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|56	|Xerox Network Systems (XNS) Authentication Protocol. Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|58	|Xerox Network Systems (XNS) Mail. Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|61	|Historically assigned to the NIFTP-Based Mail protocol, but was never documented in the related IEN. The port number entry was removed from IANA's registry on 2017-05-18.	|
|67	|Bootstrap Protocol (BOOTP) server; also used by Dynamic Host Configuration Protocol (DHCP)	|
|68	|Bootstrap Protocol (BOOTP) client; also used by Dynamic Host Configuration Protocol (DHCP)	|
|69	|Trivial File Transfer Protocol (TFTP)	|
|70	|Gopher protocol	|
|71–74	|NETRJS protocol	|
|79	|Finger protocol	|
|80	|Hypertext Transfer Protocol (HTTP)|
|81	|TorPark onion routing[verification needed	|
|82	|TorPark control[verification needed	|
|83	|MIT ML Device, networking file system 	|
|88	|Kerberos authentication system	|
|90	|PointCast (dotcom)[third-party source needed	|
|95	|SUPDUP, terminal-independent remote login 	|
|101	|NIC host name	|
|102	|ISO Transport Service Access Point (TSAP) Class 0 protocol;	|
|104	|Digital Imaging and Communications in Medicine (DICOM; also port 11112)	|
|105	|CCSO Nameserver	|
|107	|Remote User Telnet Service (RTelnet)	|
|108	|IBM Systems Network Architecture (SNA) gateway access server	|
|109	|Post Office Protocol, version 2 (POP2)	|
|110	|Post Office Protocol, version 3 (POP3)	|
|111	|Open Network Computing Remote Procedure Call (ONC RPC, sometimes referred to as Sun RPC)	|
|113|No	Official	Ident, authentication service/identification protocol, used by IRC servers to identify users	|
||Authentication Service (auth), the predecessor to identification protocol. Used to determine a user's identity of a particular TCP connection.	|
|115	|Simple File Transfer Protocol	|
|117	|UUCP Mapping Project (path service)[citation needed	|
|118	|Structured Query Language (SQL) Services[jargon	|
|119	|Network News Transfer Protocol (NNTP), retrieval of newsgroup messages	|
|123	|Network Time Protocol (NTP), used for time synchronization	|
|126	|Formerly Unisys Unitary Login, renamed by Unisys to NXEdit. Used by Unisys Programmer's Workbench for Clearpath MCP, an IDE for Unisys MCP software development	|
|135	|DCE endpoint resolution	|
||Microsoft EPMAP (End Point Mapper), also known as DCE/RPC Locator service, used to remotely manage services including DHCP server, DNS server and WINS. Also used by DCOM	|
|137	|NetBIOS Name Service, used for name registration and resolution	|
|138	|NetBIOS Datagram Service	|
|139	|NetBIOS Session Service	|
|143	|Internet Message Access Protocol (IMAP), management of electronic mail messages on a server	|
|152	|Background File Transfer Program (BFTP)[importance?	|
|153	|Simple Gateway Monitoring Protocol (SGMP), a protocol for remote inspection and alteration of gateway management information	|
|156	|Structured Query Language (SQL) Service[jargon	|
|158	|Distributed Mail System Protocol (DMSP, sometimes referred to as Pcmail)[importance?	|
|161	|Simple Network Management Protocol (SNMP)[citation needed	|
|162	|Simple Network Management Protocol Trap (SNMPTRAP)[citation needed	|
|170	|Network PostScript print server	|
|177	|X Display Manager Control Protocol (XDMCP), used for remote logins to an X Display Manager server[self-published source	|
|179	|Border Gateway Protocol (BGP), used to exchange routing and reachability information among autonomous systems (AS) on the Internet	Yes |
|194	|Internet Relay Chat (IRC)	|
|199	|SNMP Unix Multiplexer (SMUX)	|
|201	|AppleTalk Routing Maintenance	|
|209	|Quick Mail Transfer Protocol[self-published source	|
|210	|ANSI Z39.50	|
|213	|Internetwork Packet Exchange (IPX)	|
|218	|Message posting protocol (MPP)	|
|220	|Internet Message Access Protocol (IMAP), version 3	|
|225–241	|	|
|249–255	|	|
|259	|Efficient Short Remote Operations (ESRO)	|
|262	|Arcisdms	|
|264	|Border Gateway Multicast Protocol (BGMP)	|
|280	|http-mgmt	|
|300	|ThinLinc Web Access	|
|308	|Novastor Online Backup	|
|311	|Mac OS X Server Admin (officially AppleShare IP Web administration)	|
|318	|PKIX Time Stamp Protocol (TSP)	|
|319	|Precision Time Protocol (PTP) event messages	|
|320	|Precision Time Protocol (PTP) general messages	|
|350	|Mapping of Airline Traffic over Internet Protocol (MATIP) type A	|
|351	|MATIP type B	|
|356	|cloanto-net-1 (used by Cloanto Amiga Explorer and VMs)	|
|366	|On-Demand Mail Relay (ODMR)	|
|369	|Rpc2portmap	|
|370	|codaauth2, Coda authentication server	|
|Yes	Official	securecast1, outgoing packets to NAI's SecureCast serversAs of 2000	|
|371	|ClearCase albd	|
|383	|HP data alarm manager	|
|384	|A Remote Network Server System	|
|387	|AURP (AppleTalk Update-based Routing Protocol)	|
|388	|Unidata LDM near real-time data distribution protocol[self-published source[self-published source	|
|389	|Lightweight Directory Access Protocol (LDAP)	|
|399	|Digital Equipment Corporation DECnet+ (Phase V) over TCP/IP (RFC1859)	|
|401	|Uninterruptible power supply (UPS)	|
|427	|Service Location Protocol (SLP)	|
|433	|NNSP, part of Network News Transfer Protocol	|
|434	|Mobile IP Agent (RFC 5944)	|
|443	|Hypertext Transfer Protocol over TLS/SSL (HTTPS)	Yes |
|No|Unofficial	Quick UDP Internet Connections (QUIC), a transport protocol over UDP (still in draft as of July 2018), using stream multiplexing, encryption by default with TLS, and currently supporting HTTP/2.	|
|444	|Simple Network Paging Protocol (SNPP), RFC 1568	|
|445	|Microsoft-DS (Directory Services) Active Directory, Windows shares	|
||Microsoft-DS (Directory Services) SMB file sharing	|
|464	|Kerberos Change/Set password	|
|465|No	Official	URL Rendezvous Directory for SSM (Cisco protocol)[importance?	|
|Yes	No	Official	Authenticated SMTP over TLS/SSL (SMTPS)	|
|475	|tcpnethaspsrv, Aladdin Knowledge Systems Hasp services	|
|491	|GO-Global remote access and application publishing software	|
|497	|Retrospect	|
|500	|Internet Security Association and Key Management Protocol (ISAKMP) / Internet Key Exchange (IKE)	|
|502	|Modbus Protocol	|
|504	|Citadel, multiservice protocol for dedicated clients for the Citadel groupware system	|
|510	|FirstClass Protocol (FCP), used by FirstClass client/server groupware system	|
|512	|Rexec, Remote Process Execution	|
|Yes	Official	comsat, together with biff	|
|513	|rlogin	|
|Yes	Official	Who	|
|514	|Remote Shell, used to execute non-interactive commands on a remote system (Remote Shell, rsh, remsh)	|
|No|Syslog, used for system logging	|
|515	|Line Printer Daemon (LPD), print service	|
|517	|Talk	|
|518	|NTalk	|
|520	|efs, extended file name server	|
|Yes	Official	Routing Information Protocol (RIP)	|
|521	|Routing Information Protocol Next Generation (RIPng)	|
|524	|NetWare Core Protocol (NCP) is used for a variety things such as access to primary NetWare server resources, Time Synchronization, etc.	|
|525	|Timed, Timeserver	|
|530	|Remote procedure call (RPC)	|
|532	|netnews	|
|533	|netwall, For Emergency Broadcasts	|
|540	|Unix-to-Unix Copy Protocol (UUCP)	|
|542	|commerce (Commerce Applications)	|
|543	|klogin, Kerberos login	|
|544	|kshell, Kerberos Remote shell	|
|546	|DHCPv6 client	|
|547	|DHCPv6 server	|
|548	|Apple Filing Protocol (AFP) over TCP	|
|550	|new-rwho, new-who	|
|554	|Real Time Streaming Protocol (RTSP)	|
|556	|Remotefs, RFS, rfs_server	|
|560	|rmonitor, Remote Monitor	|
|561	|monitor	|
|563	|NNTP over TLS/SSL (NNTPS)	|
|564	|9P (Plan 9)	|
|585	Port 993	?	Unofficial	Legacy use of Internet Message Access Protocol over TLS/SSL (IMAPS), now in use at port 993.	|
|587	|email message submission (SMTP)	|
|591	|FileMaker 6.0 (and later) Web Sharing (HTTP Alternate, also see port 80)	|
|593	|HTTP RPC Ep Map, Remote procedure call over Hypertext Transfer Protocol, often used by Distributed Component Object Model services and Microsoft Exchange Server	|
|601	|Reliable Syslog Service — used for system logging	|
|604	|TUNNEL profile, a protocol for BEEP peers to form an application layer tunnel	|
|623	|ASF Remote Management and Control Protocol (ASF-RMCP) & IPMI Remote Management Protocol	|
|625|No	Unofficial	Open Directory Proxy (ODProxy)	|
|631	|Internet Printing Protocol (IPP)	|
|635	|RLZ DBase	|
|636	|Lightweight Directory Access Protocol over TLS/SSL (LDAPS)	|
|639	|MSDP, Multicast Source Discovery Protocol	|
|641	|SupportSoft Nexus Remote Command (control/listening), a proxy gateway connecting remote control traffic	|
|643	|SANity	|
|646	|Label Distribution Protocol (LDP), a routing protocol used in MPLS networks	|
|647	|DHCP Failover protocol	|
|648	|Registry Registrar Protocol (RRP)	|
|651	|IEEE-MMS	|
|653	|SupportSoft Nexus Remote Command (data), a proxy gateway connecting remote control traffic	|
|654	|Media Management System (MMS) Media Management Protocol (MMP)	|
|655	|Tinc VPN daemon	|
|657	|IBM RMC (Remote monitoring and Control) protocol, used by System p5 AIX Integrated Virtualization Manager (IVM) and Hardware Management Console to connect managed logical partitions (LPAR) to enable dynamic partition reconfiguration	|
|660	|Mac OS X Server administration, version 10.4 and earlier	|
|666	|Doom, first online first-person shooter	|
|674	|Application Configuration Access Protocol (ACAP)	|
|688	|REALM-RUSD (ApplianceWare Server Appliance Management Protocol)	|
|690	|Velneo Application Transfer Protocol (VATP)	|
|691	|MS Exchange Routing	|
|694	|Linux-HA high-availability heartbeat	|
|695	|IEEE Media Management System over SSL (IEEE-MMS-SSL)	|
|698	|Optimized Link State Routing (OLSR)	|
|700	|Extensible Provisioning Protocol (EPP), a protocol for communication between domain name registries and registrars (RFC 5734)	|
|701	|Link Management Protocol (LMP), a protocol that runs between a pair of nodes and is used to manage traffic engineering (TE) links	|
|702	|IRIS (Internet Registry Information Service) over BEEP (Blocks Extensible Exchange Protocol) (RFC 3983)	|
|706	|Secure Internet Live Conferencing (SILC)	|
|711	|Cisco Tag Distribution Protocol012—being replaced by the MPLS Label Distribution Protocol3	|
|712	|Topology Broadcast based on Reverse-Path Forwarding routing protocol (TBRPF; RFC 3684)	|
|749	|Kerberos (protocol) administration	|
|750	|kerberos-iv, Kerberos version IV	|
|751	|kerberos_master, Kerberos authentication	|
|752	|Unofficial	passwd_server, Kerberos password (kpasswd) server	|
|753	|Reverse Routing Header (RRH)4	|
|Yes	Unofficial	userreg_server, Kerberos userreg server	|
|754	|tell send	|
||krb5_prop, Kerberos v5 slave propagation	|
|760	|krbupdate [kreg, Kerberos registration	|
|782	|Conserver serial-console management server	|
|783	|SpamAssassin spamd daemon	|
|800	|mdbs-daemon	|
|802	|MODBUS/TCP Security5	|
|808	|Microsoft Net.TCP Port Sharing Service	|
|829	|Certificate Management Protocol6	|
|830	|NETCONF over SSH	|
|831	|NETCONF over BEEP	|
|832	|NETCONF for SOAP over HTTPS	|
|833	|NETCONF for SOAP over BEEP	|
|843	|Adobe Flash7	|
|847	|DHCP Failover protocol	|
|848	|Group Domain Of Interpretation (GDOI) protocol	|
|853	|DNS over TLS (RFC 7858)	|
|860	|iSCSI (RFC 3720)	|
|861	|OWAMP control (RFC 4656)	|
|862	|TWAMP control (RFC 5357)	|
|873	|rsync file synchronization protocol	|
|888	|cddbp, CD DataBase (CDDB) protocol (CDDBP)	|
||IBM Endpoint Manager Remote Control	|
|897	|Brocade SMI-S RPC	|
|898	|Brocade SMI-S RPC SSL	|
|902	|VMware ESXi89	|
|903	|VMware ESXi89	|
|953|Reserved	Official	BIND remote name daemon control (RNDC)01	|
|981	|Remote HTTPS management for firewall devices running embedded Check Point VPN-1 software2	|
|987	|Microsoft Remote Web Workplace, a feature of Windows Small Business Server3	|
|989	|FTPS Protocol (data), FTP over TLS/SSL	|
|990	|FTPS Protocol (control), FTP over TLS/SSL	|
|991	|Netnews Administration System (NAS)4	|
|992	|Telnet protocol over TLS/SSL	|
|993	|Internet Message Access Protocol over TLS/SSL (IMAPS)	|
|994	|	|
|Maybe	Maybe	Unofficial	Internet Relay Chat over TLS/SSL (IRCS). Previously assigned, but not used in common practice.	|
|995	|Post Office Protocol 3 over TLS/SSL (POP3S)	|
|1010	|ThinLinc web-based administration interface5[self-published source?	|
|1011–1020	|	|
|1023	|	|
||z/OS Network File System (NFS) (potentially ports 991–1023)|
||
||
||
||
|6[self-published source|
||
|Registered ports|
|This is a dynamic list and may never be able to satisfy particular standards for completeness. You can help by expanding it with reliably sourced entries.|
|The range of port numbers from 1024 to 49151 (210 to 214 + 215 − 1) are the registered ports. They are assigned by IANA for specific service upon application by a requesting entity. On most systems, registered ports can be used without superuser privileges.|
||
|Registered ports |
|Port	TCP	UDP	Description	IANA status|
|1024	Reserved	Reserved	Reserved	Official|
|1027	Reserved		Reserved	Official|
|Yes	Native IPv6 behind IPv4-to-IPv4 NAT Customer Premises Equipment (6a44)7	Official|
|1028			Deprecated	Official|
|1029			Microsoft DCOM services	Unofficial|
|1058	|nim, IBM AIX Network Installation Manager (NIM)	Official|
|1059	|nimreg, IBM AIX Network Installation Manager (NIM)	Official|
|1080	|SOCKS proxy	Official|
|1085	|WebObjects	Official|
|1098	|rmiactivation, Java remote method invocation (RMI) activation	Official|
|1099	|rmiregistry, Java remote method invocation (RMI) registry	Official|
|1109			Reserved – IANA	Official|
||Kerberos Post Office Protocol (KPOP)[citation needed	Unofficial|
|1113	Assigned[note 18	Yes9	Licklider Transmission Protocol (LTP) delay tolerant networking protocol	Official|
|1119	|Battle.net chat/game protocol, used by Blizzard's games0	Official|
|1167	Yes, and SCTP|Cisco IP SLA (Service Assurance Agent)	Official|
|1194	|OpenVPN	Official|
|1198	|The cajo project Free dynamic transparent distributed computing in Java	Official|
|1214	|Kazaa	Official|
|1218|No	William POWER	Official|
|1220	|QuickTime Streaming Server administration	Official|
|1234	|Infoseek search agent	Official|
|Yes	VLC media player default port for UDP/RTP stream	Unofficial|
|1241	|Nessus Security Scanner	Official|
|1270	|Microsoft System Center Operations Manager (SCOM) (formerly Microsoft Operations Manager (MOM)) agent	Official|
|1293	|Internet Protocol Security (IPSec)	Official|
|1311	|Windows RxMon.exe	Official|
||Dell OpenManage HTTPS1	Unofficial|
|1314	?	?	Festival Speech Synthesis System server2[self-published source?	Unofficial|
|1337	|neo4j-shell[citation needed	Unofficial|
|Yes	?	Sails.js default port3	Unofficial|
||WASTE Encrypted File Sharing Program[citation needed	Unofficial|
|1341	|Qubes (Manufacturing Execution System)	Official|
|1344	|Internet Content Adaptation Protocol	Official|
|1352	|IBM Lotus Notes/Domino (RPC) protocol	Official|
|1360	|Mimer SQL	Official|
|1414	|IBM WebSphere MQ (formerly known as MQSeries)	Official|
|1417	|Timbuktu Service 1 Port	Official|
|1418	|Timbuktu Service 2 Port	Official|
|1419	|Timbuktu Service 3 Port	Official|
|1420	|Timbuktu Service 4 Port	Official|
|1431	|Reverse Gossip Transport Protocol (RGTP), used to access a General-purpose Reverse-Ordered Gossip Gathering System (GROGGS) bulletin board, such as that implemented on the Cambridge University's Phoenix system	Official|
|1433	|Microsoft SQL Server database management system (MSSQL) server	Official|
|1434	|Microsoft SQL Server database management system (MSSQL) monitor	Official|
|1492	|Sid Meier's CivNet, a multiplayer remake of the original Sid Meier's Civilization game[citation needed	Unofficial|
|1494	|Citrix Independent Computing Architecture (ICA)4	Unofficial|
|1500	|IBM Tivoli Storage Manager server5	Unofficial|
|1501	|IBM Tivoli Storage Manager client scheduler5	Unofficial|
|1503	|Windows Live Messenger (Whiteboard and Application Sharing)6	Unofficial|
|1512	|Microsoft's Windows Internet Name Service (WINS)	Official|
|1513	|Garena game client[citation needed	Unofficial|
|1521	|nCUBE License Manager	Official|
||Oracle database default listener, in future releases[when?7 official port 2483 (TCP/IP) and 2484 (TCP/IP with SSL)	Unofficial|
|1524	|ingreslock, ingres	Official|
|1527	|Oracle Net Services, formerly known as SQL*Net8	Official|
||Apache Derby Network Server9	Unofficial|
|1533	|IBM Sametime Virtual Places Chat	Official|
|1534	No|Eclipse Target Communication Framework 0	Unofficial|
|1540	|1C:Enterprise server agent (ragent)12[self-published source	Unofficial|
|1541	|1C:Enterprise master cluster manager (rmngr)1	Unofficial|
|1542	|1C:Enterprise configuration repository server1	Unofficial|
|1545	|1C:Enterprise cluster administration server (RAS)1	Unofficial|
|1547	|Laplink	Official|
|1550	|1C:Enterprise debug server1	Unofficial|
||Gadu-Gadu (direct client-to-client)[citation needed	Unofficial|
|1560–1590	|1C:Enterprise cluster working processes1	Unofficial|
|1581	|MIL STD 2045-47001 VMF	Official|
||IBM Tivoli Storage Manager web client5	Unofficial|
|1582–1583	|IBM Tivoli Storage Manager server web interface5	Unofficial|
|1583	?	?	Pervasive PSQL3	Unofficial|
|1589	|Cisco VLAN Query Protocol (VQP)	Official|
|1604	|DarkComet remote administration tool (RAT)[citation needed	Unofficial|
|1626|?	iSketch4	Unofficial|
|1627|?	iSketch4	Unofficial|
|1628	|LonTalk normal	Official|
|1629	|LonTalk urgent	Official|
|1645	|Early deployment of RADIUS before RFC standardization was done using UDP port number 1645. Enabled for compatibility reasons by default on Cisco[citation needed and Juniper Networks RADIUS servers.5 Official port is 1812. TCP port 1645 MUST NOT be used.6	Unofficial|
|1646	|Old radacct port,[when? RADIUS accounting protocol. Enabled for compatibility reasons by default on Cisco[citation needed and Juniper Networks RADIUS servers.5 Official port is 1813. TCP port 1646 MUST NOT be used.6	Unofficial|
|1666	|Perforce7	Unofficial|
|1677	|Novell GroupWise clients in client/server access mode	Official|
|1688	|Microsoft Key Management Service (KMS) for Windows Activation8	Unofficial|
|1701	|Layer 2 Forwarding Protocol (L2F)	Official|
|Assigned|Layer 2 Tunneling Protocol (L2TP)	Official|
|1707	|Windward Studios games (vdmplay)	Official|
|Yes	L2TP/IPsec, for establish an initial connection9	Unofficial|
|1716	|America's Army, a massively multiplayer online game (MMO)0	Unofficial|
|1719	|H.323 registration and alternate communication	Official|
|1720	|H.323 call signaling	Official|
|1723	|Point-to-Point Tunneling Protocol (PPTP)	Official|
|1755	|Microsoft Media Services (MMS, ms-streaming)	Official|
|1761	|Novell ZENworks12	Unofficial|
|1783			Decomissioned [sic Port 04/14/00, ms	Official|
|1801	|Microsoft Message Queuing	Official|
|1812	|RADIUS authentication protocol, radius	Official|
|1813	|RADIUS accounting protocol, radius-acct	Official|
|1863	|Microsoft Notification Protocol (MSNP), used by the Microsoft Messenger service and a number of instant messaging Messenger clients	Official|
|1880	?	?	Node-RED3	Unofficial|
|1883	|MQTT (formerly MQ Telemetry Transport)	Official|
|1900	Assigned|Simple Service Discovery Protocol (SSDP), discovery of UPnP devices	Official|
|1935	|Macromedia Flash Communications Server MX, the precursor to Adobe Flash Media Server before Macromedia's acquisition by Adobe on December 3, 2005	Official|
||Real Time Messaging Protocol (RTMP)[citation needed, primarily used in Adobe Flash4	Unofficial|
|1967	|Cisco IOS IP Service Level Agreements (IP SLAs) Control Protocol[citation needed	Unofficial|
|1970	|Netop Remote Control	Official|
|1972	|InterSystems Caché	Official|
|1984	|Big Brother	Official|
|1985	Assigned|Cisco Hot Standby Router Protocol (HSRP)5[self-published source	Official|
|1998	|Cisco X.25 over TCP (XOT) service	Official|
|2000	|Cisco Skinny Client Control Protocol (SCCP)	Official|
|2010	?	?	Artemis: Spaceship Bridge Simulator6[self-published source?	Unofficial|
|2033	|Civilization IV multiplayer7	Unofficial|
|2049	Yes, and SCTP|Network File System (NFS)	Official|
|2056	|Civilization IV multiplayer7	Unofficial|
|2080	|Autodesk NLM (FLEXlm)	Official|
|2082	|cPanel default8	Unofficial|
|2083	|Secure RADIUS Service (radsec)	Official|
||cPanel default SSL8	Unofficial|
|2086	|GNUnet	Official|
||WebHost Manager default8	Unofficial|
|2087	|WebHost Manager default SSL8	Unofficial|
|2095	|cPanel default web mail8	Official|
|2096	|cPanel default SSL web mail8	Unofficial|
|2100	|Warzone 2100 multiplayer[citation needed	Unofficial|
|2101	|Networked Transport of RTCM via Internet Protocol (NTRIP)[citation needed	Unofficial|
|2102	|Zephyr Notification Service server	Official|
|2103	|Zephyr Notification Service serv-hm connection	Official|
|2104	|Zephyr Notification Service hostmanager	Official|
|2123	|GTP control messages (GTP-C)	Official|
|2142	|TDMoIP (TDM over IP)	Official|
|2152	|GTP user data messages (GTP-U)	Official|
|2159	|GDB remote debug port	Official|
|2181	|EForward-document transport system	Official|
||Apache ZooKeeper default client port[citation needed	Unofficial|
|2195	|Apple Push Notification Service9	Unofficial|
|2196	|Apple Push Notification Service, feedback service9	Unofficial|
|2210	|NOAAPORT Broadcast Network	Official|
|2211	|EMWIN	Official|
|2221	|ESET anti-virus updates0	Unofficial|
|2222	|EtherNet/IP implicit messaging for IO data	Official|
|?	?	DirectAdmin Access1	Unofficial|
|2222–2226	|ESET Remote administrator0	Official|
|2240	|General Dynamics Remote Encryptor Configuration Information Protocol (RECIPe)	Official|
|2261	|CoMotion master	Official|
|2262	|CoMotion backup	Official|
|2302	|ArmA multiplayer[citation needed	Unofficial|
|Yes	Halo: Combat Evolved multiplayer host2	Unofficial|
|2303	|ArmA multiplayer (default port for game +1)[citation needed	Unofficial|
|Yes	Halo: Combat Evolved multiplayer listener2	Unofficial|
|2305	|ArmA multiplayer (default port for game +3)[citation needed	Unofficial|
|2351	|AIM game LAN network port[citation needed	Unofficial|
|2368	|Ghost (blogging platform)3	Unofficial|
|2369	|Default for BMC Control-M/Server Configuration Agent	Unofficial|
|2370	|Default for BMC Control-M/Server, to allow the Control-M/Enterprise Manager to connect to the Control-M/Server	Unofficial|
|2372	|Default for K9 Web Protection/parental controls, content filtering agent[citation needed	Unofficial|
|2375|Reserved	Docker REST API (plain)	Official|
|2376|Reserved	Docker REST API (SSL)	Official|
|2377|Reserved	Docker Swarm cluster management communications4[self-published source	Official|
|2379|Reserved	CoreOS etcd client communication	Official|
||KGS Go Server5	Unofficial|
|2380|Reserved	CoreOS etcd server communication	Official|
|2389	Assigned	Assigned	OpenView Session Mgr	Official|
|2399	|FileMaker Data Access Layer (ODBC/JDBC)	Official|
|2401	|CVS version control system password-based server	Official|
|2404	|IEC 60870-5-104, used to send electric power telecontrol messages between two systems via directly connected data circuits	Official|
|2424	|OrientDB database listening for binary client connections6	Unofficial|
|2427	|Media Gateway Control Protocol (MGCP) media gateway	Official|
|2447	|ovwdb—OpenView Network Node Manager (NNM) daemon	Official|
|2459	|xrpl	Official|
|2480	|OrientDB database listening for HTTP client connections6	Unofficial|
|2483	|Oracle database listening for insecure client connections to the listener, replaces port 1521[when?	Official|
|2484	|Oracle database listening for SSL client connections to the listener	Official|
|2500	|NetFS communication7	Unofficial|
|2501	|NetFS probe	Unofficial|
|2535	|Multicast Address Dynamic Client Allocation Protocol (MADCAP).8 All standard messages are UDP datagrams.9	Official|
|2541	|LonTalk/IP	Official|
|2546–2548	|EVault data protection services	Official|
|2593	|Ultima Online servers[citation needed	Unofficial|
|2598	|Citrix Independent Computing Architecture (ICA) with Session Reliability; port 1494 without session reliability4	Unofficial|
|2599	|Ultima Online servers[citation needed	Unofficial|
|2628	|DICT 0	Official|
|2638	|SQL Anywhere database server12	Official|
|2710	|XBT Tracker.3 UDP tracker extension is considered experimental.4	Unofficial|
|2727	|Media Gateway Control Protocol (MGCP) media gateway controller (call agent)	Official|
|2775	|Short Message Peer-to-Peer (SMPP)[citation needed	Official|
|2809	|corbaloc:iiop URL, per the CORBA 3.0.3 specification	Official|
|2811	|gsi ftp, per the GridFTP specification	Official|
|2827	|I2P BOB Bridge5	Unofficial|
|2944	|Megaco text H.248	Official|
|2945	|Megaco binary (ASN.1) H.248	Official|
|2947	|gpsd, GPS daemon	Official|
|2948	|WAP push Multimedia Messaging Service (MMS)	Official|
|2949	|WAP push secure (MMS)	Official|
|2967	|Symantec System Center agent (SSC-AGENT)	Official|
|3000	|Cloud9 IDE server[citation needed	Unofficial|
||Ruby on Rails development default6	Unofficial|
||Meteor development default7[failed verification	Unofficial|
||Resilio Sync,8 spun from BitTorrent Sync.	Unofficial|
|Yes	Distributed Interactive Simulation (DIS)[citation needed	Unofficial|
|3004	|iSync	Unofficial|
|3020	|Common Internet File System (CIFS). See also port 445 for Server Message Block (SMB), a dialect of CIFS.	Official|
|3050	|gds-db (Interbase/Firebird databases)	Official|
|3052	|APC PowerChute Network	Official|
|3074	|Xbox LIVE and Games for Windows – Live	Official|
|3101	|BlackBerry Enterprise Server communication protocol9	Unofficial|
|3128|?	Squid caching web proxy0	Unofficial|
|3225	|Fibre Channel over IP (FCIP)	Official|
|3233	|WhiskerControl research control protocol	Official|
|3260	|iSCSI	Official|
|3268	|msft-gc, Microsoft Global Catalog (LDAP service which contains data from Active Directory forests)	Official|
|3269	|msft-gc-ssl, Microsoft Global Catalog over SSL (similar to port 3268, LDAP over SSL)	Official|
|3283	|Net Assistant, a predecessor to Apple Remote Desktop	Official|
||Apple Remote Desktop 2.0 or later	Unofficial|
|3290	|Virtual Air Traffic Simulation (VATSIM) network voice communication[citation needed	Unofficial|
|3305	|Odette File Transfer Protocol (OFTP)	Official|
|3306	|MySQL database system	Official|
|3323	|DECE GEODI Server	Unofficial|
|3332	|Thundercloud DataPath Overlay Control	Unofficial|
|3333	|Eggdrop, an IRC bot default port1	Unofficial|
||Network Caller ID server	Unofficial|
||CruiseControl.rb2	Unofficial|
|3351	?	?	Pervasive PSQL3	Unofficial|
|3386	|GTP' 3GPP GSM/UMTS CDR logging protocol	Official|
|3389	|Microsoft Terminal Server (RDP) officially registered as Windows Based Terminal (WBT)3	Official|
|3396	|Novell NDPS Printer Agent	Official|
|3412	|xmlBlaster	Official|
|3423	|Xware xTrm Communication Protocol	Official|
|3424	|Xware xTrm Communication Protocol over SSL	Official|
|3455	|Resource Reservation Protocol (RSVP)	Official|
|3478	|STUN, a protocol for NAT traversal4	Official|
||TURN, a protocol for NAT traversal5 (extension to STUN)	Official|
||STUN Behavior Discovery.6 See also port 5349.	Official|
|3479	|PlayStation Network7	Unofficial|
|3480	|PlayStation Network7	Unofficial|
|3483	|Slim Devices discovery protocol	Official|
||Slim Devices SlimProto protocol	Official|
|3493	|Network UPS Tools (NUT)	Official|
|3516	|Smartcard Port	Official|
|3527	|Microsoft Message Queuing	Official|
|3535	|SMTP alternate8	Unofficial|
|3544	|Teredo tunneling	Official|
|3632	|Distcc, distributed compiler	Official|
|3645	|Cyc	Official|
|3659	|Apple SASL, used by Mac OS X Server Password Server	Official|
|Yes	Battlefield 4	Unofficial|
|3667	|Information Exchange	Official|
|3689	|Digital Audio Access Protocol (DAAP), used by Apple's iTunes and AirPlay	Official|
|3690	|Subversion (SVN) version control system	Official|
|3702	|Web Services Dynamic Discovery (WS-Discovery), used by various components of Windows Vista and later	Official|
|3724	|Some Blizzard games0	Official|
||Club Penguin Disney online game for kids	Unofficial|
|3725	|Netia NA-ER Port	Official|
|3749	|CimTrak registered port	Official|
|3768	|RBLcheckd server daemon	Official|
|3784	|Bidirectional Forwarding Detection (BFD)for IPv4 and IPv6 (Single Hop) (RFC 5881)	Official|
|3785	|VoIP program used by Ventrilo	Unofficial|
|3799	|RADIUS change of authorization	Official|
|3804	|Harman Professional HiQnet protocol	Official|
|3825	|RedSeal Networks client/server connection[citation needed	Unofficial|
|3826	|WarMUX game server	Official|
||RedSeal Networks client/server connection[citation needed	Unofficial|
|3835	|RedSeal Networks client/server connection[citation needed	Unofficial|
|3830	|System Management Agent, developed and used by Cerner to monitor and manage solutions	Official|
|3856	|ERP Server Application used by F10 Software	Unofficial|
|3880	|IGRS	Official|
|3868	Yes, and SCTP		Diameter base protocol (RFC 3588)	Official|
|3872	|Oracle Enterprise Manager Remote Agent	Official|
|3900	|udt_os, IBM UniData UDT OS9	Official|
|3960	|Warframe online interaction[citation needed	Unofficial|
|3962	|Warframe online interaction[citation needed	Unofficial|
|3978	|OpenTTD game (masterserver and content service)	Unofficial|
|3979	|OpenTTD game	Unofficial|
|3999	|Norman distributed scanning service	Official|
|4000	|Diablo II game	Unofficial|
|4001	|Microsoft Ants game	Unofficial|
||CoreOS etcd client communication	Unofficial|
|4018	|Protocol information and warnings[clarification needed	Official|
|4035	|IBM Rational Developer for System z Remote System Explorer Daemon	Unofficial|
|4045	|Solaris lockd NFS lock daemon/manager	Unofficial|
|4050	|Mud Master Chat protocol (MMCP) - Peer-to-peer communications between MUD clients.0	Unofficial|
|4069	|Minger Email Address Verification Protocol1	Official|
|4070	|Amazon Echo Dot (Amazon Alexa) streaming connection with Spotify2	Unofficial|
|4089	|OpenCORE Remote Control Service	Official|
|4090	|Kerio	Official|
|4093	|PxPlus Client server interface ProvideX	Official|
|4096	|Ascom Timeplex Bridge Relay Element (BRE)	Official|
|4105	|Shofar (ShofarNexus)	Official|
|4111	|Xgrid	Official|
|4116	|Smartcard-TLS	Official|
|4125	|Microsoft Remote Web Workplace administration	Unofficial|
|4172	|Teradici PCoIP	Official|
|4190	|ManageSieve3	Official|
|4198	|Couch Potato Android app4	Unofficial|
|4201	|TinyMUD and various derivatives	Unofficial|
|4222	|NATS server default port5	Unofficial|
|4226	|Aleph One, a computer game	Unofficial|
|4242	|Orthanc – DICOM server6	Unofficial|
||Quassel distributed IRC client	Unofficial|
|4243	|Docker implementations, redistributions, and setups default7[needs update?	Unofficial|
||CrashPlan	Unofficial|
|4244	|Viber8	Unofficial|
|4303	|Simple Railroad Command Protocol (SRCP)	Official|
|4307	|TrueConf Client - TrueConf Server media data exchange9	Official|
|4321	|Referral Whois (RWhois) Protocol0	Official|
|4444	|Oracle WebCenter Content: Content Server—Intradoc Socket port. (formerly known as Oracle Universal Content Management).	Unofficial|
|?	?	Metasploit's default listener port[citation needed	Unofficial|
||Xvfb X server virtual frame buffer service	Unofficial|
|4444–4445	|I2P HTTP/S proxy	Unofficial|
|4486	|Integrated Client Message Service (ICMS)	Official|
|4488	|Apple Wide Area Connectivity Service, used by Back to My Mac	Official|
|4500	Assigned|IPSec NAT Traversal (RFC 3947, RFC 4306)	Official|
|4502–4534	|Microsoft Silverlight connectable ports under non-elevated trust	Official|
|4505–4506	|Salt master	Unofficial|
|4534	|Armagetron Advanced server default	Unofficial|
|4560	|default Log4j socketappender port	Unofficial|
|4567	|Sinatra default server port in development mode (HTTP)	Unofficial|
|4569	|Inter-Asterisk eXchange (IAX2)	Official|
|4604	|Identity Registration Protocol	Official|
|4605	|Direct End to End Secure Chat Protocol	Official|
|4610–4640	|QualiSystems TestShell Suite Services	Unofficial|
|4662	|OrbitNet Message Service	Official|
||Default for older versions of eMule1	Unofficial|
|4664	|Google Desktop Search	Unofficial|
|4672	|Default for older versions of eMule1	Unofficial|
|4711	|eMule optional web interface1	Unofficial|
|4713	|PulseAudio sound server	Unofficial|
|4728	|Computer Associates Desktop and Server Management (DMP)/Port Multiplexer2	Official|
|4730	|Gearman's job server	Official|
|4739	|IP Flow Information Export	Official|
|4747	|Apprentice	Unofficial|
|4753	|SIMON (service and discovery)	Official|
|4789	|Virtual eXtensible Local Area Network (VXLAN)	Official|
|4791	|IP Routable RocE (RoCEv2)	Official|
|4840	|OPC UA Connection Protocol (TCP) and OPC UA Multicast Datagram Protocol (UDP) for OPC Unified Architecture from OPC Foundation	Official|
|4843	|OPC UA TCP Protocol over TLS/SSL for OPC Unified Architecture from OPC Foundation	Official|
|4847	|Web Fresh Communication, Quadrion Software & Odorless Entertainment	Official|
|4848	|Java, Glassfish Application Server administration default	Unofficial|
|4894	|LysKOM Protocol A	Official|
|4944	No|DrayTek DSL Status Monitoring3[self-published source	Unofficial|
|4949	|Munin Resource Monitoring Tool	Official|
|4950	|Cylon Controls UC32 Communications Port	Official|
|5000	|UPnP—Windows network device interoperability	Unofficial|
||VTun, VPN Software	Unofficial|
|Yes	FlightGear multiplayer4	Unofficial|
||Synology Inc. Management Console, File Station, Audio Station	Unofficial|
||Flask Development Webserver	Unofficial|
||Heroku console access	Unofficial|
|?	?	Docker Registry5[self-published source	Unofficial|
||AT&T U-verse public, educational, and government access (PEG) streaming over HTTP6[self-published source?	Unofficial|
|?	?	High-Speed SECS Message Services[citation needed	Unofficial|
||3CX Phone System Legacy Management Console	Unofficial|
|5000–5500	No|League of Legends, a multiplayer online battle arena video game7	Unofficial|
|5001	|Slingbox and Slingplayer	Unofficial|
||Iperf (Tool for measuring TCP and UDP bandwidth performance)	Unofficial|
||Synology Inc. Secured Management Console, File Station, Audio Station	Unofficial|
||3CX Phone System Secured Management Console, Secure API	Unofficial|
|5002	|ASSA ARX access control system8	Unofficial|
|5003	|FileMaker – name binding and transport	Official|
|5004	Yes, and DCCP|Real-time Transport Protocol media data (RTP) (RFC 3551, RFC 4571)	Official|
|5005	Yes, and DCCP|Real-time Transport Protocol control protocol (RTCP) (RFC 3551, RFC 4571)	Official|
|5010	|Registered to: TelePath (the IBM FlowMark workflow-management system messaging platform)9|
|The TCP port is now used for: IBM WebSphere MQ Workflow	Official|
|5011	|TelePath (the IBM FlowMark workflow-management system messaging platform)9	Official|
|5025	|scpi-raw Standard Commands for Programmable Instruments	Official|
|5029	|Sonic Robo Blast 2 and Sonic Robo Blast 2 Kart servers	Unofficial|
|5031	|AVM CAPI-over-TCP (ISDN over Ethernet tunneling)[citation needed	Unofficial|
|5037	|Android ADB server	Unofficial|
|5044	|Standard port in Filebeats/Logstash implementation of Lumberjack protocol.	Official|
|5048	|Texai Message Service	Official|
|5050	|Yahoo! Messenger	Unofficial|
|5051	|ita-agent Symantec Intruder Alert0	Official|
|5060	|Session Initiation Protocol (SIP)	Official|
|5061	|Session Initiation Protocol (SIP) over TLS	Official|
|5062	|Localisation access	Official|
|5064	|EPICS Channel Access server1	Official|
|5065	Assigned|EPICS Channel Access repeater beacon1	Official|
|5070|No	Binary Floor Control Protocol (BFCP)2	Unofficial|
|5084	|EPCglobal Low Level Reader Protocol (LLRP)	Official|
|5085	|EPCglobal Low Level Reader Protocol (LLRP) over TLS	Official|
|5090	|3CX Phone System 3CX Tunnel Protocol, 3CX App API, 3CX Session Border Controller	Unofficial|
|5093	|SafeNet, Inc Sentinel LM, Sentinel RMS, License Manager, client-to-server	Official|
|5099	|SafeNet, Inc Sentinel LM, Sentinel RMS, License Manager, server-to-server	Official|
|5104	|IBM Tivoli Framework NetCOOL/Impact3 HTTP Service	Unofficial|
|5121	|Neverwinter Nights	Unofficial|
|5124	|TorgaNET (Micronational Darknet)	Unofficial|
|5125	|TorgaNET (Micronational Intelligence Darknet)	Unofficial|
|5150	|ATMP Ascend Tunnel Management Protocol4	Official|
|5151	|ESRI SDE Instance	Official|
|Yes	ESRI SDE Remote Start	Official|
|5154	|BZFlag	Official|
|5172	|PC over IP Endpoint Management5	Official|
|5190	|AOL Instant Messenger protocol. The chat app is defunct as of 15 December 2017.6	Official|
|5198	|EchoLink VoIP Amateur Radio Software (Voice)	Unofficial|
|5199	|EchoLink VoIP Amateur Radio Software (Voice)	Unofficial|
|5200	|EchoLink VoIP Amateur Radio Software (Information)	Unofficial|
|5201	|Iperf3 (Tool for measuring TCP and UDP bandwidth performance)	Unofficial|
|5222|Reserved	Extensible Messaging and Presence Protocol (XMPP) client connection78	Official|
|5223	|Apple Push Notification Service9	Unofficial|
||Extensible Messaging and Presence Protocol (XMPP) client connection over SSL	Unofficial|
|5228	|HP Virtual Room Service	Official|
||Google Play, Android Cloud to Device Messaging Service, Google Cloud Messaging	Unofficial|
|5242	|Viber8	Unofficial|
|5243	|Viber8	Unofficial|
|5246	|Control And Provisioning of Wireless Access Points (CAPWAP) CAPWAP control9	Official|
|5247	|Control And Provisioning of Wireless Access Points (CAPWAP) CAPWAP data9	Official|
|5269	|Extensible Messaging and Presence Protocol (XMPP) server-to-server connection78	Official|
|5280	|Extensible Messaging and Presence Protocol (XMPP)0	Official|
|5281	|Extensible Messaging and Presence Protocol (XMPP)1	Unofficial|
|5298	|Extensible Messaging and Presence Protocol (XMPP)2	Official|
|5310	Assigned|Outlaws, a 1997 first-person shooter video game[citation needed	Official|
|5318|Reserved	Certificate Management over CMS3	Official|
|5349	Yes/No	Yes/No	STUN over TLS/DTLS, a protocol for NAT traversal4	Official|
|Yes/No	Yes/No	TURN over TLS/DTLS, a protocol for NAT traversal5	Official|
|Yes	Reserved	STUN Behavior Discovery over TLS.6 See also port 3478.	Official|
|5351	Reserved|NAT Port Mapping Protocol and Port Control Protocol—client-requested configuration for connections through network address translators and firewalls	Official|
|5353	Assigned|Multicast DNS (mDNS)	Official|
|5355	|Link-Local Multicast Name Resolution (LLMNR), allows hosts to perform name resolution for hosts on the same local link (only provided by Windows Vista and Server 2008)	Official|
|5357	|Web Services for Devices (WSDAPI) (only provided by Windows Vista, Windows 7 and Server 2008)	Unofficial|
|5358	|WSDAPI Applications to Use a Secure Channel (only provided by Windows Vista, Windows 7 and Server 2008)	Unofficial|
|5394	|Kega Fusion, a Sega multi-console emulator45	Unofficial|
|5402	|Multicast File Transfer Protocol (MFTP)6[importance?	Official|
|5405	|NetSupport Manager	Official|
|5412	|IBM Rational Synergy (Telelogic Synergy) (Continuus CM) Message Router	Official|
|5413	|Wonderware SuiteLink service	Official|
|5417	|SNS Agent	Official|
|5421	|NetSupport Manager	Official|
|5432	|PostgreSQL database system	Official|
|5433	|Bouwsoft file/webserver7	Unofficial|
|5445	|Cisco Unified Video Advantage[citation needed	Unofficial|
|5480	|VMware VAMI (Virtual Appliance Management Infrastructure)—used for initial setup of various administration settings on Virtual Appliances designed using the VAMI architecture.	Unofficial|
|5481	|Schneider Electric's ClearSCADA (SCADA implementation for Windows) — used for client-to-server communication.8	Unofficial|
|5495	|IBM Cognos TM1 Admin server	Unofficial|
|5498	|Hotline tracker server connection	Unofficial|
|5499	|Hotline tracker server discovery	Unofficial|
|5500	|Hotline control connection	Unofficial|
||VNC Remote Frame Buffer RFB protocol—for incoming listening viewer	Unofficial|
|5501	|Hotline file transfer connection	Unofficial|
|5517	|Setiqueue Proxy server client for SETI@Home project	Unofficial|
|5550	|Hewlett-Packard Data Protector[citation needed	Unofficial|
|5554	|Fastboot default wireless port	Unofficial|
|5555	|Oracle WebCenter Content: Inbound Refinery—Intradoc Socket port. (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
||Freeciv versions up to 2.0, Hewlett-Packard Data Protector, McAfee EndPoint Encryption Database Server, SAP, Default for Microsoft Dynamics CRM 4.0, Softether VPN default port	Unofficial|
|5556	|Freeciv, Oracle WebLogic Server Node Manager9	Official|
|5568	|Session Data Transport (SDT), a part of Architecture for Control Networks (ACN)0[full citation needed	Official|
|5601	|Kibana[citation needed	Unofficial|
|5631	|pcANYWHEREdata, Symantec pcAnywhere (version 7.52 and later1)2 data	Official|
|5632	|pcANYWHEREstat, Symantec pcAnywhere (version 7.52 and later) status	Official|
|5656	|IBM Lotus Sametime p2p file transfer	Unofficial|
|5666	|NRPE (Nagios)	Unofficial|
|5667	|NSCA (Nagios)	Unofficial|
|5670	|FILEMQ ZeroMQ File Message Queuing Protocol	Official|
|Yes	ZRE-DISC ZeroMQ Realtime Exchange Protocol (Discovery)	Official|
|5671	|Advanced Message Queuing Protocol (AMQP)3 over TLS	Official|
|5672	Yes, and SCTP	Assigned	Advanced Message Queuing Protocol (AMQP)3	Official|
|5683	|Constrained Application Protocol (CoAP)	Official|
|5684	Yes/No|Constrained Application Protocol Secure (CoAPs)	Official|
|5693	|Nagios Cross Platform Agent (NCPA)4	Unofficial|
|5701	|Hazelcast default communication port5	Unofficial|
|5722	|Microsoft RPC, DFSR (SYSVOL) Replication Service[citation needed	Official|
|5718	|Microsoft DPM Data Channel (with the agent coordinator)	Unofficial|
|5719	|Microsoft DPM Data Channel (with the protection agent)	Unofficial|
|5723	|System Center Operations Manager6	Unofficial|
|5724	|Operations Manager Console	Unofficial|
|5741	|IDA Discover Port 1	Official|
|5742	|IDA Discover Port 2	Official|
|5800	|VNC Remote Frame Buffer RFB protocol over HTTP	Unofficial|
||ProjectWise Server7	Unofficial|
|5900	|Remote Frame Buffer protocol (RFB)	Official|
||Virtual Network Computing (VNC) Remote Frame Buffer RFB protocol8	Unofficial|
|5931	|AMMYY admin Remote Control	Official|
|5938	|TeamViewer remote desktop protocol9	Unofficial|
|5984	|CouchDB database server	Official|
|5985	|Windows PowerShell Default psSession Port0 Windows Remote Management Service (WinRM-HTTP)1	Official|
|5986	|Windows PowerShell Default psSession Port0 Windows Remote Management Service (WinRM-HTTPS)1	Official|
|5988–5989	|CIM-XML (DMTF Protocol)2	Official|
|6000–6063	|X11—used between an X client and server over the network	Official|
|6005	|Default for BMC Software Control-M/Server—Socket used for communication between Control-M processes—though often changed during installation	Unofficial|
||Default for Camfrog chat & cam client	Unofficial|
|6009	|JD Edwards EnterpriseOne ERP system JDENet messaging client listener	Unofficial|
|6050	|Arcserve backup	Unofficial|
|6051	|Arcserve backup	Unofficial|
|6086	|Peer Distributed Transfer Protocol (PDTP), FTP like file server in a P2P network	Official|
|6100	|Vizrt System	Unofficial|
||Ventrilo authentication for version 3	Unofficial|
|6101	|Backup Exec Agent Browser[citation needed	Unofficial|
|6110	|softcm, HP Softbench CM	Official|
|6111	|spc, HP Softbench Sub-Process Control	Official|
|6112	|dtspcd, execute commands and launch applications remotely	Official|
||Blizzard's Battle.net gaming service and some games,0 ArenaNet gaming service, Relic gaming service	Unofficial|
||Club Penguin Disney online game for kids	Unofficial|
|6113	|Club Penguin Disney online game for kids, Used by some Blizzard games0	Unofficial|
|6136	|ObjectDB database server3[self-published source	Unofficial|
|6159	|ARINC 840 EFB Application Control Interface	Official|
|6200	|Oracle WebCenter Content Portable: Content Server (With Native UI) and Inbound Refinery	Unofficial|
|6201	|Oracle WebCenter Content Portable: Admin	Unofficial|
|6225	|Oracle WebCenter Content Portable: Content Server Web UI	Unofficial|
|6227	|Oracle WebCenter Content Portable: JavaDB	Unofficial|
|6240	|Oracle WebCenter Content Portable: Capture	Unofficial|
|6244	|Oracle WebCenter Content Portable: Content Server—Intradoc Socket port	Unofficial|
|6255	|Oracle WebCenter Content Portable: Inbound Refinery—Intradoc Socket port	Unofficial|
|6257	|WinMX (see also 6699)	Unofficial|
|6260	|planet M.U.L.E.	Unofficial|
|6262	|Sybase Advantage Database Server	Unofficial|
|6343	|SFlow, sFlow traffic monitoring	Official|
|6346	|gnutella-svc, gnutella (FrostWire, Limewire, Shareaza, etc.)	Official|
|6347	|gnutella-rtr, Gnutella alternate	Official|
|6350	|App Discovery and Access Protocol	Official|
|6379	|Redis key-value data store	Official|
|6389	|EMC CLARiiON	Unofficial|
|6432	|PgBouncer—A connection pooler for PostgreSQL	Official|
|6436	|Leap Motion Websocket Server TLS	Unofficial|
|6437	|Leap Motion Websocket Server	Unofficial|
|6444	|Sun Grid Engine Qmaster Service	Official|
|6445	|Sun Grid Engine Execution Service	Official|
|6463–6472	|Discord RPC4	Unofficial|
|6464	|Port assignment for medical device communication in accordance to IEEE 11073-20701	Official|
|6502	|Netop Remote Control	Unofficial|
|6513	|NETCONF over TLS	Official|
|6514	|Syslog over TLS5	Official|
|6515	|Elipse RPC Protocol (REC)	Official|
|6516			Windows Admin Center	Unofficial|
|6543	|Pylons project#Pyramid Default Pylons Pyramid web service port	Unofficial|
|6556	|Check MK Agent	Unofficial|
|6566	|SANE (Scanner Access Now Easy)—SANE network scanner daemon6	Official|
|6560–6561	|Speech-Dispatcher daemon[citation needed	Unofficial|
|6571			Windows Live FolderShare client	Unofficial|
|6600	|Microsoft Hyper-V Live	Official|
||Music Player Daemon (MPD)	Unofficial|
|6601	|Microsoft Forefront Threat Management Gateway	Official|
|6602	|Microsoft Windows WSS Communication	Official|
|6619	|odette-ftps, Odette File Transfer Protocol (OFTP) over TLS/SSL	Official|
|6622	|Multicast FTP	Official|
|6653	|OpenFlow[citation needed	Official|
|6660–6664	|Internet Relay Chat (IRC)	Unofficial|
|6665–6669	|Internet Relay Chat (IRC)	Official|
|6679	|Osorno Automation Protocol (OSAUT)	Official|
||IRC SSL (Secure Internet Relay Chat)—often used	Unofficial|
|6690	|Synology Cloud station	Unofficial|
|6697	|IRC SSL (Secure Internet Relay Chat)—often used	Official|
|6699	|WinMX (see also 6257)	Unofficial|
|6715	|AberMUD and derivatives default port	Unofficial|
|6771	|BitTorrent Local Peer Discovery	Unofficial|
|6783–6785	|Splashtop Remote server broadcast	Unofficial|
|6881–6887	|BitTorrent part of full range of ports used most often	Unofficial|
|6888	|MUSE	Official|
||BitTorrent part of full range of ports used most often	Unofficial|
|6889–6890	|BitTorrent part of full range of ports used most often	Unofficial|
|6891–6900	|BitTorrent part of full range of ports used most often	Unofficial|
|6891–6900	|Windows Live Messenger (File transfer)	Unofficial|
|6901	|Windows Live Messenger (Voice)	Unofficial|
||BitTorrent part of full range of ports used most often	Unofficial|
|6902–6968	|BitTorrent part of full range of ports used most often	Unofficial|
|6969	|acmsoda	Official|
||BitTorrent tracker	Unofficial|
|6970–6999	|BitTorrent part of full range of ports used most often	Unofficial|
|Yes	QuickTime Streaming Server	Unofficial|
|7000	|Default for Vuze's built-in HTTPS Bittorrent Tracker	Unofficial|
||Avira Server Management Console	Unofficial|
|7001	|Avira Server Management Console	Unofficial|
||Default for BEA WebLogic Server's HTTP server, though often changed during installation	Unofficial|
|7002	|Default for BEA WebLogic Server's HTTPS server, though often changed during installation	Unofficial|
|7005	|Default for BMC Software Control-M/Server and Control-M/Agent for Agent-to-Server, though often changed during installation	Unofficial|
|7006	|Default for BMC Software Control-M/Server and Control-M/Agent for Server-to-Agent, though often changed during installation	Unofficial|
|7010	|Default for Cisco AON AMC (AON Management Console)7	Unofficial|
|7022	|Database mirroring endpoints8	Unofficial|
|7023	|Bryan Wilcutt T2-NMCS Protocol for SatCom Modems	Official|
|7025	|Zimbra LMTP [mailbox—local mail delivery	Unofficial|
|7047	|Zimbra conversion server	Unofficial|
|7070|Yes/No	Real Time Streaming Protocol (RTSP), used by QuickTime Streaming Server. TCP is used by default, UDP is used as an alternate.	Unofficial|
|7133	|Enemy Territory: Quake Wars	Unofficial|
|7144	|Peercast[citation needed	Unofficial|
|7145	|Peercast[citation needed	Unofficial|
|7171	|Tibia	Unofficial|
|7262	|CNAP (Calypso Network Access Protocol)	Official|
|7272	|WatchMe - WatchMe Monitoring	Official|
|7306	|Zimbra mysql [mailbox[citation needed	Unofficial|
|7307	|Zimbra mysql [logger[citation needed	Unofficial|
|7312	|Sibelius License Server	Unofficial|
|7396	|Web control interface for Folding@home v7.3.6 and later9	Unofficial|
|7400	|RTPS (Real Time Publish Subscribe) DDS Discovery	Official|
|7401	|RTPS (Real Time Publish Subscribe) DDS User-Traffic	Official|
|7402	|RTPS (Real Time Publish Subscribe) DDS Meta-Traffic	Official|
|7471	|Stateless Transport Tunneling (STT)	Unofficial|
|7473	|Rise: The Vieneo Province	Official|
|7474	|Neo4J Server webadmin0	Official|
|7478	|Default port used by Open iT Server.1	Official|
|7542	|Saratoga file transfer protocol23	Official|
|7547	|CPE WAN Management Protocol (CWMP) Technical Report 069	Official|
|7575	|Populous: The Beginning server	Unofficial|
|7624	|Instrument Neutral Distributed Interface	Official|
|7631	|ERLPhase	Official|
|7634	|hddtemp—Utility to monitor hard drive temperature	Unofficial|
|7652–7654	|I2P anonymizing overlay network	Unofficial|
|7655	|I2P SAM Bridge Socket API	Unofficial|
|7656–7660	|I2P anonymizing overlay network	Unofficial|
|7670	|BrettspielWelt BSW Boardgame Portal	Unofficial|
|7680	|Delivery Optimization for Windows 104	Unofficial|
|7687	|Bolt database connection	Official|
|7707–7708	|Killing Floor	Unofficial|
|7717	|Killing Floor	Unofficial|
|7777	|iChat server file transfer proxy	Unofficial|
||Oracle Cluster File System 2[citation needed	Unofficial|
||Windows backdoor program tini.exe default[citation needed	Unofficial|
||Just Cause 2: Multiplayer Mod Server[citation needed	Unofficial|
||Terraria default server	Unofficial|
|Yes	San Andreas Multiplayer (SA-MP) default port server	Unofficial|
|Yes	SCP: Secret Laboratory Multiplayer Server	Unofficial|
|7777–7788	|Unreal Tournament series default server[citation needed	Unofficial|
|7831	|Default used by Smartlaunch Internet Cafe Administration5 software	Unofficial|
|7880	|PowerSchool Gradebook Server[citation needed	Unofficial|
|7890	|Default that will be used by the iControl Internet Cafe Suite Administration software	Unofficial|
|7915	|Default for YSFlight server6	Unofficial|
|7935	|Fixed port used for Adobe Flash Debug Player to communicate with a debugger (Flash IDE, Flex Builder or fdb).7	Unofficial|
|7946	|Docker Swarm communication among nodes4	Unofficial|
|7990	|Atlassian Bitbucket (default port)[citation needed	Unofficial|
|8000	|Commonly used for Internet radio streams such as SHOUTcast[citation needed, Icecast[citation needed and iTunes Radio	Unofficial|
|?	?	DynamoDB Local8[self-published source?	Unofficial|
|?	?	Django Development Webserver9[self-published source?	Unofficial|
|8005	|Tomcat remote shutdown	Unofficial|
|8006	|Quest AppAssure 5 API0	 Unofficial|
|?	?	Proxmox Virtual Environment admin web interface1	Unofficial|
|8007	|Quest AppAssure 5 Engine0	Unofficial|
|8008	|Alternative port for HTTP. See also ports 80 and 8080.	Official|
||IBM HTTP Server administration default[importance?	Unofficial|
||iCal, a calendar application by Apple	Unofficial|
|Yes	?	Matrix homeserver federation over HTTP2[self-published source?	Unofficial|
|8009	|Apache JServ Protocol (ajp13)[citation needed	Unofficial|
|8010|?	Buildbot Web status page[citation needed	Unofficial|
|8042	?	?	Orthanc – REST API over HTTP6[self-published source?	Unofficial|
|8069	|OpenERP 5.0 XML-RPC protocol3[self-published source?	Unofficial|
|8070	|OpenERP 5.0 NET-RPC protocol3	Unofficial|
|8074	|Gadu-Gadu	Official|
|8075	|Killing Floor web administration interface[citation needed	Unofficial|
|8080	|Alternative port for HTTP. See also ports 80 and 8008.	Official|
||Apache Tomcat4	Unofficial|
||Atlassian JIRA applications5[self-published source?	Unofficial|
|8088	|Asterisk management access via HTTP[citation needed	Unofficial|
|8089|No	Splunk daemon management6[self-published source	Unofficial|
||Fritz!Box automatic TR-069 configuration7	Unofficial|
|8090	?	?	Atlassian Confluence8[self-published source?	Unofficial|
||Coral Content Distribution Network (legacy; 80 and 8080 now supported)9	Unofficial|
|?	?	Matrix identity server[citation needed	Unofficial|
|8091	?	?	CouchBase web administration0	Unofficial|
|8092	?	?	CouchBase API0	Unofficial|
|8111	|JOSM Remote Control	Unofficial|
|8112	|PAC Pacifica Coin	Unofficial|
|8116	|Check Point Cluster Control Protocol	Unofficial|
|8118	|Privoxy—advertisement-filtering Web proxy	Official|
|8123	|Polipo Web proxy	Official|
|8139	|Puppet (software) Client agent	Unofficial|
|8140	|Puppet (software) Master server	Official|
|8172	|Microsoft Remote Administration for IIS Manager1	Unofficial|
|8184	|NCSA Brown Dog Data Access Proxy	Unofficial|
|8194–8195	?	?	Bloomberg Terminal2	Official|
|8200	|GoToMyPC	Unofficial|
||MiniDLNA media server Web Interface	Unofficial|
|8222	?	?	VMware VI Web Access via HTTP3	Unofficial|
|8243	|HTTPS listener for Apache Synapse4	Official|
|8245	|Dynamic DNS for at least No-IP and DyDNS5	Unofficial|
|8280	|HTTP listener for Apache Synapse4	Official|
|8281	|HTTP Listener for Gatecraft Plugin	Unofficial|
|8291	|Winbox—Default on a MikroTik RouterOS for a Windows application used to administer MikroTik RouterOS6	Unofficial|
|8303	|Teeworlds Server	Unofficial|
|8332	|Bitcoin JSON-RPC server7	Unofficial|
|8333	|Bitcoin8	Unofficial|
|?	?	VMware VI Web Access via HTTPS3	Unofficial|
|8333	|Zip Code Technology9	Unofficial|
|8337	|VisualSVN Distributed File System Service (VDFS)0	Unofficial|
|8384	|Syncthing web GUI	Unofficial|
|8388	|Shadowsocks proxy server[citation needed	Unofficial|
|8443	|SW Soft Plesk Control Panel	Unofficial|
||Apache Tomcat SSL	Unofficial|
||Promise WebPAM SSL	Unofficial|
||iCal over SSL	Unofficial|
||MineOs WebUi	Unofficial|
|8444	|Bitmessage	Unofficial|
|8448|?	Matrix homeserver federation over HTTPS2	Unofficial|
|8484	|MapleStory Login Server	Unofficial|
|8500	|Adobe ColdFusion built-in web server1[self-published source?	Unofficial|
|8530	?	?	Windows Server Update Services over HTTP2[further explanation needed3	Unofficial|
|8531	?	?	Windows Server Update Services over HTTPS3[further explanation needed2	Unofficial|
|8580	?	?	Freegate, an Internet anonymizer and proxy tool4	Unofficial|
|8629	|Tibero database[citation needed	Unofficial|
|8642	|Lotus Notes Traveler auto synchronization for Windows Mobile and Nokia devices5	Unofficial|
|8691	|Ultra Fractal, a fractal generation and rendering software application – distributed calculations over networked computers67[self-published source?	Unofficial|
|8765|?	Default port of a local GUN relay peer that the Internet Archive8[self-published source and others use as a decentralized mirror for censorship resistance.9[self-published source	Unofficial|
|8767	|Voice channel of TeamSpeak 2,0 a proprietary Voice over IP protocol targeted at gamers[citation needed	Unofficial|
|8834	?	?	Nessus, a vulnerability scanner – remote XML-RPC web server1[third-party source needed	Unofficial|
|8840	?	?	Opera Unite, an extensible framework for web applications23	Unofficial|
|8880	|Alternate port of CDDB (Compact Disc Database) protocol, used to look up audio CD (compact disc) information over the Internet.4 See also port 888.	Official|
|?	?	IBM WebSphere Application Server SOAP connector5[jargon	Unofficial|
|8883	|Secure MQTT (MQTT over TLS)67	Official|
|8887	?	?	HyperVM over HTTP[citation needed	Unofficial|
|8888	?	?	HyperVM over HTTPS[citation needed	Unofficial|
|?|Freenet web UI (localhost only)[citation needed	Unofficial|
|?	?	Default for IPython8[self-published source? / Jupyter9[self-published source? notebook dashboards	Unofficial|
|?	?	MAMP0	Unofficial|
|8889	?	?	MAMP0	Unofficial|
|8983	?	?	Apache Solr1	Unofficial|
|8997	?	?	Alternate port for I2P Monotone Proxy5[jargon	Unofficial|
|8998	?	?	I2P Monotone Proxy5[jargon	Unofficial|
|8999	?	?	Alternate port for I2P Monotone Proxy5[jargon	Unofficial|
|9000	|SonarQube Web Server2	Unofficial|
||DBGp	Unofficial|
||SqueezeCenter web server & streaming	Unofficial|
|Yes	UDPCast	Unofficial|
||Play! Framework web server3	Unofficial|
||Hadoop NameNode default port	Unofficial|
||PHP-FPM default port	Unofficial|
||QBittorrent's embedded torrent tracker default port4	Unofficial|
|9001	|ETL Service Manager5	Official|
|Microsoft SharePoint authoring environment	Unofficial|
|cisco-xremote router configuration[citation needed	Unofficial|
|Tor network default	Unofficial|
||DBGp Proxy	Unofficial|
||HSQLDB default port	Unofficial|
|9002			Newforma Server comms	Unofficial|
|9006			De-Commissioned Port	Official|
||Tomcat in standalone mode	Unofficial|
|9030	|Tor often used	Unofficial|
|9042	|Apache Cassandra native protocol clients	Unofficial|
|9043	|WebSphere Application Server Administration Console secure	Unofficial|
|9050–9051	|Tor (SOCKS-5 proxy client)	Unofficial|
|9060	|WebSphere Application Server Administration Console	Unofficial|
|9080	|glrpc, Groove Collaboration software GLRPC	Official|
||WebSphere Application Server HTTP Transport (port 1) default	Unofficial|
||Remote Potato by FatAttitude, Windows Media Center addon	Unofficial|
||ServerWMC, Windows Media Center addon	Unofficial|
|9090	|Prometheus metrics server	Unofficial|
||Openfire Administration Console	Unofficial|
||SqueezeCenter control (CLI)	Unofficial|
||Cherokee Admin Panel	Unofficial|
|9091	|Openfire Administration Console (SSL Secured)	Unofficial|
||Transmission (BitTorrent client) Web Interface	Unofficial|
|9092	|H2 (DBMS) Database Server	Unofficial|
||Apache Kafka A Distributed Streaming Platform6	Unofficial|
|9100	|PDL Data Stream, used for printing to certain network printers	Official|
|9101	|Bacula Director	Official|
|9102	|Bacula File Daemon	Official|
|9103	|Bacula Storage Daemon	Official|
|9119	|MXit Instant Messenger	Official|
|9150	|Tor Browser	Unofficial|
|9191	|Sierra Wireless Airlink	Unofficial|
|9199	|Avtex LLC—qStats	Unofficial|
|9200	|Elasticsearch7—default Elasticsearch port	Unofficial|
|9217	|iPass Platform Service	Unofficial|
|9293	|Sony PlayStation RemotePlay8	Unofficial|
|9300	|IBM Cognos BI[citation needed	Unofficial|
|9303	|D-Link Shareport Share storage and MFP printers[citation needed	Unofficial|
|9306	|Sphinx Native API	Official|
|9309	|Sony PlayStation Vita Host Collaboration WiFi Data Transfer9	Unofficial|
|9312	|Sphinx SphinxQL	Official|
|9332	|Litecoin JSON-RPC server	Unofficial|
|9333	|Litecoin	Unofficial|
|9339	|Clash of Clans, a mobile freemium strategy video game	Unofficial|
|9389	|adws, Microsoft AD DS Web Services, Powershell uses this port	Official|
|9392|?	OpenVAS Greenbone Security Assistant web interface	Unofficial|
|9418	|git, Git pack transfer service	Official|
|9419	|MooseFS distributed file system – master control port0[self-published source	Unofficial|
|9420	|MooseFS distributed file system – master command port0	Unofficial|
|9421	|MooseFS distributed file system – master client port0	Unofficial|
|9422	|MooseFS distributed file system – Chunkservers0	Unofficial|
|9425	|MooseFS distributed file system – CGI server0	Unofficial|
|9443	|VMware Websense Triton console (HTTPS port used for accessing and administrating a vCenter Server via the Web Management Interface)	Unofficial|
||NCSA Brown Dog Data Tilling Service	Unofficial|
|9535	|mngsuite, LANDesk Management Suite Remote Control	Official|
|9536	|laes-bf, IP Fabrics Surveillance buffering function	Official|
|9600	No|Factory Interface Network Service (FINS), a network protocol used by Omron programmable logic controllers[citation needed	Unofficial|
|9675	|Spiceworks Desktop, IT Helpdesk Software	Unofficial|
|9676	|Spiceworks Desktop, IT Helpdesk Software	Unofficial|
|9695	?	?	Content centric networking (CCN, CCNx)[citation needed	Official|
|9785	|Viber8	Unofficial|
|9800	|WebDAV Source	Official|
|WebCT e-learning portal	Unofficial|
|9875	|Club Penguin Disney online game for kids	Unofficial|
|9898	|Tripwire—File Integrity Monitoring Software1	Unofficial|
|9899	|SCTP tunneling (port number used in SCTP packets encapsulated in UDP, RFC 6951)	Official|
|9901	|Banana for Apache Solr	Unofficial|
|9981	|Tvheadend HTTP server (web interface)2	Unofficial|
|9982	|Tvheadend HTSP server (Streaming protocol)2	Unofficial|
|9987	|TeamSpeak 3 server default (voice) port (for the conflicting service see the IANA list)	Unofficial|
|9993	|ZeroTier Default port for ZeroTier	Unofficial|
|9997	|Splunk port for communication between the forwarders and indexers	Unofficial|
|9999			Urchin Web Analytics[citation needed	Unofficial|
|10000	|Network Data Management Protocol	Official|
|BackupExec	Unofficial|
|Webmin, Web-based Unix/Linux system administration tool (default port)	Unofficial|
|10000–20000	No|Used on VoIP networks for receiving and transmitting voice telephony traffic which includes Google Voice via the OBiTalk ATA devices as well as on the MagicJack and Vonage ATA network devices.3	Unofficial|
|10001	|Ubiquiti UniFi access points broadcast to 255.255.255.255:10001 (UDP) to locate the controller(s)	Unofficial|
|10009	|CrossFire, a multiplayer online First Person Shooter[citation needed	Unofficial|
|10010	|Open Object Rexx (ooRexx) rxapi daemon	Official|
|10024	|Zimbra smtp [mta—to amavis from postfix[citation needed	Unofficial|
|10025	|Zimbra smtp [mta—back to postfix from amavis[citation needed	Unofficial|
|10042	|Mathoid server[citation needed	Unofficial|
|10050	|Zabbix agent	Official|
|10051	|Zabbix trapper	Official|
|10080	|Touhou fight games (Immaterial and Missing Power, Scarlet Weather Rhapsody, Hisoutensoku, Hopeless Masquerade and Urban Legend in Limbo)	Unofficial|
|10110	|NMEA 0183 Navigational Data. Transport of NMEA 0183 sentences over TCP or UDP	Official|
|10172	|Intuit Quickbooks client	Unofficial|
|10200	|FRISK Software International's fpscand virus scanning daemon for Unix platforms4	Unofficial|
||FRISK Software International's f-protd virus scanning daemon for Unix platforms5	Unofficial|
|10201–10204	|FRISK Software International's f-protd virus scanning daemon for Unix platforms5	Unofficial|
|10212	|GE Intelligent Platforms Proficy HMI/SCADA – CIMPLICITY WebView6	Official|
|10308	?	?	Lock On: Modern Air Combat[citation needed	Unofficial|
|10480	?	?	SWAT 4 Dedicated Server[citation needed	Unofficial|
|10505	|BlueStacks (android simulator) broadcast7	Unofficial|
|10514	|TLS-enabled Rsyslog (default by convention)	Unofficial|
|10823	|Farming Simulator 2011[citation needed	Unofficial|
|10891	|Jungle Disk (this port is opened by the Jungle Disk Monitor service on the localhost)[citation needed	Unofficial|
|10933|No	Octopus Deploy Tentacle deployment agent8	Official|
|11001	|metasys ( Johnson Controls Metasys java AC control environment )	Official|
|11111	|RiCcI, Remote Configuration Interface (Redhat Linux)	Unofficial|
|11112	|ACR/NEMA Digital Imaging and Communications in Medicine (DICOM)	Official|
|11211	|memcached	Unofficial|
|11214	|memcached incoming SSL proxy	Unofficial|
|11215	|memcached internal outgoing SSL proxy	Unofficial|
|11235			Savage: Battle for Newerth[citation needed	Unofficial|
|11311	|Robot Operating System master	Unofficial|
|11371	|OpenPGP HTTP key server	Official|
|11753	|OpenRCT2 multiplayer9[self-published source	Unofficial|
|12000	|CubeForm, Multiplayer SandBox Game	Unofficial|
|12012	|Audition Online Dance Battle, Korea Server—Status/Version Check	Unofficial|
|12013	|Audition Online Dance Battle, Korea Server	Unofficial|
|12035	|Second Life, used for server UDP in-bound0	Unofficial|
|12043	|Second Life, used for LSL HTTPS in-bound1	Unofficial|
|12046	|Second Life, used for LSL HTTP in-bound1	Unofficial|
|12201	|Graylog Extended Log Format (GELF)2[importance?	Unofficial|
|12222	|Light Weight Access Point Protocol (LWAPP) LWAPP data (RFC 5412)	Official|
|12223	|Light Weight Access Point Protocol (LWAPP) LWAPP control (RFC 5412)	Official|
|12345	|Cube World3	Unofficial|
||Little Fighter 2	Unofficial|
|NetBus remote administration tool (often Trojan horse).	Unofficial|
|12443	|IBM HMC web browser management access over HTTPS instead of default port 4434	Unofficial|
|12489	|NSClient/NSClient++/NC_Net (Nagios)	Unofficial|
|12975	|LogMeIn Hamachi (VPN tunnel software; also port 32976)—used to connect to Mediation Server (bibi.hamachi.cc); will attempt to use SSL (TCP port 443) if both 12975 & 32976 fail to connect	Unofficial|
|13000–13050	|Second Life, used for server UDP in-bound5	Unofficial|
|13008	|CrossFire, a multiplayer online First Person Shooter[citation needed	Unofficial|
|13075	|Default6 for BMC Software Control-M/Enterprise Manager Corba communication, though often changed during installation	Official|
|13400	|ISO 13400 Road vehicles — Diagnostic communication over Internet Protocol(DoIP)	Official|
|13720	|Symantec NetBackup—bprd (formerly VERITAS)	Official|
|13721	|Symantec NetBackup—bpdbm (formerly VERITAS)	Official|
|13724	|Symantec Network Utility—vnetd (formerly VERITAS)	Official|
|13782	|Symantec NetBackup—bpcd (formerly VERITAS)	Official|
|13783	|Symantec VOPIED protocol (formerly VERITAS)	Official|
|13785	|Symantec NetBackup Database—nbdb (formerly VERITAS)	Official|
|13786	|Symantec nomdb (formerly VERITAS)	Official|
|14550	|MAVLink Ground Station Port	Unofficial|
|14567	|Battlefield 1942 and mods	Unofficial|
|15000	|psyBNC	Unofficial|
||Wesnoth	Unofficial|
||Kaspersky Network Agent[citation needed	Unofficial|
|Yes	Teltonika networks remote management system (RMS)	Unofficia|
|15009	|Teltonika networks remote management system (RMS)	Unofficial|
|15010	|Teltonika networks remote management system (RMS)	Unofficial|
|15441	?	?	ZeroNet fileserver[citation needed	Unofficial|
|15567	|Battlefield Vietnam and mods	Unofficial|
|15345	|XPilot Contact	Official|
|15672|No	RabbitMQ management plugin7[self-published source	Unofficial|
|16000	|Oracle WebCenter Content: Imaging (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
||shroudBNC	Unofficial|
|16080	|Mac OS X Server Web (HTTP) service with performance cache8	Unofficial|
|16200	|Oracle WebCenter Content: Content Server (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
|16225	|Oracle WebCenter Content: Content Server Web UI. Port though often changed during installation	Unofficial|
|16250	|Oracle WebCenter Content: Inbound Refinery (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
|16261	|Project Zomboid multiplayer. Additional sequential ports used for each player connecting to server.[citation needed	Unofficial|
|16300	|Oracle WebCenter Content: Records Management (formerly known as Oracle Universal Records Management). Port though often changed during installation	Unofficial|
|16384	|CISCO Default RTP MIN	Unofficial|
|16384-16403	|Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's iChat for audio and video	Unofficial|
|16384-16387	|Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's FaceTime and Game Center	Unofficial|
|16393-16402	|Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's FaceTime and Game Center	Unofficial|
|16403-16472	|Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's Game Center	Unofficial|
|16400	|Oracle WebCenter Content: Capture (formerly known as Oracle Document Capture). Port though often changed during installation	Unofficial|
|16482			CISCO Default RTP MAX	Official|
|16567	|Battlefield 2 and mods	Unofficial|
|17011	|Worms multiplayer	Unofficial|
|17224	|Train Realtime Data Protocol (TRDP) Process Data, network protocol used in train communication.9	Official|
|17225	|Train Realtime Data Protocol (TRDP) Message Data, network protocol used in train communication.0	Official|
|17333	|CS Server (CSMS), default binary protocol port	Unofficial|
|17475	|DMXControl 3 Network Broker	Unofficial|
|17500	|Dropbox LanSync Protocol (db-lsp); used to synchronize file catalogs between Dropbox clients on a local network.	Official|
|18080|No	Monero P2P network communications[citation needed	Unofficial|
|18081|No	Monero incoming RPC calls[citation needed	Unofficial|
|18091	|memcached Internal REST HTTPS for SSL	Unofficial|
|18092	|memcached Internal CAPI HTTPS for SSL	Unofficial|
|18104	|RAD PDF Service	Official|
|18200	|Audition Online Dance Battle, AsiaSoft Thailand Server status/version check	Unofficial|
|18201	|Audition Online Dance Battle, AsiaSoft Thailand Server	Unofficial|
|18206	|Audition Online Dance Battle, AsiaSoft Thailand Server FAM database	Unofficial|
|18300	|Audition Online Dance Battle, AsiaSoft SEA Server status/version check	Unofficial|
|18301	|Audition Online Dance Battle, AsiaSoft SEA Server	Unofficial|
|18306	|Audition Online Dance Battle, AsiaSoft SEA Server FAM database	Unofficial|
|18333	|Bitcoin testnet8	Unofficial|
|18400	|Audition Online Dance Battle, KAIZEN Brazil Server status/version check	Unofficial|
|18401	|Audition Online Dance Battle, KAIZEN Brazil Server	Unofficial|
|18505	|Audition Online Dance Battle R4p3 Server, Nexon Server status/version check	Unofficial|
|18506	|Audition Online Dance Battle, Nexon Server	Unofficial|
|18605	|X-BEAT status/version check	Unofficial|
|18606	|X-BEAT	Unofficial|
|18676	|YouView	Unofficial|
|19000	|Audition Online Dance Battle, G10/alaplaya Server status/version check	Unofficial|
|Yes	JACK sound server	Unofficial|
|19001	|Audition Online Dance Battle, G10/alaplaya Server	Unofficial|
|19132	|Minecraft: Bedrock Edition multiplayer server[citation needed	Unofficial|
|19133	|Minecraft: Bedrock Edition IPv6 multiplayer server[citation needed	Unofficial|
|19150	|Gkrellm Server	Unofficial|
|19226	|Panda Software AdminSecure Communication Agent	Unofficial|
|19294	|Google Talk Voice and Video connections1	Unofficial|
|19295	|Google Talk Voice and Video connections1	Unofficial|
|19302	|Google Talk Voice and Video connections1	Unofficial|
|19812|No	4D database SQL Communication2	Official|
|19813	|4D database Client Server Communication2	Official|
|19814	|4D database DB4D Communication2	Official|
|19999			Distributed Network Protocol—Secure (DNP—Secure), a secure version of the protocol used in SCADA systems between communicating RTU's and IED's	Official|
|20000			Distributed Network Protocol (DNP), a protocol used in SCADA systems between communicating RTU's and IED's	Official|
|Usermin, Web-based Unix/Linux user administration tool (default port)	Unofficial|
|Yes	Used on VoIP networks for receiving and transmitting voice telephony traffic which includes Google Voice via the OBiTalk ATA devices as well as on the MagicJack and Vonage ATA network devices.3	Unofficial|
|20560	|Killing Floor	Unofficial|
|20582	|HW Development IoT comms	Unofficial|
|20583	|HW Development IoT comms	Unofficial|
|20595	|0 A.D. Empires Ascendant	Unofficial|
|20808	|Ableton Link	Unofficial|
|21025	|Starbound Server (default), Starbound	Unofficial|
|22000	|Syncthing (default)	Unofficial|
|22136	|FLIR Systems Camera Resource Protocol	Unofficial|
|22222	|Davis Instruments, WeatherLink IP	Unofficial|
|23073			Soldat Dedicated Server	Unofficial|
|23399			Skype default protocol	Unofficial|
|23513	?	?	Duke Nukem 3D source ports	Unofficial|
|24441	|Pyzor spam detection network	Unofficial|
|24444			NetBeans integrated development environment	Unofficial|
|24465	|Tonido Directory Server for Tonido which is a Personal Web App and P2P platform	Official|
|24554	|BINKP, Fidonet mail transfers over TCP/IP	Official|
|24800			Synergy: keyboard/mouse sharing software	Unofficial|
|24842			StepMania: Online: Dance Dance Revolution Simulator	Unofficial|
|25565	|Minecraft (Java Edition) multiplayer server34	Unofficial|
|Yes	Minecraft (Java Edition) multiplayer server query5	Unofficial|
|25575	|Minecraft (Java Edition) multiplayer server RCON6	Unofficial|
|25826	|collectd default port7	Unofficial|
|26000	|id Software's Quake server	Official|
||EVE Online	Unofficial|
|Yes	Xonotic, an open-source arena shooter	Unofficial|
|26900–26901	|EVE Online	Unofficial|
|27000	|PowerBuilder SySAM license server	Unofficial|
|27000–27006	|id Software's QuakeWorld master server	Unofficial|
|27000–27009	|FlexNet Publisher's License server (from the range of default ports)	Official|
|27000–27015	No|Steam (game client traffic)8[self-published source	Unofficial|
|27015	No|GoldSrc and Source engine dedicated server port8	Unofficial|
|27015-27018	|Unturned, a survival game	Unofficial|
|27015–27030	No|Steam (matchmaking and HLTV)8	Unofficial|
||Steam (downloads)8	Unofficial|
|27016			Magicka server port	Unofficial|
|27017|No	MongoDB daemon process (mongod) and routing service (mongos)9	Unofficial|
|27031	Ports 27036 & 27037|Steam (In-Home Streaming)8	Unofficial|
|27036	|Steam (In-Home Streaming)8	Unofficial|
|27037|Ports 27031 & 27036	Steam (In-Home Streaming)8	Unofficial|
|27374			Sub7 default.	Unofficial|
|27500–27900	|id Software's QuakeWorld	Unofficial|
|27888	|Kaillera server	Unofficial|
|27901–27910	|id Software's Quake II master server	Unofficial|
|27950	|OpenArena outgoing	Unofficial|
|27960–27969	|Activision's Enemy Territory and id Software's Quake III Arena, Quake III and Quake Live and some ioquake3 derived games, such as Urban Terror (OpenArena incoming)	Unofficial|
|28001			Starsiege: Tribes[citation needed	Unofficial|
|28015	|Rust (video game)0	Unofficial|
|28016	|Rust RCON (video game)1	Unofficial|
|28770–28771	|AssaultCube Reloaded, a video game based upon a modification of AssaultCube[citation needed	Unofficial|
|28785–28786	|Cube 2: Sauerbraten2[self-published source?	Unofficial|
|28852	|Killing Floor[citation needed	Unofficial|
|28910	|Nintendo Wi-Fi Connection3	Unofficial|
|28960	|Call of Duty; Call of Duty: United Offensive; Call of Duty 2; Call of Duty 4: Modern Warfare;[citation needed Call of Duty: World at War (PC platform)4	Unofficial|
|29000	?	?	Perfect World, an adventure and fantasy MMORPG[citation needed	Unofficial|
|29070	|Jedi Knight: Jedi Academy by Ravensoft[citation needed	Unofficial|
|29900–29901	|Nintendo Wi-Fi Connection3	Unofficial|
|29920	|Nintendo Wi-Fi Connection3	Unofficial|
|30564	|Multiplicity: keyboard/mouse/clipboard sharing software[citation needed	Unofficial|
|31337	|Back Orifice and Back Orifice 2000 remote administration tools56	Unofficial|
|31416	?	?	BOINC RPC7	Unofficial|
|31438	|Rocket U28[self-published source?	Unofficial|
|31457	|TetriNET	Official|
|32137	|Immunet Protect (UDP in version 2.0,9 TCP since version 3.00)	Unofficial|
|32400	|Plex Media Server1	Official|
|32764	|A backdoor found on certain Linksys, Netgear and other wireless DSL modems/combination routers2	Unofficial|
|32887	|Ace of Spades, a multiplayer FPS video game[citation needed	Unofficial|
|32976	|LogMeIn Hamachi, a VPN application; also TCP port 12975 and SSL (TCP 443).3	Unofficial|
|33434	|traceroute	Official|
|33848	|Jenkins, a continuous integration (CI) tool45	Unofficial|
|34000	|Infestation: Survivor Stories (formerly known as The War Z), a multiplayer zombie video game[verification needed	Unofficial|
|34197	No|Factorio, a multiplayer survival and factory-building game6	Unofficial|
|35357	|OpenStack Identity (Keystone) administration7[self-published source?	Official|
|37008	|TZSP intrusion detection[citation needed	Unofficial|
|40000	|SafetyNET p – a real-time Industrial Ethernet protocol	Official|
|41121	|Tentacle Server8 - Pandora FMS	Official|
|43110	|ZeroNet web UI default port[citation needed	Unofficial|
|43594–43595	?	?	RuneScape9	Unofficial|
|44405	|Mu Online Connect Server[citation needed	Unofficial|
|44818	|EtherNet/IP explicit messaging	Official|
|47808	|BACnet Building Automation and Control Networks (4780810 = BAC016)	Official|
|49151	Reserved	Reserved	Reserved	Official|
||