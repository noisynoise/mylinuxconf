#!/bin/bash

# aliases
## divers system aliases
alias lart="ls -lart"
alias lrt="ls -lrt"
alias nohash="egrep -v '(^.*#.*|^$)'"


## VM - SSH connection aliases
alias ssh_nipap="ssh labo@192.168.100.144"
alias ssh_nav="ssh labo@192.168.100.142"
alias ssh_librenms="ssh labo@192.168.100.141"
alias ssh_dashboard="ssh labo@192.168.100.143"

# BareMetal - SSH Conections
alias ssh_labo-nas="ssh root@192.168.101.101"
alias ssh_pf-services="ssh labo@192.168.100.125"
alias ssh_labo-bastion="ssh labo@192.168.100.140"
alias ssh_labo-mon="ssh labo@192.168.100.118"

# labo dNFV
alias ssh_dnfv-controller="ssh rad@10.193.35.36"

# tmux new session
alias ntmux="tmux new -s $1"
