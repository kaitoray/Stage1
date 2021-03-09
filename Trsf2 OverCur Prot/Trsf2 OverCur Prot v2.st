PROGRAM OverCurrent_TRSF2
  VAR
    Short_Circuit_TRSF2 : BOOL;
    Short_Circuit_66BUS : BOOL;
  END_VAR
  VAR
    Open_CB2_66KV AT %QX0.0 : BOOL;
    Open_CB3_66KV AT %QX0.1 : BOOL;
    Open_CB_TRSF2 AT %QX0.2 : BOOL;
    Reset_All_CB AT %IX0.0 : BOOL;
    Current_CB2_66KV AT %IW0 : INT;
    Current_CB3_66KV AT %IW1 : INT;
    Current_TRSF2_W1 AT %IW2 : INT;
    Current_TRSF2_W2 AT %IW3 : INT;
    Current_CB_TRSF2 AT %IW4 : INT;
    Current_CB2_22KV AT %IW5 : INT;
    Current_Fault_on_TRSF2 AT %IW6 : INT;
    Current_Fault_on_66BUS2 AT %IW7 : INT;
  END_VAR
  VAR
    Threshold1000 : INT := 1000;
    Threshold500 : INT := 500;
    ABS66_OUT : INT;
    GT10_OUT : BOOL;
    ABS39_OUT : INT;
    GT4_OUT : BOOL;
    AND63_OUT : BOOL;
    ABS42_OUT : INT;
    GT15_OUT : BOOL;
    ABS43_OUT : INT;
    GT20_OUT : BOOL;
    ABS44_OUT : INT;
    GT26_OUT : BOOL;
    AND62_OUT : BOOL;
  END_VAR

  Open_CB2_66KV := NOT(Reset_All_CB) AND Open_CB3_66KV AND Open_CB2_66KV AND Open_CB_TRSF2 OR Short_Circuit_TRSF2;
  ABS66_OUT := ABS(Current_CB_TRSF2);
  GT10_OUT := GT(ABS66_OUT, Threshold500);
  ABS39_OUT := ABS(Current_Fault_on_TRSF2);
  GT4_OUT := GT(ABS39_OUT, Threshold1000);
  AND63_OUT := AND(GT10_OUT, GT4_OUT);
  Short_Circuit_TRSF2 := AND63_OUT;
  Open_CB_TRSF2 := NOT(Reset_All_CB) AND Open_CB3_66KV AND Open_CB2_66KV AND Open_CB_TRSF2 OR Short_Circuit_TRSF2;
  Open_CB3_66KV := NOT(Reset_All_CB) AND Open_CB3_66KV AND Open_CB2_66KV AND Open_CB_TRSF2 OR Short_Circuit_TRSF2;
  Open_CB2_66KV := NOT(Reset_All_CB) AND Open_CB3_66KV AND Open_CB2_66KV AND Open_CB_TRSF2 OR Short_Circuit_66BUS;
  Open_CB_TRSF2 := NOT(Reset_All_CB) AND Open_CB3_66KV AND Open_CB2_66KV AND Open_CB_TRSF2 OR Short_Circuit_66BUS;
  ABS42_OUT := ABS(Current_Fault_on_66BUS2);
  GT15_OUT := GT(ABS42_OUT, Threshold1000);
  ABS43_OUT := ABS(Current_CB2_66KV);
  GT20_OUT := GT(ABS43_OUT, Threshold1000);
  ABS44_OUT := ABS(Current_CB3_66KV);
  GT26_OUT := GT(ABS44_OUT, Threshold1000);
  AND62_OUT := AND(GT15_OUT, GT20_OUT, GT26_OUT);
  Short_Circuit_66BUS := AND62_OUT;
  Open_CB3_66KV := NOT(Reset_All_CB) AND Open_CB3_66KV AND Open_CB2_66KV AND Open_CB_TRSF2 OR Short_Circuit_66BUS;
END_PROGRAM


CONFIGURATION Config0

  RESOURCE Res0 ON PLC
    TASK TaskMain(INTERVAL := T#10ms,PRIORITY := 0);
    PROGRAM Inst0 WITH TaskMain : OverCurrent_TRSF2;
  END_RESOURCE
END_CONFIGURATION
