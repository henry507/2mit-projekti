Class User.DataTransformation Extends Ens.DataTransformDTL [ DependsOn = (Ens.AlertRequest, User.PushOverComponents) ]
{

Parameter IGNOREMISSINGSOURCE = 1;

Parameter REPORTERRORS = 1;

Parameter TREATEMPTYREPEATINGFIELDASNULL = 0;

XData DTL [ XMLNamespace = "http://www.intersystems.com/dtl" ]
{
<transform sourceClass='Ens.AlertRequest' targetClass='User.PushOverComponents' create='new' language='objectscript' >
<assign value='source.AlertTime' property='target.Time' action='set' />
<assign value='source.SessionId' property='target.SessionId' action='set' />
<assign value='source.AlertText' property='target.AlertText' action='set' />
</transform>
}

}
