Class ASPMining.CanonicalModel.HWMonitoring.OEMInterfaceMap Extends %Persistent
{
/// OEMInterface Reference
Property OEMInterface As OEMInterface;
/// Equipment Reference where this Interface is connected to
Property Equipment As ASPMining.CanonicalModel.Equipment.Equipment;

index OEMInterfaceIndex on OEMInterface [Unique ];
index EquipmentIndex on OEMInterface [type = bitmap];
Storage Default
{
<Data name="OEMInterfaceMapDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>OEMInterface</Value>
</Value>
<Value name="3">
<Value>Equipment</Value>
</Value>
</Data>
<DataLocation>^ASPMiningE4E6.OEMInterfac774FD</DataLocation>
<DefaultData>OEMInterfaceMapDefaultData</DefaultData>
<IdLocation>^ASPMiningE4E6.OEMInterfac774FD</IdLocation>
<IndexLocation>^ASPMiningE4E6.OEMInterfac774FI</IndexLocation>
<StreamLocation>^ASPMiningE4E6.OEMInterfac774FS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}