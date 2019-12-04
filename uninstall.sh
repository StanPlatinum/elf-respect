#!/bin/bash

Curr_Path=`pwd`
echo $Curr_Path

Bash_Dir=`dirname $0`
echo $Bash_Dir

if ["$Curr_Path" = "$Bash_Dir"]
then
        echo "Wrong uninstall path! Please make sure you are in a right elf-respect repo!"
        exit 1
fi

cd ..
Install_Path=`pwd`
echo $Install_Path

echo "Deleting SGXSDK..."
rm -rf linux-sgx

echo "Deleting Libelf..."
rm -rf elfutils4sgx

echo "Deleting Capstone..."
rm -rf capstone

echo "Deleting LLVM..."
rm -rf proofGen

echo "Uninstall successfully!"

