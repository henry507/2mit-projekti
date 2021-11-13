Class User.PushOver Extends Ens.BusinessOperation
{

Parameter ADAPTER = "EnsLib.HTTP.OutboundAdapter";

Property Adapter As EnsLib.HTTP.OutboundAdapter;

Parameter INVOCATION = "Queue";

Method OnAlert(pReq As User.PushOverComponents, Output pResp As %String) As %Status
{
    
        Set Message =##class(%FileCharacterStream).%New()
        Set Message.FileName="E:\InterSystems\Team_1\mgr\AMK\Alert\Alerts_2021-10-06.txt"
        While 'stream.AtEnd {
	        Set line=Message.ReadLine()}
	        Do Message.Close()
        
        Set title = "Is test"
        
        Set httprequest = ##class(%Net.HttpRequest).%New()
        
        Set httprequest.SSLConfiguration = "Pushover"
        
        Set httprequest.Https = $$$YES
        
        Set httprequest.Server = "api.pushover.net"
        
        Set httprequest.Location = "/1/messages.json"
        
        Set httprequest.ContentType = "application/x-www-form-urlencoded"
        
        Do httprequest.SetParam("token","axs8abm837y6x6ghzm8ateq1fd7bfd")
        
        Do httprequest.SetParam("user","u5d2491xhnesvkq7bjpagm5nqshd6s")
        
        Do httprequest.SetParam("device","Black7")
        
        Do httprequest.SetParam("title",title)
        
        Do httprequest.SetParam("html",1)
        
        Do httprequest.SetParam("message",Message)
        
        Do httprequest.Post(,0)
        
        set stream = httprequest.HttpResponse.Data
            
        while 'stream.AtEnd {
                Set pResp = stream.Read($$$MaxStringLength)
        }
    
    Quit $$$OK
}

XData MessageMap
{
<MapItems>
    <MapItem MessageType="User.PushOverComponents"> 
        <Method>OnAlert</Method>
    </MapItem>
</MapItems>
}

Storage Default
{
<Data name="PushOverDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Adapter</Value>
</Value>
</Data>
<DataLocation>^User.PushOverD</DataLocation>
<DefaultData>PushOverDefaultData</DefaultData>
<IdLocation>^User.PushOverD</IdLocation>
<IndexLocation>^User.PushOverI</IndexLocation>
<StreamLocation>^User.PushOverS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
