#!/bin/bash

sfctl application delete --application-id WPL.Fabric.Accounts
sfctl application unprovision --application-type-name WPL.Fabric.AccountsType --application-type-version 1.0.0
sfctl store delete --content-path WPL.Fabric.Accounts