#!/bin/bash

nmcli radio wifi `nmcli r wifi | grep enabled -c | sed -e "s/1/off/" | sed -e "s/0/on/"`
