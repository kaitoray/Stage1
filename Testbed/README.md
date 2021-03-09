## source codes explanation 
* plc.xml: the plc program in OpenPLC written in Ladder Logic
* interface.cfg: configuration file for interface between Simulink and OpenPLC
* simlink.cpp: source file of interface between Simulink and OpenPLC
* run.sh: shell executables file for running all necessary programs
* goose_publisher_*.c: API of GOOSE publisher based on libiec61850
* goose_subscriber_*.c: API of GOOSE subscriber based on libiec61850
## Executable files explanaiton
* simlink: executable file of "simlink.cpp"
* goose_publisher_*: executable file of "goose_publisher_*.c"
* goose_subscriber_*: executable file of "goose_subscriber_*.c"