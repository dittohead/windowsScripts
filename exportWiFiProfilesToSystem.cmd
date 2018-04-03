echo off
FOR %%f IN (*.xml) do netsh wlan add profile filename="%%f" user=all
