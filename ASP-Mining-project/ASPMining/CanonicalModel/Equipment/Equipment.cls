Class ASPMining.CanonicalModel.Equipment.Equipment Extends %Persistent
{

Parameter DSTIME = "AUTO";

/// Mine Unique Identifier of Vehicle
Property Id As %String;

/// Category of Equipment, eg: Truck, Excav.
Property EquipmentCategory As EquipmentCategory;

/// Model of Equipment: e.g: CAT 770
Property EquipmentModel As EquipmentModel;

/// Readable Display Name of Vehicle
Property Name As %String;

/// Capacity of Vehicle ASSIGNED BY USERS
Property Capacity As %Float;

/// Used to check Last production DumpEvent
Property LastUnifiedEvent As ASPMining.CanonicalModel.Operation.UnifiedEvents;

Index EquipmentIndex On Id [ Unique ];

Index NameIndex On Name [ Type = bitmap ];

Storage Default
{
<Data name="EquipmentDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>EquipmentCategory</Value>
</Value>
<Value name="3">
<Value>EquipmentModel</Value>
</Value>
<Value name="4">
<Value>Name</Value>
</Value>
<Value name="5">
<Value>Capacity</Value>
</Value>
<Value name="6">
<Value>Id</Value>
</Value>
<Value name="7">
<Value>LastProductionUpdate</Value>
</Value>
<Value name="8">
<Value>LastProductionDumpEvent</Value>
</Value>
<Value name="9">
<Value>LastProductionLoadEvent</Value>
</Value>
<Value name="10">
<Value>LastUnifiedEvent</Value>
</Value>
</Data>
<DataLocation>^ASPMining.CanoniF845.EquipmentD</DataLocation>
<DefaultData>EquipmentDefaultData</DefaultData>
<IdLocation>^ASPMining.CanoniF845.EquipmentD</IdLocation>
<IndexLocation>^ASPMining.CanoniF845.EquipmentI</IndexLocation>
<StreamLocation>^ASPMining.CanoniF845.EquipmentS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
