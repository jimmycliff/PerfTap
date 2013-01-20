param
(
	[Parameter()]
	[Array] $settings = @{}
)

$config = @{
        Server = 'server.addr'; 
        Port = 8125; 
        Key = 'Key'; 
        SampleInterval = '00:00:01'; 
        DefinitionPaths = 'CounterDefinitions\system.counters','CounterDefinitions\webservice.counters'; 
        CounterNames = '\Processor(*)\% Processor Time';
    }
    $args = @{
        ScriptBlock = $executioncontext.InvokeCommand.NewScriptBlock((new-object Net.WebClient).DownloadString('https://raw.github.com/EastPoint/PerfTap/master/InstallPerfTap.ps1'));
        ArgumentList = $config
    }
    Invoke-Command @args