#!/bin/bash

sfctl application upload --path WPL.Fabric.Accounts --show-progress
sfctl application provision --application-type-build-path WPL.Fabric.Accounts
sfctl application create --app-name fabric:/WPL.Fabric.Accounts --app-type WPL.Fabric.AccountsType --app-version 1.0.0
