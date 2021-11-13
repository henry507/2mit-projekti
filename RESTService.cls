Class User.RESTService Extends (User.REST.Base, Ens.BusinessService)
{

Parameter HandleCorsRequest = 1;

XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/all" Method="GET" Call="GETServices"/>
<Route Url="/:id" Method="GET" Call="GETService"/>
<Route Url="/:id" Method="PUT" Call="PUTService"/>
<Route Url="/:id" Method="DELETE" Call="DELETEService"/>
<Route Url="/" Method="POST" Call="POSTService"/>
</Routes>
}

/// Noutaa kaiken data tietokannasta
ClassMethod GETServices() As %Status
{
    #dim tSC As %Status = $$$OK
    Set rset = ##class(User.PushOverComponents).ExtentFunc()

    Set %response.ContentType = ..#CONTENTTYPEJSON
    Write "["
    if rset.%Next() {
        Set data = ##class(User.PushOverComponents).%OpenId(rset.ID)
        Do data.%JSONExport()
    }
    While rset.%Next() {
        Write ","
        Set data = ##class(User.PushOverComponents).%OpenId(rset.ID)
        Do data.%JSONExport()
    }
    Write "]"
    Quit tSC
}

/// Noutaa dataa tietokannasta id:n mukaan
ClassMethod GETService(id As %Integer) As %Status
{
	#dim tSC As %Status = $$$OK
    #dim e As %Exception.AbstractException

    Set %response.ContentType = ..#CONTENTTYPEJSON

    Set data = ##class(User.PushOverComponents).%OpenId(id)

    If '$IsObject(data) Quit ..Http404()

    Do data.%JSONExport()

    Quit tSC
}

/// Luo uuden id:n ja siihen haluttua dataa
ClassMethod POSTService() As %Status
{
	#dim tSC As %Status = $$$OK
    #dim e As %Exception.AbstractException
    Set test = ##class(User.PushOverComponents).%New()
    Set data = %request.Content

    $$$TOE(tSC,test.%JSONImport(data))
    $$$TOE(tSC,test.%Save())

    Set %response.Status = 204
    Set %response.ContentType = ..#CONTENTTYPEJSON
    //Do data.%ToJSON()
    Do test.%JSONExport()

    Quit tSC
}

/// Päivitä dataa id:n perusteella
ClassMethod PUTService(id As %Integer) As %Status
{
    #dim tSC As %Status = $$$OK
    #dim e As %Exception.AbstractException
    Set test = ##class(User.PushOverComponents).%OpenId(id)
    If '$IsOBject(test) Return ..Http404()
    Set data = %request.Content

    $$$TOE(tSC,test.%JSONImport(data))
    $$$TOE(tSC,test.%Save())

    Set %response.Status = 200

    Set %response.ContentType = ..#CONTENTTYPEJSON
    Do test.%JSONExport()

    Quit tSC
}

/// Poista dataa id:n perusteella
ClassMethod DELETEService(id As %Integer) As %Status
{
	#dim tSC As %Status = $$$OK
    #dim e As %Exception.AbstractException
    Set test = ##class(User.PushOverComponents).%OpenId(id)
    If '$IsObject(test) Return ..Http404()

    $$$TOE(tSC,test.%DeleteId(id))

    Set %response.Status = 200

    Set %response.ContentType = ..#CONTENTTYPEJSON

    Quit tSC
}

}
