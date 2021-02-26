#!/usr/bin/env bash

cat << 'EOF' >> $HOME/.bashrc
# Load user defined functions and aliases
if [ -f $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi
EOF
