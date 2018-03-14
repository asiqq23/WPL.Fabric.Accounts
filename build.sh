#!/bin/bash
DIR=`dirname $0`
source $DIR/dotnet-include.sh

dotnet restore $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\Accounts.Interfaces\Accounts.Interfaces.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\Accounts.Interfaces\Accounts.Interfaces.csproj -v normal

CURDIR=`pwd`
dotnet restore $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\AccountsService\AccountsService.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\AccountsService\AccountsService.csproj -v normal
cd `dirname $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\AccountsService\AccountsService.csproj`
dotnet publish -o $CURDIR/../WPL.Fabric.Accounts\WPL.Fabric.Accounts\AccountsPkg\Code
cd -


dotnet restore $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\AccountsTestClient\AccountsTestClient.csproj -s https://api.nuget.org/v3/index.json
dotnet build $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\AccountsTestClient\AccountsTestClient.csproj -v normal
cd `dirname $DIR/../WPL.Fabric.Accounts\src\WPL.Fabric.Accounts\AccountsTestClient\AccountsTestClient.csproj`
dotnet publish -o $CURDIR/../WPL.Fabric.Accounts\AccountsServiceTestClient
cd -
