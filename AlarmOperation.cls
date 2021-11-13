Class User.AlarmOperation Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.File.OutboundAdapter";

Property Adapter As EnsLib.File.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method WriteAlert(pRequest As Ens.AlertRequest, Output pResponse As Ens.Response) As %Status
{
	#Dim tFileName As %String = "Alerts_" _ $ZDate($Horolog, 3) _ ".txt"
	#Dim tStatus As %Status = $$$OK
	
	Set tStatus = ..Adapter.PutLine(tFileName, "Time: " _ pRequest.AlertTime)
	If $$$ISERR(tStatus) Quit tStatus
	Set tStatus = ..Adapter.PutLine(tFileName, "Source: " _ pRequest.SourceConfigName)
	If $$$ISERR(tStatus) Quit tStatus
	Set tStatus = ..Adapter.PutLine(tFileName, "Session: " _ pRequest.SessionId)
	If $$$ISERR(tStatus) Quit tStatus
	Set tStatus = ..Adapter.PutLine(tFileName, "AlertText: " _ pRequest.AlertText)
	If $$$ISERR(tStatus) Quit tStatus
	Set tStatus = ..Adapter.PutLine(tFileName, "Destination: " _ pRequest.AlertDestination)
	If $$$ISERR(tStatus) Quit tStatus
	Set tStatus = ..Adapter.PutLine(tFileName, "--------------------------------------------------")

	Quit tStatus
}

XData MessageMap
{
<MapItems>
	<MapItem MessageType="Ens.AlertRequest"> 
		<Method>WriteAlert</Method>
	</MapItem>
</MapItems>
}

}
