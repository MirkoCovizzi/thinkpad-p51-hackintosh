DefinitionBlock("SSDT_OVERRIDES", "SSDT", 2, "Mirko", "ThinkOpt", 0){
    External (B1B2, MethodObj)
    External (\_SB.PCI0.LPCB.EC.SPD0, BuffObj)
    External (\_SB.PCI0.LPCB.EC.SPD1, BuffObj)
    External (\_SB.PCI0.LPCB.EC.TMP0, BuffObj)

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
    }
}