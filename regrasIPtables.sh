#!bin/bash

#Versão 1.0

#Na questão da automação para o script iniciar junto ao sistema em
#caso de desligamento/reiniciar preferir editar manualmente  o arquivo
#de inicialização do sistema

#Regra do Firewall

iptables -I INPUT 2 -p icmp --icmp-type echo-request -i ens3 -j DROP

#Regras de permisão para o pacote do protocolo ICMP

iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT
iptables -A forward -p icmp -j ACCEPT

#Liberando porta 53

iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT
iptables -A FORWARD -p udp --dport 53 -j ACCEPT
iptables -A FORWARD -p udp --sport 53 -j ACCEPT

#Liberando acesso HTTP

iptables -A INPUT -p tcp --sport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -p tcp --sport 80 -j ACCEPT
iptables -A FORWARD -p tcp --dport 80 -j ACCEPT

#Liberando acesso HTTPS

iptables -A INPUT -p tcp --sport 443 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -A FORWARD -p tcp --sport 443 -j ACCEPT
iptables -A FORWARD -p tcp --dport 443 -j ACCEPT

#Liberando navegação via IPv6

ip6tables -A ITPUT -p tcp --sport 443 -j ACCEPT
ip6tables -A OUTPUT -p tcp --dport 443 -j ACCEPT
ip6tables -A FORWARD -p tcp --sport 443 -j ACCEPT
ip6tables -A FOREWARD -p tcp --dport 443 -j ACCEPT

