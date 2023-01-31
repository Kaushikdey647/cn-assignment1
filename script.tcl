# Create Network Simulator Object

set ns [new Simulator]

#########################################################################

$ns color 1 blue
$ns color 2 green
$ns color 3 red

#########################################################################

# Create the trace file and the nam file

set tf [open trace.tr w]

$ns trace-all $tf

set nf [open out.nam w]

$ns namtrace-all $nf

##########3 ##############################################################

# Create 4 nodes

set A [$ns node]
$A label "A"

set B [$ns node]
$B label "B"

set C [$ns node]
$C label "C"

set D [$ns node]
$D label "D"

# Create a link between A and D

$ns duplex-link $A $D 10Mb 2ms DropTail

# Create a link between D and B

$ns duplex-link $D $B 10Mb 2ms DropTail

# Create a link between C and D

$ns duplex-link $C $D 10Mb 2ms DropTail

# Create a link between D and B

$ns duplex-link $D $B 10Mb 2ms DropTail

#########################################################################

# define finish

proc finish {} {
    global ns nf tf
    $ns flush-trace
    close $nf
    close $tf
    exec nam out &
    exit 0
}

#########################################################################

# FTP CONNECTION BETWEEN A AND B

## Create a tcp agent and attatch it to A

set tcp1 [new Agent/TCP/Reno]

# Set flow color to blue

$tcp1 set class_ 1

$ns attach-agent $A $tcp1

## Create a sink agent and attatch it to B

set sink1 [new Agent/TCPSink]

$ns attach-agent $B $sink1

## Attach FTP application to the source

set ftp1 [new Application/FTP]

$ftp1 attach-agent $tcp1

## Connect the traffic source to the sink

$ns connect $tcp1 $sink1



#########################################################################

# UNRELIABLE UDP CONNECTION BETWEEN C AND D

## Create a udp agent and attatch it to C

set udp1 [new Agent/UDP]

## Set flow color to red

$udp1 set class_ 3

$ns attach-agent $C $udp1

## Create a Null Sink and attatch it to D

set sink2 [new Agent/Null]

$ns attach-agent $D $sink2

## Attach CBR application to the source

set udpapp1 [new Application/Traffic/CBR]

$udpapp1 attach-agent $udp1

## Connect the traffic source to the sink

$ns connect $udp1 $sink2


#########################################################################

# CREATE A RELIABLE CONNECTION BETWEEN D AND B

## Create a tcp agent and attatch it to D

set tcp2 [new Agent/TCP/Reno]

## Set flow color to green

$tcp2 set class_ 2

$ns attach-agent $D $tcp2


## Create a sink agent and attatch it to B

set sink3 [new Agent/TCPSink]

$ns attach-agent $B $sink3

## Attach FTP Application to the source

set tcpapp1 [new Application/FTP]

$tcpapp1 attach-agent $tcp2

## Connect the traffic source to the sink

$ns connect $tcp2 $sink3



#########################################################################

# SIMULATION TIME

$ns at 0.0 "$ftp1 start"

$ns at 0.5 "$udpapp1 start"

$ns at 1.0 "$tcpapp1 start"

$ns at 1.5 "$ftp1 stop"

$ns at 2.0 "$udpapp1 stop"

$ns at 2.5 "$tcpapp1 stop"

$ns at 3.0 "finish"

# RUN THE SIMULATION

$ns run