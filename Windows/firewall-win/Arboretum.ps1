#Reset the firewall
netsh advfirewall reset

#Make sure firewall is on
netsh advfirewall set allprofiles state on

#Delete all current rules on system
netsh advfirewall firewall delete rule name=all


#Block all of the inbound and outbound traffic unless specified
netsh advfirewall set allprofiles firewallpolicy blockinbound,blockoutbound


#DNS
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=UDP localport=53 
netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=UDP localport=53
netsh advfirewall firewall add rule name="DNS" dir=in action=allow protocol=UDP remoteport=53 
netsh advfirewall firewall add rule name="DNS" dir=out action=allow protocol=UDP remoteport=53

#LDAP
netsh advfirewall firewall add rule name="LDAP" dir=in action=allow protocol=TCP localport=389,636
netsh advfirewall firewall add rule name="LDAP" dir=out action=allow protocol=TCP localport=389,636

#Active Directory
netsh advfirewall firewall add rule name="Active-D-TCP" dir=in action=allow protocol=TCP remoteport=389,445,88,636,135,3268 
netsh advfirewall firewall add rule name="Active-D-TCP" dir=out action=allow protocol=TCP remoteport=389,445,88,636,135,3268
netsh advfirewall firewall add rule name="Active-D-UDP" dir=in action=allow protocol=UDP remoteport=389,445,88,636,135,3268
netsh advfirewall firewall add rule name="Active-D-UDP" dir=out action=allow protocol=UDP remoteport=389,445,88,636,135,3268


#All other systems in topo
netsh advfirewall firewall add rule name="Local Net traffic" dir=in action=allow protocol=ANY remoteip=10.4.1.1-10.4.1.90
netsh advfirewall firewall add rule name="Local Net traffic" dir=out action=allow protocol=ANY remoteip=10.4.1.1-10.4.1.90

#winRM
netsh advfirewall firewall add rule name="winRM" dir=in action=allow protocol=TCP localport=5985,5986
netsh advfirewall firewall add rule name="winRM" dir=out action=allow protocol=TCP localport=5985,5986

#HTTP
netsh advfirewall firewall add rule name="http" dir=in action=allow protocol=UDP localport=80,443
netsh advfirewall firewall add rule name="http" dir=out action=allow protocol=UDP localport=80,443

#Mail server shit
#SMTP
netsh advfirewall firewall add rule name="SMTP" dir=in action=allow protocol=TCP localport=25
netsh advfirewall firewall add rule name="SMTP" dir=out action=allow protocol=TCP localport=25
#POP3
netsh advfirewall firewall add rule name="POP3" dir=in action=allow protocol=TCP localport=110
netsh advfirewall firewall add rule name="POP3" dir=out action=allow protocol=TCP localport=110
#IMAP
netsh advfirewall firewall add rule name="IMAP" dir=in action=allow protocol=TCP localport=143
netsh advfirewall firewall add rule name="IMAP" dir=out action=allow protocol=TCP localport=143


#start or add to logging file
netsh advfirewall set currentprofile logging filename "$HOME\Desktop\firelogs\fire.log"
netsh advfirewall set currentprofile logging maxfilesize 32676
netsh advfirewall set allprofiles logging droppedconnections enable
netsh advfirewall set allprofiles settings inboundusernotification enable
netsh advfirewall reset