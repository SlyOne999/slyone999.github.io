|## Well Known Network Ports|

|Port	|TCP	|UDP	|IANA status	|Description	|SCTP |
|-------|-------|-------|---------------|-------------|----|
|1	|Yes	|Assigned	|Official	|TCP Port Service Multiplexer (TCPMUX). Historic. Both TCP and UDP have been assigned to TCPMUX by IANA, but by design only TCP is specified.	|
|5	Assigned	Assigned	Official	Remote Job Entry was historically using socket 5 in its old socket form, while MIB PIM has identified it as TCP/5 and IANA has assigned both TCP and UDP 5 to it.	|
|7	Yes	Yes	Official	Echo Protocol	|
|9	Yes	Yes	Official	Discard Protocol	Yes |
|No	Yes	Unofficial	Wake-on-LAN	|
|11	Yes	Yes	Official	Active Users (systat service)	|
|13	Yes	Yes	Official	Daytime Protocol	|
|15	Yes	No	Unofficial	Previously netstat service	|
|17	Yes	Yes	Official	Quote of the Day (QOTD)	|
|18	Yes	Yes	Official	Message Send Protocol	|
|19	Yes	Yes	Official	Character Generator Protocol (CHARGEN)	|
|20	Yes	Assigned	Official	File Transfer Protocol (FTP) data transfer	Yes |
|21	Yes	Assigned	Official	File Transfer Protocol (FTP) control (command)	Yes|
|22	Yes	Assigned	Official	Secure Shell (SSH), secure logins, file transfers (scp, sftp) and port forwarding	Yes |
|23	Yes	Assigned	Official	Telnet protocol—unencrypted text communications	|
|25	Yes	Assigned	Official	Simple Mail Transfer Protocol (SMTP), used for email routing between mail servers	|
|37	Yes	Yes	Official	Time Protocol	|
|42	Assigned	Yes	Official	Host Name Server Protocol	|
|43	Yes	Assigned	Official	WHOIS protocol	|
|47	Reserved	Reserved	Official		|
|49	Yes	Yes	Official	TACACS Login Host protocol. TACACS+, still in draft which is an improved but distinct version of TACACS, only uses TCP 49.	|
|51	Reserved	Reserved	Official	Historically used for Interface Message Processor logical address management, entry has been removed by IANA on 2013-05-25	|
|52	Assigned	Assigned	Official	Xerox Network Systems (XNS) Time Protocol. Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|53	Yes	Yes	Official	Domain Name System (DNS)	|
|54	Assigned	Assigned	Official	Xerox Network Systems (XNS) Clearinghouse (Name Server). Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|56	Assigned	Assigned	Official	Xerox Network Systems (XNS) Authentication Protocol. Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|58	Assigned	Assigned	Official	Xerox Network Systems (XNS) Mail. Despite this port being assigned by IANA, the service is meant to work on SPP (ancestor of IPX/SPX), instead of TCP/IP.	|
|61	Reserved	Reserved	Official	Historically assigned to the NIFTP-Based Mail protocol, but was never documented in the related IEN. The port number entry was removed from IANA's registry on 2017-05-18.	|
|67	Assigned	Yes	Official	Bootstrap Protocol (BOOTP) server; also used by Dynamic Host Configuration Protocol (DHCP)	|
|68	Assigned	Yes	Official	Bootstrap Protocol (BOOTP) client; also used by Dynamic Host Configuration Protocol (DHCP)	|
|69	Assigned	Yes	Official	Trivial File Transfer Protocol (TFTP)	|
|70	Yes	Assigned	Official	Gopher protocol	|
|71–74	Yes	Yes	Official	NETRJS protocol	|
|79	Yes	Assigned	Official	Finger protocol	|
|80	Yes	Assigned	Official	Hypertext Transfer Protocol (HTTP)	Yes |
|No	Yes	Unofficial	QUIC, a transport protocol over UDP (still in draft as of April 2020), using stream multiplexing, encryption by default with TLS, and currently supporting HTTP/2. QUIC has been renamed to HTTP/3, which is currently an Internet Draft.	|
|81	Yes		Unofficial	TorPark onion routing[verification needed	|
|82		Yes	Unofficial	TorPark control[verification needed	|
|83	Yes	Assigned	Official	MIT ML Device, networking file system 	|
|88	Yes	Assigned	Official	Kerberos authentication system	|
|90	Yes	Yes	Unofficial	PointCast (dotcom)[third-party source needed	|
|95	Yes	Assigned	Official	SUPDUP, terminal-independent remote login 	|
|101	Yes	Assigned	Official	NIC host name	|
|102	Yes	Assigned	Official	ISO Transport Service Access Point (TSAP) Class 0 protocol;	|
|104	Yes	Yes	Official	Digital Imaging and Communications in Medicine (DICOM; also port 11112)	|
|105	Yes	Yes	Official	CCSO Nameserver	|
|107	Yes	Yes	Official	Remote User Telnet Service (RTelnet)	|
|108	Yes	Yes	Official	IBM Systems Network Architecture (SNA) gateway access server	|
|109	Yes	Assigned	Official	Post Office Protocol, version 2 (POP2)	|
|110	Yes	Assigned	Official	Post Office Protocol, version 3 (POP3)	|
|111	Yes	Yes	Official	Open Network Computing Remote Procedure Call (ONC RPC, sometimes referred to as Sun RPC)	|
|113	Yes	No	Official	Ident, authentication service/identification protocol, used by IRC servers to identify users	|
|Yes	Assigned	Official	Authentication Service (auth), the predecessor to identification protocol. Used to determine a user's identity of a particular TCP connection.	|
|115	Yes	Assigned	Official	Simple File Transfer Protocol	|
|117	Yes	Yes	Official	UUCP Mapping Project (path service)[citation needed	|
|118	Yes	Yes	Official	Structured Query Language (SQL) Services[jargon	|
|119	Yes	Assigned	Official	Network News Transfer Protocol (NNTP), retrieval of newsgroup messages	|
|123	Assigned	Yes	Official	Network Time Protocol (NTP), used for time synchronization	|
|126	Yes	Yes	Official	Formerly Unisys Unitary Login, renamed by Unisys to NXEdit. Used by Unisys Programmer's Workbench for Clearpath MCP, an IDE for Unisys MCP software development	|
|135	Yes	Yes	Official	DCE endpoint resolution	|
|Yes	Yes	Official	Microsoft EPMAP (End Point Mapper), also known as DCE/RPC Locator service, used to remotely manage services including DHCP server, DNS server and WINS. Also used by DCOM	|
|137	Yes	Yes	Official	NetBIOS Name Service, used for name registration and resolution	|
|138	Assigned	Yes	Official	NetBIOS Datagram Service	|
|139	Yes	Assigned	Official	NetBIOS Session Service	|
|143	Yes	Assigned	Official	Internet Message Access Protocol (IMAP), management of electronic mail messages on a server	|
|152	Yes	Yes	Official	Background File Transfer Program (BFTP)[importance?	|
|153	Yes	Yes	Official	Simple Gateway Monitoring Protocol (SGMP), a protocol for remote inspection and alteration of gateway management information	|
|156	Yes	Yes	Official	Structured Query Language (SQL) Service[jargon	|
|158	Yes	Yes	Official	Distributed Mail System Protocol (DMSP, sometimes referred to as Pcmail)[importance?	|
|161	Assigned	Yes	Official	Simple Network Management Protocol (SNMP)[citation needed	|
|162	Yes	Yes	Official	Simple Network Management Protocol Trap (SNMPTRAP)[citation needed	|
|170	Yes	Yes	Official	Network PostScript print server	|
|177	Yes	Yes	Official	X Display Manager Control Protocol (XDMCP), used for remote logins to an X Display Manager server[self-published source	|
|179	Yes	Assigned	Official	Border Gateway Protocol (BGP), used to exchange routing and reachability information among autonomous systems (AS) on the Internet	Yes |
|194	Yes	Yes	Official	Internet Relay Chat (IRC)	|
|199	Yes	Yes	Official	SNMP Unix Multiplexer (SMUX)	|
|201	Yes	Yes	Official	AppleTalk Routing Maintenance	|
|209	Yes	Assigned	Official	Quick Mail Transfer Protocol[self-published source	|
|210	Yes	Yes	Official	ANSI Z39.50	|
|213	Yes	Yes	Official	Internetwork Packet Exchange (IPX)	|
|218	Yes	Yes	Official	Message posting protocol (MPP)	|
|220	Yes	Yes	Official	Internet Message Access Protocol (IMAP), version 3	|
|225–241	Reserved	Reserved	Official		|
|249–255	Reserved	Reserved	Official		|
|259	Yes	Yes	Official	Efficient Short Remote Operations (ESRO)	|
|262	Yes	Yes	Official	Arcisdms	|
|264	Yes	Yes	Official	Border Gateway Multicast Protocol (BGMP)	|
|280	Yes	Yes	Official	http-mgmt	|
|300	Yes		Unofficial	ThinLinc Web Access	|
|308	Yes		Official	Novastor Online Backup	|
|311	Yes	Assigned	Official	Mac OS X Server Admin (officially AppleShare IP Web administration)	|
|318	Yes	Yes	Official	PKIX Time Stamp Protocol (TSP)	|
|319		Yes	Official	Precision Time Protocol (PTP) event messages	|
|320		Yes	Official	Precision Time Protocol (PTP) general messages	|
|350	Yes	Yes	Official	Mapping of Airline Traffic over Internet Protocol (MATIP) type A	|
|351	Yes	Yes	Official	MATIP type B	|
|356	Yes	Yes	Official	cloanto-net-1 (used by Cloanto Amiga Explorer and VMs)	|
|366	Yes	Yes	Official	On-Demand Mail Relay (ODMR)	|
|369	Yes	Yes	Official	Rpc2portmap	|
|370	Yes	Yes	Official	codaauth2, Coda authentication server	|
|Yes	Official	securecast1, outgoing packets to NAI's SecureCast serversAs of 2000	|
|371	Yes	Yes	Official	ClearCase albd	|
|383	Yes	Yes	Official	HP data alarm manager	|
|384	Yes	Yes	Official	A Remote Network Server System	|
|387	Yes	Yes	Official	AURP (AppleTalk Update-based Routing Protocol)	|
|388	Yes	Assigned	Official	Unidata LDM near real-time data distribution protocol[self-published source[self-published source	|
|389	Yes	Assigned	Official	Lightweight Directory Access Protocol (LDAP)	|
|399	Yes	Yes	Official	Digital Equipment Corporation DECnet+ (Phase V) over TCP/IP (RFC1859)	|
|401	Yes	Yes	Official	Uninterruptible power supply (UPS)	|
|427	Yes	Yes	Official	Service Location Protocol (SLP)	|
|433	Yes	Yes	Official	NNSP, part of Network News Transfer Protocol	|
|434	Yes	Yes	Official	Mobile IP Agent (RFC 5944)	|
|443	Yes	Assigned	Official	Hypertext Transfer Protocol over TLS/SSL (HTTPS)	Yes |
|No	Yes	Unofficial	Quick UDP Internet Connections (QUIC), a transport protocol over UDP (still in draft as of July 2018), using stream multiplexing, encryption by default with TLS, and currently supporting HTTP/2.	|
|444	Yes	Yes	Official	Simple Network Paging Protocol (SNPP), RFC 1568	|
|445	Yes	Yes	Official	Microsoft-DS (Directory Services) Active Directory, Windows shares	|
|Yes	Assigned	Official	Microsoft-DS (Directory Services) SMB file sharing	|
|464	Yes	Yes	Official	Kerberos Change/Set password	|
|465	Yes	No	Official	URL Rendezvous Directory for SSM (Cisco protocol)[importance?	|
|Yes	No	Official	Authenticated SMTP over TLS/SSL (SMTPS)	|
|475	Yes	Yes	Official	tcpnethaspsrv, Aladdin Knowledge Systems Hasp services	|
|491	Yes		Unofficial	GO-Global remote access and application publishing software	|
|497	Yes	Yes	Official	Retrospect	|
|500	Assigned	Yes	Official	Internet Security Association and Key Management Protocol (ISAKMP) / Internet Key Exchange (IKE)	|
|502	Yes	Yes	Official	Modbus Protocol	|
|504	Yes	Yes	Official	Citadel, multiservice protocol for dedicated clients for the Citadel groupware system	|
|510	Yes	Yes	Official	FirstClass Protocol (FCP), used by FirstClass client/server groupware system	|
|512	Yes		Official	Rexec, Remote Process Execution	|
|Yes	Official	comsat, together with biff	|
|513	Yes		Official	rlogin	|
|Yes	Official	Who	|
|514	Yes		Unofficial	Remote Shell, used to execute non-interactive commands on a remote system (Remote Shell, rsh, remsh)	|
|No	Yes	Official	Syslog, used for system logging	|
|515	Yes	Assigned	Official	Line Printer Daemon (LPD), print service	|
|517		Yes	Official	Talk	|
|518		Yes	Official	NTalk	|
|520	Yes		Official	efs, extended file name server	|
|Yes	Official	Routing Information Protocol (RIP)	|
|521		Yes	Official	Routing Information Protocol Next Generation (RIPng)	|
|524	Yes	Yes	Official	NetWare Core Protocol (NCP) is used for a variety things such as access to primary NetWare server resources, Time Synchronization, etc.	|
|525		Yes	Official	Timed, Timeserver	|
|530	Yes	Yes	Official	Remote procedure call (RPC)	|
|532	Yes	Assigned	Official	netnews	|
|533		Yes	Official	netwall, For Emergency Broadcasts	|
|540	Yes		Official	Unix-to-Unix Copy Protocol (UUCP)	|
|542	Yes	Yes	Official	commerce (Commerce Applications)	|
|543	Yes		Official	klogin, Kerberos login	|
|544	Yes		Official	kshell, Kerberos Remote shell	|
|546	Yes	Yes	Official	DHCPv6 client	|
|547	Yes	Yes	Official	DHCPv6 server	|
|548	Yes	Assigned	Official	Apple Filing Protocol (AFP) over TCP	|
|550	Yes	Yes	Official	new-rwho, new-who	|
|554	Yes	Yes	Official	Real Time Streaming Protocol (RTSP)	|
|556	Yes		Official	Remotefs, RFS, rfs_server	|
|560		Yes	Official	rmonitor, Remote Monitor	|
|561		Yes	Official	monitor	|
|563	Yes	Yes	Official	NNTP over TLS/SSL (NNTPS)	|
|564	Yes		Unofficial	9P (Plan 9)	|
|585	Port 993	?	Unofficial	Legacy use of Internet Message Access Protocol over TLS/SSL (IMAPS), now in use at port 993.	|
|587	Yes	Assigned	Official	email message submission (SMTP)	|
|591	Yes		Official	FileMaker 6.0 (and later) Web Sharing (HTTP Alternate, also see port 80)	|
|593	Yes	Yes	Official	HTTP RPC Ep Map, Remote procedure call over Hypertext Transfer Protocol, often used by Distributed Component Object Model services and Microsoft Exchange Server	|
|601	Yes		Official	Reliable Syslog Service — used for system logging	|
|604	Yes		Official	TUNNEL profile, a protocol for BEEP peers to form an application layer tunnel	|
|623		Yes	Official	ASF Remote Management and Control Protocol (ASF-RMCP) & IPMI Remote Management Protocol	|
|625	Yes	No	Unofficial	Open Directory Proxy (ODProxy)	|
|631	Yes	Yes	Official	Internet Printing Protocol (IPP)	|
|Yes	Yes	Unofficial	Common Unix Printing System (CUPS) administration console (extension to IPP)	|
|635	Yes	Yes	Official	RLZ DBase	|
|636	Yes	Assigned	Official	Lightweight Directory Access Protocol over TLS/SSL (LDAPS)	|
|639	Yes	Yes	Official	MSDP, Multicast Source Discovery Protocol	|
|641	Yes	Yes	Official	SupportSoft Nexus Remote Command (control/listening), a proxy gateway connecting remote control traffic	|
|643	Yes	Yes	Official	SANity	|
|646	Yes	Yes	Official	Label Distribution Protocol (LDP), a routing protocol used in MPLS networks	|
|647	Yes		Official	DHCP Failover protocol	|
|648	Yes		Official	Registry Registrar Protocol (RRP)	|
|651	Yes	Yes	Official	IEEE-MMS	|
|653	Yes	Yes	Official	SupportSoft Nexus Remote Command (data), a proxy gateway connecting remote control traffic	|
|654	Yes		Official	Media Management System (MMS) Media Management Protocol (MMP)	|
|655	Yes	Yes	Official	Tinc VPN daemon	|
|657	Yes	Yes	Official	IBM RMC (Remote monitoring and Control) protocol, used by System p5 AIX Integrated Virtualization Manager (IVM) and Hardware Management Console to connect managed logical partitions (LPAR) to enable dynamic partition reconfiguration	|
|660	Yes	Assigned	Official	Mac OS X Server administration, version 10.4 and earlier	|
|666	Yes	Yes	Official	Doom, first online first-person shooter	|
|Yes		Unofficial	airserv-ng, aircrack-ng's server for remote-controlling wireless devices	|
|674	Yes		Official	Application Configuration Access Protocol (ACAP)	|
|688	Yes	Yes	Official	REALM-RUSD (ApplianceWare Server Appliance Management Protocol)	|
|690	Yes	Yes	Official	Velneo Application Transfer Protocol (VATP)	|
|691	Yes		Official	MS Exchange Routing	|
|694	Yes	Yes	Official	Linux-HA high-availability heartbeat	|
|695	Yes		Official	IEEE Media Management System over SSL (IEEE-MMS-SSL)	|
|698		Yes	Official	Optimized Link State Routing (OLSR)	|
|700	Yes		Official	Extensible Provisioning Protocol (EPP), a protocol for communication between domain name registries and registrars (RFC 5734)	|
|701	Yes		Official	Link Management Protocol (LMP), a protocol that runs between a pair of nodes and is used to manage traffic engineering (TE) links	|
|702	Yes		Official	IRIS (Internet Registry Information Service) over BEEP (Blocks Extensible Exchange Protocol) (RFC 3983)	|
|706	Yes		Official	Secure Internet Live Conferencing (SILC)	|
|711	Yes		Official	Cisco Tag Distribution Protocol012—being replaced by the MPLS Label Distribution Protocol3	|
|712	Yes		Official	Topology Broadcast based on Reverse-Path Forwarding routing protocol (TBRPF; RFC 3684)	|
|749	Yes	Yes	Official	Kerberos (protocol) administration	|
|750		Yes	Official	kerberos-iv, Kerberos version IV	|
|751	Yes	Yes	Unofficial	kerberos_master, Kerberos authentication	|
|752		Yes	Unofficial	passwd_server, Kerberos password (kpasswd) server	|
|753	Yes	Yes	Official	Reverse Routing Header (RRH)4	|
|Yes	Unofficial	userreg_server, Kerberos userreg server	|
|754	Yes	Yes	Official	tell send	|
|Yes		Unofficial	krb5_prop, Kerberos v5 slave propagation	|
|760	Yes	Yes	Unofficial	krbupdate [kreg, Kerberos registration	|
|782	Yes		Unofficial	Conserver serial-console management server	|
|783	Yes		Unofficial	SpamAssassin spamd daemon	|
|800	Yes	Yes	Official	mdbs-daemon	|
|802	Yes	Yes	Official	MODBUS/TCP Security5	|
|808	Yes		Unofficial	Microsoft Net.TCP Port Sharing Service	|
|829	Yes	Assigned	Official	Certificate Management Protocol6	|
|830	Yes	Yes	Official	NETCONF over SSH	|
|831	Yes	Yes	Official	NETCONF over BEEP	|
|832	Yes	Yes	Official	NETCONF for SOAP over HTTPS	|
|833	Yes	Yes	Official	NETCONF for SOAP over BEEP	|
|843	Yes		Unofficial	Adobe Flash7	|
|847	Yes		Official	DHCP Failover protocol	|
|848	Yes	Yes	Official	Group Domain Of Interpretation (GDOI) protocol	|
|853	Yes	Yes	Official	DNS over TLS (RFC 7858)	|
|860	Yes		Official	iSCSI (RFC 3720)	|
|861	Yes	Yes	Official	OWAMP control (RFC 4656)	|
|862	Yes	Yes	Official	TWAMP control (RFC 5357)	|
|873	Yes		Official	rsync file synchronization protocol	|
|888	Yes		Unofficial	cddbp, CD DataBase (CDDB) protocol (CDDBP)	|
|Yes		Unofficial	IBM Endpoint Manager Remote Control	|
|897	Yes	Yes	Unofficial	Brocade SMI-S RPC	|
|898	Yes	Yes	Unofficial	Brocade SMI-S RPC SSL	|
|902	Yes	Yes	Unofficial	VMware ESXi89	|
|903	Yes		Unofficial	VMware ESXi89	|
|953	Yes	Reserved	Official	BIND remote name daemon control (RNDC)01	|
|981	Yes		Unofficial	Remote HTTPS management for firewall devices running embedded Check Point VPN-1 software2	|
|987	Yes		Unofficial	Microsoft Remote Web Workplace, a feature of Windows Small Business Server3	|
|989	Yes	Yes	Official	FTPS Protocol (data), FTP over TLS/SSL	|
|990	Yes	Yes	Official	FTPS Protocol (control), FTP over TLS/SSL	|
|991	Yes	Yes	Official	Netnews Administration System (NAS)4	|
|992	Yes	Yes	Official	Telnet protocol over TLS/SSL	|
|993	Yes	Assigned	Official	Internet Message Access Protocol over TLS/SSL (IMAPS)	|
|994	Reserved	Reserved	Official		|
|Maybe	Maybe	Unofficial	Internet Relay Chat over TLS/SSL (IRCS). Previously assigned, but not used in common practice.	|
|995	Yes	Yes	Official	Post Office Protocol 3 over TLS/SSL (POP3S)	|
|1010	Yes		Unofficial	ThinLinc web-based administration interface5[self-published source?	|
|1011–1020	Reserved	Reserved	Official		|
|1023	Reserved	Reserved	Official		|
|Yes	Yes	Unofficial	z/OS Network File System (NFS) (potentially ports 991–1023)|
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
|1058	Yes	Yes	nim, IBM AIX Network Installation Manager (NIM)	Official|
|1059	Yes	Yes	nimreg, IBM AIX Network Installation Manager (NIM)	Official|
|1080	Yes	Yes	SOCKS proxy	Official|
|1085	Yes	Yes	WebObjects	Official|
|1098	Yes	Yes	rmiactivation, Java remote method invocation (RMI) activation	Official|
|1099	Yes	Assigned	rmiregistry, Java remote method invocation (RMI) registry	Official|
|1109			Reserved – IANA	Official|
|Yes		Kerberos Post Office Protocol (KPOP)[citation needed	Unofficial|
|1113	Assigned[note 18	Yes9	Licklider Transmission Protocol (LTP) delay tolerant networking protocol	Official|
|1119	Yes	Yes	Battle.net chat/game protocol, used by Blizzard's games0	Official|
|1167	Yes, and SCTP	Yes	Cisco IP SLA (Service Assurance Agent)	Official|
|1194	Yes	Yes	OpenVPN	Official|
|1198	Yes	Yes	The cajo project Free dynamic transparent distributed computing in Java	Official|
|1214	Yes	Yes	Kazaa	Official|
|1218	Yes	No	William POWER	Official|
|1220	Yes	Assigned	QuickTime Streaming Server administration	Official|
|1234	Yes	Yes	Infoseek search agent	Official|
|Yes	VLC media player default port for UDP/RTP stream	Unofficial|
|1241	Yes	Yes	Nessus Security Scanner	Official|
|1270	Yes	Yes	Microsoft System Center Operations Manager (SCOM) (formerly Microsoft Operations Manager (MOM)) agent	Official|
|1293	Yes	Yes	Internet Protocol Security (IPSec)	Official|
|1311	Yes	Yes	Windows RxMon.exe	Official|
|Yes		Dell OpenManage HTTPS1	Unofficial|
|1314	?	?	Festival Speech Synthesis System server2[self-published source?	Unofficial|
|1337	Yes		neo4j-shell[citation needed	Unofficial|
|Yes	?	Sails.js default port3	Unofficial|
|Yes		WASTE Encrypted File Sharing Program[citation needed	Unofficial|
|1341	Yes	Yes	Qubes (Manufacturing Execution System)	Official|
|1344	Yes	Yes	Internet Content Adaptation Protocol	Official|
|1352	Yes	Yes	IBM Lotus Notes/Domino (RPC) protocol	Official|
|1360	Yes	Yes	Mimer SQL	Official|
|1414	Yes	Yes	IBM WebSphere MQ (formerly known as MQSeries)	Official|
|1417	Yes	Yes	Timbuktu Service 1 Port	Official|
|1418	Yes	Yes	Timbuktu Service 2 Port	Official|
|1419	Yes	Yes	Timbuktu Service 3 Port	Official|
|1420	Yes	Yes	Timbuktu Service 4 Port	Official|
|1431	Yes		Reverse Gossip Transport Protocol (RGTP), used to access a General-purpose Reverse-Ordered Gossip Gathering System (GROGGS) bulletin board, such as that implemented on the Cambridge University's Phoenix system	Official|
|1433	Yes	Yes	Microsoft SQL Server database management system (MSSQL) server	Official|
|1434	Yes	Yes	Microsoft SQL Server database management system (MSSQL) monitor	Official|
|1492	Yes		Sid Meier's CivNet, a multiplayer remake of the original Sid Meier's Civilization game[citation needed	Unofficial|
|1494	Yes	Yes	Citrix Independent Computing Architecture (ICA)4	Unofficial|
|1500	Yes		IBM Tivoli Storage Manager server5	Unofficial|
|1501	Yes		IBM Tivoli Storage Manager client scheduler5	Unofficial|
|1503	Yes	Yes	Windows Live Messenger (Whiteboard and Application Sharing)6	Unofficial|
|1512	Yes	Yes	Microsoft's Windows Internet Name Service (WINS)	Official|
|1513	Yes	Yes	Garena game client[citation needed	Unofficial|
|1521	Yes	Yes	nCUBE License Manager	Official|
|Yes		Oracle database default listener, in future releases[when?7 official port 2483 (TCP/IP) and 2484 (TCP/IP with SSL)	Unofficial|
|1524	Yes	Yes	ingreslock, ingres	Official|
|1527	Yes	Yes	Oracle Net Services, formerly known as SQL*Net8	Official|
|Yes		Apache Derby Network Server9	Unofficial|
|1533	Yes	Yes	IBM Sametime Virtual Places Chat	Official|
|1534	No	Yes	Eclipse Target Communication Framework 0	Unofficial|
|1540	Yes	Yes	1C:Enterprise server agent (ragent)12[self-published source	Unofficial|
|1541	Yes	Yes	1C:Enterprise master cluster manager (rmngr)1	Unofficial|
|1542	Yes	Yes	1C:Enterprise configuration repository server1	Unofficial|
|1545	Yes	Yes	1C:Enterprise cluster administration server (RAS)1	Unofficial|
|1547	Yes	Yes	Laplink	Official|
|1550	Yes	Yes	1C:Enterprise debug server1	Unofficial|
|Yes		Gadu-Gadu (direct client-to-client)[citation needed	Unofficial|
|1560–1590	Yes	Yes	1C:Enterprise cluster working processes1	Unofficial|
|1581	Yes	Yes	MIL STD 2045-47001 VMF	Official|
|Yes		IBM Tivoli Storage Manager web client5	Unofficial|
|1582–1583	Yes		IBM Tivoli Storage Manager server web interface5	Unofficial|
|1583	?	?	Pervasive PSQL3	Unofficial|
|1589	Yes	Yes	Cisco VLAN Query Protocol (VQP)	Official|
|1604	Yes	Yes	DarkComet remote administration tool (RAT)[citation needed	Unofficial|
|1626	Yes	?	iSketch4	Unofficial|
|1627	Yes	?	iSketch4	Unofficial|
|1628	Yes	Yes	LonTalk normal	Official|
|1629	Yes	Yes	LonTalk urgent	Official|
|1645		Yes	Early deployment of RADIUS before RFC standardization was done using UDP port number 1645. Enabled for compatibility reasons by default on Cisco[citation needed and Juniper Networks RADIUS servers.5 Official port is 1812. TCP port 1645 MUST NOT be used.6	Unofficial|
|1646		Yes	Old radacct port,[when? RADIUS accounting protocol. Enabled for compatibility reasons by default on Cisco[citation needed and Juniper Networks RADIUS servers.5 Official port is 1813. TCP port 1646 MUST NOT be used.6	Unofficial|
|1666	Yes		Perforce7	Unofficial|
|1677	Yes	Yes	Novell GroupWise clients in client/server access mode	Official|
|1688	Yes		Microsoft Key Management Service (KMS) for Windows Activation8	Unofficial|
|1701	Yes	Yes	Layer 2 Forwarding Protocol (L2F)	Official|
|Assigned	Yes	Layer 2 Tunneling Protocol (L2TP)	Official|
|1707	Yes	Yes	Windward Studios games (vdmplay)	Official|
|Yes	L2TP/IPsec, for establish an initial connection9	Unofficial|
|1716		Yes	America's Army, a massively multiplayer online game (MMO)0	Unofficial|
|1719	Yes	Yes	H.323 registration and alternate communication	Official|
|1720	Yes	Yes	H.323 call signaling	Official|
|1723	Yes	Assigned	Point-to-Point Tunneling Protocol (PPTP)	Official|
|1755	Yes	Yes	Microsoft Media Services (MMS, ms-streaming)	Official|
|1761	Yes	Yes	Novell ZENworks12	Unofficial|
|1783			Decomissioned [sic Port 04/14/00, ms	Official|
|1801	Yes	Yes	Microsoft Message Queuing	Official|
|1812	Yes	Yes	RADIUS authentication protocol, radius	Official|
|1813	Yes	Yes	RADIUS accounting protocol, radius-acct	Official|
|1863	Yes	Yes	Microsoft Notification Protocol (MSNP), used by the Microsoft Messenger service and a number of instant messaging Messenger clients	Official|
|1880	?	?	Node-RED3	Unofficial|
|1883	Yes	Yes	MQTT (formerly MQ Telemetry Transport)	Official|
|1900	Assigned	Yes	Simple Service Discovery Protocol (SSDP), discovery of UPnP devices	Official|
|1935	Yes	Yes	Macromedia Flash Communications Server MX, the precursor to Adobe Flash Media Server before Macromedia's acquisition by Adobe on December 3, 2005	Official|
|Yes	Yes	Real Time Messaging Protocol (RTMP)[citation needed, primarily used in Adobe Flash4	Unofficial|
|1967		Yes	Cisco IOS IP Service Level Agreements (IP SLAs) Control Protocol[citation needed	Unofficial|
|1970	Yes	Yes	Netop Remote Control	Official|
|1972	Yes	Yes	InterSystems Caché	Official|
|1984	Yes	Yes	Big Brother	Official|
|1985	Assigned	Yes	Cisco Hot Standby Router Protocol (HSRP)5[self-published source	Official|
|1998	Yes	Yes	Cisco X.25 over TCP (XOT) service	Official|
|2000	Yes	Yes	Cisco Skinny Client Control Protocol (SCCP)	Official|
|2010	?	?	Artemis: Spaceship Bridge Simulator6[self-published source?	Unofficial|
|2033	Yes	Yes	Civilization IV multiplayer7	Unofficial|
|2049	Yes, and SCTP	Yes	Network File System (NFS)	Official|
|2056	Yes	Yes	Civilization IV multiplayer7	Unofficial|
|2080	Yes	Yes	Autodesk NLM (FLEXlm)	Official|
|2082	Yes		cPanel default8	Unofficial|
|2083	Yes	Yes	Secure RADIUS Service (radsec)	Official|
|Yes		cPanel default SSL8	Unofficial|
|2086	Yes	Yes	GNUnet	Official|
|Yes		WebHost Manager default8	Unofficial|
|2087	Yes		WebHost Manager default SSL8	Unofficial|
|2095	Yes		cPanel default web mail8	Official|
|2096	Yes		cPanel default SSL web mail8	Unofficial|
|2100	Yes		Warzone 2100 multiplayer[citation needed	Unofficial|
|2101	Yes		Networked Transport of RTCM via Internet Protocol (NTRIP)[citation needed	Unofficial|
|2102	Yes	Yes	Zephyr Notification Service server	Official|
|2103	Yes	Yes	Zephyr Notification Service serv-hm connection	Official|
|2104	Yes	Yes	Zephyr Notification Service hostmanager	Official|
|2123	Yes	Yes	GTP control messages (GTP-C)	Official|
|2142	Yes	Yes	TDMoIP (TDM over IP)	Official|
|2152	Yes	Yes	GTP user data messages (GTP-U)	Official|
|2159	Yes	Yes	GDB remote debug port	Official|
|2181	Yes	Yes	EForward-document transport system	Official|
|Yes		Apache ZooKeeper default client port[citation needed	Unofficial|
|2195	Yes		Apple Push Notification Service9	Unofficial|
|2196	Yes		Apple Push Notification Service, feedback service9	Unofficial|
|2210	Yes	Yes	NOAAPORT Broadcast Network	Official|
|2211	Yes	Yes	EMWIN	Official|
|2221	Yes		ESET anti-virus updates0	Unofficial|
|2222	Yes	Yes	EtherNet/IP implicit messaging for IO data	Official|
|?	?	DirectAdmin Access1	Unofficial|
|2222–2226	Yes		ESET Remote administrator0	Official|
|2240	Yes	Yes	General Dynamics Remote Encryptor Configuration Information Protocol (RECIPe)	Official|
|2261	Yes	Yes	CoMotion master	Official|
|2262	Yes	Yes	CoMotion backup	Official|
|2302		Yes	ArmA multiplayer[citation needed	Unofficial|
|Yes	Halo: Combat Evolved multiplayer host2	Unofficial|
|2303		Yes	ArmA multiplayer (default port for game +1)[citation needed	Unofficial|
|Yes	Halo: Combat Evolved multiplayer listener2	Unofficial|
|2305		Yes	ArmA multiplayer (default port for game +3)[citation needed	Unofficial|
|2351	Yes		AIM game LAN network port[citation needed	Unofficial|
|2368	Yes		Ghost (blogging platform)3	Unofficial|
|2369	Yes		Default for BMC Control-M/Server Configuration Agent	Unofficial|
|2370	Yes		Default for BMC Control-M/Server, to allow the Control-M/Enterprise Manager to connect to the Control-M/Server	Unofficial|
|2372	Yes		Default for K9 Web Protection/parental controls, content filtering agent[citation needed	Unofficial|
|2375	Yes	Reserved	Docker REST API (plain)	Official|
|2376	Yes	Reserved	Docker REST API (SSL)	Official|
|2377	Yes	Reserved	Docker Swarm cluster management communications4[self-published source	Official|
|2379	Yes	Reserved	CoreOS etcd client communication	Official|
|Yes		KGS Go Server5	Unofficial|
|2380	Yes	Reserved	CoreOS etcd server communication	Official|
|2389	Assigned	Assigned	OpenView Session Mgr	Official|
|2399	Yes	Yes	FileMaker Data Access Layer (ODBC/JDBC)	Official|
|2401	Yes	Yes	CVS version control system password-based server	Official|
|2404	Yes	Yes	IEC 60870-5-104, used to send electric power telecontrol messages between two systems via directly connected data circuits	Official|
|2424	Yes		OrientDB database listening for binary client connections6	Unofficial|
|2427	Yes	Yes	Media Gateway Control Protocol (MGCP) media gateway	Official|
|2447	Yes	Yes	ovwdb—OpenView Network Node Manager (NNM) daemon	Official|
|2459	Yes	Yes	xrpl	Official|
|2480	Yes		OrientDB database listening for HTTP client connections6	Unofficial|
|2483	Yes	Yes	Oracle database listening for insecure client connections to the listener, replaces port 1521[when?	Official|
|2484	Yes	Yes	Oracle database listening for SSL client connections to the listener	Official|
|2500	Yes	Yes	NetFS communication7	Unofficial|
|2501		Yes	NetFS probe	Unofficial|
|2535	Yes	Yes	Multicast Address Dynamic Client Allocation Protocol (MADCAP).8 All standard messages are UDP datagrams.9	Official|
|2541	Yes	Yes	LonTalk/IP	Official|
|2546–2548	Yes	Yes	EVault data protection services	Official|
|2593	Yes	Yes	Ultima Online servers[citation needed	Unofficial|
|2598	Yes		Citrix Independent Computing Architecture (ICA) with Session Reliability; port 1494 without session reliability4	Unofficial|
|2599	Yes	Yes	Ultima Online servers[citation needed	Unofficial|
|2628	Yes	Yes	DICT 0	Official|
|2638	Yes	Yes	SQL Anywhere database server12	Official|
|2710	Yes	Yes	XBT Tracker.3 UDP tracker extension is considered experimental.4	Unofficial|
|2727	Yes	Yes	Media Gateway Control Protocol (MGCP) media gateway controller (call agent)	Official|
|2775	Yes	Yes	Short Message Peer-to-Peer (SMPP)[citation needed	Official|
|2809	Yes	Yes	corbaloc:iiop URL, per the CORBA 3.0.3 specification	Official|
|2811	Yes	Yes	gsi ftp, per the GridFTP specification	Official|
|2827	Yes		I2P BOB Bridge5	Unofficial|
|2944	Yes	Yes	Megaco text H.248	Official|
|2945	Yes	Yes	Megaco binary (ASN.1) H.248	Official|
|2947	Yes	Yes	gpsd, GPS daemon	Official|
|2948	Yes	Yes	WAP push Multimedia Messaging Service (MMS)	Official|
|2949	Yes	Yes	WAP push secure (MMS)	Official|
|2967	Yes	Yes	Symantec System Center agent (SSC-AGENT)	Official|
|3000	Yes		Cloud9 IDE server[citation needed	Unofficial|
|Yes		Ruby on Rails development default6	Unofficial|
|Yes		Meteor development default7[failed verification	Unofficial|
|Yes	Yes	Resilio Sync,8 spun from BitTorrent Sync.	Unofficial|
|Yes	Distributed Interactive Simulation (DIS)[citation needed	Unofficial|
|3004	Yes		iSync	Unofficial|
|3020	Yes	Yes	Common Internet File System (CIFS). See also port 445 for Server Message Block (SMB), a dialect of CIFS.	Official|
|3050	Yes	Yes	gds-db (Interbase/Firebird databases)	Official|
|3052	Yes	Yes	APC PowerChute Network	Official|
|3074	Yes	Yes	Xbox LIVE and Games for Windows – Live	Official|
|3101	Yes		BlackBerry Enterprise Server communication protocol9	Unofficial|
|3128	Yes	?	Squid caching web proxy0	Unofficial|
|3225	Yes	Yes	Fibre Channel over IP (FCIP)	Official|
|3233	Yes	Yes	WhiskerControl research control protocol	Official|
|3260	Yes	Yes	iSCSI	Official|
|3268	Yes	Yes	msft-gc, Microsoft Global Catalog (LDAP service which contains data from Active Directory forests)	Official|
|3269	Yes	Yes	msft-gc-ssl, Microsoft Global Catalog over SSL (similar to port 3268, LDAP over SSL)	Official|
|3283	Yes	Yes	Net Assistant, a predecessor to Apple Remote Desktop	Official|
|Yes	Yes	Apple Remote Desktop 2.0 or later	Unofficial|
|3290		Yes	Virtual Air Traffic Simulation (VATSIM) network voice communication[citation needed	Unofficial|
|3305	Yes	Yes	Odette File Transfer Protocol (OFTP)	Official|
|3306	Yes	Assigned	MySQL database system	Official|
|3323	Yes	Yes	DECE GEODI Server	Unofficial|
|3332		Yes	Thundercloud DataPath Overlay Control	Unofficial|
|3333	Yes		Eggdrop, an IRC bot default port1	Unofficial|
|Yes		Network Caller ID server	Unofficial|
|Yes		CruiseControl.rb2	Unofficial|
|3351	?	?	Pervasive PSQL3	Unofficial|
|3386	Yes	Yes	GTP' 3GPP GSM/UMTS CDR logging protocol	Official|
|3389	Yes	Yes	Microsoft Terminal Server (RDP) officially registered as Windows Based Terminal (WBT)3	Official|
|3396	Yes	Yes	Novell NDPS Printer Agent	Official|
|3412	Yes	Yes	xmlBlaster	Official|
|3423	Yes		Xware xTrm Communication Protocol	Official|
|3424	Yes		Xware xTrm Communication Protocol over SSL	Official|
|3455	Yes	Yes	Resource Reservation Protocol (RSVP)	Official|
|3478	Yes	Yes	STUN, a protocol for NAT traversal4	Official|
|Yes	Yes	TURN, a protocol for NAT traversal5 (extension to STUN)	Official|
|Yes	Yes	STUN Behavior Discovery.6 See also port 5349.	Official|
|3479	Yes	Yes	PlayStation Network7	Unofficial|
|3480	Yes	Yes	PlayStation Network7	Unofficial|
|3483		Yes	Slim Devices discovery protocol	Official|
|Yes		Slim Devices SlimProto protocol	Official|
|3493	Yes	Yes	Network UPS Tools (NUT)	Official|
|3516	Yes	Yes	Smartcard Port	Official|
|3527		Yes	Microsoft Message Queuing	Official|
|3535	Yes		SMTP alternate8	Unofficial|
|3544		Yes	Teredo tunneling	Official|
|3632	Yes	Assigned	Distcc, distributed compiler	Official|
|3645	Yes	Yes	Cyc	Official|
|3659	Yes	Yes	Apple SASL, used by Mac OS X Server Password Server	Official|
|Yes	Battlefield 4	Unofficial|
|3667	Yes	Yes	Information Exchange	Official|
|3689	Yes	Assigned	Digital Audio Access Protocol (DAAP), used by Apple's iTunes and AirPlay	Official|
|3690	Yes	Yes	Subversion (SVN) version control system	Official|
|3702	Yes	Yes	Web Services Dynamic Discovery (WS-Discovery), used by various components of Windows Vista and later	Official|
|3724	Yes	Yes	Some Blizzard games0	Official|
|Yes		Club Penguin Disney online game for kids	Unofficial|
|3725	Yes	Yes	Netia NA-ER Port	Official|
|3749	Yes	Yes	CimTrak registered port	Official|
|3768	Yes	Yes	RBLcheckd server daemon	Official|
|3784		Yes	Bidirectional Forwarding Detection (BFD)for IPv4 and IPv6 (Single Hop) (RFC 5881)	Official|
|3785		Yes	VoIP program used by Ventrilo	Unofficial|
|3799		Yes	RADIUS change of authorization	Official|
|3804	Yes	Yes	Harman Professional HiQnet protocol	Official|
|3825	Yes		RedSeal Networks client/server connection[citation needed	Unofficial|
|3826	Yes	Yes	WarMUX game server	Official|
|Yes		RedSeal Networks client/server connection[citation needed	Unofficial|
|3835	Yes		RedSeal Networks client/server connection[citation needed	Unofficial|
|3830	Yes	Yes	System Management Agent, developed and used by Cerner to monitor and manage solutions	Official|
|3856	Yes	Yes	ERP Server Application used by F10 Software	Unofficial|
|3880	Yes	Yes	IGRS	Official|
|3868	Yes, and SCTP		Diameter base protocol (RFC 3588)	Official|
|3872	Yes		Oracle Enterprise Manager Remote Agent	Official|
|3900	Yes		udt_os, IBM UniData UDT OS9	Official|
|3960		Yes	Warframe online interaction[citation needed	Unofficial|
|3962		Yes	Warframe online interaction[citation needed	Unofficial|
|3978	Yes	Yes	OpenTTD game (masterserver and content service)	Unofficial|
|3979	Yes	Yes	OpenTTD game	Unofficial|
|3999	Yes	Yes	Norman distributed scanning service	Official|
|4000	Yes	Yes	Diablo II game	Unofficial|
|4001	Yes		Microsoft Ants game	Unofficial|
|Yes		CoreOS etcd client communication	Unofficial|
|4018	Yes	Yes	Protocol information and warnings[clarification needed	Official|
|4035	Yes		IBM Rational Developer for System z Remote System Explorer Daemon	Unofficial|
|4045	Yes	Yes	Solaris lockd NFS lock daemon/manager	Unofficial|
|4050	Yes		Mud Master Chat protocol (MMCP) - Peer-to-peer communications between MUD clients.0	Unofficial|
|4069		Yes	Minger Email Address Verification Protocol1	Official|
|4070	Yes	Yes	Amazon Echo Dot (Amazon Alexa) streaming connection with Spotify2	Unofficial|
|4089	Yes	Yes	OpenCORE Remote Control Service	Official|
|4090	Yes	Yes	Kerio	Official|
|4093	Yes	Yes	PxPlus Client server interface ProvideX	Official|
|4096	Yes	Yes	Ascom Timeplex Bridge Relay Element (BRE)	Official|
|4105	Yes	Yes	Shofar (ShofarNexus)	Official|
|4111	Yes	Assigned	Xgrid	Official|
|4116	Yes	Yes	Smartcard-TLS	Official|
|4125	Yes		Microsoft Remote Web Workplace administration	Unofficial|
|4172	Yes	Yes	Teradici PCoIP	Official|
|4190	Yes		ManageSieve3	Official|
|4198	Yes	Yes	Couch Potato Android app4	Unofficial|
|4201	Yes		TinyMUD and various derivatives	Unofficial|
|4222	Yes		NATS server default port5	Unofficial|
|4226	Yes	Yes	Aleph One, a computer game	Unofficial|
|4242	Yes		Orthanc – DICOM server6	Unofficial|
|Yes		Quassel distributed IRC client	Unofficial|
|4243	Yes		Docker implementations, redistributions, and setups default7[needs update?	Unofficial|
|Yes		CrashPlan	Unofficial|
|4244	Yes	Yes	Viber8	Unofficial|
|4303	Yes	Yes	Simple Railroad Command Protocol (SRCP)	Official|
|4307	Yes		TrueConf Client - TrueConf Server media data exchange9	Official|
|4321	Yes		Referral Whois (RWhois) Protocol0	Official|
|4444	Yes	Yes	Oracle WebCenter Content: Content Server—Intradoc Socket port. (formerly known as Oracle Universal Content Management).	Unofficial|
|?	?	Metasploit's default listener port[citation needed	Unofficial|
|Yes	Yes	Xvfb X server virtual frame buffer service	Unofficial|
|4444–4445	Yes		I2P HTTP/S proxy	Unofficial|
|4486	Yes	Yes	Integrated Client Message Service (ICMS)	Official|
|4488	Yes	Assigned	Apple Wide Area Connectivity Service, used by Back to My Mac	Official|
|4500	Assigned	Yes	IPSec NAT Traversal (RFC 3947, RFC 4306)	Official|
|4502–4534	Yes		Microsoft Silverlight connectable ports under non-elevated trust	Official|
|4505–4506	Yes		Salt master	Unofficial|
|4534		Yes	Armagetron Advanced server default	Unofficial|
|4560	Yes		default Log4j socketappender port	Unofficial|
|4567	Yes		Sinatra default server port in development mode (HTTP)	Unofficial|
|4569		Yes	Inter-Asterisk eXchange (IAX2)	Official|
|4604	Yes		Identity Registration Protocol	Official|
|4605	Yes		Direct End to End Secure Chat Protocol	Official|
|4610–4640	Yes		QualiSystems TestShell Suite Services	Unofficial|
|4662	Yes	Yes	OrbitNet Message Service	Official|
|Yes		Default for older versions of eMule1	Unofficial|
|4664	Yes		Google Desktop Search	Unofficial|
|4672		Yes	Default for older versions of eMule1	Unofficial|
|4711	Yes		eMule optional web interface1	Unofficial|
|4713	Yes		PulseAudio sound server	Unofficial|
|4728	Yes		Computer Associates Desktop and Server Management (DMP)/Port Multiplexer2	Official|
|4730	Yes	Yes	Gearman's job server	Official|
|4739	Yes	Yes	IP Flow Information Export	Official|
|4747	Yes		Apprentice	Unofficial|
|4753	Yes	Yes	SIMON (service and discovery)	Official|
|4789		Yes	Virtual eXtensible Local Area Network (VXLAN)	Official|
|4791		Yes	IP Routable RocE (RoCEv2)	Official|
|4840	Yes	Yes	OPC UA Connection Protocol (TCP) and OPC UA Multicast Datagram Protocol (UDP) for OPC Unified Architecture from OPC Foundation	Official|
|4843	Yes	Yes	OPC UA TCP Protocol over TLS/SSL for OPC Unified Architecture from OPC Foundation	Official|
|4847	Yes	Yes	Web Fresh Communication, Quadrion Software & Odorless Entertainment	Official|
|4848	Yes		Java, Glassfish Application Server administration default	Unofficial|
|4894	Yes	Yes	LysKOM Protocol A	Official|
|4944	No	Yes	DrayTek DSL Status Monitoring3[self-published source	Unofficial|
|4949	Yes		Munin Resource Monitoring Tool	Official|
|4950	Yes	Yes	Cylon Controls UC32 Communications Port	Official|
|5000	Yes		UPnP—Windows network device interoperability	Unofficial|
|Yes	Yes	VTun, VPN Software	Unofficial|
|Yes	FlightGear multiplayer4	Unofficial|
|Yes		Synology Inc. Management Console, File Station, Audio Station	Unofficial|
|Yes		Flask Development Webserver	Unofficial|
|Yes		Heroku console access	Unofficial|
|?	?	Docker Registry5[self-published source	Unofficial|
|Yes		AT&T U-verse public, educational, and government access (PEG) streaming over HTTP6[self-published source?	Unofficial|
|?	?	High-Speed SECS Message Services[citation needed	Unofficial|
|Yes		3CX Phone System Legacy Management Console	Unofficial|
|5000–5500	No	Yes	League of Legends, a multiplayer online battle arena video game7	Unofficial|
|5001	Yes		Slingbox and Slingplayer	Unofficial|
|Yes	Yes	Iperf (Tool for measuring TCP and UDP bandwidth performance)	Unofficial|
|Yes		Synology Inc. Secured Management Console, File Station, Audio Station	Unofficial|
|Yes		3CX Phone System Secured Management Console, Secure API	Unofficial|
|5002	Yes		ASSA ARX access control system8	Unofficial|
|5003	Yes	Assigned	FileMaker – name binding and transport	Official|
|5004	Yes, and DCCP	Yes	Real-time Transport Protocol media data (RTP) (RFC 3551, RFC 4571)	Official|
|5005	Yes, and DCCP	Yes	Real-time Transport Protocol control protocol (RTCP) (RFC 3551, RFC 4571)	Official|
|5010	Yes	Yes	Registered to: TelePath (the IBM FlowMark workflow-management system messaging platform)9|
|The TCP port is now used for: IBM WebSphere MQ Workflow	Official|
|5011	Yes	Yes	TelePath (the IBM FlowMark workflow-management system messaging platform)9	Official|
|5025	Yes	Yes	scpi-raw Standard Commands for Programmable Instruments	Official|
|5029		Yes	Sonic Robo Blast 2 and Sonic Robo Blast 2 Kart servers	Unofficial|
|5031	Yes	Yes	AVM CAPI-over-TCP (ISDN over Ethernet tunneling)[citation needed	Unofficial|
|5037	Yes		Android ADB server	Unofficial|
|5044	Yes		Standard port in Filebeats/Logstash implementation of Lumberjack protocol.	Official|
|5048	Yes		Texai Message Service	Official|
|5050	Yes		Yahoo! Messenger	Unofficial|
|5051	Yes		ita-agent Symantec Intruder Alert0	Official|
|5060	Yes	Yes	Session Initiation Protocol (SIP)	Official|
|5061	Yes		Session Initiation Protocol (SIP) over TLS	Official|
|5062	Yes	Yes	Localisation access	Official|
|5064	Yes	Yes	EPICS Channel Access server1	Official|
|5065	Assigned	Yes	EPICS Channel Access repeater beacon1	Official|
|5070	Yes	No	Binary Floor Control Protocol (BFCP)2	Unofficial|
|5084	Yes	Yes	EPCglobal Low Level Reader Protocol (LLRP)	Official|
|5085	Yes	Yes	EPCglobal Low Level Reader Protocol (LLRP) over TLS	Official|
|5090	Yes	Yes	3CX Phone System 3CX Tunnel Protocol, 3CX App API, 3CX Session Border Controller	Unofficial|
|5093		Yes	SafeNet, Inc Sentinel LM, Sentinel RMS, License Manager, client-to-server	Official|
|5099	Yes	Yes	SafeNet, Inc Sentinel LM, Sentinel RMS, License Manager, server-to-server	Official|
|5104	Yes		IBM Tivoli Framework NetCOOL/Impact3 HTTP Service	Unofficial|
|5121	Yes		Neverwinter Nights	Unofficial|
|5124	Yes	Yes	TorgaNET (Micronational Darknet)	Unofficial|
|5125	Yes	Yes	TorgaNET (Micronational Intelligence Darknet)	Unofficial|
|5150	Yes	Yes	ATMP Ascend Tunnel Management Protocol4	Official|
|5151	Yes		ESRI SDE Instance	Official|
|Yes	ESRI SDE Remote Start	Official|
|5154	Yes	Yes	BZFlag	Official|
|5172	Yes		PC over IP Endpoint Management5	Official|
|5190	Yes	Yes	AOL Instant Messenger protocol. The chat app is defunct as of 15 December 2017.6	Official|
|5198		Yes	EchoLink VoIP Amateur Radio Software (Voice)	Unofficial|
|5199		Yes	EchoLink VoIP Amateur Radio Software (Voice)	Unofficial|
|5200	Yes		EchoLink VoIP Amateur Radio Software (Information)	Unofficial|
|5201	Yes	Yes	Iperf3 (Tool for measuring TCP and UDP bandwidth performance)	Unofficial|
|5222	Yes	Reserved	Extensible Messaging and Presence Protocol (XMPP) client connection78	Official|
|5223	Yes		Apple Push Notification Service9	Unofficial|
|Yes		Extensible Messaging and Presence Protocol (XMPP) client connection over SSL	Unofficial|
|5228	Yes		HP Virtual Room Service	Official|
|Yes		Google Play, Android Cloud to Device Messaging Service, Google Cloud Messaging	Unofficial|
|5242	Yes	Yes	Viber8	Unofficial|
|5243	Yes	Yes	Viber8	Unofficial|
|5246		Yes	Control And Provisioning of Wireless Access Points (CAPWAP) CAPWAP control9	Official|
|5247		Yes	Control And Provisioning of Wireless Access Points (CAPWAP) CAPWAP data9	Official|
|5269	Yes		Extensible Messaging and Presence Protocol (XMPP) server-to-server connection78	Official|
|5280	Yes		Extensible Messaging and Presence Protocol (XMPP)0	Official|
|5281	Yes		Extensible Messaging and Presence Protocol (XMPP)1	Unofficial|
|5298	Yes	Yes	Extensible Messaging and Presence Protocol (XMPP)2	Official|
|5310	Assigned	Yes	Outlaws, a 1997 first-person shooter video game[citation needed	Official|
|5318	Yes	Reserved	Certificate Management over CMS3	Official|
|5349	Yes/No	Yes/No	STUN over TLS/DTLS, a protocol for NAT traversal4	Official|
|Yes/No	Yes/No	TURN over TLS/DTLS, a protocol for NAT traversal5	Official|
|Yes	Reserved	STUN Behavior Discovery over TLS.6 See also port 3478.	Official|
|5351	Reserved	Yes	NAT Port Mapping Protocol and Port Control Protocol—client-requested configuration for connections through network address translators and firewalls	Official|
|5353	Assigned	Yes	Multicast DNS (mDNS)	Official|
|5355	Yes	Yes	Link-Local Multicast Name Resolution (LLMNR), allows hosts to perform name resolution for hosts on the same local link (only provided by Windows Vista and Server 2008)	Official|
|5357	Yes	Yes	Web Services for Devices (WSDAPI) (only provided by Windows Vista, Windows 7 and Server 2008)	Unofficial|
|5358	Yes	Yes	WSDAPI Applications to Use a Secure Channel (only provided by Windows Vista, Windows 7 and Server 2008)	Unofficial|
|5394		Yes	Kega Fusion, a Sega multi-console emulator45	Unofficial|
|5402	Yes	Yes	Multicast File Transfer Protocol (MFTP)6[importance?	Official|
|5405	Yes	Yes	NetSupport Manager	Official|
|5412	Yes	Yes	IBM Rational Synergy (Telelogic Synergy) (Continuus CM) Message Router	Official|
|5413	Yes	Yes	Wonderware SuiteLink service	Official|
|5417	Yes	Yes	SNS Agent	Official|
|5421	Yes	Yes	NetSupport Manager	Official|
|5432	Yes	Assigned	PostgreSQL database system	Official|
|5433	Yes		Bouwsoft file/webserver7	Unofficial|
|5445		Yes	Cisco Unified Video Advantage[citation needed	Unofficial|
|5480	Yes		VMware VAMI (Virtual Appliance Management Infrastructure)—used for initial setup of various administration settings on Virtual Appliances designed using the VAMI architecture.	Unofficial|
|5481	Yes		Schneider Electric's ClearSCADA (SCADA implementation for Windows) — used for client-to-server communication.8	Unofficial|
|5495	Yes		IBM Cognos TM1 Admin server	Unofficial|
|5498	Yes		Hotline tracker server connection	Unofficial|
|5499		Yes	Hotline tracker server discovery	Unofficial|
|5500	Yes		Hotline control connection	Unofficial|
|Yes		VNC Remote Frame Buffer RFB protocol—for incoming listening viewer	Unofficial|
|5501	Yes		Hotline file transfer connection	Unofficial|
|5517	Yes		Setiqueue Proxy server client for SETI@Home project	Unofficial|
|5550	Yes		Hewlett-Packard Data Protector[citation needed	Unofficial|
|5554	Yes	Yes	Fastboot default wireless port	Unofficial|
|5555	Yes	Yes	Oracle WebCenter Content: Inbound Refinery—Intradoc Socket port. (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
|Yes		Freeciv versions up to 2.0, Hewlett-Packard Data Protector, McAfee EndPoint Encryption Database Server, SAP, Default for Microsoft Dynamics CRM 4.0, Softether VPN default port	Unofficial|
|5556	Yes	Yes	Freeciv, Oracle WebLogic Server Node Manager9	Official|
|5568	Yes	Yes	Session Data Transport (SDT), a part of Architecture for Control Networks (ACN)0[full citation needed	Official|
|5601	Yes		Kibana[citation needed	Unofficial|
|5631	Yes		pcANYWHEREdata, Symantec pcAnywhere (version 7.52 and later1)2 data	Official|
|5632		Yes	pcANYWHEREstat, Symantec pcAnywhere (version 7.52 and later) status	Official|
|5656	Yes		IBM Lotus Sametime p2p file transfer	Unofficial|
|5666	Yes		NRPE (Nagios)	Unofficial|
|5667	Yes		NSCA (Nagios)	Unofficial|
|5670	Yes		FILEMQ ZeroMQ File Message Queuing Protocol	Official|
|Yes	ZRE-DISC ZeroMQ Realtime Exchange Protocol (Discovery)	Official|
|5671	Yes	Assigned	Advanced Message Queuing Protocol (AMQP)3 over TLS	Official|
|5672	Yes, and SCTP	Assigned	Advanced Message Queuing Protocol (AMQP)3	Official|
|5683	Yes	Yes	Constrained Application Protocol (CoAP)	Official|
|5684	Yes/No	Yes	Constrained Application Protocol Secure (CoAPs)	Official|
|5693	Yes		Nagios Cross Platform Agent (NCPA)4	Unofficial|
|5701	Yes		Hazelcast default communication port5	Unofficial|
|5722	Yes	Yes	Microsoft RPC, DFSR (SYSVOL) Replication Service[citation needed	Official|
|5718	Yes		Microsoft DPM Data Channel (with the agent coordinator)	Unofficial|
|5719	Yes		Microsoft DPM Data Channel (with the protection agent)	Unofficial|
|5723	Yes		System Center Operations Manager6	Unofficial|
|5724	Yes		Operations Manager Console	Unofficial|
|5741	Yes	Yes	IDA Discover Port 1	Official|
|5742	Yes	Yes	IDA Discover Port 2	Official|
|5800	Yes		VNC Remote Frame Buffer RFB protocol over HTTP	Unofficial|
|Yes		ProjectWise Server7	Unofficial|
|5900	Yes	Yes	Remote Frame Buffer protocol (RFB)	Official|
|Yes		Virtual Network Computing (VNC) Remote Frame Buffer RFB protocol8	Unofficial|
|5931	Yes	Yes	AMMYY admin Remote Control	Official|
|5938	Yes	Yes	TeamViewer remote desktop protocol9	Unofficial|
|5984	Yes	Yes	CouchDB database server	Official|
|5985	Yes		Windows PowerShell Default psSession Port0 Windows Remote Management Service (WinRM-HTTP)1	Official|
|5986	Yes		Windows PowerShell Default psSession Port0 Windows Remote Management Service (WinRM-HTTPS)1	Official|
|5988–5989	Yes		CIM-XML (DMTF Protocol)2	Official|
|6000–6063	Yes	Yes	X11—used between an X client and server over the network	Official|
|6005	Yes		Default for BMC Software Control-M/Server—Socket used for communication between Control-M processes—though often changed during installation	Unofficial|
|Yes		Default for Camfrog chat & cam client	Unofficial|
|6009	Yes		JD Edwards EnterpriseOne ERP system JDENet messaging client listener	Unofficial|
|6050	Yes		Arcserve backup	Unofficial|
|6051	Yes		Arcserve backup	Unofficial|
|6086	Yes		Peer Distributed Transfer Protocol (PDTP), FTP like file server in a P2P network	Official|
|6100	Yes		Vizrt System	Unofficial|
|Yes		Ventrilo authentication for version 3	Unofficial|
|6101	Yes		Backup Exec Agent Browser[citation needed	Unofficial|
|6110	Yes	Yes	softcm, HP Softbench CM	Official|
|6111	Yes	Yes	spc, HP Softbench Sub-Process Control	Official|
|6112	Yes	Yes	dtspcd, execute commands and launch applications remotely	Official|
|Yes	Yes	Blizzard's Battle.net gaming service and some games,0 ArenaNet gaming service, Relic gaming service	Unofficial|
|Yes		Club Penguin Disney online game for kids	Unofficial|
|6113	Yes		Club Penguin Disney online game for kids, Used by some Blizzard games0	Unofficial|
|6136	Yes		ObjectDB database server3[self-published source	Unofficial|
|6159	Yes		ARINC 840 EFB Application Control Interface	Official|
|6200	Yes		Oracle WebCenter Content Portable: Content Server (With Native UI) and Inbound Refinery	Unofficial|
|6201	Yes		Oracle WebCenter Content Portable: Admin	Unofficial|
|6225	Yes		Oracle WebCenter Content Portable: Content Server Web UI	Unofficial|
|6227	Yes		Oracle WebCenter Content Portable: JavaDB	Unofficial|
|6240	Yes		Oracle WebCenter Content Portable: Capture	Unofficial|
|6244	Yes	Yes	Oracle WebCenter Content Portable: Content Server—Intradoc Socket port	Unofficial|
|6255	Yes	Yes	Oracle WebCenter Content Portable: Inbound Refinery—Intradoc Socket port	Unofficial|
|6257		Yes	WinMX (see also 6699)	Unofficial|
|6260	Yes	Yes	planet M.U.L.E.	Unofficial|
|6262	Yes		Sybase Advantage Database Server	Unofficial|
|6343		Yes	SFlow, sFlow traffic monitoring	Official|
|6346	Yes	Yes	gnutella-svc, gnutella (FrostWire, Limewire, Shareaza, etc.)	Official|
|6347	Yes	Yes	gnutella-rtr, Gnutella alternate	Official|
|6350	Yes	Yes	App Discovery and Access Protocol	Official|
|6379	Yes		Redis key-value data store	Official|
|6389	Yes		EMC CLARiiON	Unofficial|
|6432	Yes		PgBouncer—A connection pooler for PostgreSQL	Official|
|6436	Yes		Leap Motion Websocket Server TLS	Unofficial|
|6437	Yes		Leap Motion Websocket Server	Unofficial|
|6444	Yes	Yes	Sun Grid Engine Qmaster Service	Official|
|6445	Yes	Yes	Sun Grid Engine Execution Service	Official|
|6463–6472	Yes		Discord RPC4	Unofficial|
|6464	Yes	Yes	Port assignment for medical device communication in accordance to IEEE 11073-20701	Official|
|6502	Yes	Yes	Netop Remote Control	Unofficial|
|6513	Yes		NETCONF over TLS	Official|
|6514	Yes		Syslog over TLS5	Official|
|6515	Yes	Yes	Elipse RPC Protocol (REC)	Official|
|6516			Windows Admin Center	Unofficial|
|6543	Yes		Pylons project#Pyramid Default Pylons Pyramid web service port	Unofficial|
|6556	Yes		Check MK Agent	Unofficial|
|6566	Yes		SANE (Scanner Access Now Easy)—SANE network scanner daemon6	Official|
|6560–6561	Yes		Speech-Dispatcher daemon[citation needed	Unofficial|
|6571			Windows Live FolderShare client	Unofficial|
|6600	Yes		Microsoft Hyper-V Live	Official|
|Yes		Music Player Daemon (MPD)	Unofficial|
|6601	Yes		Microsoft Forefront Threat Management Gateway	Official|
|6602	Yes		Microsoft Windows WSS Communication	Official|
|6619	Yes	Yes	odette-ftps, Odette File Transfer Protocol (OFTP) over TLS/SSL	Official|
|6622	Yes	Yes	Multicast FTP	Official|
|6653	Yes	Assigned	OpenFlow[citation needed	Official|
|6660–6664	Yes		Internet Relay Chat (IRC)	Unofficial|
|6665–6669	Yes		Internet Relay Chat (IRC)	Official|
|6679	Yes	Yes	Osorno Automation Protocol (OSAUT)	Official|
|Yes		IRC SSL (Secure Internet Relay Chat)—often used	Unofficial|
|6690	Yes		Synology Cloud station	Unofficial|
|6697	Yes		IRC SSL (Secure Internet Relay Chat)—often used	Official|
|6699	Yes		WinMX (see also 6257)	Unofficial|
|6715	Yes		AberMUD and derivatives default port	Unofficial|
|6771		Yes	BitTorrent Local Peer Discovery	Unofficial|
|6783–6785	Yes		Splashtop Remote server broadcast	Unofficial|
|6881–6887	Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|6888	Yes	Yes	MUSE	Official|
|Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|6889–6890	Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|6891–6900	Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|6891–6900	Yes	Yes	Windows Live Messenger (File transfer)	Unofficial|
|6901	Yes	Yes	Windows Live Messenger (Voice)	Unofficial|
|Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|6902–6968	Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|6969	Yes	Yes	acmsoda	Official|
|Yes		BitTorrent tracker	Unofficial|
|6970–6999	Yes	Yes	BitTorrent part of full range of ports used most often	Unofficial|
|Yes	QuickTime Streaming Server	Unofficial|
|7000	Yes		Default for Vuze's built-in HTTPS Bittorrent Tracker	Unofficial|
|Yes		Avira Server Management Console	Unofficial|
|7001	Yes		Avira Server Management Console	Unofficial|
|Yes		Default for BEA WebLogic Server's HTTP server, though often changed during installation	Unofficial|
|7002	Yes		Default for BEA WebLogic Server's HTTPS server, though often changed during installation	Unofficial|
|7005	Yes		Default for BMC Software Control-M/Server and Control-M/Agent for Agent-to-Server, though often changed during installation	Unofficial|
|7006	Yes		Default for BMC Software Control-M/Server and Control-M/Agent for Server-to-Agent, though often changed during installation	Unofficial|
|7010	Yes		Default for Cisco AON AMC (AON Management Console)7	Unofficial|
|7022	Yes		Database mirroring endpoints8	Unofficial|
|7023		Yes	Bryan Wilcutt T2-NMCS Protocol for SatCom Modems	Official|
|7025	Yes		Zimbra LMTP [mailbox—local mail delivery	Unofficial|
|7047	Yes		Zimbra conversion server	Unofficial|
|7070	Yes	Yes/No	Real Time Streaming Protocol (RTSP), used by QuickTime Streaming Server. TCP is used by default, UDP is used as an alternate.	Unofficial|
|7133	Yes		Enemy Territory: Quake Wars	Unofficial|
|7144	Yes		Peercast[citation needed	Unofficial|
|7145	Yes		Peercast[citation needed	Unofficial|
|7171	Yes		Tibia	Unofficial|
|7262	Yes	Yes	CNAP (Calypso Network Access Protocol)	Official|
|7272	Yes	Yes	WatchMe - WatchMe Monitoring	Official|
|7306	Yes		Zimbra mysql [mailbox[citation needed	Unofficial|
|7307	Yes		Zimbra mysql [logger[citation needed	Unofficial|
|7312		Yes	Sibelius License Server	Unofficial|
|7396	Yes		Web control interface for Folding@home v7.3.6 and later9	Unofficial|
|7400	Yes	Yes	RTPS (Real Time Publish Subscribe) DDS Discovery	Official|
|7401	Yes	Yes	RTPS (Real Time Publish Subscribe) DDS User-Traffic	Official|
|7402	Yes	Yes	RTPS (Real Time Publish Subscribe) DDS Meta-Traffic	Official|
|7471	Yes		Stateless Transport Tunneling (STT)	Unofficial|
|7473	Yes		Rise: The Vieneo Province	Official|
|7474	Yes		Neo4J Server webadmin0	Official|
|7478	Yes		Default port used by Open iT Server.1	Official|
|7542	Yes	Yes	Saratoga file transfer protocol23	Official|
|7547	Yes	Yes	CPE WAN Management Protocol (CWMP) Technical Report 069	Official|
|7575		Yes	Populous: The Beginning server	Unofficial|
|7624	Yes	Yes	Instrument Neutral Distributed Interface	Official|
|7631	Yes		ERLPhase	Official|
|7634	Yes		hddtemp—Utility to monitor hard drive temperature	Unofficial|
|7652–7654	Yes		I2P anonymizing overlay network	Unofficial|
|7655		Yes	I2P SAM Bridge Socket API	Unofficial|
|7656–7660	Yes		I2P anonymizing overlay network	Unofficial|
|7670	Yes		BrettspielWelt BSW Boardgame Portal	Unofficial|
|7680	Yes		Delivery Optimization for Windows 104	Unofficial|
|7687	Yes		Bolt database connection	Official|
|7707–7708		Yes	Killing Floor	Unofficial|
|7717		Yes	Killing Floor	Unofficial|
|7777	Yes		iChat server file transfer proxy	Unofficial|
|Yes		Oracle Cluster File System 2[citation needed	Unofficial|
|Yes		Windows backdoor program tini.exe default[citation needed	Unofficial|
|Yes		Just Cause 2: Multiplayer Mod Server[citation needed	Unofficial|
|Yes		Terraria default server	Unofficial|
|Yes	San Andreas Multiplayer (SA-MP) default port server	Unofficial|
|Yes	SCP: Secret Laboratory Multiplayer Server	Unofficial|
|7777–7788	Yes	Yes	Unreal Tournament series default server[citation needed	Unofficial|
|7831	Yes		Default used by Smartlaunch Internet Cafe Administration5 software	Unofficial|
|7880	Yes	Yes	PowerSchool Gradebook Server[citation needed	Unofficial|
|7890	Yes		Default that will be used by the iControl Internet Cafe Suite Administration software	Unofficial|
|7915	Yes		Default for YSFlight server6	Unofficial|
|7935	Yes		Fixed port used for Adobe Flash Debug Player to communicate with a debugger (Flash IDE, Flex Builder or fdb).7	Unofficial|
|7946	Yes	Yes	Docker Swarm communication among nodes4	Unofficial|
|7990	Yes		Atlassian Bitbucket (default port)[citation needed	Unofficial|
|8000	Yes		Commonly used for Internet radio streams such as SHOUTcast[citation needed, Icecast[citation needed and iTunes Radio	Unofficial|
|?	?	DynamoDB Local8[self-published source?	Unofficial|
|?	?	Django Development Webserver9[self-published source?	Unofficial|
|8005	Yes		Tomcat remote shutdown	Unofficial|
|8006	Yes		Quest AppAssure 5 API0	 Unofficial|
|?	?	Proxmox Virtual Environment admin web interface1	Unofficial|
|8007	Yes		Quest AppAssure 5 Engine0	Unofficial|
|8008	Yes	Yes	Alternative port for HTTP. See also ports 80 and 8080.	Official|
|Yes		IBM HTTP Server administration default[importance?	Unofficial|
|Yes		iCal, a calendar application by Apple	Unofficial|
|Yes	?	Matrix homeserver federation over HTTP2[self-published source?	Unofficial|
|8009	Yes		Apache JServ Protocol (ajp13)[citation needed	Unofficial|
|8010	Yes	?	Buildbot Web status page[citation needed	Unofficial|
|8042	?	?	Orthanc – REST API over HTTP6[self-published source?	Unofficial|
|8069	Yes		OpenERP 5.0 XML-RPC protocol3[self-published source?	Unofficial|
|8070	Yes		OpenERP 5.0 NET-RPC protocol3	Unofficial|
|8074	Yes	Yes	Gadu-Gadu	Official|
|8075	Yes		Killing Floor web administration interface[citation needed	Unofficial|
|8080	Yes	Yes	Alternative port for HTTP. See also ports 80 and 8008.	Official|
|Yes		Apache Tomcat4	Unofficial|
|Yes		Atlassian JIRA applications5[self-published source?	Unofficial|
|8088	Yes		Asterisk management access via HTTP[citation needed	Unofficial|
|8089	Yes	No	Splunk daemon management6[self-published source	Unofficial|
|Yes		Fritz!Box automatic TR-069 configuration7	Unofficial|
|8090	?	?	Atlassian Confluence8[self-published source?	Unofficial|
|Yes		Coral Content Distribution Network (legacy; 80 and 8080 now supported)9	Unofficial|
|?	?	Matrix identity server[citation needed	Unofficial|
|8091	?	?	CouchBase web administration0	Unofficial|
|8092	?	?	CouchBase API0	Unofficial|
|8111	Yes		JOSM Remote Control	Unofficial|
|8112	Yes		PAC Pacifica Coin	Unofficial|
|8116		Yes	Check Point Cluster Control Protocol	Unofficial|
|8118	Yes		Privoxy—advertisement-filtering Web proxy	Official|
|8123	Yes		Polipo Web proxy	Official|
|8139	Yes		Puppet (software) Client agent	Unofficial|
|8140	Yes		Puppet (software) Master server	Official|
|8172	Yes		Microsoft Remote Administration for IIS Manager1	Unofficial|
|8184	Yes		NCSA Brown Dog Data Access Proxy	Unofficial|
|8194–8195	?	?	Bloomberg Terminal2	Official|
|8200	Yes		GoToMyPC	Unofficial|
|Yes		MiniDLNA media server Web Interface	Unofficial|
|8222	?	?	VMware VI Web Access via HTTP3	Unofficial|
|8243	Yes	Yes	HTTPS listener for Apache Synapse4	Official|
|8245	Yes		Dynamic DNS for at least No-IP and DyDNS5	Unofficial|
|8280	Yes	Yes	HTTP listener for Apache Synapse4	Official|
|8281	Yes		HTTP Listener for Gatecraft Plugin	Unofficial|
|8291	Yes		Winbox—Default on a MikroTik RouterOS for a Windows application used to administer MikroTik RouterOS6	Unofficial|
|8303		Yes	Teeworlds Server	Unofficial|
|8332	Yes		Bitcoin JSON-RPC server7	Unofficial|
|8333	Yes		Bitcoin8	Unofficial|
|?	?	VMware VI Web Access via HTTPS3	Unofficial|
|8333	Yes		Zip Code Technology9	Unofficial|
|8337	Yes		VisualSVN Distributed File System Service (VDFS)0	Unofficial|
|8384	Yes		Syncthing web GUI	Unofficial|
|8388	Yes		Shadowsocks proxy server[citation needed	Unofficial|
|8443	Yes		SW Soft Plesk Control Panel	Unofficial|
|Yes		Apache Tomcat SSL	Unofficial|
|Yes		Promise WebPAM SSL	Unofficial|
|Yes		iCal over SSL	Unofficial|
|Yes		MineOs WebUi	Unofficial|
|8444	Yes		Bitmessage	Unofficial|
|8448	Yes	?	Matrix homeserver federation over HTTPS2	Unofficial|
|8484	Yes		MapleStory Login Server	Unofficial|
|8500	Yes		Adobe ColdFusion built-in web server1[self-published source?	Unofficial|
|8530	?	?	Windows Server Update Services over HTTP2[further explanation needed3	Unofficial|
|8531	?	?	Windows Server Update Services over HTTPS3[further explanation needed2	Unofficial|
|8580	?	?	Freegate, an Internet anonymizer and proxy tool4	Unofficial|
|8629	Yes		Tibero database[citation needed	Unofficial|
|8642	Yes		Lotus Notes Traveler auto synchronization for Windows Mobile and Nokia devices5	Unofficial|
|8691	Yes		Ultra Fractal, a fractal generation and rendering software application – distributed calculations over networked computers67[self-published source?	Unofficial|
|8765	Yes	?	Default port of a local GUN relay peer that the Internet Archive8[self-published source and others use as a decentralized mirror for censorship resistance.9[self-published source	Unofficial|
|8767		Yes	Voice channel of TeamSpeak 2,0 a proprietary Voice over IP protocol targeted at gamers[citation needed	Unofficial|
|8834	?	?	Nessus, a vulnerability scanner – remote XML-RPC web server1[third-party source needed	Unofficial|
|8840	?	?	Opera Unite, an extensible framework for web applications23	Unofficial|
|8880	Yes		Alternate port of CDDB (Compact Disc Database) protocol, used to look up audio CD (compact disc) information over the Internet.4 See also port 888.	Official|
|?	?	IBM WebSphere Application Server SOAP connector5[jargon	Unofficial|
|8883	Yes	Yes	Secure MQTT (MQTT over TLS)67	Official|
|8887	?	?	HyperVM over HTTP[citation needed	Unofficial|
|8888	?	?	HyperVM over HTTPS[citation needed	Unofficial|
|?	Yes	Freenet web UI (localhost only)[citation needed	Unofficial|
|?	?	Default for IPython8[self-published source? / Jupyter9[self-published source? notebook dashboards	Unofficial|
|?	?	MAMP0	Unofficial|
|8889	?	?	MAMP0	Unofficial|
|8983	?	?	Apache Solr1	Unofficial|
|8997	?	?	Alternate port for I2P Monotone Proxy5[jargon	Unofficial|
|8998	?	?	I2P Monotone Proxy5[jargon	Unofficial|
|8999	?	?	Alternate port for I2P Monotone Proxy5[jargon	Unofficial|
|9000	Yes		SonarQube Web Server2	Unofficial|
|Yes		DBGp	Unofficial|
|Yes		SqueezeCenter web server & streaming	Unofficial|
|Yes	UDPCast	Unofficial|
|Yes		Play! Framework web server3	Unofficial|
|Yes		Hadoop NameNode default port	Unofficial|
|Yes		PHP-FPM default port	Unofficial|
|Yes		QBittorrent's embedded torrent tracker default port4	Unofficial|
|9001	Yes	Yes	ETL Service Manager5	Official|
|Microsoft SharePoint authoring environment	Unofficial|
|cisco-xremote router configuration[citation needed	Unofficial|
|Tor network default	Unofficial|
|Yes		DBGp Proxy	Unofficial|
|Yes		HSQLDB default port	Unofficial|
|9002			Newforma Server comms	Unofficial|
|9006			De-Commissioned Port	Official|
|Yes		Tomcat in standalone mode	Unofficial|
|9030	Yes		Tor often used	Unofficial|
|9042	Yes		Apache Cassandra native protocol clients	Unofficial|
|9043	Yes		WebSphere Application Server Administration Console secure	Unofficial|
|9050–9051	Yes		Tor (SOCKS-5 proxy client)	Unofficial|
|9060	Yes		WebSphere Application Server Administration Console	Unofficial|
|9080	Yes	Yes	glrpc, Groove Collaboration software GLRPC	Official|
|Yes		WebSphere Application Server HTTP Transport (port 1) default	Unofficial|
|Yes		Remote Potato by FatAttitude, Windows Media Center addon	Unofficial|
|Yes		ServerWMC, Windows Media Center addon	Unofficial|
|9090	Yes		Prometheus metrics server	Unofficial|
|Yes		Openfire Administration Console	Unofficial|
|Yes		SqueezeCenter control (CLI)	Unofficial|
|Yes		Cherokee Admin Panel	Unofficial|
|9091	Yes		Openfire Administration Console (SSL Secured)	Unofficial|
|Yes		Transmission (BitTorrent client) Web Interface	Unofficial|
|9092	Yes		H2 (DBMS) Database Server	Unofficial|
|Yes		Apache Kafka A Distributed Streaming Platform6	Unofficial|
|9100	Yes	Assigned	PDL Data Stream, used for printing to certain network printers	Official|
|9101	Yes	Yes	Bacula Director	Official|
|9102	Yes	Yes	Bacula File Daemon	Official|
|9103	Yes	Yes	Bacula Storage Daemon	Official|
|9119	Yes	Yes	MXit Instant Messenger	Official|
|9150	Yes		Tor Browser	Unofficial|
|9191	Yes		Sierra Wireless Airlink	Unofficial|
|9199	Yes		Avtex LLC—qStats	Unofficial|
|9200	Yes		Elasticsearch7—default Elasticsearch port	Unofficial|
|9217	Yes		iPass Platform Service	Unofficial|
|9293	Yes		Sony PlayStation RemotePlay8	Unofficial|
|9300	Yes		IBM Cognos BI[citation needed	Unofficial|
|9303		Yes	D-Link Shareport Share storage and MFP printers[citation needed	Unofficial|
|9306	Yes		Sphinx Native API	Official|
|9309	Yes	Yes	Sony PlayStation Vita Host Collaboration WiFi Data Transfer9	Unofficial|
|9312	Yes		Sphinx SphinxQL	Official|
|9332	Yes		Litecoin JSON-RPC server	Unofficial|
|9333	Yes		Litecoin	Unofficial|
|9339	Yes		Clash of Clans, a mobile freemium strategy video game	Unofficial|
|9389	Yes	Yes	adws, Microsoft AD DS Web Services, Powershell uses this port	Official|
|9392	Yes	?	OpenVAS Greenbone Security Assistant web interface	Unofficial|
|9418	Yes	Yes	git, Git pack transfer service	Official|
|9419	Yes		MooseFS distributed file system – master control port0[self-published source	Unofficial|
|9420	Yes		MooseFS distributed file system – master command port0	Unofficial|
|9421	Yes		MooseFS distributed file system – master client port0	Unofficial|
|9422	Yes		MooseFS distributed file system – Chunkservers0	Unofficial|
|9425	Yes		MooseFS distributed file system – CGI server0	Unofficial|
|9443	Yes		VMware Websense Triton console (HTTPS port used for accessing and administrating a vCenter Server via the Web Management Interface)	Unofficial|
|Yes		NCSA Brown Dog Data Tilling Service	Unofficial|
|9535	Yes	Yes	mngsuite, LANDesk Management Suite Remote Control	Official|
|9536	Yes	Yes	laes-bf, IP Fabrics Surveillance buffering function	Official|
|9600	No	Yes	Factory Interface Network Service (FINS), a network protocol used by Omron programmable logic controllers[citation needed	Unofficial|
|9675	Yes	Yes	Spiceworks Desktop, IT Helpdesk Software	Unofficial|
|9676	Yes	Yes	Spiceworks Desktop, IT Helpdesk Software	Unofficial|
|9695	?	?	Content centric networking (CCN, CCNx)[citation needed	Official|
|9785	Yes	Yes	Viber8	Unofficial|
|9800	Yes	Yes	WebDAV Source	Official|
|WebCT e-learning portal	Unofficial|
|9875	Yes		Club Penguin Disney online game for kids	Unofficial|
|9898	Yes		Tripwire—File Integrity Monitoring Software1	Unofficial|
|9899		Yes	SCTP tunneling (port number used in SCTP packets encapsulated in UDP, RFC 6951)	Official|
|9901	Yes		Banana for Apache Solr	Unofficial|
|9981	Yes		Tvheadend HTTP server (web interface)2	Unofficial|
|9982	Yes		Tvheadend HTSP server (Streaming protocol)2	Unofficial|
|9987		Yes	TeamSpeak 3 server default (voice) port (for the conflicting service see the IANA list)	Unofficial|
|9993		Yes	ZeroTier Default port for ZeroTier	Unofficial|
|9997	Yes		Splunk port for communication between the forwarders and indexers	Unofficial|
|9999			Urchin Web Analytics[citation needed	Unofficial|
|10000	Yes	Yes	Network Data Management Protocol	Official|
|BackupExec	Unofficial|
|Webmin, Web-based Unix/Linux system administration tool (default port)	Unofficial|
|10000–20000	No	Yes	Used on VoIP networks for receiving and transmitting voice telephony traffic which includes Google Voice via the OBiTalk ATA devices as well as on the MagicJack and Vonage ATA network devices.3	Unofficial|
|10001		Yes	Ubiquiti UniFi access points broadcast to 255.255.255.255:10001 (UDP) to locate the controller(s)	Unofficial|
|10009	Yes	Yes	CrossFire, a multiplayer online First Person Shooter[citation needed	Unofficial|
|10010	Yes		Open Object Rexx (ooRexx) rxapi daemon	Official|
|10024	Yes		Zimbra smtp [mta—to amavis from postfix[citation needed	Unofficial|
|10025	Yes		Zimbra smtp [mta—back to postfix from amavis[citation needed	Unofficial|
|10042	Yes		Mathoid server[citation needed	Unofficial|
|10050	Yes	Yes	Zabbix agent	Official|
|10051	Yes	Yes	Zabbix trapper	Official|
|10080	Yes		Touhou fight games (Immaterial and Missing Power, Scarlet Weather Rhapsody, Hisoutensoku, Hopeless Masquerade and Urban Legend in Limbo)	Unofficial|
|10110	Yes	Yes	NMEA 0183 Navigational Data. Transport of NMEA 0183 sentences over TCP or UDP	Official|
|10172	Yes		Intuit Quickbooks client	Unofficial|
|10200	Yes		FRISK Software International's fpscand virus scanning daemon for Unix platforms4	Unofficial|
|Yes		FRISK Software International's f-protd virus scanning daemon for Unix platforms5	Unofficial|
|10201–10204	Yes		FRISK Software International's f-protd virus scanning daemon for Unix platforms5	Unofficial|
|10212	Yes		GE Intelligent Platforms Proficy HMI/SCADA – CIMPLICITY WebView6	Official|
|10308	?	?	Lock On: Modern Air Combat[citation needed	Unofficial|
|10480	?	?	SWAT 4 Dedicated Server[citation needed	Unofficial|
|10505		Yes	BlueStacks (android simulator) broadcast7	Unofficial|
|10514	Yes	Yes	TLS-enabled Rsyslog (default by convention)	Unofficial|
|10823		Yes	Farming Simulator 2011[citation needed	Unofficial|
|10891	Yes		Jungle Disk (this port is opened by the Jungle Disk Monitor service on the localhost)[citation needed	Unofficial|
|10933	Yes	No	Octopus Deploy Tentacle deployment agent8	Official|
|11001	Yes	Yes	metasys ( Johnson Controls Metasys java AC control environment )	Official|
|11111	Yes		RiCcI, Remote Configuration Interface (Redhat Linux)	Unofficial|
|11112	Yes	Yes	ACR/NEMA Digital Imaging and Communications in Medicine (DICOM)	Official|
|11211	Yes	Yes	memcached	Unofficial|
|11214	Yes	Yes	memcached incoming SSL proxy	Unofficial|
|11215	Yes	Yes	memcached internal outgoing SSL proxy	Unofficial|
|11235			Savage: Battle for Newerth[citation needed	Unofficial|
|11311	Yes	Yes	Robot Operating System master	Unofficial|
|11371	Yes	Yes	OpenPGP HTTP key server	Official|
|11753	Yes		OpenRCT2 multiplayer9[self-published source	Unofficial|
|12000	Yes	Yes	CubeForm, Multiplayer SandBox Game	Unofficial|
|12012		Yes	Audition Online Dance Battle, Korea Server—Status/Version Check	Unofficial|
|12013	Yes	Yes	Audition Online Dance Battle, Korea Server	Unofficial|
|12035		Yes	Second Life, used for server UDP in-bound0	Unofficial|
|12043	Yes		Second Life, used for LSL HTTPS in-bound1	Unofficial|
|12046	Yes		Second Life, used for LSL HTTP in-bound1	Unofficial|
|12201	Yes	Yes	Graylog Extended Log Format (GELF)2[importance?	Unofficial|
|12222		Yes	Light Weight Access Point Protocol (LWAPP) LWAPP data (RFC 5412)	Official|
|12223		Yes	Light Weight Access Point Protocol (LWAPP) LWAPP control (RFC 5412)	Official|
|12345	Yes	Yes	Cube World3	Unofficial|
|Yes		Little Fighter 2	Unofficial|
|NetBus remote administration tool (often Trojan horse).	Unofficial|
|12443	Yes		IBM HMC web browser management access over HTTPS instead of default port 4434	Unofficial|
|12489	Yes		NSClient/NSClient++/NC_Net (Nagios)	Unofficial|
|12975	Yes		LogMeIn Hamachi (VPN tunnel software; also port 32976)—used to connect to Mediation Server (bibi.hamachi.cc); will attempt to use SSL (TCP port 443) if both 12975 & 32976 fail to connect	Unofficial|
|13000–13050		Yes	Second Life, used for server UDP in-bound5	Unofficial|
|13008	Yes	Yes	CrossFire, a multiplayer online First Person Shooter[citation needed	Unofficial|
|13075	Yes		Default6 for BMC Software Control-M/Enterprise Manager Corba communication, though often changed during installation	Official|
|13400	Yes	Yes	ISO 13400 Road vehicles — Diagnostic communication over Internet Protocol(DoIP)	Official|
|13720	Yes	Yes	Symantec NetBackup—bprd (formerly VERITAS)	Official|
|13721	Yes	Yes	Symantec NetBackup—bpdbm (formerly VERITAS)	Official|
|13724	Yes	Yes	Symantec Network Utility—vnetd (formerly VERITAS)	Official|
|13782	Yes	Yes	Symantec NetBackup—bpcd (formerly VERITAS)	Official|
|13783	Yes	Yes	Symantec VOPIED protocol (formerly VERITAS)	Official|
|13785	Yes	Yes	Symantec NetBackup Database—nbdb (formerly VERITAS)	Official|
|13786	Yes	Yes	Symantec nomdb (formerly VERITAS)	Official|
|14550		Yes	MAVLink Ground Station Port	Unofficial|
|14567		Yes	Battlefield 1942 and mods	Unofficial|
|15000	Yes		psyBNC	Unofficial|
|Yes		Wesnoth	Unofficial|
|Yes		Kaspersky Network Agent[citation needed	Unofficial|
|Yes	Teltonika networks remote management system (RMS)	Unofficia|
|15009	Yes	Yes	Teltonika networks remote management system (RMS)	Unofficial|
|15010	Yes	Yes	Teltonika networks remote management system (RMS)	Unofficial|
|15441	?	?	ZeroNet fileserver[citation needed	Unofficial|
|15567		Yes	Battlefield Vietnam and mods	Unofficial|
|15345	Yes	Yes	XPilot Contact	Official|
|15672	Yes	No	RabbitMQ management plugin7[self-published source	Unofficial|
|16000	Yes		Oracle WebCenter Content: Imaging (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
|Yes		shroudBNC	Unofficial|
|16080	Yes		Mac OS X Server Web (HTTP) service with performance cache8	Unofficial|
|16200	Yes		Oracle WebCenter Content: Content Server (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
|16225	Yes		Oracle WebCenter Content: Content Server Web UI. Port though often changed during installation	Unofficial|
|16250	Yes		Oracle WebCenter Content: Inbound Refinery (formerly known as Oracle Universal Content Management). Port though often changed during installation	Unofficial|
|16261	Yes	Yes	Project Zomboid multiplayer. Additional sequential ports used for each player connecting to server.[citation needed	Unofficial|
|16300	Yes		Oracle WebCenter Content: Records Management (formerly known as Oracle Universal Records Management). Port though often changed during installation	Unofficial|
|16384		Yes	CISCO Default RTP MIN	Unofficial|
|16384-16403		Yes	Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's iChat for audio and video	Unofficial|
|16384-16387		Yes	Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's FaceTime and Game Center	Unofficial|
|16393-16402		Yes	Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's FaceTime and Game Center	Unofficial|
|16403-16472		Yes	Real-time Transport Protocol (RTP), RTP Control Protocol (RTCP), used by Apple's Game Center	Unofficial|
|16400	Yes		Oracle WebCenter Content: Capture (formerly known as Oracle Document Capture). Port though often changed during installation	Unofficial|
|16482			CISCO Default RTP MAX	Official|
|16567		Yes	Battlefield 2 and mods	Unofficial|
|17011	Yes		Worms multiplayer	Unofficial|
|17224	Yes	Yes	Train Realtime Data Protocol (TRDP) Process Data, network protocol used in train communication.9	Official|
|17225	Yes	Yes	Train Realtime Data Protocol (TRDP) Message Data, network protocol used in train communication.0	Official|
|17333	Yes		CS Server (CSMS), default binary protocol port	Unofficial|
|17475	Yes		DMXControl 3 Network Broker	Unofficial|
|17500	Yes	Yes	Dropbox LanSync Protocol (db-lsp); used to synchronize file catalogs between Dropbox clients on a local network.	Official|
|18080	Yes	No	Monero P2P network communications[citation needed	Unofficial|
|18081	Yes	No	Monero incoming RPC calls[citation needed	Unofficial|
|18091	Yes	Yes	memcached Internal REST HTTPS for SSL	Unofficial|
|18092	Yes	Yes	memcached Internal CAPI HTTPS for SSL	Unofficial|
|18104	Yes		RAD PDF Service	Official|
|18200	Yes	Yes	Audition Online Dance Battle, AsiaSoft Thailand Server status/version check	Unofficial|
|18201	Yes	Yes	Audition Online Dance Battle, AsiaSoft Thailand Server	Unofficial|
|18206	Yes	Yes	Audition Online Dance Battle, AsiaSoft Thailand Server FAM database	Unofficial|
|18300	Yes	Yes	Audition Online Dance Battle, AsiaSoft SEA Server status/version check	Unofficial|
|18301	Yes	Yes	Audition Online Dance Battle, AsiaSoft SEA Server	Unofficial|
|18306	Yes	Yes	Audition Online Dance Battle, AsiaSoft SEA Server FAM database	Unofficial|
|18333	Yes		Bitcoin testnet8	Unofficial|
|18400	Yes	Yes	Audition Online Dance Battle, KAIZEN Brazil Server status/version check	Unofficial|
|18401	Yes	Yes	Audition Online Dance Battle, KAIZEN Brazil Server	Unofficial|
|18505	Yes	Yes	Audition Online Dance Battle R4p3 Server, Nexon Server status/version check	Unofficial|
|18506	Yes	Yes	Audition Online Dance Battle, Nexon Server	Unofficial|
|18605	Yes	Yes	X-BEAT status/version check	Unofficial|
|18606	Yes	Yes	X-BEAT	Unofficial|
|18676	Yes	Yes	YouView	Unofficial|
|19000	Yes	Yes	Audition Online Dance Battle, G10/alaplaya Server status/version check	Unofficial|
|Yes	JACK sound server	Unofficial|
|19001	Yes	Yes	Audition Online Dance Battle, G10/alaplaya Server	Unofficial|
|19132		Yes	Minecraft: Bedrock Edition multiplayer server[citation needed	Unofficial|
|19133		Yes	Minecraft: Bedrock Edition IPv6 multiplayer server[citation needed	Unofficial|
|19150	Yes	Yes	Gkrellm Server	Unofficial|
|19226	Yes		Panda Software AdminSecure Communication Agent	Unofficial|
|19294	Yes		Google Talk Voice and Video connections1	Unofficial|
|19295		Yes	Google Talk Voice and Video connections1	Unofficial|
|19302		Yes	Google Talk Voice and Video connections1	Unofficial|
|19812	Yes	No	4D database SQL Communication2	Official|
|19813	Yes	Yes	4D database Client Server Communication2	Official|
|19814	Yes		4D database DB4D Communication2	Official|
|19999			Distributed Network Protocol—Secure (DNP—Secure), a secure version of the protocol used in SCADA systems between communicating RTU's and IED's	Official|
|20000			Distributed Network Protocol (DNP), a protocol used in SCADA systems between communicating RTU's and IED's	Official|
|Usermin, Web-based Unix/Linux user administration tool (default port)	Unofficial|
|Yes	Used on VoIP networks for receiving and transmitting voice telephony traffic which includes Google Voice via the OBiTalk ATA devices as well as on the MagicJack and Vonage ATA network devices.3	Unofficial|
|20560	Yes	Yes	Killing Floor	Unofficial|
|20582		Yes	HW Development IoT comms	Unofficial|
|20583		Yes	HW Development IoT comms	Unofficial|
|20595		Yes	0 A.D. Empires Ascendant	Unofficial|
|20808		Yes	Ableton Link	Unofficial|
|21025	Yes		Starbound Server (default), Starbound	Unofficial|
|22000	Yes		Syncthing (default)	Unofficial|
|22136	Yes		FLIR Systems Camera Resource Protocol	Unofficial|
|22222	Yes		Davis Instruments, WeatherLink IP	Unofficial|
|23073			Soldat Dedicated Server	Unofficial|
|23399			Skype default protocol	Unofficial|
|23513	?	?	Duke Nukem 3D source ports	Unofficial|
|24441	Yes	Yes	Pyzor spam detection network	Unofficial|
|24444			NetBeans integrated development environment	Unofficial|
|24465	Yes	Yes	Tonido Directory Server for Tonido which is a Personal Web App and P2P platform	Official|
|24554	Yes	Yes	BINKP, Fidonet mail transfers over TCP/IP	Official|
|24800			Synergy: keyboard/mouse sharing software	Unofficial|
|24842			StepMania: Online: Dance Dance Revolution Simulator	Unofficial|
|25565	Yes		Minecraft (Java Edition) multiplayer server34	Unofficial|
|Yes	Minecraft (Java Edition) multiplayer server query5	Unofficial|
|25575		Yes	Minecraft (Java Edition) multiplayer server RCON6	Unofficial|
|25826		Yes	collectd default port7	Unofficial|
|26000	Yes	Yes	id Software's Quake server	Official|
|Yes		EVE Online	Unofficial|
|Yes	Xonotic, an open-source arena shooter	Unofficial|
|26900–26901	Yes		EVE Online	Unofficial|
|27000	Yes		PowerBuilder SySAM license server	Unofficial|
|27000–27006		Yes	id Software's QuakeWorld master server	Unofficial|
|27000–27009	Yes	Yes	FlexNet Publisher's License server (from the range of default ports)	Official|
|27000–27015	No	Yes	Steam (game client traffic)8[self-published source	Unofficial|
|27015	No	Yes	GoldSrc and Source engine dedicated server port8	Unofficial|
|27015-27018		Yes	Unturned, a survival game	Unofficial|
|27015–27030	No	Yes	Steam (matchmaking and HLTV)8	Unofficial|
|Yes	Yes	Steam (downloads)8	Unofficial|
|27016			Magicka server port	Unofficial|
|27017	Yes	No	MongoDB daemon process (mongod) and routing service (mongos)9	Unofficial|
|27031	Ports 27036 & 27037	Yes	Steam (In-Home Streaming)8	Unofficial|
|27036	Yes	Yes	Steam (In-Home Streaming)8	Unofficial|
|27037	Yes	Ports 27031 & 27036	Steam (In-Home Streaming)8	Unofficial|
|27374			Sub7 default.	Unofficial|
|27500–27900		Yes	id Software's QuakeWorld	Unofficial|
|27888		Yes	Kaillera server	Unofficial|
|27901–27910		Yes	id Software's Quake II master server	Unofficial|
|27950		Yes	OpenArena outgoing	Unofficial|
|27960–27969		Yes	Activision's Enemy Territory and id Software's Quake III Arena, Quake III and Quake Live and some ioquake3 derived games, such as Urban Terror (OpenArena incoming)	Unofficial|
|28001			Starsiege: Tribes[citation needed	Unofficial|
|28015		Yes	Rust (video game)0	Unofficial|
|28016		Yes	Rust RCON (video game)1	Unofficial|
|28770–28771		Yes	AssaultCube Reloaded, a video game based upon a modification of AssaultCube[citation needed	Unofficial|
|28785–28786		Yes	Cube 2: Sauerbraten2[self-published source?	Unofficial|
|28852	Yes	Yes	Killing Floor[citation needed	Unofficial|
|28910	Yes	Yes	Nintendo Wi-Fi Connection3	Unofficial|
|28960	Yes	Yes	Call of Duty; Call of Duty: United Offensive; Call of Duty 2; Call of Duty 4: Modern Warfare;[citation needed Call of Duty: World at War (PC platform)4	Unofficial|
|29000	?	?	Perfect World, an adventure and fantasy MMORPG[citation needed	Unofficial|
|29070	Yes	Yes	Jedi Knight: Jedi Academy by Ravensoft[citation needed	Unofficial|
|29900–29901	Yes	Yes	Nintendo Wi-Fi Connection3	Unofficial|
|29920	Yes	Yes	Nintendo Wi-Fi Connection3	Unofficial|
|30564	Yes		Multiplicity: keyboard/mouse/clipboard sharing software[citation needed	Unofficial|
|31337	Yes		Back Orifice and Back Orifice 2000 remote administration tools56	Unofficial|
|31416	?	?	BOINC RPC7	Unofficial|
|31438	Yes		Rocket U28[self-published source?	Unofficial|
|31457	Yes		TetriNET	Official|
|32137	Yes	Yes	Immunet Protect (UDP in version 2.0,9 TCP since version 3.00)	Unofficial|
|32400	Yes		Plex Media Server1	Official|
|32764	Yes		A backdoor found on certain Linksys, Netgear and other wireless DSL modems/combination routers2	Unofficial|
|32887	Yes		Ace of Spades, a multiplayer FPS video game[citation needed	Unofficial|
|32976	Yes		LogMeIn Hamachi, a VPN application; also TCP port 12975 and SSL (TCP 443).3	Unofficial|
|33434	Yes	Yes	traceroute	Official|
|33848		Yes	Jenkins, a continuous integration (CI) tool45	Unofficial|
|34000		Yes	Infestation: Survivor Stories (formerly known as The War Z), a multiplayer zombie video game[verification needed	Unofficial|
|34197	No	Yes	Factorio, a multiplayer survival and factory-building game6	Unofficial|
|35357	Yes		OpenStack Identity (Keystone) administration7[self-published source?	Official|
|37008		Yes	TZSP intrusion detection[citation needed	Unofficial|
|40000	Yes	Yes	SafetyNET p – a real-time Industrial Ethernet protocol	Official|
|41121	Yes	Yes	Tentacle Server8 - Pandora FMS	Official|
|43110	Yes		ZeroNet web UI default port[citation needed	Unofficial|
|43594–43595	?	?	RuneScape9	Unofficial|
|44405	Yes		Mu Online Connect Server[citation needed	Unofficial|
|44818	Yes	Yes	EtherNet/IP explicit messaging	Official|
|47808	Yes	Yes	BACnet Building Automation and Control Networks (4780810 = BAC016)	Official|
|49151	Reserved	Reserved	Reserved	Official|
||