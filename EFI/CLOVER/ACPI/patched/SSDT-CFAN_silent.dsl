// created by MirkoCovizzi

DefinitionBlock("SSDT_OVERRIDES", "SSDT", 2, "Mirko", "ThinkOpt", 0){
    External (B1B2, MethodObj)
    External (\_SB.PCI0.LPCB.EC.SPD0, IntObj)
    External (\_SB.PCI0.LPCB.EC.SPD1, IntObj)
    External (\_SB.PCI0.LPCB.EC.TMP0, IntObj)
    External (\_SB.PCI0.LPCB.EC.HFSP, IntObj)
    External (\_SB.PCI0.LPCB.EC.RECB, MethodObj)
    External (\_SB.PCI0.LPCB.EC.WECB, MethodObj)
    
    Method (SWFN, 1, Serialized)
    {
        Store (\_SB.PCI0.LPCB.EC.RECB (0x31, 8), Local0)
        If (LEqual (Arg0, 0x00))
        {
            \_SB.PCI0.LPCB.EC.WECB (0x31, 8, And (Local0, 0xFE))
        }
        Else
        {
            \_SB.PCI0.LPCB.EC.WECB (0x31, 8, Or (Local0, 0x01))
        }
        Return (1)
    }

    Method (CFSP, 1, Serialized)
    {
        SWFN (0x00)
        Store (Arg0, \_SB.PCI0.LPCB.EC.HFSP)
        
        Sleep (0x64)
        
        SWFN (0x01)
        Store (Arg0, \_SB.PCI0.LPCB.EC.HFSP)           
        
        Sleep (0x64)

        Return (1)    
    }

    Device (SMCD)
    {
        Name (_HID, "FAN00000")
        Name (TACH, Package()
        {
            "System Fan", "FAN0"
        })
        
        Name (TEMP, Package()
        {
            "CPU Heatsink", "TCPU"
        })
            
        Method (FAN0, 0, Serialized)
        {
            Store (\_SB.PCI0.LPCB.EC.SPD0, Local0)
            Store (\_SB.PCI0.LPCB.EC.SPD1, Local1)
            Return (B1B2(Local0, Local1))
        }
        
        Method (TCPU, 0, Serialized)
        {
            Store (\_SB.PCI0.LPCB.EC.TMP0, Local0)
            Return (Local0)
        }
        
        Method (FCPU, 0, Serialized)
        {
            CFSP (0x00)
            
            Return (1)
        }
    }
}