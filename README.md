# Testbed source codes for stage 1
The testbed simulates both the primary plant and secondary plant of an electricity distribution substation, especially the physical distribution process and a small-scale of the process bus based on the IEC 61850 standard. The testbed runs on an Oracle VirtualBox with five virtual machines (VMs). One VM simulates a small-scale primary plant of a distribution substation using [**MATLAB/Simulink**](https://www.mathworks.com/products/simulink). The other four VMs represent different types of protection relays using [**OpenPLC**](https://www.openplcproject.com), including three instantaneous overcurrent protections and one circuit breaker failure protection. Communication interfaces among each VM, such as GOOSE trip messages between IEDs and the primary plant, are written in C++ based on an open source library - [**libiec61850**](http://libiec61850.com).

*Sincerely thanks **Thiago Alves** for helping solve issues with OpenPLC_Simulink-Interface.*


# Datasets for stage 1
