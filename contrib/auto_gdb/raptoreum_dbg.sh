#!/bin/bash
# use testnet settings,  if you need mainnet,  use ~/.coinraccore/coinracd.pid file instead
coinrac_pid=$(<~/.coinraccore/testnet3/coinracd.pid)
sudo gdb -batch -ex "source debug.gdb" coinracd ${coinrac_pid}
