:: This Batch File fetches All the Details of the Nearby PC's of Same VLAN (Upto 254 host's).
:: Windows OS
:: Dated: 8th March 2017.

:: #****************************************************************** Start of Script ********************************************************************#

@echo off
title Remote PC Details Fetching Script(PC Name / IP's / MAC / Vnet)
echo. > %cd%\PC_Details_Temp.txt
echo Remote PC Details Fetching Script (PC Name / IP's / MAC / Vnet / SeatNo.) Details of the Nearby PC's of Same VLAN.(Upto 254 Hosts)
echo.
set /p input_ip="Please Enter the IP Range(Eg:10.238.234) :  " && echo
set /p input_ip_start="Please Enter Start IP Range(Eg:1) :  " && echo
set /p input_ip_end="Please Enter End IP Range(Eg:254) :  " && echo
echo. >> %cd%\PC_Details_Temp.txt
@echo on
for /l %%i in (%input_ip_start%, 1, %input_ip_end%) do nbtstat -a %input_ip%.%%i | findstr /c:"MAC" /c:"<00>" | findstr /c:"MAC" /c:"UNIQUE" >> %cd%\PC_Details_Temp.txt && echo     IP Address  = %input_ip%.%%i >> %cd%\PC_Details_Temp.txt
@echo off
echo. > %cd%\PC_Details_Logs.txt
echo. > %cd%\PC_Details_Logs.txt
echo This Batch Script fetches All the Details of the Nearby PC's of Same VLAN.(Starting from 1 to 254 host's) >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo PC Host Name: >> %cd%\PC_Details_Logs.txt
find "UNIQUE" PC_Details_Temp.txt >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo PC IP Address: >> %cd%\PC_Details_Logs.txt
find "IP" PC_Details_Temp.txt >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo PC MAC Address: >> %cd%\PC_Details_Logs.txt
find "MAC" PC_Details_Temp.txt >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo PC Seat No's. and Vnet No's: >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
net view /all >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
echo. >> %cd%\PC_Details_Logs.txt
arp -a >> %cd%\PC_Details_Logs.txt
:: del %cd%\PC_Details_Temp.txt
echo.
echo Completed Successfully..!
echo.
pause

:: #****************************************************************** End of Script ********************************************************************#
