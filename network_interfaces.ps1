function get_network_properties($network_config){
    $output_array = @()

    foreach($item in $network_config){
        $properties = @{
            HostName = $item.DNSHostName
            IPAddress = $item.IPAddress
            MacAddress = $item.MACAddress
            InterfaceIndex = $item.InterfaceIndex
        }
        $new_obj = New-Object -TypeName PSObject -Property $properties
        $output_array += $new_obj
    }

    write-output("Hostname: $($hostname)`n")
    foreach($o in $output_array){
        write-output("Interface: $($o.InterfaceIndex)`nIP Address: $($o.IPAddress)`nMAC Address: $($o.MacAddress)`n")
    }
}

$hostname = hostname
$network = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -Filter IPEnabled=TRUE -ComputerName .
get_network_properties($network)