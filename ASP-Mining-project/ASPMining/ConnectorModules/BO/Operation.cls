Include DEMOMACROS

Class ASPMining.ConnectorModules.BO.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";


/// Gets the CompleteEvent object and saves it
Method NewCompleteEvent(pInput As ASPMining.ConnectorModules.BO.CompleteEvent, Output pOutput As Ens.Response) As %Status
{
	#Dim eventChange As OEE.Data.EventChange
	#Dim previousChange As OEE.Data.EventChange
	#Dim timeSlice As OEE.Data.OEETimeSlice
	
	Set sc=$$$OK
	
	Try
	{		
		Set event = ##class(ASPMining.CanonicalModel.Operation.StatusEvent).%New()
		#Dim event As ASPMining.CanonicalModel.Operation.StatusEvent
		
		// Check if equipment exists and open it, if not, make a fake one, which should not be seen if everything works right
		If ##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexExists(pInput.EquipmentId){
			Set event.Equipment = ##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexOpen(pInput.EquipmentId)
		}else{
			Set event.Equipment = ##class(ASPMining.CanonicalModel.Equipment.Equipment).%New()
			set event.Equipment.Id = pInput.EquipmentId
			set event.Equipment.Name = "GENERATED BY OPERATION"
			set event.Equipment.Capacity = 300
			// Resolve Category
			if '##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).EquipmentCategoryIndexExists("GENERATED BY OPERATION") {
				Set event.Equipment.EquipmentCategory = ##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).%New() 
				Set event.Equipment.EquipmentCategory.Name = "GENERATED BY OPERATION"
			}else{
				Set event.Equipment.EquipmentCategory = ##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).EquipmentCategoryIndexOpen("GENERATED BY OPERATION")
			}
			
			// Resolve Model
			if '##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).EquipmentModelIndexExists("GENERATED BY OPERATION") {
				Set event.Equipment.EquipmentModel = ##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).%New() 
				Set event.Equipment.EquipmentModel.Model = "GENERATED BY OPERATION"
			}else{
				Set event.Equipment.EquipmentModel = ##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).EquipmentModelIndexOpen("GENERATED BY OPERATION")
			}
		}
		Set event.StartDate = pInput.StartDate
		Set event.EndDate = pInput.EndDate
		Set event.Duration = pInput.Duration
		
		//TODO: Validate status reasons and type jus like with equipment
		set statusReasonId = pInput.StatusTypeId _ "-" _ pInput.StatusReasonId
		If '##class(ASPMining.CanonicalModel.Operation.StatusReason).IdIndexExists(statusReasonId) {
			Set event.StatusReason = ##class(ASPMining.CanonicalModel.Operation.StatusReason).%New()
			Set event.StatusReason.Id = statusReasonId
			Set event.StatusReason.Reason = pInput.StatusReasonId
			Set event.StatusReason.Description = "GENERATED BY OPERATION"
		}else{
			Set event.StatusReason = ##class(ASPMining.CanonicalModel.Operation.StatusReason).IdIndexOpen(statusReasonId)
		}
		
		If '##class(ASPMining.CanonicalModel.Operation.StatusType).TypeIndexExists(pInput.StatusTypeId){
			Set event.StatusType = ##class(ASPMining.CanonicalModel.Operation.StatusType).%New()
			Set event.StatusType.Type = pInput.StatusTypeId
			Set event.StatusType.Description = "GENERATED BY OPERATION"
		}else{
			Set event.StatusType = ##class(ASPMining.CanonicalModel.Operation.StatusType).TypeIndexOpen(pInput.StatusTypeId)
		}
		
		If '##class(ASPMining.CanonicalModel.Planning.Shift).ShiftIndexExists(pInput.ShiftId){
			set event.Shift = ##class(ASPMining.CanonicalModel.Planning.Shift).%New()
			set event.Shift.Id = pInput.ShiftId
		}else{
			set event.Shift = ##class(ASPMining.CanonicalModel.Planning.Shift).ShiftIndexOpen(pInput.ShiftId)
		}
		//Set event.StatusReason = ##class(ASPMining.CanonicalModel.Operation.StatusReason).%New() // pInput.StatusReasonId
		//Set event.StatusReason.Reason = pInput.StatusReasonId
		//Set event.StatusType = ##class(ASPMining.CanonicalModel.Operation.StatusType).%New() // pInput.StatusTypeId
		//Set event.StatusType.Type = pInput.StatusTypeId
		
		Set sc = event.%Save()
		
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewEquipment(pInput As ASPMining.CanonicalModel.Equipment.Equipment, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexExists(pInput.Id) {
			Set sc = pInput.%Save()		
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewReason(pInput As ASPMining.CanonicalModel.Operation.StatusReason, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Operation.StatusReason).IdIndexExists(pInput.Reason) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewShift(pInput As ASPMining.CanonicalModel.Planning.Shift, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Planning.Shift).ShiftIndexExists(pInput.Id) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewDump(pInput As ASPMining.CanonicalModel.Production.DumpEvent, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Production.DumpEvent).DumpIndexExists(pInput.DumpId) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewLoad(pInput As ASPMining.CanonicalModel.Production.LoadEvent, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Production.LoadEvent).LoadIndexExists(pInput.LoadId) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewProductionEvent(pInput As ASPMining.CanonicalModel.Production.ProductionEvent, Output pOutput As Ens.Response) As %Status
{
	#Dim pInput as ASPMining.CanonicalModel.Production.ProductionEvent
	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Production.ProductionEvent).IdIndexExists(pInput.Id) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewUnifiedEvent(pInput As ASPMining.CanonicalModel.Operation.UnifiedEvents, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Operation.UnifiedEvents).IdIndexExists(pInput.Id) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewStatusEvent(pInput As ASPMining.CanonicalModel.Operation.StatusEvent, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Operation.StatusEvent).IdIndexExists(pInput.Id) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewOEMEvent(pInput As ASPMining.CanonicalModel.HWMonitoring.OEMEvent, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.HWMonitoring.OEMEvent).OEMEventIndexExists(pInput.Id) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewSlicedEvent(pInput As ASPMining.ConnectorModules.BO.SlicedEvent, Output pOutput As Ens.Response) As %Status
{
	#Dim eventChange As OEE.Data.EventChange
	#Dim previousChange As OEE.Data.EventChange
	#Dim timeSlice As OEE.Data.OEETimeSlice
	
	Set sc=$$$OK
	
	Try
	{		
		Set event = ##class(ASPMining.CanonicalModel.Operation.StatusEventSliced).%New()
		#Dim event As ASPMining.CanonicalModel.Operation.StatusEventSliced
		
		// Check if equipment exists and open it, if not, make a fake one, which should not be seen if everything works right
		If ##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexExists(pInput.EquipmentId){
			Set event.Equipment = ##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexOpen(pInput.EquipmentId)
		}else{
			Set event.Equipment = ##class(ASPMining.CanonicalModel.Equipment.Equipment).%New()
			set event.Equipment.Id = pInput.EquipmentId
			set event.Equipment.Name = "GENERATED BY OPERATION"
			set event.Equipment.Capacity = 300
			// Resolve Category
			if '##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).EquipmentCategoryIndexExists("GENERATED BY OPERATION") {
				Set event.Equipment.EquipmentCategory = ##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).%New() 
				Set event.Equipment.EquipmentCategory.Name = "GENERATED BY OPERATION"
			}else{
				Set event.Equipment.EquipmentCategory = ##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).EquipmentCategoryIndexOpen("GENERATED BY OPERATION")
			}
			
			// Resolve Model
			if '##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).EquipmentModelIndexExists("GENERATED BY OPERATION") {
				Set event.Equipment.EquipmentModel = ##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).%New() 
				Set event.Equipment.EquipmentModel.Model = "GENERATED BY OPERATION"
			}else{
				Set event.Equipment.EquipmentModel = ##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).EquipmentModelIndexOpen("GENERATED BY OPERATION")
			}
		}
		
		//Validate Reasons
		If '##class(ASPMining.CanonicalModel.Operation.StatusReason).IdIndexExists(pInput.StatusReasonId) {
			Set event.StatusReason = ##class(ASPMining.CanonicalModel.Operation.StatusReason).%New()
			Set event.StatusReason.Reason = pInput.StatusReasonId
			Set event.StatusReason.Description = "GENERATED BY OPERATION"
		}else{
			Set event.StatusReason = ##class(ASPMining.CanonicalModel.Operation.StatusReason).IdIndexOpen(pInput.StatusReasonId)
		}
		
		//Validate Reason Types
		If '##class(ASPMining.CanonicalModel.Operation.StatusType).TypeIndexExists(pInput.StatusTypeId){
			Set event.StatusType = ##class(ASPMining.CanonicalModel.Operation.StatusType).%New()
			Set event.StatusType.Type = pInput.StatusTypeId
			Set event.StatusType.Description = "GENERATED BY OPERATION"
		}else{
			Set event.StatusType = ##class(ASPMining.CanonicalModel.Operation.StatusType).TypeIndexOpen(pInput.StatusTypeId)
		}
		
		//Validate Shift
		If '##class(ASPMining.CanonicalModel.Planning.Shift).ShiftIndexExists(pInput.ShiftId){
			set event.Shift = ##class(ASPMining.CanonicalModel.Planning.Shift).%New()
			set event.Shift.Id = pInput.ShiftId
		}else{
			set event.Shift = ##class(ASPMining.CanonicalModel.Planning.Shift).ShiftIndexOpen(pInput.ShiftId)
		}
		
		Set event.SliceStartDate = pInput.SliceStartDate
		set event.PartialDuration = pInput.PartialDuration
		set event.ddbkey = pInput.ddbkey
		
		Set sc = event.%Save()
		
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewProductionEventSliced(pInput As ASPMining.CanonicalModel.Production.ProductionEventSliced, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		//If '##class(ASPMining.CanonicalModel.Production.ProductionEventSliced).IndexExists(pInput.Id) {
		
			// Saves the slice and updates the truck and excav last slice
			Set sc = pInput.%Save()
			//set truck = ##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexOpen(pInput.EquipmentTruck.Id)
			//set truck.LastProductionUpdate = pInput
			//Set sc2 = truck.%Save()
			//set excav = ##class(ASPMining.CanonicalModel.Equipment.Equipment).EquipmentIndexOpen(pInput.EquipmentExcav.Id)
			//set excav.LastProductionUpdate = pInput
			//Set sc3 = excav.%Save()
		//}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewCategory(pInput As ASPMining.CanonicalModel.Equipment.EquipmentCategory, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Equipment.EquipmentCategory).EquipmentCategoryIndexExists(pInput.Name) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

Method NewModel(pInput As ASPMining.CanonicalModel.Equipment.EquipmentModel, Output pOutput As Ens.Response) As %Status
{

	Set sc=$$$OK
	
	Try
	{		
		If '##class(ASPMining.CanonicalModel.Equipment.EquipmentModel).EquipmentModelIndexExists(pInput.Model) {
			Set sc = pInput.%Save()
		}
	}
	Catch (oException)
	{
		Set sc = oException.AsStatus()
	}
	
	Quit sc
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="ASPMining.ConnectorModules.BO.CompleteEvent">
        <Method>NewCompleteEvent</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Equipment.Equipment">
        <Method>NewEquipment</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Operation.StatusReason">
        <Method>NewReason</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Planning.Shift">
        <Method>NewShift</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Production.DumpEvent">
        <Method>NewDump</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Production.LoadEvent">
        <Method>NewLoad</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.HWMonitoring.OEMEvent">
        <Method>NewOEMEvent</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.ConnectorModules.BO.SlicedEvent">
        <Method>NewSlicedEvent</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Production.ProductionEventSliced">
        <Method>NewProductionEventSliced</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Production.ProductionEvent">
        <Method>NewProductionEvent</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Operation.UnifiedEvents">
        <Method>NewUnifiedEvent</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Operation.StatusEvent">
        <Method>NewStatusEvent</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Equipment.EquipmentCategory">
        <Method>NewCategory</Method>
    </MapItem>
    <MapItem MessageType="ASPMining.CanonicalModel.Equipment.EquipmentModel">
        <Method>NewModel</Method>
    </MapItem>
</MapItems>
}

}