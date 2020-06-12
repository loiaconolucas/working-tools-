@echo off

::Script to uninstall a program on multiple hosts

::Populate host file with targets. For loop will go through each 
:: host and complete the task within the loop 

for /f "tokens=*" %%a in (hosts.txt) do (


:: for loop calls changes directory to locate psexec then 
:: calls an uninstall file on a remote host 


  echo uninstalling shockwave player on %%a
  cd C:\
  cd C:\Users\Liacono\Downloads\PSTools\
  psexec \\%%a "C:\Windows\SysWOW64\Adobe\Shockwave 12\uninstaller.exe"
 
)

pause