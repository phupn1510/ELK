
cd "C:\Program Files\Wireshark\"

.\tshark.exe -a duration:60 -i 1 -t ad -T fields -E separator="," -E quote=n -E bom=n -e _ws.col.Time -e _ws.col.Source -e _ws.col.Destination -e ip.src -e ip.dst -e tcp.srcport -e tcp.dstport -e _ws.col.Protocol -e ip.len -e _ws.col.Info > D:\tshark.csv

