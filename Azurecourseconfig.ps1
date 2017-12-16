Configuration AzureCouseConfig
{
    Node WebServer
    {
        WindowsFeature IIS
        {
            Ensure = 'Present'
            Name = 'Web-Server'
            IncludeAllSubFeature = $true
        }
        Group Develops
        {
            Ensure = 'Present'
            GroupName = 'DevGroup'
        }
        Group Accountants
        {
            Ensure = 'Absent'
            GroupName = 'AcctGroup'
        }
        File DirectoryCreate
        {
            Ensure = 'Present'
            Type = 'Directory'
            DestinationPath = 'C:\Users\Public\Documents\MyDemo'
        }
        Log AfterDirectoryCreate
        {
            Message = 'Directory Created Using DSC'
            DependsOn = '[File]DirectoryCreate'
        }
    }
}
