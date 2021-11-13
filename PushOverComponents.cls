Class User.PushOverComponents Extends (%Persistent, %JSON.Adaptor)
{

Property Time As %TimeStamp;

Property SessionId As %Integer;

Property AlertText As %String(MAXLEN = 50, TRUNCATE = 1);

Storage Default
{
<Data name="PushOverComponentsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SiteName</Value>
</Value>
<Value name="3">
<Value>ServerName</Value>
</Value>
<Value name="4">
<Value>ServerId</Value>
</Value>
<Value name="5">
<Value>ProductionName</Value>
</Value>
<Value name="6">
<Value>EventDateTime</Value>
</Value>
<Value name="7">
<Value>EventCode</Value>
</Value>
<Value name="8">
<Value>EventItem</Value>
</Value>
<Value name="9">
<Value>EventCodeId</Value>
</Value>
<Value name="10">
<Value>EventDescription</Value>
</Value>
<Value name="11">
<Value>EventValue</Value>
</Value>
<Value name="12">
<Value>EventValueUnits</Value>
</Value>
<Value name="13">
<Value>EventSD25</Value>
</Value>
<Value name="14">
<Value>EventAlertValue</Value>
</Value>
<Value name="15">
<Value>EventAlertNow</Value>
</Value>
<Value name="16">
<Value>ErrorCode</Value>
</Value>
<Value name="17">
<Value>EventValue2</Value>
</Value>
<Value name="18">
<Value>EventValue3</Value>
</Value>
<Value name="19">
<Value>EventValue4</Value>
</Value>
<Value name="20">
<Value>EventValue5</Value>
</Value>
<Value name="21">
<Value>Time</Value>
</Value>
<Value name="22">
<Value>SessionId</Value>
</Value>
<Value name="23">
<Value>AlertText</Value>
</Value>
</Data>
<DataLocation>^User.PushOverComponentsD</DataLocation>
<DefaultData>PushOverComponentsDefaultData</DefaultData>
<IdLocation>^User.PushOverComponentsD</IdLocation>
<IndexLocation>^User.PushOverComponentsI</IndexLocation>
<StreamLocation>^User.PushOverComponentsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
