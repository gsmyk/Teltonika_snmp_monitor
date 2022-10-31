$SNMP = New-Object -ComObject olePrn.OleSNMP

$ip = "<teltonika_router_ip>"

$location = $ip
$snmp_secret = "public"

$snmplist = (
    ( "ModemImei", ".1.3.6.1.4.1.48690.1.1.0" ),
    ( "ModemModel", ".1.3.6.1.4.1.48690.1.2.0" ),
    ( "ModemManufacturer", ".1.3.6.1.4.1.48690.1.3.0" ),
    ( "ModemRevision", ".1.3.6.1.4.1.48690.1.4.0" ),
    ( "ModemSerial", ".1.3.6.1.4.1.48690.1.5.0" ),
    ( "Imsi", ".1.3.6.1.4.1.48690.1.6.0" ),
    ( "RouterName", ".1.3.6.1.4.1.48690.1.7.0" ),
    ( "ProductCode", ".1.3.6.1.4.1.48690.1.8.0" ),
    ( "BatchNumber", ".1.3.6.1.4.1.48690.1.9.0" ),
    ( "HardwareRevision", ".1.3.6.1.4.1.48690.1.10.0" ),
    ( "SimState", ".1.3.6.1.4.1.48690.2.1.0" ),
    ( "PinState", ".1.3.6.1.4.1.48690.2.2.0" ),
    ( "NetState", ".1.3.6.1.4.1.48690.2.3.0" ),
    ( "Signal", ".1.3.6.1.4.1.48690.2.4.0" ),
    ( "Operator", ".1.3.6.1.4.1.48690.2.5.0" ),
    ( "OperatorNumber", ".1.3.6.1.4.1.48690.2.6.0" ),
    ( "ConnectionState", ".1.3.6.1.4.1.48690.2.7.0" ),
    ( "ConnectionType", ".1.3.6.1.4.1.48690.2.8.0" ),
    ( "Temperature", ".1.3.6.1.4.1.48690.2.9.0" ),
    ( "ReceivedToday", ".1.3.6.1.4.1.48690.2.10.0" ),
    ( "SentToday", ".1.3.6.1.4.1.48690.2.11.0" ),
    ( "ReceivedYesterday", ".1.3.6.1.4.1.48690.2.12.0" ),
    ( "SentYesterday", ".1.3.6.1.4.1.48690.2.13.0" ),
    ( "FirmwareVersion", ".1.3.6.1.4.1.48690.2.14.0" ),
    ( "SimSlot", ".1.3.6.1.4.1.48690.2.15.0" ),
    ( "RouterUptime", ".1.3.6.1.4.1.48690.2.16.0" ),
    ( "ConnectionUptime", ".1.3.6.1.4.1.48690.2.17.0" ),
    ( "MobileIP", ".1.3.6.1.4.1.48690.2.18.0" ),
    ( "Sent", ".1.3.6.1.4.1.48690.2.19.0" ),
    ( "Received", ".1.3.6.1.4.1.48690.2.20.0" ),
    ( "CellID", ".1.3.6.1.4.1.48690.2.21.0" ),
    ( "SINR", ".1.3.6.1.4.1.48690.2.22.0" ),
    ( "RSRP", ".1.3.6.1.4.1.48690.2.23.0" ),
    ( "RSRQ", ".1.3.6.1.4.1.48690.2.24.0" ),
    ( "hotSpotId", ".1.3.6.1.4.1.48690.3.4.1.0" ),
    ( "hotSpotSsid", ".1.3.6.1.4.1.48690.3.4.2.0" ),
    ( "hotSpotEnableState", ".1.3.6.1.4.1.48690.3.4.3.0" ),
    ( "hotSpotIP", ".1.3.6.1.4.1.48690.3.4.4.0" ),
    ( "hotSpotDownloadBandWidth", ".1.3.6.1.4.1.48690.3.4.5.0" ),
    ( "hotSpotUploadBandWidth", ".1.3.6.1.4.1.48690.3.4.6.0" ),
    ( "hotSpotUsers", ".1.3.6.1.4.1.48690.3.4.7.0" ),
    ( "hotSpotUsersPass", ".1.3.6.1.4.1.48690.3.4.8.0" ),
    ( "hotSpotUsersActive", ".1.3.6.1.4.1.48690.3.4.9.0" ),
    ( "hotSpotUsersMac", ".1.3.6.1.4.1.48690.3.4.10.0" ),
    ( "hotSpotUsersIp", ".1.3.6.1.4.1.48690.3.4.11.0" ),
    ( "hotSpotUsersStartTime", ".1.3.6.1.4.1.48690.3.4.12.0" ),
    ( "hotSpotUsersUseTime", ".1.3.6.1.4.1.48690.3.4.13.0" ),
    ( "hotSpotUsersDownload", ".1.3.6.1.4.1.48690.3.4.14.0" ),
    ( "hotSpotUsersUpload", ".1.3.6.1.4.1.48690.3.4.15.0" ),
    ( "hotSpotEndTime", ".1.3.6.1.4.1.48690.3.4.16.0" ),
    ( "DigitalInput", ".1.3.6.1.4.1.48690.5.1.0" ),
    ( "DigitalIsolatedInput", ".1.3.6.1.4.1.48690.5.2.0" ),
    ( "AnalogInput", ".1.3.6.1.4.1.48690.5.3.0" ),
    ( "DigitalOCOutput", ".1.3.6.1.4.1.48690.5.4.0" ),
    ( "DigitalRelayOutput", ".1.3.6.1.4.1.48690.5.5.0" ),
    ( "AnalogInputCalc", ".1.3.6.1.4.1.48690.5.6.0" ),
    ( "Longtitude", ".1.3.6.1.4.1.48690.6.1.0" ),
    ( "Latitude", ".1.3.6.1.4.1.48690.6.2.0" ),
    ( "Accuracy", ".1.3.6.1.4.1.48690.6.3.0" ),
    ( "Datetime", ".1.3.6.1.4.1.48690.6.4.0" ),
    ( "NumSatellites", ".1.3.6.1.4.1.48690.6.5.0" )
)

for($beg = 0; $beg -lt $snmplist.count; $beg = $beg + 1) {
    try {
    $snmp.open($location, $snmp_secret, 2, 1000)
    $tmp = $snmp.get($snmplist[$beg][1])
    Write-Host $snmplist[$beg][0] ": " $tmp
    Start-Sleep -Seconds 1
    $tmp = $null
    }
    catch {
        Write-Host ">>>>>>>> Error> " $snmplist[$beg][0] $snmplist[$beg][1] 
    }
}
