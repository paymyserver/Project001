'
' WINDOW MYRT [MALAYSIA REMOTE TOOL] MANAGER
' Copyright (c) Alexander Eric, NOT PORNHUB MASTER
' Download myrt.cmd&cmd.exe
' Download file ini
' 
' Then, gunakan cmd.exe, taipkan "myrt"
' Ke bahasa 'altantuya' lebih best? gurau.
' altantuya v1.0.0

Option Explicit

'''''''''''''''''''''
' Kesalahan Kod
private const ERR_OK              = 0
private const ERR_GENERAL_FAILURE = 1

'''''''''''''''''''''
' Contoh Uras
private const L_ONLYCSCRIPT_Message     = "Can be executed only by cscript.exe."
private const L_UNKOPNM_Message         = "Unknown operation name: "
private const L_OP_Message              = "Operation - "
private const L_NOFILE_Message          = "File does not exist: "
private const L_PARZERO_Message         = "Parameter is zero length #"
private const L_INVOPT_ErrorMessage     = "Switch not allowed with the given operation: "
private const L_UNKOPT_ErrorMessage     = "Unknown switch: "
private const L_BLANKOPT_ErrorMessage   = "Missing switch name"
private const L_UNKOPT_GenMessage       = "Invalid use of command line. Type ""myrt -alex"" for Bantu."
private const L_Bantu_GenMessage         = "Type ""myrt -alex"" for Bantu."
private const L_ScriptNameNotFound_ErrorMessage = "Invalid usage of command line; myrt.vbs not found in command string."
private const L_ImproperUseOfQuotes_ErrorMessage = "A quoted parameter value must begin and end with quotes: "
private const L_BADMATCNT1_Message      = "Unexpected match count - one match is expected: "
private const L_OPTNOTUNQ_Message       = "Option is not unique: "
private const L_URIMISSING_Message      = "URI is missing"
private const L_ACTIONMISSING_Message   = "Action is missing"
private const L_URIZERO_Message         = "URI is 0 length"    
private const L_URIZEROTOK_Message      = "Invalid URI, token is 0 length"    
private const L_INVWMIURI1_Message      = "Invalid WMI resource URI - no '/' found  (at least 2 expected)"
private const L_INVWMIURI2_Message      = "Invalid WMI resource URI - only one '/' found (at least 2 expected)"
private const L_NOLASTTOK_Message       = "Invalid URI - cannot locate last token for root node name"
private const L_HashSyntax_ErrorMessage = "Syntax Error: input must be of the form {KEY=""VALUE""[;KEY=""VALUE""]}"
private const L_ARGNOVAL_Message        = "Argument's value is not provided: "
private const L_XMLERROR_Message        = "Unable to parse XML: "
private const L_XSLERROR_Message        = "Unable to parse XSL file. Either it is inaccessible or invalid: "
private const L_MSXML6MISSING_Message   = "Unable to load MSXML6, required by -format option and for set using ""@{...}"""
private const L_FORMATLERROR_Message    = "Invalid option for -format: "
private const L_FORMATFAILED_Message    = "Unable to reformat message. Raw, unformatted, message: "
private const L_PUT_PARAM_NOMATCH_Message = "Parameter name does not match any properties on resource: "
private const L_PUT_PARAM_MULTIMATCH_Message = "Parameter matches more than one property on resource: "
private const L_PUT_PARAM_NOARRAY_Message = "Multiple matching parameter names not allowedin @{...}: "
private const L_PUT_PARAM_NOTATTR_Message = "Parameter matches a non-text property on resource: "
private const L_PUT_PARAM_EMPTY_Message = "Parameter set is empty."
private const L_OPTIONS_PARAMETER_EMPTY_Message = "Options parameter has no value or is malformed."
private const L_RESOURCELOCATOR_Message = "Unable to create ResourceLocator object."
private const L_PUT_PARAM_NOINPUT_Message = "No input provided through ""@{...}"" or ""-file:"" commandline parameters."
private const L_ERR_Message = "Error: "
private const L_ERRNO_Message = "Error number: "
private const L_OpDoesntAcceptInput_ErrorMessage = "Input was supplied to an operation that does not accept input."
private const L_atursegeraNoChangesNeeded_Message = "myrt is already set up for remote management on this computer."
private const L_atursegera_MissingUpdateXml_0_ErrorMessage = "Could not find update instructions in analysis result."
private const L_atursegeraUpdated_Message = "myrt has been updated for remote management."
private const L_atursegeraUpdateFailed_ErrorMessage = "One or more update steps could not be completed."
private const L_atursegera_InvalidBool_0_ErrorMessage = "Could not determine if remoting is enabled."
private const L_atursegera_RemotingDisabledbyGP_00_ErrorMessage = "Cannot complete the request due to a conflicting Group Policy setting."
private const L_atursegera_UpdatesNeeded_0_Message = "myrt is not set up to allow remote access to this machine for management."
private const L_atursegera_UpdatesNeeded_1_Message = "The following changes must be made:"
private const L_atursegera_Prompt_0_Message = "Make these changes [y/n]? "
private const L_atursegeraNoServiceChangesNeeded_Message = "myrt is already set up to receive requests on this computer."
private const L_atursegeraNoServiceChangesNeeded_Message2 = "myrt service is already running on this machine."
private const L_atursegeraUpdatedService_Message = "myrt has been updated to receive requests."
private const L_atursegera_ServiceUpdatesNeeded_0_Message = "myrt is not set up to receive requests on this machine."


'''''''''''''''''''''
' Bantu - AWAM
private const L_Bantu_Title_0_Message = "WINDOW MYRT [MALAYSIA REMOTE TOOL] MANAGER                                           remote altantuya ver:1.0.0"

private const L_Bantu_Blank_0_Message = "leave_blank"

private const L_Bantu_SeeAlso_Title_Message    = "See also:"
private const X_Bantu_SeeAlso_Aliases_Message  = "myrt bantu gelar"
private const X_Bantu_SeeAlso_Config_Message   = "myrt bantu aturan"
private const X_Bantu_SeeAlso_CertMapping_Message  = "myrt bantu siasat"
private const X_Bantu_SeeAlso_CustomRemoteShell_Message    = "myrt bantu customremoteshell"
private const X_Bantu_SeeAlso_Input_Message    = "myrt bantu nilai"
private const X_Bantu_SeeAlso_Filters_Message  = "myrt bantu filters"
private const X_Bantu_SeeAlso_Switches_Message = "myrt bantu altantuya"
private const X_Bantu_SeeAlso_Uris_Message     = "myrt bantu uris"
private const X_Bantu_SeeAlso_Auth_Message     = "myrt bantu keutamaan"
private const X_Bantu_SeeAlso_Set_Message      = "myrt set -alex"
private const X_Bantu_SeeAlso_Create_Message   = "myrt create -alex"
private const X_Bantu_SeeAlso_Enumerate_Message   = "myrt enumerate -alex"
private const X_Bantu_SeeAlso_Invoke_Message   = "myrt invoke -alex"
private const X_Bantu_SeeAlso_Remoting_Message = "myrt bantu mengawal"
private const X_Bantu_SeeAlso_aturSSDL_Message = "myrt aturSSDL -alex"


'''''''''''''''''''''
'Bantu - Bantu
private const L_BantuBantu_000_0_Message = "Window Malaysia Remote Management (myrt) ialah penerapan Microsoft untuk WS-Protokol Pengurusan yang membenarkan"
private const L_BantuBantu_001_0_Message = "komunikasi yang lebih baik antara 'local' dan mesin mudah alih menggunakan internet atau web servis. "
private const L_BantuBantu_001_1_Message = "command protocol diubahsuai oleh:[ALEXANDER ERIC]                                           "                                            
private const L_BantuBantu_002_0_Message = "________________________________________________________________________________________________________________"
private const L_BantuBantu_003_0_Message = "KEGUNAAN:"
private const L_BantuBantu_004_0_Message = "	myrt OPERASI PUNCA_URI [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuBantu_005_0_Message = "         [@{KUNCI=NILAI[;KUNCI=NILAI]...}].				       #BesertaCommandHaramYangLain"
private const L_BantuBantu_006_0_Message = "leave_blank"
private const L_BantuBantu_007_0_Message = "________________________________________________________________________________________________________________"
private const L_BantuBantu_008_0_Message = "Untuk bantuan mengenai operasi tertentu:"
private const L_BantuBantu_009_0_Message = "	myrt d[apat] 	-alex      Mendapatkan pengurusan maklumat"
private const L_BantuBantu_010_0_Message = " 	myrt s[et] 	-alex      Mengubah pengurusan informasi."
private const L_BantuBantu_011_0_Message = "  	myrt c[ipta] 	-alex      Mencipta punca pengurusan segera."
private const L_BantuBantu_012_0_Message = " 	myrt b[uang] 	-alex      Membuang punca pengurusan segera."
private const L_BantuBantu_013_0_Message = "  	myrt s[enarai] 	-alex  	   Senarai semua punca pengurusan segera."
private const L_BantuBantu_014_0_Message = "  	myrt l[aksana] 	-alex      Menlaksanakan langkah untuk punca pengurusan."
private const L_BantuBantu_015_0_Message = "  	myrt id[entiti] -alex      Memastikan jika kawalan pengurusan diadakan"
private const L_BantuBantu_015_1_Message = "                        	   pada mesin kawalan anda."
private const L_BantuBantu_016_0_Message = "  	myrt atursegera -alex  	   Mengatur mesin untuk menerima system kawalan "
private const L_BantuBantu_016_1_Message = "                        	   daripada mesin kawalan yang lain."
private const L_BantuBantu_016_3_Message = "  	myrt aturSSDL 	-alex      Mengubahsuai keselamatan 'tidak jujur' pada URI yang ada."
private const L_BantuBantu_016_4_Message = " 	myrt bantumsg 	-alex      Memaparkan kesalahan kod untuk kod yang salah."
private const L_BantuBantu_017_0_Message = "_______________________________________________________________________________________________________________"
private const L_BantuBantu_017_0a_Message = "-----------------------------------------------------------------------------------------------------"
private const L_BantuBantu_018_0_Message = "Untuk Bantuan berkaitan hal:"
private const L_BantuBantu_019_0_Message = " 	myrt bantu uris       	   Bagaimana untuk menyusun punca URIs. p/s Dengar lagu Steel Panther \m/"
private const L_BantuBantu_020_0_Message = " 	myrt bantu gelar    	   Gelaran lain untuk URIs. p/s dengarlah lagu Avenged Sevenfold"
private const L_BantuBantu_021_0_Message = " 	myrt bantu aturan     	   Mengatur myrt client dan aturan servis."
private const L_BantuBantu_021_2_Message = " 	myrt bantu siasat 	   Mengatur kemasukkan sijil client. p/s dengar lagu trivium."
private const L_BantuBantu_022_0_Message = " 	myrt bantu mengawal   	   Bagaimana untuk memasuki kawalan mesin."
private const L_BantuBantu_023_0_Message = " 	myrt bantu keutamaan       Menyediakan kebenaran untuk kemasukkan kawalan."
private const L_BantuBantu_024_0_Message = " 	myrt bantu nilai      	   Menyediakan nilai untuk dibuat, set, dan laksana."
private const L_BantuBantu_025_0_Message = " 	myrt bantu altantuya   	   Mengubah arahan unutuk format, aturan, dan lain-lain."
private const L_BantuBantu_026_0_Message = " 	myrt bantu kompas      	   Menyediakan informasi alamat."
private const L_BantuBantu_027_0_Message = "_______________________________________________________________________________________________________________"
'''''''''''''''''''''
'Bantu - dapat
private const L_Bantudapat_000_0_Message = "myrt dapat RESOURCE_URI [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_Bantudapat_001_0_Message = ""
private const L_Bantudapat_002_0_Message = "Retrieves instances of RESOURCE_URI using specified "
private const L_Bantudapat_003_0_Message = "options and key-value pairs."
private const L_Bantudapat_004_0_Message = ""
private const L_Bantudapat_005_0_Message = "Example: Retrieve current configuration in XML format:"
private const X_Bantudapat_006_0_Message = "  myrt dapat myrt/config -format:pretty"
private const L_Bantudapat_007_0_Message = ""
private const L_Bantudapat_008_0_Message = "Example: Retrieve spooler instance of Win32_Service class:"
private const X_Bantudapat_009_0_Message = "  myrt dapat wmicimv2/Win32_Service?Name=spooler"
private const L_Bantudapat_010_0_Message = ""
private const L_Bantudapat_014_0_Message = "Example: Retrieve a certmapping entry on this machine:"
private const X_Bantudapat_015_0_Message = "  myrt dapat myrt/config/service/certmapping?Issuer=1212131238d84023982e381f20391a2935301923+Subject=*.example.com+URI=wmicimv2/*"
private const L_Bantudapat_016_0_Message = ""

'''''''''''''''''''''
'Bantu - SET
private const L_BantuSet_001_0_Message = "myrt set RESOURCE_URI [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuSet_002_0_Message = "          [@{KEY=""VALUE""[;KEY=""VALUE""]}]"
private const L_BantuSet_003_0_Message = "          [-file:VALUE]"
private const L_BantuSet_004_0_Message = ""
private const L_BantuSet_005_0_Message = "Modifies settings in RESOURCE_URI using specified switches"
private const L_BantuSet_006_0_Message = "and input of changed values via key-value pairs or updated "
private const L_BantuSet_007_0_Message = "object via an input file."
private const L_BantuSet_008_0_Message = ""
private const L_BantuSet_009_0_Message = "Example: Modify a configuration property of myrt:"
private const X_BantuSet_010_0_Message = "  myrt set myrt/config @{MaxEnvelopeSizekb=""100""}"
private const L_BantuSet_011_0_Message = ""
private const L_BantuSet_012_0_Message = "Example: Disable a listener on this machine:"
private const X_BantuSet_013_0_Message = "  myrt set myrt/config/Listener?Address=*+Transport=HTTPS @{Enabled=""false""}"
private const L_BantuSet_014_0_Message = ""
private const L_BantuSet_018_0_Message = "Example: Disable a certmapping entry on this machine:"
private const X_BantuSet_019_0_Message = "  myrt set myrt/config/service/certmapping?Issuer=1212131238d84023982e381f20391a2935301923+Subject=*.example.com+URI=wmicimv2/* @{Enabled=""false""}"
private const L_BantuSet_020_0_Message = ""

'''''''''''''''''''''
'Bantu - CIPTA
private const L_BantuCreate_001_0_Message = "myrt create RESOURCE_URI [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuCreate_002_0_Message = "             [@{KEY=""VALUE""[;KEY=""VALUE""]}]"
private const L_BantuCreate_003_0_Message = "             [-file:VALUE]"
private const L_BantuCreate_004_0_Message = ""
private const L_BantuCreate_005_0_Message = "Spawns an instance of RESOURCE_URI using specified "
private const L_BantuCreate_006_0_Message = "key-value pairs or input file."
private const L_BantuCreate_007_0_Message = ""
private const L_BantuCreate_008_0_Message = "Example: Create instance of HTTP Listener on IPv6 address:"
private const X_BantuCreate_009_0_Message = "  myrt create myrt/config/Listener?Address=IP:3ffe:8311:ffff:f2c1::5e61+Transport=HTTP"
private const L_BantuCreate_010_0_Message = ""
private const L_BantuCreate_011_0_Message = "Example: Create instance of HTTPS Listener on all IPs:"
private const X_BantuCreate_012_0_Message = "  myrt create myrt/config/Listener?Address=*+Transport=HTTPS @{Hostname=""HOST"";CertificateThumbprint=""XXXXXXXXXX""}"
private const L_BantuCreate_013_0_Message = "Note: XXXXXXXXXX represents a 40-digit hex string; see Bantu config."
private const L_BantuCreate_014_0_Message = ""
private const L_BantuCreate_015_0_Message = "Example: Create a windows shell command instance from xml:"
private const X_BantuCreate_016_0_Message = "  myrt create shell/cmd -file:shell.xml -remote:srv.corp.com"
private const L_BantuCreate_017_0_Message = ""
private const L_BantuCreate_022_0_Message = "Example: Create a CertMapping entry:"
private const X_BantuCreate_023_0_Message = "  myrt create myrt/config/service/certmapping?Issuer=1212131238d84023982e381f20391a2935301923+Subject=*.example.com+URI=wmicimv2/* @{UserName=""USERNAME"";Password=""PASSWORD""} -remote:localhost"
private const L_BantuCreate_024_0_Message = ""


'''''''''''''''''''''
'Bantu - BUANG
private const L_BantuDelete_001_0_Message = "myrt delete RESOURCE_URI [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuDelete_002_0_Message = ""
private const L_BantuDelete_003_0_Message = "Removes an instance of RESOURCE_URI."
private const L_BantuDelete_004_0_Message = ""
private const L_BantuDelete_005_0_Message = "Example: delete the HTTP listener on this machine for given IP address:"
private const X_BantuDelete_006_0_Message = "  myrt delete myrt/config/Listener?Address=IP:192.168.2.1+Transport=HTTP"
private const L_BantuDelete_007_0_Message = ""
private const L_BantuDelete_008_0_Message = "Example: delete a certmapping entry:"
private const X_BantuDelete_009_0_Message = "  myrt delete myrt/config/service/certmapping?Issuer=1212131238d84023982e381f20391a2935301923+Subject=*.example.com+URI=wmicimv2/*"
private const L_BantuDelete_010_0_Message = ""

'''''''''''''''''''''
'Bantu - SENARAI
private const L_BantuEnum_001_0_Message = "myrt enumerate RESOURCE_URI [-ReturnType:Value] [-Shallow]" 
private const L_BantuEnum_001_1_Message = "         [-BasePropertiesOnly] [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuEnum_002_0_Message = ""
private const L_BantuEnum_003_0_Message = "Lists instances of RESOURCE_URI."
private const L_BantuEnum_004_0_Message = "Can limit the instances returned by using a filter and dialect if the "
private const L_BantuEnum_005_0_Message = "resource supports these."
private const L_BantuEnum_006_0_Message = ""
private const L_BantuEnum_006_1_Message = "ReturnType"
private const L_BantuEnum_006_2_Message = "----------"
private const L_BantuEnum_006_3_Message = "returnType is an optional switch that determines the type of data returned."
private const L_BantuEnum_006_4_Message = "Possible options are 'Object', 'EPR'  and 'ObjectAndEPR'. Default is Object"
private const L_BantuEnum_006_5_Message = "If Object is specified or if switch is omitted, then only the objects are"
private const L_BantuEnum_006_6_Message = "returned."
private const L_BantuEnum_006_7_Message = "If EPR is specified, then only the EPRs (End point reference) of the"
private const L_BantuEnum_006_8_Message = "objects are returned. EPRs contain information about the resource URI and"
private const L_BantuEnum_006_9_Message = "selectors for the instance."
private const L_BantuEnum_006_10_Message = "If ObjectAndEPR is specified, then both the object and the associated EPRs"
private const L_BantuEnum_006_11_Message = "are returned."
private const L_BantuEnum_006_12_Message = ""
private const L_BantuEnum_006_13_Message = "Shallow"
private const L_BantuEnum_006_14_Message = "-------"
private const L_BantuEnum_006_15_Message = "Enumerate only instances of the base class specified in the resource URI."
private const L_BantuEnum_006_16_Message = "If this flag is not specified, instances of the base class specified in "
private const L_BantuEnum_006_17_Message = "the resource URI and all its derived classes are returned."
private const L_BantuEnum_006_18_Message = ""
private const L_BantuEnum_006_19_Message = "BasePropertiesOnly"
private const L_BantuEnum_006_20_Message = "------------------"
private const L_BantuEnum_006_21_Message = "Includes only those properties that are part of the base class specified"
private const L_BantuEnum_006_22_Message = "in the resource URI. When -Shallow is specified, this flag has no effect. "
private const L_BantuEnum_006_23_Message = ""
private const L_BantuEnum_007_0_Message = "Example: List all myrt listeners on this machine:"
private const X_BantuEnum_008_0_Message = "  myrt enumerate myrt/config/Listener"
private const L_BantuEnum_009_0_Message = ""
private const L_BantuEnum_010_0_Message = "Example: List all instances of Win32_Service class:"
private const X_BantuEnum_011_0_Message = "  myrt enumerate wmicimv2/Win32_Service"
private const L_BantuEnum_012_0_Message = ""
private const L_BantuEnum_013_0_Message = "Example: List all auto start services that are stopped:"
private const X_BantuEnum_014_0_Message = "  myrt enum wmicimv2/* -filter:""select * from win32_service where StartMode=\""Auto\"" and State = \""Stopped\"" """
private const L_BantuEnum_015_0_Message = ""
private const L_BantuEnum_016_0_Message = "Example: List all shell instances on a machine:"
private const X_BantuEnum_017_0_Message = "  myrt enum shell/cmd -remote:srv.corp.com"
private const L_BantuEnum_018_0_Message = ""
private const L_BantuEnum_019_0_Message = "Example: List resources accessible to the current user:"
private const X_BantuEnum_020_0_Message = "  myrt enum myrt/config/resource"
private const L_BantuEnum_021_0_Message = ""
private const L_BantuEnum_022_0_Message = "Example: List all certmapping settings:"
private const X_BantuEnum_023_0_Message = "  myrt enum myrt/config/service/certmapping"
private const L_BantuEnum_024_0_Message = ""

'''''''''''''''''''''
'Bantu - LAKSANA
private const L_BantuInvoke_001_0_Message = "myrt invoke ACTION RESOURCE_URI [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuInvoke_002_0_Message = "             [@{KEY=""VALUE""[;KEY=""VALUE""]}]"
private const L_BantuInvoke_003_0_Message = "             [-file:VALUE]"
private const L_BantuInvoke_004_0_Message = ""
private const L_BantuInvoke_005_0_Message = "Executes method specified by ACTION on tardapat object specified by RESOURCE_URI"
private const L_BantuInvoke_006_0_Message = "with parameters specified by key-value pairs."
private const L_BantuInvoke_007_0_Message = ""
private const L_BantuInvoke_008_0_Message = "Example: Call StartService method on Spooler service:"
private const X_BantuInvoke_009_0_Message = "  myrt invoke StartService wmicimv2/Win32_Service?Name=spooler"
private const L_BantuInvoke_010_0_Message = ""
private const L_BantuInvoke_011_0_Message = "Example: Call StopService method on Spooler service using XML file:"
private const X_BantuInvoke_012_0_Message = "  myrt invoke StopService wmicimv2/Win32_Service?Name=spooler -file:input.xml"
private const L_BantuInvoke_013_0_Message = "Where input.xml:"
private const X_BantuInvoke_014_0_Message = "<p:StopService_INPUT xmlns:p=""http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service""/>"
private const L_BantuInvoke_015_0_Message = ""
private const L_BantuInvoke_016_0_Message = "Example: Call Create method of Win32_Process class with specified parameters:"
private const X_BantuInvoke_017_0_Message = "  myrt invoke Create wmicimv2/Win32_Process @{CommandLine=""notepad.exe"";CurrentDirectory=""C:\""}"
private const L_BantuInvoke_018_0_Message = ""
private const L_BantuInvoke_019_0_Message = "Example: Restore the default myrt configuration:"
private const L_BantuInvoke_019_1_Message = "Note that this will not restore the default myrt plugin configuration:"
private const X_BantuInvoke_020_0_Message = "  myrt invoke restore myrt/config @{}"
private const L_BantuInvoke_021_0_Message = ""
private const L_BantuInvoke_022_0_Message = "Example: Restore the default myrt plugin configuration:"
private const L_BantuInvoke_022_1_Message = "Note that all external plugins will be unregistered during this operation:"
private const X_BantuInvoke_023_0_Message = "  myrt invoke restore myrt/config/plugin @{}"

'''''''''''''''''''''
'Bantu - IDENTIFY
private const X_BantuIdentify_001_0_Message = "myrt identify  [-TUKAR:NILAI [-TUKAR:NILAI] ...]"
private const L_BantuIdentify_003_0_Message = ""
private const L_BantuIdentify_004_0_Message = "Issues an operation against a remote machine to see if the WS-Management "
private const L_BantuIdentify_005_0_Message = "service is running. This operation must be run with the '-remote' switch."
private const L_BantuIdentify_006_0_Message = "To run this operation unauthenticated against the remote machine use the"
private const L_BantuIdentify_007_0_Message = "-auth:none"
private const L_BantuIdentify_008_0_Message = ""
private const L_BantuIdentify_009_0_Message = "Example: identify if WS-Management is running on www.example.com:"
private const X_BantuIdentify_010_0_Message = "  myrt identify -remote:www.example.com"


'''''''''''''''''''''
'Bantu - BantuMSG
private const X_BantuBantuMessaage_001_0_Message = "myrt Bantumsg errorcode"
private const X_BantuBantuMessaage_002_0_Message = ""
private const X_BantuBantuMessaage_003_0_Message = "Displays error message associate with the error code."
private const X_BantuBantuMessaage_004_0_Message = "Example:"
private const X_BantuBantuMessaage_006_0_Message = " myrt bantumsg 0x5"

'''''''''''''''''''''
'Bantu - GELAR
private const L_BantuAlias_001_0_Message = "Aliasing allows shortcuts to be used in place of full Resource URIs."
private const L_BantuAlias_002_0_Message = "Available aliases and the Resource URIs they substitute for are:"
private const L_BantuAlias_003_0_Message = ""
private const X_BantuAlias_004_0_Message = "wmi      = http://schemas.microsoft.com/wbem/wsman/1/wmi"
private const X_BantuAlias_005_0_Message = "wmicimv2 = http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2"
private const X_BantuAlias_006_0_Message = "cimv2    = http://schemas.dmtf.org/wbem/wscim/1/cim-schema/2"
private const X_BantuAlias_007_0_Message = "myrt    = http://schemas.microsoft.com/wbem/wsman/1"
private const X_BantuAlias_008_0_Message = "wsman    = http://schemas.microsoft.com/wbem/wsman/1"
private const X_BantuAlias_009_0_Message = "shell    = http://schemas.microsoft.com/wbem/wsman/1/windows/shell"
private const L_BantuAlias_010_0_Message = ""
private const L_BantuAlias_011_0_Message = "Example: using full Resource URI:"
private const x_BantuAlias_012_0_Message = "  myrt dapat http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service?Name=myrt"
private const L_BantuAlias_013_0_Message = ""
private const L_BantuAlias_014_0_Message = "Example: using alias:"
private const X_BantuAlias_015_0_Message = "  myrt dapat wmicimv2/Win32_Service?Name=myrt"

'''''''''''''''''''''
'Bantu - URIS
private const L_BantuUris_001_0_Message = "Universal Resource Identifiers (URI) specify management resources to be"
private const L_BantuUris_002_0_Message = "used for operations."
private const L_BantuUris_003_0_Message = ""
private const L_BantuUris_004_0_Message = "Selectors and values are passed after the URI in the form:"
private const X_BantuUris_005_0_Message = "  RESOURCE_URI?NAME=VALUE[+NAME=VALUE]..."
private const L_BantuUris_006_0_Message = ""
private const L_BantuUris_007_0_Message = "URIs for all information in WMI are of the following form:"
private const X_BantuUris_008_0_Message = "  WMI path = \\root\NAMESPACE[\NAMESPACE]\CLASS"
private const X_BantuUris_009_0_Message = "  URI      = http://schemas.microsoft.com/wbem/wsman/1/wmi/root/NAMESPACE[/NAMESPACE]/CLASS"
private const X_BantuUris_010_0_Message = "  ALIAS    = wmi/root/NAMESPACE[/NAMESPACE]/CLASS"
private const L_BantuUris_011_0_Message = ""
private const L_BantuUris_012_0_Message = "Example: dapat information about myrt service from WMI using single selector"
private const X_BantuUris_013_0_Message = "  WMI path = \\root\cimv2\Win32_Service"
private const X_BantuUris_013_1_Message = "  URI      = http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service?Name=myrt"
private const X_BantuUris_014_0_Message = "  ALIAS    = wmi/root/cimv2/Win32_Service?Name=myrt"
private const L_BantuUris_015_0_Message = ""
private const L_BantuUris_015_1_Message = "When enumerating WMI instances using a WQL filter,"
private const L_BantuUris_015_2_Message = "the CLASS must be ""*"" (star) and no selectors should be specified."
private const L_BantuUris_015_3_Message = "Example:"
private const X_BantuUris_015_4_Message = "URI = http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/*"
private const L_BantuUris_015_5_Message = ""
private const L_BantuUris_015_6_Message = "When accesing WMI singleton instances, no selectors should be specified."
private const L_BantuUris_015_7_Message = "Example:"
private const X_BantuUris_015_8_Message = "URI = http://schemas.microsoft.com/wbem/wsman/1/wmi/root/cimv2/Win32_Service"
private const L_BantuUris_015_9_Message = ""
private const L_BantuUris_016_0_Message = "Note: Some parts of RESOURCE_URI may be case-sensitive. When using create or"
private const L_BantuUris_017_0_Message = "invoke, the last part of the resource URI must match case-wise the top-level"
private const L_BantuUris_018_0_Message = "element of the expected XML."

'''''''''''''''''''''
'Bantu - ATURAN
private const L_BantuConfig_001_0_Message = "Configuration for myrt is managed using the myrt command line or through GPO."
private const L_BantuConfig_002_0_Message = "Configuration includes global configuration for both the client and service."
private const L_BantuConfig_003_0_Message = ""
private const L_BantuConfig_004_0_Message = "The myrt service requires at least one listener to indicate the IP address(es)"
private const L_BantuConfig_005_0_Message = "on which to accept WS-Management requests.  For example, if the machine has "
private const L_BantuConfig_006_0_Message = "multiple network cards, myrt can be configured to only accept requests from"
private const L_BantuConfig_007_0_Message = "one of the network cards."
private const L_BantuConfig_008_0_Message = ""
private const L_BantuConfig_009_0_Message = "Global configuration"
private const X_BantuConfig_010_0_Message = "  myrt dapat myrt/config"
private const X_BantuConfig_011_0_Message = "  myrt dapat myrt/config/client"
private const X_BantuConfig_012_0_Message = "  myrt dapat myrt/config/service"
private const X_BantuConfig_012_1_Message = "  myrt enumerate myrt/config/resource"
private const X_BantuConfig_012_2_Message = "  myrt enumerate myrt/config/listener"
private const X_BantuConfig_012_3_Message = "  myrt enumerate myrt/config/plugin"
private const X_BantuConfig_012_4_Message = "  myrt enumerate myrt/config/service/certmapping"
private const L_BantuConfig_013_0_Message = ""
private const L_BantuConfig_014_0_Message = "Network listening requires one or more listeners.  "
private const L_BantuConfig_015_0_Message = "Listeners are identified by two selectors: Address and Transport."

private const L_BantuConfigAddress_001_0_Message = "Address must be one of:"
private const L_BantuConfigAddress_002_0_Message = "  *           - Listen on all IPs on the machine "
private const L_BantuConfigAddress_003_0_Message = "  IP:1.2.3.4  - Listen only on the specified IP address"
private const L_BantuConfigAddress_004_0_Message = "  MAC:...     - Listen only on IP address for the specified MAC"
private const L_BantuConfigAddress_005_0_Message = ""
private const L_BantuConfigAddress_006_0_Message = "Note: All listening is subject to the IPv4Filter and IPv6Filter under    "
private const L_BantuConfigAddress_007_0_Message = "config/service."
private const L_BantuConfigAddress_008_0_Message = "Note: IP may be an IPv4 or IPv6 address."

private const L_BantuConfigTransport_001_0_Message = "Transport must be one of:"
private const L_BantuConfigTransport_002_0_Message = "  HTTP  - Listen for requests on HTTP  (default port is 5985)"
private const L_BantuConfigTransport_003_0_Message = "  HTTPS - Listen for requests on HTTPS (default port is 5986)"
private const L_BantuConfigTransport_004_0_Message = ""
private const L_BantuConfigTransport_005_0_Message = "Note: HTTP traffic by default only allows messages encrypted with "
private const L_BantuConfigTransport_006_0_Message = "the Negotiate or Kerberos SSP."
private const L_BantuConfigTransport_007_0_Message = ""
private const L_BantuConfigTransport_008_0_Message = ""
private const L_BantuConfigTransport_009_0_Message = "When configuring HTTPS, the following properties are used:"
private const L_BantuConfigTransport_010_0_Message = "  Hostname - Name of this machine; must match CN in certificate."
private const L_BantuConfigTransport_011_0_Message = "  CertificateThumbprint - hexadecimal thumbprint of certificate appropriate for"
private const L_BantuConfigTransport_012_0_Message = "    Server Authentication."
private const L_BantuConfigTransport_013_0_Message = "Note: If only Hostname is supplied, myrt will try to find an appropriate"
private const L_BantuConfigTransport_014_0_Message = "certificate."
   
private const L_BantuConfigExamples_001_0_Message = "Example: To listen for requests on HTTP on all IPs on the machine:"
private const X_BantuConfigExamples_002_0_Message = "  myrt create myrt/config/listener?Address=*+Transport=HTTP"
private const L_BantuConfigExamples_003_0_Message = ""
private const L_BantuConfigExamples_004_0_Message = "Example: To disable a given listener"
private const X_BantuConfigExamples_005_0_Message = "  myrt set myrt/config/listener?Address=IP:1.2.3.4+Transport=HTTP @{Enabled=""false""}"
private const L_BantuConfigExamples_006_0_Message = ""
private const L_BantuConfigExamples_007_0_Message = "Example: To enable basic authentication on the client but not the service:"
private const X_BantuConfigExamples_008_0_Message = "  myrt set myrt/config/client/auth @{Basic=""true""}"
private const L_BantuConfigExamples_009_0_Message = ""
private const L_BantuConfigExamples_010_0_Message = "Example: To enable Negotiate for all workgroup machines."
private const X_BantuConfigExamples_011_0_Message = "  myrt set myrt/config/client @{TrustedHosts=""<local>""}"
private const L_BantuConfigExamples_012_0_Message = ""
private const L_BantuConfigExamples_013_0_Message = "Example: To add an IPv4 and IPv6 host address to TrustedHosts."
private const X_BantuConfigExamples_014_0_Message = "  myrt set myrt/config/client @{TrustedHosts=""1.2.3.4,[1:2:3::8]""}"
private const L_BantuConfigExamples_015_0_Message = ""
private const L_BantuConfigExamples_016_0_Message = "  Note: Computers in the TrustedHosts list might not be authenticated"

'''''''''''''''''''''
'Bantu - SIASAT
private const L_BantuCertMapping_001_0_Message = "Certificate mapping remote access to myrt using client certificates is "
private const L_BantuCertMapping_002_0_Message = "stored in the certificate mapping table identified by the "
private const L_BantuCertMapping_003_0_Message = "following resource URI:"
private const L_BantuCertMapping_003_1_Message = ""
private const L_BantuCertMapping_004_0_Message = " myrt/config/service/CertMapping"
private const L_BantuCertMapping_005_0_Message = ""
private const L_BantuCertMapping_006_0_Message = "Each entry in this table contains five properties:"
private const L_BantuCertMapping_007_0_Message = " Issuer -  Thumbprint of the issuer certificate."
private const L_BantuCertMapping_008_0_Message = " Subject - Subject field of client certificate."
private const L_BantuCertMapping_009_0_Message = " URI - The URI or URI prefix for which this mapping applies."
private const L_BantuCertMapping_009_1_Message = " Username - Local username for processing the request."
private const L_BantuCertMapping_009_2_Message = " Password - Local password for processing the request."
private const L_BantuCertMapping_009_3_Message = " Enabled - Use in processing if true."
private const L_BantuCertMapping_010_0_Message = "  "
private const L_BantuCertMapping_011_0_Message = "For a client certificate to be applicable, the issuer certificate must be  "
private const L_BantuCertMapping_012_0_Message = "available locally and match the thumbprint in the entry Issuer property"
private const L_BantuCertMapping_012_1_Message = ""
private const L_BantuCertMapping_012_2_Message = "For a client certificate to be applicable, its DNS or Principal name "
private const L_BantuCertMapping_013_0_Message = "(from the SubjectAlternativeName field) must match the Subject property."
private const L_BantuCertMapping_014_0_Message = "The value can start with a '*' wildcard."
private const L_BantuCertMapping_014_1_Message = "The URI identifies for which resources the indicated client certificates ."
private const L_BantuCertMapping_014_2_Message = "should be mapped."
private const L_BantuCertMapping_014_3_Message = "The value can end with a '*' wildcard."
private const L_BantuCertMapping_014_4_Message = ""

private const L_BantuCertMapping_015_0_Message = "If the client certificate matches the entry and it is enabled, the "
private const L_BantuCertMapping_016_0_Message = "request is processed under the local account with the given username "

private const L_BantuCertMapping_017_0_Message = "and password after ensuring that user has access to the resource as "
private const L_BantuCertMapping_018_0_Message = "defined by the URI security table."
private const L_BantuCertMapping_019_0_Message = ""

private const L_BantuCertMapping_020_0_Message = "When creating a new entry or changing the password of an existing entry, "
private const L_BantuCertMapping_021_0_Message = "the -r switch must be used since the myrt service must store the password"
private const L_BantuCertMapping_022_0_Message = "for future use."


private const L_BantuCertMappingExamples_001_0_Message = "Example: To see the current CertMapping configuration"
private const X_BantuCertMappingExamples_002_0_Message = "  myrt enumerate myrt/config/service/CertMapping"

private const L_BantuCertMappingExamples_003_0_Message = "Example: Create a CertMapping entry:"
private const X_BantuCertMappingExamples_004_0_Message = "  myrt create myrt/config/service/certmapping?Issuer=1212131238d84023982e381f20391a2935301923+Subject=*.example.com+URI=wmicimv2/* @{UserName=""USERNAME"";Password=""PASSWORD""} -remote:localhost"
private const L_BantuCertMappingExamples_005_0_Message = ""

'''''''''''''''''''''
'Bantu - aturSSDL
private const L_BantuaturSSDL_000_1_Message = "  myrt aturSSDL RESOURCE_URI"
private const L_BantuaturSSDL_001_0_Message = ""
private const L_BantuaturSSDL_002_0_Message = "Changes an existing entry in the plugin configuration to "
private const L_BantuaturSSDL_002_1_Message = "control remote access to myrt resources."
private const L_BantuaturSSDL_003_0_Message = "This command will fail if the plugin does not exist."
private const L_BantuaturSSDL_004_0_Message = ""
private const L_BantuaturSSDL_005_0_Message = "This command will launch a GUI to edit the security settings."
private const L_BantuaturSSDL_005_1_Message = ""
private const L_BantuaturSSDL_006_0_Message = "RESOURCE_URI is always treated as a prefix."
private const L_BantuaturSSDL_010_0_Message = ""
private const L_BantuaturSSDL_011_0_Message = "To change the default security (the RootSDDL setting) use:"
private const X_BantuaturSSDL_012_0_Message = "  myrt aturSSDL default"

'''''''''''''''''''''
'Bantu - atursegera
private const X_Bantuatursegera_001_0_Message = "myrt atursegera [-quiet] [-transport:VALUE] [-force]"
private const X_Bantuatursegera_002_0_Message = ""
private const L_Bantuatursegera_003_0_Message = "Performs configuration actions to enable this machine for remote management."
private const L_Bantuatursegera_004_0_Message = "Includes:"
private const L_Bantuatursegera_005_0_Message = "  1. Start the myrt service"
private const L_Bantuatursegera_006_0_Message = "  2. Set the myrt service type to auto start"
private const L_Bantuatursegera_007_0_Message = "  3. Create a listener to accept request on any IP address"
private const L_Bantuatursegera_008_0_Message = "  4. Enable firewall exception for WS-Management traffic (for http only)"
private const X_Bantuatursegera_009_0_Message = ""
private const X_Bantuatursegera_010_0_Message = "-q[uiet]"
private const X_Bantuatursegera_010_1_Message = "--------"
private const L_Bantuatursegera_011_0_Message = "If present, atursegera will not prompt for confirmation."
private const X_Bantuatursegera_012_0_Message = "-transport:VALUE"
private const X_Bantuatursegera_013_0_Message = "----------------"
private const L_Bantuatursegera_014_0_Message = "Perform atursegera for specific transport."
private const L_Bantuatursegera_015_0_Message = "Possible options are http and https.  Defaults to http."
private const X_Bantuatursegera_016_0_Message = "-force"
private const X_Bantuatursegera_017_0_Message = "--------"
private const L_Bantuatursegera_018_0_Message = "If present, atursegera will not prompt for confirmation, and will enable "
private const L_Bantuatursegera_019_0_Message = "the firewall exception regardless of current network profile settings."

'''''''''''''''''''''
'Bantu - MENGAWAL
private const L_BantuRemote_001_0_Message = "myrt OPERATION -remote:VALUE [-unencrypted] [-usessl]"
private const L_BantuRemote_002_0_Message = ""
private const L_BantuRemote_003_0_Message = "-r[emote]:VALUE"
private const L_BantuRemote_004_0_Message = "---------------"
private const L_BantuRemote_005_0_Message = "Specifies identifier of remote endpoint/system.  "
private const L_BantuRemote_006_0_Message = "May be a simple host name or a complete URL."
private const L_BantuRemote_007_0_Message = ""
private const L_BantuRemote_008_0_Message = "  [TRANSPORT://]HOST[:PORT][/PREFIX]"
private const L_BantuRemote_009_0_Message = ""
private const L_BantuRemote_010_0_Message = "Transport: One of HTTP or HTTPS; default is HTTP."
private const L_BantuRemote_011_0_Message = "Host: Can be in the form of a DNS name, NetBIOS name, or IP address."
private const L_BantuRemote_012_0_Message = "Port: If port is not specified then the following default rules apply:"
private const L_BantuRemote_013_0_Message = "Prefix: Defaults to wsman."
private const L_BantuRemote_014_0_Message = ""
private const L_BantuRemote_015_0_Message = "Note: IPv6 addresses must be enclosed in brackets."
private const L_BantuRemote_016_0_Message = "Note: When using HTTPS, the machine name must match the server's certificate"
private const L_BantuRemote_017_0_Message = "      common name (CN) unless -skipCNcheck is used."
private const L_BantuRemote_018_0_Message = "Note: Defaults for port and prefix can be changed in the local configuration."

private const L_BantuRemoteExample_001_0_Message = "Example: Connect to srv.corp.com via http:"
private const X_BantuRemoteExample_002_0_Message = "  myrt dapat uri -r:srv.corp.com"
private const L_BantuRemoteExample_003_0_Message = ""
private const L_BantuRemoteExample_004_0_Message = "Example: Connect to local computer machine1 via https:"
private const X_BantuRemoteExample_005_0_Message = "  myrt dapat uri -r:https://machine1"
private const L_BantuRemoteExample_006_0_Message = ""
private const L_BantuRemoteExample_007_0_Message = "Example: Connect to an IPv6 machine via http:"
private const X_BantuRemoteExample_008_0_Message = "  myrt dapat uri -r:[1:2:3::8]"
private const L_BantuRemoteExample_009_0_Message = ""
private const L_BantuRemoteExample_010_0_Message = "Example: Connect to an IPv6 machine via https on a non-default port and URL:"
private const X_BantuRemoteExample_011_0_Message = "  myrt dapat uri -r:https://[1:2:3::8]:444/path"

private const L_BantuRemoteUnencrypted_001_0_Message = "-un[encrypted]"
private const L_BantuRemoteUnencrypted_002_0_Message = "--------------"
private const L_BantuRemoteUnencrypted_003_0_Message = "Specifies that no encryption will be used when doing remote operations over"
private const L_BantuRemoteUnencrypted_004_0_Message = "HTTP.  Unencrypted traffic is not allowed by default and must be enabled in"
private const L_BantuRemoteUnencrypted_005_0_Message = "the local configuration."

private const L_BantuRemoteConfig_001_0_Message = "To enable this machine to be remotely managed see:"

'''''''''''''''''''''
'Bantu - KEUTAMAAN
private const L_BantuAuth_001_0_Message = "myrt OPERATION -remote:VALUE "
private const L_BantuAuth_002_0_Message = "  [-authentication:VALUE] "
private const L_BantuAuth_003_0_Message = "  [-username:USERNAME] "
private const L_BantuAuth_004_0_Message = "  [-password:PASSWORD]"
private const L_BantuAuth_004_1_Message = "  [-certificate:THUMBPRINT]"
private const L_BantuAuth_005_0_Message = ""
private const L_BantuAuth_006_0_Message = "When connecting remotely, you can specify which credentials and which"
private const L_BantuAuth_007_0_Message = "authentication mechanisms to use.  If none are specified the current "
private const L_BantuAuth_008_0_Message = "logged-on user's credentials will be used."

private const L_BantuAuthAuth_001_0_Message = "-a[uthentication]:VALUE"
private const L_BantuAuthAuth_002_0_Message = "-----------------------"
private const L_BantuAuthAuth_003_0_Message = "Specifies authentication mechanism used when communicating with remote machine."
private const L_BantuAuthAuth_004_0_Message = "Possible options are None, Basic, Digest, Negotiate, Kerberos, CredSSP."
private const L_BantuAuthAuth_004_1_Message = "Possible options are None, Basic, Digest, Negotiate, Kerberos."
private const L_BantuAuthAuth_005_0_Message = "Examples:"
private const X_BantuAuthAuth_006_0_Message = "  -a:None"
private const X_BantuAuthAuth_007_0_Message = "  -a:Basic"
private const X_BantuAuthAuth_008_0_Message = "  -a:Digest"
private const X_BantuAuthAuth_009_0_Message = "  -a:Negotiate"
private const X_BantuAuthAuth_010_0_Message = "  -a:Kerberos"
private const X_BantuAuthAuth_010_1_Message = "  -a:Certificate"
private const X_BantuAuthAuth_010_2_Message = "  -a:CredSSP"
private const L_BantuAuthAuth_011_0_Message = "Note: If an authentication mechanism is not specified, Kerberos is used unless"
private const L_BantuAuthAuth_012_0_Message = "      one of the conditions below is true, in which case Negotiate is used:"
private const L_BantuAuthAuth_013_0_Message = "   -explicit credentials are supplied and the destination host is trusted"
private const L_BantuAuthAuth_013_1_Message = "   -the destination host is ""localhost"", ""127.0.0.1"" or ""[::1]"""
private const L_BantuAuthAuth_013_2_Message = "   -the client computer is in workgroup and the destination host is trusted"
private const L_BantuAuthAuth_014_0_Message = "Note: Not all authentication mechanisms are enabled by default.  Allowed"
private const L_BantuAuthAuth_015_0_Message = "      authentication mechanisms can be controlled by local configuration "
private const L_BantuAuthAuth_016_0_Message = "      or group policy."
private const L_BantuAuthAuth_017_0_Message = "Note: Most operations will require an authentication mode other than None."
private const L_BantuAuthAuth_018_0_Message = "Note: Certificate authentication can be used only with the HTTPS transport."
private const L_BantuAuthAuth_019_0_Message = "      To configure an HTTPS listener for the myrt service run the command:"
private const L_BantuAuthAuth_020_0_Message = "      ""myrt atursegera -transport:HTTPS"""

private const L_BantuAuthUsername_001_0_Message = "-u[sername]:USERNAME"
private const L_BantuAuthUsername_002_0_Message = "--------------------"
private const L_BantuAuthUsername_003_0_Message = "Specifies username on remote machine. Cannot be used on local machine."
private const L_BantuAuthUsername_004_0_Message = "User must be member of local Administrators group on remote machine."
private const L_BantuAuthUsername_005_0_Message = "If the user account is a local account on the remote machine,"
private const L_BantuAuthUsername_006_0_Message = "the syntax should be in the form -username:USERNAME"
private const L_BantuAuthUsername_007_0_Message = "If the username is a domain account, the syntax should be in the form"
private const L_BantuAuthUsername_008_0_Message = "-username:DOMAIN\USERNAME"
private const L_BantuAuthUsername_009_0_Message = "If Basic or Digest is used, then -username is required."
private const L_BantuAuthUsername_010_0_Message = "If Kerberos is used, then the current logged-on user's credentials"
private const L_BantuAuthUsername_011_0_Message = "are used if -username is not supplied. Only domain credentials can"
private const L_BantuAuthUsername_011_1_Message = "be used with Kerberos."
private const L_BantuAuthUsername_012_0_Message = "If Negotiate is used, then -username is required unless"
private const L_BantuAuthUsername_013_0_Message = "one of the conditions below is true:"
private const L_BantuAuthUsername_014_0_Message = "   -the destination host is ""localhost"", ""127.0.0.1"" or ""[::1]"""
private const L_BantuAuthUsername_015_0_Message = "   -the client computer is in workgroup and the destination host is trusted"
private const L_BantuAuthUsername_016_0_Message = "If CredSSP is used, then username and password are required."

private const L_BantuAuthPassword_001_0_Message = "-p[assword]:PASSWORD"
private const L_BantuAuthPassword_002_0_Message = "--------------------"
private const L_BantuAuthPassword_003_0_Message = "Specifies password on command line to override interactive prompt."
private const L_BantuAuthPassword_004_0_Message = "Applies only if -username:USERNAME option is used."

private const L_BantuAuthCertificate_001_0_Message = "-c[ertificate]:THUMBPRINT"
private const L_BantuAuthCertificate_002_0_Message = "--------------------"
private const L_BantuAuthCertificate_003_0_Message = "Specifies the thumbprint of a certificate that must exist in the local"
private const L_BantuAuthCertificate_004_0_Message = "machine store or in the current user store. The certificate must be intended"
private const L_BantuAuthCertificate_005_0_Message = "for client authentication."
private const L_BantuAuthCertificate_006_0_Message = "Applies only if -a:Certificate is used."
private const L_BantuAuthCertificate_007_0_Message = "THUMBPRINT can contain spaces, in which case it must be enclosed in"
private const L_BantuAuthCertificate_008_0_Message = "double quotation marks."
private const L_BantuAuthCertificate_009_0_Message = "Examples:"
private const L_BantuAuthCertificate_010_0_Message = "-c:7b0cf48026409e38a2d6348761b1dd1271c4f86d"
private const L_BantuAuthCertificate_011_0_Message = "-c:""7b 0c f4 80 26 40 9e 38 a2 d6 34 87 61 b1 dd 12 71 c4 f8 6d"""

'''''''''''''''''''''
'Bantu - PROXY
private const X_BantuProxy_001_0_Message = "myrt OPERATION -remote:VALUE "
private const X_BantuProxy_002_0_Message = "  [-proxyaccess:VALUE] "
private const X_BantuProxy_002_1_Message = "  [-proxyauth:VALUE] "
private const X_BantuProxy_003_0_Message = "  [-proxyusername:USERNAME] "
private const X_BantuProxy_004_0_Message = "  [-proxypassword:PASSWORD]"
private const L_BantuProxy_005_0_Message = ""
private const L_BantuProxy_006_0_Message = "When connecting remotely, you can specify which proxy access type,"
private const L_BantuProxy_007_0_Message = " proxy credentials and proxy authentication mechanisms to use."

private const X_BantuProxyAccess_001_0_Message = "-p[roxy]ac[cess]:VALUE"
private const L_BantuProxyAccess_002_0_Message = "-----------------------"
private const L_BantuProxyAccess_003_0_Message = "Specifies which proxy settings to retrieve when connecting to a remote machine."
private const L_BantuProxyAccess_004_0_Message = "Possible options are ie_settings, winhttp_settings, auto_detect, no_proxy."
private const L_BantuProxyAccess_005_0_Message = "Examples:"
private const X_BantuProxyAccess_006_0_Message = "  -pac:ie_settings"
private const X_BantuProxyAccess_007_0_Message = "  -pac:winhttp_settings"
private const X_BantuProxyAccess_008_0_Message = "  -pac:auto_detect"
private const X_BantuProxyAccess_009_0_Message = "  -pac:no_proxy"
private const L_BantuProxyAccess_010_0_Message = ""
private const L_BantuProxyAccess_011_0_Message = "The WSMan client provides four options for the configuration of proxy settings:"
private const L_BantuProxyAccess_012_0_Message = "   -use settings configured through Internet Explorer (default)"
private const L_BantuProxyAccess_013_0_Message = "   -use settings configured through WinHTTP"
private const L_BantuProxyAccess_014_0_Message = "   -automatic proxy discovery"
private const L_BantuProxyAccess_015_0_Message = "   -direct connection (don’t use a proxy)"

private const L_BantuProxyAuth_001_0_Message = "-p[roxy]a[uth]:VALUE"
private const L_BantuProxyAuth_002_0_Message = "-----------------------"
private const L_BantuProxyAuth_003_0_Message = "Specifies authentication mechanism used to authenticate with a proxy."
private const L_BantuProxyAuth_004_0_Message = "Possible options are Basic, Digest, Negotiate."
private const L_BantuProxyAuth_005_0_Message = "Examples:"
private const X_BantuProxyAuth_007_0_Message = "  -pa:Basic"
private const X_BantuProxyAuth_008_0_Message = "  -pa:Digest"
private const X_BantuProxyAuth_009_0_Message = "  -pa:Negotiate"
private const L_BantuProxyAuth_010_0_Message = "If -proxyauth:VALUE is used then -proxyaccess:VALUE is required."

private const L_BantuProxyUsername_001_0_Message = "-p[roxy]u[sername]:USERNAME"
private const L_BantuProxyUsername_002_0_Message = "--------------------"
private const L_BantuProxyUsername_003_0_Message = "Specifies username to authenticate with proxy. Cannot be used on local machine."
private const L_BantuProxyUsername_005_0_Message = "If the user account is a local account on the remote machine,"
private const L_BantuProxyUsername_006_0_Message = "the syntax should be in the form -proxyusername:USERNAME"
private const L_BantuProxyUsername_007_0_Message = "If the username is a domain account, the syntax should be in the form"
private const L_BantuProxyUsername_008_0_Message = "-proxyusername:DOMAIN\USERNAME"
private const L_BantuProxyUsername_009_0_Message = "If -proxyusername is used then -proxyauth:VALUE is required."

private const L_BantuProxyPassword_001_0_Message = "-p[roxy]p[assword]:PASSWORD"
private const L_BantuProxyPassword_002_0_Message = "--------------------"
private const L_BantuProxyPassword_003_0_Message = "Specifies password on command line to override interactive prompt."
private const L_BantuProxyPassword_004_0_Message = "Applies only if -proxyusername:USERNAME option is used."

'''''''''''''''''''''
'Bantu - NILAI
private const L_BantuInput_001_0_Message = "Input can be by either providing key/value pairs directly on the command line"
private const L_BantuInput_002_0_Message = "or reading XML from a file."
private const L_BantuInput_003_0_Message = ""
private const L_BantuInput_004_0_Message = "  myrt OPERATION -file:VALUE "
private const L_BantuInput_005_0_Message = "  myrt OPERATION @{KEY=""VALUE""[;KEY=""VALUE""]}"
private const L_BantuInput_006_0_Message = ""
private const L_BantuInput_007_0_Message = "Applies to set, create, and invoke operations."
private const L_BantuInput_008_0_Message = "Use either @{KUNCI=NILAI} or input from an XML file, but not both."
private const L_BantuInput_009_0_Message = ""
private const L_BantuInput_010_0_Message = "-file:VALUE"
private const L_BantuInput_011_0_Message = "-----------"
private const L_BantuInput_012_0_Message = "Specifies name of file used as input."
private const L_BantuInput_013_0_Message = "VALUE can be absolute path, relative path, or filename without path."
private const L_BantuInput_014_0_Message = "Names or paths that include spaces must be enclosed in quotation marks."
private const L_BantuInput_015_0_Message = ""
private const L_BantuInput_016_0_Message = "@{KEY=""VALUE""[;KEY=""VALUE""]}"
private const L_BantuInput_017_0_Message = "----------------------------"
private const L_BantuInput_018_0_Message = "Keys are not unique."
private const L_BantuInput_019_0_Message = "Values must be within quotation marks."
private const L_BantuInput_020_0_Message = "$null is a special value."
private const L_BantuInput_021_0_Message = ""
private const L_BantuInput_022_0_Message = "Examples:"
private const X_BantuInput_023_0_Message = "  @{key1=""value1"";key2=""value2""}"
private const X_BantuInput_024_0_Message = "  @{key1=$null;key2=""value2""}"


'''''''''''''''''''''
'Bantu - TAPISS
private const L_BantuFilter_001_0_Message = "Filters allow selecting a subset of the desired resources:"
private const X_BantuFilter_002_0_Message = ""
private const X_BantuFilter_003_0_Message = "myrt enumerate RESOURCE_URI -filter:EXPR [-dialect:URI] [-Associations]..."
private const X_BantuFilter_004_0_Message = ""
private const L_BantuFilter_005_0_Message = "-filter:EXPR"
private const X_BantuFilter_006_0_Message = "------------"
private const L_BantuFilter_007_0_Message = "Filter expression for enumeration."
private const X_BantuFilter_008_0_Message = ""
private const L_BantuFilter_009_0_Message = "-dialect:URI"
private const X_BantuFilter_010_0_Message = "------------"
private const L_BantuFilter_011_0_Message = "Dialect of the filter expression for enumeration."
private const L_BantuFilter_012_0_Message = "This may be any dialect supported by the remote service.  "
private const X_BantuFilter_013_0_Message = ""
private const L_BantuFilter_014_0_Message = "The following aliases can be used for the dialect URI:"
private const X_BantuFilter_015_0_Message = "* WQL - http://schemas.microsoft.com/wbem/wsman/1/WQL"
private const X_BantuFilter_016_0_Message = "* Selector - http://schemas.dmtf.org/wbem/wsman/1/wsman/SelectorFilter"
private const X_BantuFilter_016_1_Message = "* Association - http://schemas.dmtf.org/wbem/wsman/1/cimbinding/AssociationFilter"
private const X_BantuFilter_017_0_Message = ""
private const L_BantuFilter_018_0_Message = "The dialect URI defaults to WQL when used with enumeration."
private const X_BantuFilter_019_0_Message = ""
private const L_BantuFilter_019_1_Message = "-Associations"
private const L_BantuFilter_019_2_Message = "------------"
private const X_BantuFilter_019_3_Message = "This parameter has relevance only when the Dialect parameter exists, and its value is specified as Association. Otherwise this parameter should not be used."
private const X_BantuFilter_019_4_Message = "This indicates retrieval of Association Instances rather than Associated Instances. Absence of this parameter would imply Associated Instances are to be retrieved."
private const X_BantuFilter_019_5_Message = ""
private const L_BantuFilter_020_0_Message = "Example: Find running services"
private const X_BantuFilter_021_0_Message = "  myrt e wmicimv2/Win32_Service -dialect:selector -filter:{State=""Running""}"
private const X_BantuFilter_022_0_Message = ""
private const L_BantuFilter_023_0_Message = "Example: Find auto start services that are not running"
private const X_BantuFilter_024_0_Message = "  myrt e wmicimv2/* -filter:""select * from Win32_Service where State!='Running' and StartMode='Auto'"""
private const L_BantuFilter_025_0_Message = ""
private const L_BantuFilter_026_0_Message = "Example: Find the services on which myrt service has a dependency"
private const X_BantuFilter_027_0_Message = "  myrt e wmicimv2/* -dialect:Association -filter:{Object=Win32_Service?Name=myrt;AssociationClassName=Win32_DependentService;ResultClassName=win32_service;ResultRole=antecedent;Role=dependent}"

'''''''''''''''''''''
'Bantu - ALTANTUYA
private const L_BantuSwitchTimeout_001_0_Message = "-timeout:MS"
private const L_BantuSwitchTimeout_002_0_Message = "-----------"
private const L_BantuSwitchTimeout_003_0_Message = "Timeout in milliseconds. Limits duration of corresponding operation."
private const L_BantuSwitchTimeout_004_0_Message = "Default timeout can be configured by:"
private const X_BantuSwitchTimeout_005_0_Message = "  myrt set myrt/config @{MaxTimeoutms=""XXXXXX""}"
private const L_BantuSwitchTimeout_006_0_Message = "Where XXXXXX is an integer indicating milliseconds."

private const X_BantuSwitchSkipCACheck_001_0_Message = "-skipCAcheck"
private const L_BantuSwitchSkipCACheck_002_0_Message = "------------"
private const L_BantuSwitchSkipCACheck_003_0_Message = "Specifies that certificate issuer need not be a trusted root authority."
private const L_BantuSwitchSkipCACheck_004_0_Message = "Used only in remote operations using HTTPS (see -remote option)."
private const L_BantuSwitchSkipCACheck_005_0_Message = "This option should be used only for trusted machines."

private const X_BantuSwitchSkipCNCheck_001_0_Message = "-skipCNcheck"
private const L_BantuSwitchSkipCNCheck_002_0_Message = "------------"
private const L_BantuSwitchSkipCNCheck_003_0_Message = "Specifies that certificate common name (CN) of the server need not match the"
private const L_BantuSwitchSkipCNCheck_004_0_Message = "hostname of the server. "
private const L_BantuSwitchSkipCNCheck_005_0_Message = "Used only in remote operations using HTTPS (see -remote option)."
private const L_BantuSwitchSkipCNCheck_006_0_Message = "This option should be used only for trusted machines."

private const X_BantuSwitchSkipRevCheck_001_0_Message = "-skipRevocationcheck"
private const X_BantuSwitchSkipRevCheck_002_0_Message = "-------------------"
private const L_BantuSwitchSkipRevCheck_003_0_Message = "Specifies that the revocation status of the server certificate is not checked."
private const L_BantuSwitchSkipRevCheck_004_0_Message = "Used only in remote operations using HTTPS (see -remote option)."
private const L_BantuSwitchSkipRevCheck_005_0_Message = "This option should be used only for trusted machines."

private const X_BantuSwitchDefaultCreds_001_0_Message = "-defaultCreds"
private const X_BantuSwitchDefaultCreds_002_0_Message = "-------------------"
private const L_BantuSwitchDefaultCreds_003_0_Message = "Specifies that the implicit credentials are allowed when Negotiate is used."
private const L_BantuSwitchDefaultCreds_004_0_Message = "Allowed only in remote operations using HTTPS (see -remote option)."

private const L_BantuSwitchDialect_001_0_Message = "-dialect:VALUE"
private const L_BantuSwitchDialect_002_0_Message = "--------------"
private const L_BantuSwitchDialect_003_0_Message = "Dialect of the filter expression for enumeration or fragment."
private const L_BantuSwitchDialect_004_0_Message = "Example: Use a WQL query"
private const X_BantuSwitchDialect_005_0_Message = "  -dialect:http://schemas.microsoft.com/wbem/wsman/1/WQL"
private const L_BantuSwitchDialect_006_0_Message = "Example: Use XPATH for filtering with enumeration or fragment dapat/set."
private const X_BantuSwitchDialect_007_0_Message = "  -dialect:http://www.w3.org/TR/1999/REC-xpath-19991116"

'private const L_BantuSwitchFilter_001_0_Message = "-filter:VALUE"
'private const L_BantuSwitchFilter_002_0_Message = "-----------------"
'private const L_BantuSwitchFilter_003_0_Message = "Filter expression for enumeration."
'private const L_BantuSwitchFilter_004_0_Message = "Example: Use a WQL query"
'private const X_BantuSwitchFilter_005_0_Message = "  -filter:""select * from Win32_process where handle=0"""

private const L_BantuSwitchFragment_001_0_Message = "-fragment:VALUE"
private const L_BantuSwitchFragment_002_0_Message = "---------------"
private const L_BantuSwitchFragment_003_0_Message = "Specify a section inside the instance XML that is to be updated or retrieved"
private const L_BantuSwitchFragment_004_0_Message = "for the given operation."
private const L_BantuSwitchFragment_005_0_Message = "Example: dapat the status of the spooler service"
private const X_BantuSwitchFragment_006_0_Message = "  myrt dapat wmicimv2/Win32_Service?name=spooler -fragment:Status/text()"

private const L_BantuSwitchOption_001_0_Message = "-options:{KEY=""VALUE""[;KEY=""VALUE""]}"
private const L_BantuSwitchOption_002_0_Message = "------------------------------------"
private const L_BantuSwitchOption_003_0_Message = "Key/value pairs for provider-specific options."
private const L_BantuSwitchOption_004_0_Message = "To specify NULL as a value, use $null"
private const L_BantuSwitchOption_005_0_Message = ""
private const L_BantuSwitchOption_006_0_Message = "Examples:"
private const X_BantuSwitchOption_007_0_Message = "  -options:{key1=""value1"";key2=""value2""}"
private const X_BantuSwitchOption_008_0_Message = "  -options:{key1=$null;key2=""value2""}"

private const X_BantuSwitchSPNPort_001_0_Message = "-SPNPort"
private const L_BantuSwitchSPNPort_002_0_Message = "--------"
private const L_BantuSwitchSPNPort_003_0_Message = "Appends port number to the Service Principal Name (SPN) of the remote server."
private const L_BantuSwitchSPNPort_004_0_Message = "Service principal name is used when Negotiate or Kerberos authentication"
private const L_BantuSwitchSPNPort_005_0_Message = "mechanism is in use."

private const L_BantuSwitchEncoding_001_0_Message = "-encoding:VALUE"
private const L_BantuSwitchEncoding_002_0_Message = "---------------"
private const L_BantuSwitchEncoding_003_0_Message = "Specifies encoding type when talking to remote machine (see -remote"
private const L_BantuSwitchEncoding_004_0_Message = "option). Possible options are ""utf-8"" and ""utf-16""."
private const L_BantuSwitchEncoding_005_0_Message = "Default is utf-8."
private const L_BantuSwitchEncoding_006_0_Message = "Examples:"
private const X_BantuSwitchEncoding_007_0_Message = "  -encoding:utf-8"
private const X_BantuSwitchEncoding_008_0_Message = "  -encoding:utf-16"

private const L_BantuSwitchFormat_001_0_Message = "-f[ormat]:FORMAT"
private const L_BantuSwitchFormat_002_0_Message = "----------------"
private const L_BantuSwitchFormat_003_0_Message = "Specifies format of output."
private const L_BantuSwitchFormat_004_0_Message = "FORMAT can be ""xml"", ""pretty"" (better formatted XML), or ""text""."
private const L_BantuSwitchFormat_005_0_Message = "Examples:"
private const X_BantuSwitchFormat_006_0_Message = "  -format:xml"
private const X_BantuSwitchFormat_007_0_Message = "  -format:pretty"
private const X_BantuSwitchFormat_008_0_Message = "  -format:text"


private const L_BantuRemoteUseSsl_001_0_Message = "-[use]ssl"
private const L_BantuRemoteUseSsl_002_0_Message = "---------"
private const L_BantuRemoteUseSsl_003_0_Message = "Specifies that an SSL connection will be used when doing remote operations."
private const L_BantuRemoteUseSsl_004_0_Message = "The transport in the remote option should not be specified. "

private const L_BantuRemote_012_1_Message = "        * If transport is specified to HTTP then port 80 is used."
private const L_BantuRemote_012_2_Message = "        * If transport is specified to HTTPS then port 443 is used."
private const L_BantuRemote_012_3_Message = "        * If transport is not specified and -usessl is not specified then port"
private const L_BantuRemote_012_4_Message = "          5985 is used for an HTTP connection."
private const L_BantuRemote_012_5_Message = "        * If transport is not specified and -usessl is specified then port 5986"
private const L_BantuRemote_012_6_Message = "          is used for an HTTPS connection."

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Operasi
private const OP_dapat  = "dapat"
private const OP_PUT  = "set"
private const OP_aturSSDL  = "aturSSDL"
private const OP_CREATESDDL  = "createsddl"
private const OP_CRE  = "create"
private const OP_DEL  = "delete"
private const OP_ENU  = "enumerate"
private const OP_INV  = "invoke"
private const OP_Bantu = "Bantu"
private const OP_IDENTIFY    = "identify"
private const OP_atursegera = "atursegera"
private const OP_BantuMSG = "Bantumsg"

'Nama Parameters (kunci nama untuk kunci/nilai pasangan)
private const NPARA_USERNAME  = "username"
private const NPARA_PASSWORD  = "password"
private const NPARA_PROXYUSERNAME  = "proxyusername"
private const NPARA_PROXYPASSWORD  = "proxypassword"
private const NPARA_CERT      = "certificate"
private const NPARA_DIALECT   = "dialect"
private const NPARA_ASSOCINST = "associations"
private const NPARA_FILE      = "file"
private const NPARA_FILTER    = "filter"
private const NPARA_Bantu      = "?"
private const NPARA_REMOTE    = "remote"
private const NPARA_NOCACHK   = "skipcacheck"
private const NPARA_NOCNCHK   = "skipcncheck"
private const NPARA_NOREVCHK   = "skiprevocationcheck"
private const NPARA_DEFAULTCREDS = "defaultcreds"
private const NPARA_SPNPORT   = "spnport"
private const NPARA_TIMEOUT   = "timeout"
private const NPARA_AUTH      = "authentication"
private const NPARA_PROXYAUTH      = "proxyauthentication"
private const NPARA_PROXYACCESS      = "proxyaccess"
private const NPARA_UNENCRYPTED = "unencrypted"
private const NPARA_ENCODING  = "encoding"
private const NPARA_FORMAT    = "format"
private const NPARA_OPTIONS   = "options"
private const NPARA_FRAGMENT  = "fragment"
private const NPARA_QUIET     = "quiet"
private const NPARA_TRANSPORT = "transport"
private const NPARA_PSEUDO_COMMAND   = "command"
private const NPARA_PSEUDO_OPERATION = "operation"
private const NPARA_PSEUDO_ACTION    = "action"
private const NPARA_PSEUDO_RESOURCE  = "resource"
private const NPARA_PSEUDO_AT        = "@"
private const NPARA_RETURN_TYPE      = "returntype"
private const NPARA_SHALLOW          = "shallow"
private const NPARA_BASE_PROPS_ONLY  = "basepropertiesonly"
private const NPARA_USESSL           = "usessl"
private const NPARA_FORCE            = "force"

private const SHORTCUT_CRE         = "c"
private const SHORTCUT_DEL         = "d"
private const SHORTCUT_ENU         = "e"
private const SHORTCUT_ENU2        = "enum"
private const SHORTCUT_dapat         = "g"
private const SHORTCUT_INV         = "i"
private const SHORTCUT_IDENTIFY    = "id"
private const SHORTCUT_PUT         = "s"
private const SHORTCUT_PUT2        = "put"
private const SHORTCUT_PUT3        = "p"
private const SHORTCUT_atursegera = "qc"
private const SHORTCUT_BantuMSG    = "Bantumsg"

private const SHORTCUT_AUTH        = "a"
private const SHORTCUT_AUTH2       = "auth"
private const SHORTCUT_PROXYAUTH        = "pa"
private const SHORTCUT_PROXYAUTH2       = "proxyauth"
private const SHORTCUT_PROXYACCESS        = "pac"
private const SHORTCUT_PROXYACCESS2       = "proxyaccess"
private const SHORTCUT_FORMAT      = "f"
private const SHORTCUT_PASSWORD    = "p"
private const SHORTCUT_PROXYPASSWORD    = "pp"
private const SHORTCUT_REMOTE      = "r"
private const SHORTCUT_REMOTE2     = "machine"
private const SHORTCUT_USERNAME    = "u"
private const SHORTCUT_PROXYUSERNAME    = "pu"
private const SHORTCUT_UNENCRYPTED = "un"
private const SHORTCUT_USESSL      = "ssl"
private const SHORTCUT_QUIET       = "q"
private const SHORTCUT_CERT        = "c"

'Bantu Topik
private const Bantu_CONFIG   = "config"
private const Bantu_CERTMAPPING   = "certmapping"
private const Bantu_CUSTOMREMOTESHELL     = "customremoteshell"
private const Bantu_URIS     = "uris"
private const Bantu_ALIAS    = "alias"
private const Bantu_ALIASES  = "aliases"
private const Bantu_SWITCHES = "switches"
private const Bantu_REMOTING = "remoting"
private const Bantu_INPUT    = "input"
private const Bantu_AUTH     = "auth"
private const Bantu_PROXY     = "proxy"
private const Bantu_FILTERS  = "filters"

'Nilai kebiasaan untuk kunci/nilai pasangan
private const VAL_NO_AUTH     = "none"
private const VAL_BASIC       = "basic"
private const VAL_DIGEST      = "digest"
private const VAL_KERBEROS    = "kerberos"
private const VAL_NEGOTIATE   = "negotiate"
private const VAL_CERT        = "certificate"
private const VAL_CREDSSP     = "credssp"

'proxy untuk jenis kemasukkan
private const VAL_PROXY_IE_CONFIG     = "ie_settings"
private const VAL_PROXY_WINHTTP_CONFIG       = "winhttp_settings"
private const VAL_PROXY_AUTODETECT      = "auto_detect"
private const VAL_PROXY_NO_PROXY_SERVER    = "no_proxy"

'Enumeration returnType values
private const VAL_RT_OBJECT  = "object"
private const VAL_RT_EPR     = "epr"
private const VAL_RT_OBJ_EPR = "objectandepr"

'Output formatting flags
private const VAL_FORMAT_XML         = "xml"
private const VAL_FORMAT_PRETTY      = "pretty"
private const VAL_FORMAT_PRETTY_XSLT = "WsmPty.xsl"
private const VAL_FORMAT_TEXT        = "text"
private const VAL_FORMAT_TEXT_XSLT   = "WsmTxt.xsl"

'''''''''''''''''''''
'Bentuk
private const PTRN_IPV6_1 = "([A-Fa-f0-9]{1,4}:){6}:[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_2 = "([A-Fa-f0-9]{1,4}:){7}[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_3 = "[A-Fa-f0-9]{1,4}::([A-Fa-f0-9]{1,4}:){0,5}[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_4 = "([A-Fa-f0-9]{1,4}:){2}:([A-Fa-f0-9]{1,4}:){0,4}[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_5 = "([A-Fa-f0-9]{1,4}:){3}:([A-Fa-f0-9]{1,4}:){0,3}[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_6 = "([A-Fa-f0-9]{1,4}:){4}:([A-Fa-f0-9]{1,4}:){0,2}[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_7 = "([A-Fa-f0-9]{1,4}:){5}:([A-Fa-f0-9]{1,4}:){0,1}[A-Fa-f0-9]{1,4}"
private const PTRN_IPV6_S = ":"

private const PTRN_URI_LAST = "([a-z_][-a-z0-9._]*)$"
private const PTRN_OPT      = "^-([a-z]+):(.*)"
private const PTRN_HASH_TOK = "\s*([\w:]+)\s*=\s*(\$null|""([^""]*)"")\s*"

dim PTRN_HASH_TOK_P
dim PTRN_HASH_VALIDATE
PTRN_HASH_TOK_P        = "(" & PTRN_HASH_TOK & ")"
PTRN_HASH_VALIDATE     = "(" & PTRN_HASH_TOK_P & ";)*(" & PTRN_HASH_TOK_P & ")"

dim PTRN_IPV6
PTRN_IPV6 = "^(" & _
    PTRN_IPV6_1 & ")$|^(" & PTRN_IPV6_2 & ")$|^(" & _
    PTRN_IPV6_3 & ")$|^(" & PTRN_IPV6_4 & ")$|^(" & PTRN_IPV6_5 & ")$|^(" & _
    PTRN_IPV6_6 & ")$|^(" & PTRN_IPV6_7 & ")$"


'''''''''''''''''''''
'Puncau
private const T_O             = &h800705B4
private const URI_IPMI        = "http://schemas.dmtf.org/wbem/wscim/1/cim-schema"
private const URI_WMI         = "http://schemas.microsoft.com/wbem/wsman/1/wmi"
private const NS_IPMI         = "http://schemas.dmtf.org/wbem/wscim/1/cim-schema"
private const NS_CIMBASE      = "http://schemas.dmtf.org/wbem/wsman/1/base"
private const NS_WSMANL       = "http://schemas.microsoft.com"
private const NS_XSI          = "xmlns:xsi=""http://www.w3.org/2001/XMLSchema-instance"""
private const ATTR_NIL        = "xsi:nil=""true"""
private const ATTR_NIL_NAME   = "xsi:nil"
private const NS_XSI_URI      = "http://www.w3.org/2001/XMLSchema-instance"
private const ALIAS_WQL       = "wql"
private const URI_WQL_DIALECT = "http://schemas.microsoft.com/wbem/wsman/1/WQL"
private const ALIAS_XPATH       = "xpath"
private const URI_XPATH_DIALECT = "http://www.w3.org/TR/1999/REC-xpath-19991116"
'Constants for MS-XML
private const NODE_ATTRIBUTE  = 2
private const NODE_TEXT       = 3

'''''''''''''''''''''
'Kimak
dim wshShellObj
dim wsmanObj
dim connOptionsObj
dim sessionObj
dim enumeratorObj
dim resourceOptionsDic
dim resourceLocatorObj
dim wsmanInternalObj

dim cmdStr
dim wsmanCmdLineObj
dim inputStr
dim responseStr
dim connectionStr
dim resourceUriStr
dim actionUriStr
dim rootNdNameStr
dim operation

dim formatOption
dim formattedStr

dim errNo
dim errDesc

dim stdIn
dim stdErr
dim stdOut
set stdIn = WScript.StdIn
set stdErr = WScript.StdErr
set stdOut = WScript.StdOut

Dim resourceDictionary, resourcesLoaded
Set resourceDictionary = CreateObject("Scripting.Dictionary")
resourcesLoaded = false

Dim WSHShell, strRegKey, osVersion, osVista
 
Set WSHShell = WScript.CreateObject("WScript.Shell") 
strRegKey = "HKLM\Software\Microsoft\Windows NT\CurrentVersion\CurrentVersion" 
osVersion = WSHShell.RegRead(strRegKey)
osVista = "6.0"

' ------------------ Main() --------------------

If Not IsCScriptEnv() Then
    Wscript.Echo dapatResource("L_ONLYCSCRIPT_Message")
    WScript.Quit(ERR_GENERAL_FAILURE)
End If

'Create an instance of the WSMAN.Automation Class
set wsmanObj = CreateObject("WSMAN.Automation")

set wsmanInternalObj = CreateObject("WSMAN.InternalAutomation")

'dapat the raw text command line
cmdStr = wsmanObj.CommandLine

'Expand the environment strings
set wshShellObj = WScript.CreateObject("WScript.Shell")
cmdStr = wshShellObj.ExpandEnvironmentStrings(cmdStr)

'Create the command-line parsing object and parse the command line
Set wsmanCmdLineObj = New WSManCommandLineParser
If Not wsmanCmdLineObj.Parse(cmdStr) Then
    BantuMenu "Bantu", stdOut
    WScript.Quit(ERR_GENERAL_FAILURE)
End If

Dim argOne
Dim argTwo
argOne = LCase(wsmanCmdLineObj.Argument(1))
argTwo = LCase(wsmanCmdLineObj.Argument(2))

If (argOne = OP_Bantu Or argOne = NPARA_Bantu Or argOne = "") Then
    BantuMenu argTwo, stdOut
    WScript.Quit(ERR_OK)
End If

'Check if the Bantu argument was presented, and display Bantu
If wsmanCmdLineObj.ArgumentExists(NPARA_Bantu) Then
    BantuMenu argOne, stdOut
    WScript.Quit(ERR_OK)
End If


If argOne = OP_BantuMSG then
    argTwo = WScript.Arguments(1)
    Dim errNumber
    Dim strHex
    if (InStr(LCase(argTwo),"0x")= 1) then
        strHex = "&H" + Mid(argTwo, 3)
        On Error Resume Next
        errNumber = CLng(strHex)
        if Err.Number <> 0 then
          BantuMenu OP_BantuMSG, stdOut
          WScript.Quit(ERR_OK)
        end if
    elseif (InStr(LCase(argTwo),"-")= 1) then                               
        strHex = "&H"+Hex(CLng(argTwo))
          On Error Resume Next
        errNumber = CLng(strHex)
        if Err.Number <> 0 then
          BantuMenu OP_BantuMSG, stdOut
          WScript.Quit(ERR_OK)
        end if
    else
           On Error Resume Next
        errNumber = CLng(argTwo)
        if Err.Number <> 0 then
            BantuMenu OP_BantuMSG, stdOut
               WScript.Quit(ERR_OK)
        end if        
    end if
    formattedStr = wsmanObj.dapatErrorMessage(errNumber)
    WScript.echo formattedStr    
    WScript.Quit(ERR_OK)
End If

wsmanCmdLineObj.ValidateArguments()

'dapat and check the operation argument
operation = wsmanCmdLineObj.Operation()

If (wsmanCmdLineObj.ArgumentExists(NPARA_REMOTE)) Then
    connectionStr = wsmanCmdLineObj.Argument(NPARA_REMOTE)
Else
    connectionStr = ""
End If

'Set the format option for result output
if(wsmanCmdLineObj.ArgumentExists(NPARA_FORMAT)) then
    formatOption = wsmanCmdLineObj.Argument(NPARA_FORMAT)   
    if Not (LCase(formatOption) = VAL_FORMAT_XML Or _
            LCase(formatOption) = VAL_FORMAT_PRETTY Or _
            LCase(formatOption) = VAL_FORMAT_TEXT) Then
        stdErr.WriteLine dapatResource("L_FORMATLERROR_Message") & """" & formatOption & """"
        WScript.Quit(ERR_GENERAL_FAILURE)
    end if
else
    formatOption = VAL_FORMAT_TEXT
end if


'Create the wsman automation API session object
set sessionObj = CreateSession(wsmanObj, connectionStr, wsmanCmdLineObj, formatOption)

'dapat the resource and action uri strings
resourceUriStr = ""
if operation = OP_INV then
    actionUriStr = wsmanCmdLineObj.Argument(NPARA_PSEUDO_ACTION)
End If

If (operation <> OP_IDENTIFY and operation <> OP_atursegera) Then
    resourceUriStr = wsmanCmdLineObj.Argument(NPARA_PSEUDO_RESOURCE)
    'Determine the name to use for the root node in the message
    rootNdNameStr = dapatRootNodeName(operation, resourceUriStr, actionUriStr)
End If

'Create the ResourceLocator object
If resourceUriStr <> "" Then
  on error resume next
  set resourceLocatorObj = CreateAndInitializeResourceLocator(wsmanObj,resourceUriStr,wsmanCmdLineObj)
  if resourceLocatorObj Is Nothing then
      if Err.Number <> 0 then
          errNo = Err.Number
          errDesc = Err.Description
          stdErr.WriteLine dapatResource("L_ERRNO_Message") & " " & errNo & " 0x" & Hex(errNo)
          stdErr.WriteLine errDesc
      end if
     WScript.Quit(ERR_GENERAL_FAILURE)
  end if
End If

'Gather the input parameters, if present, from the command line or a file. For Put,
'and input from @{...} instead of file, first do a dapat to retrieve the present state 
'of the object against which to apply the @{...} changes prior to the actual Put.
on error resume next
if not ProcessInput(wsmanObj, operation, rootNdNameStr, _
           wsmanCmdLineObj, resourceLocatorObj,sessionObj, inputStr, formatOption) then    
   WScript.Quit(ERR_GENERAL_FAILURE)
end if
            
'Now execute the indicated operation.
on error resume next
select case operation
    case OP_DEL 
        sessionObj.Delete(resourceLocatorObj)
    case OP_dapat 
        responseStr = sessionObj.dapat(resourceLocatorObj)
    case OP_PUT
       responseStr = sessionObj.Put(resourceLocatorObj, inputStr)
    case OP_aturSSDL
       responseStr = wsmanInternalObj.aturSSDL(sessionObj,resourceLocatorObj)    
    case OP_CRE
        responseStr = sessionObj.Create(resourceLocatorObj, inputStr)
    case OP_INV
        responseStr = sessionObj.Invoke(actionUriStr, resourceLocatorObj, inputStr)
    case OP_ENU
         Enumerate wsmanObj, sessionObj, wsmanCmdLineObj, resourceLocatorObj, formatOption
    case OP_IDENTIFY
        responseStr = sessionObj.Identify
    case OP_atursegera
         atursegera sessionObj, wsmanCmdLineObj
    case else 
        ASSERTBOOL False, dapatResource("L_UNKOPNM_Message") & "'" & operation & "'"
end select

'Process the output or error messages.
if Err.Number <> 0 then
    ASSERTERR sessionObj, formatOption
    on error goto 0
else
    if operation <> OP_ENU and operation <> OP_DEL and operation <> OP_atursegera then
        If Reformat(responseStr,formattedStr,formatOption) Then
            WScript.echo formattedStr
        Else
            stdErr.WriteLine dapatResource("L_FORMATFAILED_Message")
            stdErr.WriteLine responseStr
            WScript.Quit(ERR_GENERAL_FAILURE)
        End If
    end if
end if

'Exist the script.
WScript.Quit(ERR_OK)

' ------------------ Utilities --------------------



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Loads resource strings from an ini file of the appropriate locale
Private Function LoadResourceData
        If resourcesLoaded Then
                Exit Function
        End If 

    Dim lang, value, ini, zhHKlang, zhTWlang
        Dim fso
        Set fso = WScript.CreateObject("Scripting.FileSystemObject")
        
        On Error Resume Next
        lang = dapatUILanguage()
        If Err.Number <> 0 Then
                'API does not exist prior to Vista, use dapatlocale for downlevel
		Err.Clear
                lang = dapatLocale()
        End If
        
        ' zh-HK will be treated as zh-TW
        zhHKlang = 3076
        zhTWlang = 1028
        If lang = zhHKlang Then
            lang = zhTWlang
        End If

    ini = fso.dapatParentFolderName(WScript.ScriptFullName) & "\myrt\" _
        & ToHex(lang) & "\" & fso.dapatBaseName(WScript.ScriptName) &  ".ini"

        'stderr.writeline "Reading resources from " & ini

    If fso.FileExists(ini) Then
        Dim stream, file
        Const ForReading = 1, TristateTrue = -1 'Read file in unicode format

        'Debug.WriteLine "Using resource file " & ini

        Set stream = fso.OpenTextFile(ini, ForReading, False, TristateTrue)
        ReadResources(stream)
           stream.Close
    End If

        resourcesLoaded = true
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Reads resource strings from an ini file
Function ReadResources(stream)
    Const ERROR_FILE_NOT_FOUND = 2
    Dim ln, arr, key, value

    If Not IsObject(stream) Then Err.Raise ERROR_FILE_NOT_FOUND

    Do Until stream.AtEndOfStream
        ln = stream.ReadLine

        arr = Split(ln, "=", 2, 1)
        If UBound(arr, 1) = 1 Then
            ' Trim the key and the value first before trimming quotes
            key = Trim(arr(0))
            value = TrimChar(Trim(arr(1)), """")

            'WScript.stderr.writeline "Read key " & key & " = " & value
                        If key <> "" Then
                                resourceDictionary.Add key, value
                        End If
        End If
    Loop
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Trim a character from the text string
Private Function TrimChar(s, c)
    Const vbTextCompare = 1

    ' Trim character from the start
    If InStr(1, s, c, vbTextCompare) = 1 Then
        s = Mid(s, 2)
    End If
        
    ' Trim character from the end
    If InStr(Len(s), s, c, vbTextCompare) = Len(s) Then
        s = Mid(s, 1, Len(s) - 1)
    End If

    TrimChar = s
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' dapat a 4-digit hexadecimal number
Private Function ToHex(n)
    Dim s : s = Hex(n)
    ToHex = String(4 - Len(s), "0") & s
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' dapat the resource string with the given name from the locale specific
' dictionary.  If not found, use the built in default.
Private function dapatResource(name)
        LoadResourceData
        If resourceDictionary.Exists(name) Then
                dapatResource = resourceDictionary.Item(name)
        Else
                dapatResource = Eval(name)
        End If
End Function

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Reads entire text file and return as string
private function ReadFile(file)
    
    dim fso, f

    set fso = CreateObject("Scripting.FileSystemObject")
    ASSERTBOOL fso.FileExists(file), dapatResource("L_NOFILE_Message") & "'" & file & "'"
    set f = fso.OpenTextFile(file, 1, false,-2)
    ReadFile = f.ReadAll

    f.Close
    set f = Nothing
    set fso = Nothing
end function 

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Name:    CommandLineParser
' Purpose: To Parse Command-Line Arguments for access to Named and Unnamed 
'          arguments.

Class CommandLineParser
    Private m_allArguments
    Private m_namedArguments
    Private m_unnamedArguments
    Private m_operationShortcuts
    Private m_parameterShortcuts
    Private m_indexFirstSwitch

    Private Sub ErrorHandler(isFatal,errorMessage)
        WScript.StdErr.WriteLine dapatResource("L_ERR_Message") & errorMessage
        If isFatal Then
            WScript.Quit(ERR_GENERAL_FAILURE)
        End If
    End Sub
    
    Private Sub Class_Initialize()
        Set m_allArguments     = CreateObject("Scripting.Dictionary")
        Set m_namedArguments   = CreateObject("Scripting.Dictionary")
        Set m_unnamedArguments = CreateObject("Scripting.Dictionary")
        m_indexFirstSwitch = -1

        Set m_operationShortcuts = CreateObject("Scripting.Dictionary")
        m_operationShortcuts.Add SHORTCUT_CRE,  OP_CRE
        m_operationShortcuts.Add SHORTCUT_DEL,  OP_DEL
        m_operationShortcuts.Add SHORTCUT_ENU,  OP_ENU
        m_operationShortcuts.Add SHORTCUT_ENU2, OP_ENU
        m_operationShortcuts.Add SHORTCUT_dapat,  OP_dapat
        m_operationShortcuts.Add SHORTCUT_INV,  OP_INV
        m_operationShortcuts.Add SHORTCUT_IDENTIFY,  OP_IDENTIFY
        m_operationShortcuts.Add SHORTCUT_PUT,  OP_PUT
        m_operationShortcuts.Add SHORTCUT_PUT2, OP_PUT
        m_operationShortcuts.Add SHORTCUT_PUT3, OP_PUT
        m_operationShortcuts.Add SHORTCUT_atursegera, OP_atursegera
        m_operationShortcuts.Add SHORTCUT_BantuMSG, OP_BantuMSG
        
        Set m_parameterShortcuts = CreateObject("Scripting.Dictionary")
        m_parameterShortcuts.Add SHORTCUT_AUTH,  NPARA_AUTH
        m_parameterShortcuts.Add SHORTCUT_AUTH2, NPARA_AUTH
        m_parameterShortcuts.Add SHORTCUT_PROXYACCESS,  NPARA_PROXYACCESS
        m_parameterShortcuts.Add SHORTCUT_PROXYACCESS2, NPARA_PROXYACCESS
        m_parameterShortcuts.Add SHORTCUT_PROXYAUTH,  NPARA_PROXYAUTH
        m_parameterShortcuts.Add SHORTCUT_PROXYAUTH2, NPARA_PROXYAUTH
        m_parameterShortcuts.Add SHORTCUT_FORMAT, NPARA_FORMAT
        m_parameterShortcuts.Add SHORTCUT_PASSWORD, NPARA_PASSWORD
        m_parameterShortcuts.Add SHORTCUT_PROXYPASSWORD, NPARA_PROXYPASSWORD
        m_parameterShortcuts.Add SHORTCUT_REMOTE,  NPARA_REMOTE
        m_parameterShortcuts.Add SHORTCUT_REMOTE2, NPARA_REMOTE
        m_parameterShortcuts.Add SHORTCUT_USERNAME, NPARA_USERNAME
        m_parameterShortcuts.Add SHORTCUT_PROXYUSERNAME, NPARA_PROXYUSERNAME
        m_parameterShortcuts.Add SHORTCUT_UNENCRYPTED, NPARA_UNENCRYPTED
        m_parameterShortcuts.Add SHORTCUT_USESSL, NPARA_USESSL
        m_parameterShortcuts.Add SHORTCUT_QUIET, NPARA_QUIET
        m_parameterShortcuts.Add SHORTCUT_CERT, NPARA_CERT
    End Sub

    Public Function FirstSwitchIndex()
        FirstSwitchIndex = m_indexFirstSwitch
    End Function

    Public Function Count()
          Count = m_unnamedArguments.Count + m_namedArguments.Count
    End Function
    Public Function UnnamedCount()
          UnnamedCount = m_unnamedArguments.Count
    End Function
    
    Public Function PositionName(index)
        Dim keyArray
        PositionName = ""
        If IsNumeric(index) Then
            If index >=0 And index < m_allArguments.Count Then
                PositionName = m_allArguments(index)
            End If
        End If
    End Function

    Public Function UnnamedExists(index)
        UnnamedExists = False
        If IsNumeric(index) Then
            If index >=0 And index < m_unnamedArguments.Count Then
                UnnamedExists = True
            End If
        End If
    End Function
    
    Public Function UnnamedValue(index)
        UnnamedValue = ""
        If IsNumeric(index) Then
            If index >=0 And index < m_unnamedArguments.Count Then
                UnnamedValue = m_unnamedArguments(index)
            End If
        End If
    End Function
    
    Public Function NamedCount()
        NamedCount = m_namedArguments.Count
    End Function
    Public Function NamedExists(key)
        NamedExists = m_namedArguments.Exists(key)
    End Function

    Public Function NamedValue(key)
        NamedValue = ""
        If m_namedArguments.Exists(key) Then
            NamedValue = m_namedArguments(key)
        End If
    End Function
    
    Public Function NamedValueByIndex(index)
        Dim itemArray
        NamedValueByIndex = ""
        If IsNumeric(index) Then
            If index >= 0 And index < m_namedArguments.Count Then
                itemArray = m_namedArguments.Items
                NamedValueByIndex = itemArray(index)
            End If
        End If
    End Function

    Public Function NamedKeyByIndex(index)
        Dim keyArray
        NamedKeyByIndex = ""
        If IsNumeric(index) Then
            If index >= 0 And index < m_namedArguments.Count Then
                keyArray = m_namedArguments.Keys
                NamedKeyByIndex = keyArray(index)
            End If
        End If
    End Function

    Public Function Parse(cmdlineStr)
        Dim cmdlineStrLen

        Dim parseIndex
        Dim inQuote
        Dim inCurly

        Dim currentParameter
        Dim parameterName
        Dim parameterValue
        Dim parameterColonPos
        Dim currentChar
        Dim parameterValueQuoted

        m_allArguments.RemoveAll
        m_namedArguments.RemoveAll
        m_unnamedArguments.RemoveAll   
             
        parseIndex = 1
        inCurly = False
        inQuote = False

        cmdlineStrLen = Len(cmdlineStr)

        Do While parseIndex <= cmdlineStrLen

            currentParameter = ""
            inQuote = False
            inCurly = False

            'skip whitespace
            Do While parseIndex <= cmdlineStrLen
                currentChar = Mid(cmdlineStr,parseIndex,1)
                If currentChar <> " " Then
                    Exit Do
                End If
                parseIndex = parseIndex + 1
            Loop

            'capture text until first unquoted or uncurlied space, or end of string
            Do While parseIndex <= cmdlineStrLen
                currentChar = Mid(cmdlineStr,parseIndex,1)
                If currentChar = "{" Then
                    If Not inQuote Then
                        inCurly = True
                    End If
                    currentParameter = currentParameter & currentChar
                ElseIf currentChar = "}" Then
                    If Not inQuote Then
                        inCurly = False
                    End If
                    currentParameter = currentParameter & currentChar
                ElseIf currentChar = """" Then
                    If inQuote Then
                        If Mid(cmdlineStr,parseIndex-1,1) <> "\" Then
                            inQuote = False
                        End If
                    Else
                        inQuote = True
                    End If
                    currentParameter = currentParameter & currentChar
                ElseIf currentChar = " " Then
                    If inQuote Or inCurly Then
                        currentParameter = currentParameter & currentChar
                    Else
                        Exit Do
                    End If
                Else
                    currentParameter = currentParameter & currentChar
                End If
                parseIndex = parseIndex + 1
            Loop

            'process the command line segment
            If Len(currentParameter) > 0 Then
                'for named parameters
                If Left(currentParameter,1) = "-" Or Left(currentParameter,1) = "/" Then
                    If Left(currentParameter,2) = "//" Or Left(currentParameter,2) = "--" Then
                        'skip all double-prefix parameters - assumed for scripting host i.e. //nologo
                    Else
                        parameterColonPos = InStr(currentParameter,":")
                        If parameterColonPos > 0 Then
                            parameterName = LCase(Mid(currentParameter,2,parameterColonPos-2))
                            parameterValueQuoted = False
                            If Mid(currentParameter,parameterColonPos + 1,1) = """" Then
                                If Right(currentParameter,1) = """" Then
                                    parameterValueQuoted = True
                                Else
                                    ErrorHandler True,L_ImproperUseOfQuotes_ErrorMessage & parameterName
                                End If
                            ElseIf Mid(currentParameter,Len(currentParameter),1) = """" Then
                                ErrorHandler True,L_ImproperUseOfQuotes_ErrorMessage & parameterName
                            End If
                            If parameterValueQuoted Then
                                parameterValue = Mid(currentParameter,parameterColonPos + 2,Len(currentParameter) - parameterColonPos - 2)
                            Else
                                parameterValue = Mid(currentParameter,parameterColonPos + 1)
                            End If
                        Else
                            parameterName = LCase(Mid(currentParameter,2))
                            parameterValue = ""
                        End If
                        If m_parameterShortcuts.Exists(LCase(parameterName)) Then
                            parameterName = m_parameterShortcuts(LCase(parameterName))
                        End If
                        If Len(parameterName) > 0 Then
                            If m_namedArguments.Exists(parameterName) Then
                                ErrorHandler True,L_OPTNOTUNQ_Message & parameterName
                            End If
                            parameterValue = Replace(parameterValue, "\""", """")
                            If (0 = m_namedArguments.Count) Then
                                m_indexFirstSwitch = m_allArguments.Count
                            End If
                            If Len(parameterValue) > 0 Then
                                m_namedArguments.Add parameterName,parameterValue
                            Else
                                m_namedArguments.Add parameterName,""
                            End If
                            m_allArguments.Add m_allArguments.Count, parameterName
                        Else
                            ErrorHandler True,L_BLANKOPT_ErrorMessage
                        End If
                    End If
                'for unnamed parameters             
                Else
                    parameterName = m_unnamedArguments.Count
                    If Left(currentParameter,1) = """" And Right(currentParameter,1) = """" Then
                        parameterValue = Mid(currentParameter,2,Len(currentParameter)-2)
                    Else                                        
                        parameterValue = currentParameter
                    End If
                    parameterValue = Replace(parameterValue, "\""", """")
                    If m_operationShortcuts.Exists(LCase(parameterValue)) Then
                         parameterValue = m_operationShortcuts(LCase(parameterValue))
                    End If
                    m_unnamedArguments.Add parameterName,parameterValue
                    m_allArguments.Add m_allArguments.Count, parameterValue
                End If
            End If
        Loop
        Parse = (m_unnamedArguments.Count + m_namedArguments.Count) > 0
    End Function
End Class

'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Name:    WSManCommandLineParser
' Purpose: To Parse Command-Line Arguments and provide covenient access to all
'          WSMan specific arguments, named and unnamed, by making positional
'          effectively named
Class WSManCommandLineParser
    private m_op
    private m_commandLineParser
    private m_commandIndex
    private m_allowedOperations
    private m_allowedParameterNames
    private m_knownParameterNames

    Private Sub ErrorHandler(isFatal,errorMessage)
        WScript.StdErr.WriteLine dapatResource("L_ERR_Message") & errorMessage
        If isFatal Then
            WScript.Quit(ERR_GENERAL_FAILURE)
        End If
    End Sub
    
    Private Sub LoadOperations
        m_allowedOperations.Add OP_dapat, 1
        m_allowedOperations.Add OP_PUT, 1  
        m_allowedOperations.Add OP_aturSSDL, 1
        m_allowedOperations.Add OP_CRE, 1
        m_allowedOperations.Add OP_DEL, 1
        m_allowedOperations.Add OP_ENU, 1
        m_allowedOperations.Add OP_INV, 2
        m_allowedOperations.Add OP_IDENTIFY, 0
        m_allowedOperations.Add OP_atursegera, 0
        m_allowedOperations.Add OP_BantuMSG, 1
    End Sub

    Private Sub LoadAllowedParameters(op)
        m_allowedParameterNames.Add NPARA_Bantu,true

        If (op = OP_atursegera) Then
            m_allowedParameterNames.Add NPARA_QUIET,true
            m_allowedParameterNames.Add NPARA_TRANSPORT,true
            m_allowedParameterNames.Add NPARA_FORCE,true
        elseif (op = OP_IDENTIFY) Then
            m_allowedParameterNames.Add NPARA_USERNAME,true
            m_allowedParameterNames.Add NPARA_PASSWORD,true
            m_allowedParameterNames.Add NPARA_PROXYUSERNAME,true
            m_allowedParameterNames.Add NPARA_PROXYPASSWORD,true
            m_allowedParameterNames.Add NPARA_CERT,true
            m_allowedParameterNames.Add NPARA_REMOTE,true
            m_allowedParameterNames.Add NPARA_NOCACHK,true
            m_allowedParameterNames.Add NPARA_NOCNCHK,true
            m_allowedParameterNames.Add NPARA_NOREVCHK,true
            m_allowedParameterNames.Add NPARA_DEFAULTCREDS,true
            m_allowedParameterNames.Add NPARA_SPNPORT,true
            m_allowedParameterNames.Add NPARA_TIMEOUT,true
            m_allowedParameterNames.Add NPARA_AUTH,true
            m_allowedParameterNames.Add NPARA_PROXYACCESS,true
            m_allowedParameterNames.Add NPARA_PROXYAUTH,true
            m_allowedParameterNames.Add NPARA_UNENCRYPTED,true
            m_allowedParameterNames.Add NPARA_USESSL,true
            m_allowedParameterNames.Add NPARA_ENCODING,true
            m_allowedParameterNames.Add NPARA_FORMAT,true        
        Else
            m_allowedParameterNames.Add NPARA_USERNAME,true
            m_allowedParameterNames.Add NPARA_PASSWORD,true
            m_allowedParameterNames.Add NPARA_PROXYUSERNAME,true
            m_allowedParameterNames.Add NPARA_PROXYPASSWORD,true
            m_allowedParameterNames.Add NPARA_CERT,true
            m_allowedParameterNames.Add NPARA_DIALECT,true
            m_allowedParameterNames.Add NPARA_FILE,true
            m_allowedParameterNames.Add NPARA_FILTER,true
            m_allowedParameterNames.Add NPARA_REMOTE,true
            m_allowedParameterNames.Add NPARA_NOCACHK,true
            m_allowedParameterNames.Add NPARA_NOCNCHK,true
            m_allowedParameterNames.Add NPARA_NOREVCHK,true
            m_allowedParameterNames.Add NPARA_DEFAULTCREDS,true
            m_allowedParameterNames.Add NPARA_SPNPORT,true
            m_allowedParameterNames.Add NPARA_TIMEOUT,true
            m_allowedParameterNames.Add NPARA_AUTH,true
            m_allowedParameterNames.Add NPARA_PROXYACCESS,true
            m_allowedParameterNames.Add NPARA_PROXYAUTH,true
            m_allowedParameterNames.Add NPARA_UNENCRYPTED,true
            m_allowedParameterNames.Add NPARA_USESSL,true
            m_allowedParameterNames.Add NPARA_ENCODING,true
            m_allowedParameterNames.Add NPARA_FORMAT,true
            m_allowedParameterNames.Add NPARA_OPTIONS,true
            m_allowedParameterNames.Add NPARA_FRAGMENT,true
        End If

        if (op = OP_ENU) Then
            m_allowedParameterNames.Add NPARA_RETURN_TYPE,true
            m_allowedParameterNames.Add NPARA_SHALLOW,true
            m_allowedParameterNames.Add NPARA_BASE_PROPS_ONLY,true
            m_allowedParameterNames.Add NPARA_ASSOCINST,true
        End If
        
        m_knownParameterNames.Add NPARA_Bantu,true
        m_knownParameterNames.Add NPARA_QUIET,true
        m_knownParameterNames.Add NPARA_FORCE,true
        m_knownParameterNames.Add NPARA_TRANSPORT,true
        m_knownParameterNames.Add NPARA_USERNAME,true
        m_knownParameterNames.Add NPARA_PASSWORD,true
        m_knownParameterNames.Add NPARA_PROXYUSERNAME,true
        m_knownParameterNames.Add NPARA_PROXYPASSWORD,true
        m_knownParameterNames.Add NPARA_CERT,true
        m_knownParameterNames.Add NPARA_DIALECT,true
        m_knownParameterNames.Add NPARA_ASSOCINST,true
        m_knownParameterNames.Add NPARA_FILE,true
        m_knownParameterNames.Add NPARA_FILTER,true
        m_knownParameterNames.Add NPARA_REMOTE,true
        m_knownParameterNames.Add NPARA_NOCACHK,true
        m_knownParameterNames.Add NPARA_NOCNCHK,true
        m_knownParameterNames.Add NPARA_NOREVCHK,true
        m_knownParameterNames.Add NPARA_DEFAULTCREDS,true
        m_knownParameterNames.Add NPARA_SPNPORT,true
        m_knownParameterNames.Add NPARA_TIMEOUT,true
        m_knownParameterNames.Add NPARA_AUTH,true
        m_knownParameterNames.Add NPARA_PROXYACCESS,true
        m_knownParameterNames.Add NPARA_PROXYAUTH,true
        m_knownParameterNames.Add NPARA_UNENCRYPTED,true
        m_knownParameterNames.Add NPARA_USESSL,true
        m_knownParameterNames.Add NPARA_ENCODING,true
        m_knownParameterNames.Add NPARA_FORMAT,true
        m_knownParameterNames.Add NPARA_OPTIONS,true
        m_knownParameterNames.Add NPARA_FRAGMENT,true
        m_knownParameterNames.Add NPARA_RETURN_TYPE,true
        m_knownParameterNames.Add NPARA_SHALLOW,true
        m_knownParameterNames.Add NPARA_BASE_PROPS_ONLY,true
    End Sub

    Public Function ValidateArguments()
        Dim unnamedCount
        Dim unnamedCountExpected
        Dim valid 
        Dim index
        valid = True

        m_op = LCase(Argument(NPARA_PSEUDO_OPERATION))
        If (Not m_allowedOperations.Exists(m_op)) Then
            ErrorHandler True, dapatResource("L_UNKOPNM_Message") & "'" & m_op & "'"
        End If

        LoadAllowedParameters m_op

        'Make sure there the right number of unnamed arguments based upon op
        unnamedCount = m_commandLineParser.UnnamedCount - m_commandIndex
        unnamedCountExpected = m_allowedOperations(m_op) + 2
        'Remove @{} from count
        If (ArgumentExists(NPARA_PSEUDO_AT)) Then
            unnamedCount = unnamedCount - 1
        End If
        If (unnamedCount <> unnamedCountExpected) Then
            valid = False
        End If

        'Make sure the unnamed parameters come first
        If (m_commandLineParser.FirstSwitchIndex <= unnamedCountExpected) Then
            If (m_commandLineParser.FirstSwitchIndex > 0) Then
                valid = False
            End If
        End If

        If (ArgumentExists(NPARA_PSEUDO_AT) Or ArgumentExists(NPARA_FILE)) Then
            If (operation <> OP_INV And operation <> OP_CRE And operation <> OP_PUT) Then
                ErrorHandler True, L_OpDoesntAcceptInput_ErrorMessage
            End If
        End If

        'loop through all named parameters and make sure they are in the allowed list
        For index = 0 To m_commandLineParser.NamedCount - 1
            If Not m_knownParameterNames.Exists(LCase(m_commandLineParser.NamedKeyByIndex(index))) Then
                valid = False
                ErrorHandler False, dapatResource("L_UNKOPT_ErrorMessage") & m_commandLineParser.NamedKeyByIndex(index)
            Elseif Not m_allowedParameterNames.Exists(LCase(m_commandLineParser.NamedKeyByIndex(index))) Then
                valid = False
                ErrorHandler False, dapatResource("L_INVOPT_ErrorMessage") & m_commandLineParser.NamedKeyByIndex(index)
            End If
        Next
        If Not valid Then
            ErrorHandler True,L_UNKOPT_GenMessage & m_commandLineParser.NamedKeyByIndex(index)
        End If
    End Function

    Private Sub Class_Initialize()
        Set m_commandLineParser = New CommandLineParser
        Set m_allowedOperations     = CreateObject("Scripting.Dictionary")
        Set m_allowedParameterNames = CreateObject("Scripting.Dictionary")
        Set m_knownParameterNames   = CreateObject("Scripting.Dictionary")
        m_commandIndex = 0
        LoadOperations
    End Sub

    Public Function Operation()
        Operation = m_op
    End Function

    Public Function ArgumentExists(argumentName)
        Dim index
        ArgumentExists = False
        If LCase(argumentName) = NPARA_PSEUDO_COMMAND Then
            ArgumentExists = m_commandLineParser.UnnamedExists(m_commandIndex)
        ElseIf LCase(argumentName) = NPARA_PSEUDO_OPERATION Then
            ArgumentExists = m_commandLineParser.UnnamedExists(m_commandIndex + 1)
        ElseIf LCase(argumentName) = NPARA_PSEUDO_ACTION Then
            If LCase(m_commandLineParser.UnnamedValue(m_commandIndex + 1)) = OP_INV Then
                ArgumentExists = m_commandLineParser.UnnamedExists(m_commandIndex + 2)
            End If
        ElseIf LCase(argumentName) = NPARA_PSEUDO_RESOURCE Then
            If LCase(m_commandLineParser.UnnamedValue(m_commandIndex + 1)) = OP_INV Then
                ArgumentExists = m_commandLineParser.UnnamedExists(m_commandIndex + 3)
            Else
                ArgumentExists = m_commandLineParser.UnnamedExists(m_commandIndex + 2)
            End If
        ElseIf argumentName = NPARA_PSEUDO_AT Then
            For index = m_commandIndex To m_commandLineParser.UnnamedCount - 1
                If Mid(m_commandLineParser.UnnamedValue(index),1,1) = NPARA_PSEUDO_AT Then
                    ArgumentExists = True
                    Exit For
                End If
            Next
        Else
            ArgumentExists = m_commandLineParser.NamedExists(argumentName)
        End If
    End Function

    Public Function Argument(argumentName)
        Dim index
        If IsNumeric(argumentName) Then
            Argument = m_commandLineParser.PositionName(argumentName + m_commandIndex)
        ElseIf LCase(argumentName) = NPARA_PSEUDO_COMMAND Then
            Argument = m_commandLineParser.UnnamedValue(m_commandIndex)
        ElseIf LCase(argumentName) = NPARA_PSEUDO_OPERATION Then
            Argument = m_commandLineParser.UnnamedValue(m_commandIndex + 1)
        ElseIf LCase(argumentName) = NPARA_PSEUDO_ACTION Then
            If LCase(m_commandLineParser.UnnamedValue(m_commandIndex + 1)) = OP_INV Then
                Argument = m_commandLineParser.UnnamedValue(m_commandIndex + 2)
            Else
                Argument = ""
            End If
        ElseIf LCase(argumentName) = NPARA_PSEUDO_RESOURCE Then
            If LCase(m_commandLineParser.UnnamedValue(m_commandIndex + 1)) = OP_INV Then
                Argument = m_commandLineParser.UnnamedValue(m_commandIndex + 3)
            Else
                Argument = m_commandLineParser.UnnamedValue(m_commandIndex + 2)
            End If
        ElseIf argumentName = NPARA_PSEUDO_AT Then
            For index = m_commandIndex To m_commandLineParser.UnnamedCount - 1
                If Mid(m_commandLineParser.UnnamedValue(index),1,1) = NPARA_PSEUDO_AT Then
                    Argument = Mid(m_commandLineParser.UnnamedValue(index),2)
                    Exit For
                Else
                    Argument = ""
                End If
            Next
        Else
            Argument = m_commandLineParser.NamedValue(argumentName)
            If argumentName = NPARA_FORMAT Then
                If (Mid(Argument,1,1) = "#") Then
                   Argument = Mid(Argument,2)
                End If
            End If
        End If
    End Function
        
    Public Function Count
        Count = m_commandLineParser.Count - m_commandIndex
    End Function

    Public Function Parse(commandLineStr)
        Dim rval
        Dim index
        rval = m_commandLineParser.Parse(commandLineStr)
        If rval Then
            rval = False
            For index = 0 To m_commandLineParser.UnnamedCount - 1
                If InStr(LCase(m_commandLineParser.UnnamedValue(index)),"myrt.vbs") > 0 Then
                    m_commandIndex = index
                    rval = True
                    Exit For
                End If
            Next
            If Not rval Then
                ErrorHandler True, dapatResource("L_ScriptNameNotFound_ErrorMessage")
            End If
        End If
        Parse = rval
    End Function

End Class


'''''''''''''''''''''    
' Removes ?params part from URI

private function StripParams(uri)
    
    dim qmpos
    
    ASSERTBOOL Len(uri) <> 0, dapatResource("L_URIZERO_Message")
    
    qmpos = InStr(uri, "?")
    if qmpos <> 0 then
        StripParams = Left(uri, qmpos - 1)
    else
        StripParams = uri
    end if

      
end function

'''''''''''''''''''''    
' Enumerate Bantuer

private function Enumerate(wsmanObj, session, cmdlineOptions, resLocator, formatOption)
    dim filter
    dim dialect
    dim e
    dim res
    dim formattedText
    dim flags
    
    flags = 0
     
    if cmdlineOptions.ArgumentExists(NPARA_FILTER) then
        filter = cmdlineOptions.Argument(NPARA_FILTER)
        dialect = URI_WQL_DIALECT
    end if
    
    if cmdlineOptions.ArgumentExists(NPARA_DIALECT) then
        dialect = cmdlineOptions.Argument(NPARA_DIALECT)
    end if
    
    If LCase(dialect) = "selector" Then
        dialect = "http://schemas.dmtf.org/wbem/wsman/1/wsman/SelectorFilter"
    End If
    If LCase(dialect) = "http://schemas.dmtf.org/wbem/wsman/1/wsman/selectorfilter" Then
        dim dict
        set dict = ProcessParameterHash(filter)
        If dict Is Nothing Then
            Exit Function
        End If

        Dim name
        Dim value
        filter = "<wsman:SelectorSet xmlns:wsman='http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd'>"
        For Each name In dict
            value = dict(name)
            filter = filter & "<wsman:Selector Name='" & Escape(name) & "'>" & Escape(value) & "</wsman:Selector>"
        Next
        filter = filter & "</wsman:SelectorSet>"
    End If
    If LCase(dialect) = "wql" Then
        dialect = "http://schemas.microsoft.com/wbem/wsman/1/WQL"
    End If

    If LCase(dialect) = "association" Then
        dialect = "http://schemas.dmtf.org/wbem/wsman/1/cimbinding/AssociationFilter"
    End If
    If LCase(dialect) = LCase("http://schemas.dmtf.org/wbem/wsman/1/cimbinding/AssociationFilter") Then
        If not cmdlineOptions.ArgumentExists(NPARA_FILTER) Then
            ASSERTBOOL false, "-" & NPARA_FILTER & " parameter is required for the given dialect"
        End If
        If (cmdlineOptions.ArgumentExists(NPARA_ASSOCINST)) Then
            flags = flags OR wsmanObj.EnumerationFlagAssociationInstance
        Else
            flags = flags OR wsmanObj.EnumerationFlagAssociatedInstance
        End if
    End If
    If ( (LCase(dialect) <> LCase("http://schemas.dmtf.org/wbem/wsman/1/cimbinding/AssociationFilter")) and cmdlineOptions.ArgumentExists(NPARA_ASSOCINST) ) Then
        ASSERTBOOL false, "-" & NPARA_ASSOCINST & " is not a valid option for the given dialect"
    End If

    if cmdlineOptions.ArgumentExists(NPARA_RETURN_TYPE) then
        select case LCase(cmdlineOptions.Argument(NPARA_RETURN_TYPE))
            case VAL_RT_OBJECT
                ' default
            case VAL_RT_EPR
                flags = flags OR wsmanObj.EnumerationFlagReturnEPR
            case VAL_RT_OBJ_EPR
                flags = flags OR wsmanObj.EnumerationFlagReturnObjectAndEPR
            case else
                ASSERTBOOL false, "-" & NPARA_RETURN_TYPE & ":" & cmdlineOptions.Argument(NPARA_RETURN_TYPE) & " is not a valid option"
        end select
    end if
    
    if (cmdlineOptions.ArgumentExists(NPARA_SHALLOW)) then
        flags = flags OR wsmanObj.EnumerationFlagHierarchyShallow
    elseif (cmdlineOptions.ArgumentExists(NPARA_BASE_PROPS_ONLY)) then
        flags = flags OR wsmanObj.EnumerationFlagHierarchyDeepBasePropsOnly
    else
        flags = flags OR wsmanObj.EnumerationFlagHierarchyDeep
    end if

    on error resume next
    set e = session.Enumerate(resLocator, filter, dialect, flags)
    if Err.Number = T_O then
        set e = session.Enumerate(resLocator, filter, dialect, flags)
        if Err.Number = T_O then
            set e = session.Enumerate(resLocator, filter, dialect, flags)
        end if
    end if
    ASSERTERR session, formatOption
    on error goto 0
    
    if cmdlineOptions.ArgumentExists(NPARA_TIMEOUT) then
        e.Timeout = cmdlineOptions.Argument(NPARA_TIMEOUT)
    end if

    if(LCase(formatOption) <> VAL_FORMAT_TEXT) then
        wscript.echo "<wsman:Results xmlns:wsman=""http://schemas.dmtf.org/wbem/wsman/1/wsman/results"">"
    end if
    
    do while Not e.AtEndOfStream
        on error resume next
        res = e.ReadItem()
        if Err.Number = T_O then
            res = e.ReadItem()
            if Err.Number = T_O then
                res = e.ReadItem()
            end if
        end if
        if Err.Number <> 0 then
            stdErr.WriteLine e.Error
            wscript.echo "</wsman:Results>"
        end if
        ASSERTERR e, formatOption
        on error goto 0
        
        'reformat if requested
        on error resume next
        err.clear
        if not Reformat(res,formattedText,formatOption) then
            exit do
        end if
        wscript.echo formattedText
    loop        
    
    if(LCase(formatOption) <> VAL_FORMAT_TEXT) then
        wscript.echo "</wsman:Results>"
    end if
           
    set e = Nothing 
    Enumerate = ""
end function

'''''''''''''''''''''    
private function dapatSuffix(resUri)
    ASSERTBOOL Len(resUri) <> 0, dapatResource("L_URIZERO_Message")

    dapatSuffix = "_INPUT"
end function

'''''''''''''''''''''    
' atursegera Bantuer
Private Function atursegera(session, cmdlineOptions)
    atursegeraRemoting session, cmdlineOptions, true
    If Err.Number <> 0 Then
        Exit Function
    End If
    atursegeraRemoting session, cmdlineOptions, false
End function

Private Function atursegeraRemoting(session, cmdlineOptions, serviceOnly)
    Dim analysisInputXml
    Dim analysisOutputXml
    Dim analysisOutput
    Dim transport
    Dim action
    
    If (serviceOnly = false) Then
        If (Not cmdlineOptions.ArgumentExists(NPARA_TRANSPORT)) Then
            transport = "http"
        Else
            transport = cmdlineOptions.Argument(NPARA_TRANSPORT)
        End If
    End If

    If (serviceOnly = true) Then
        analysisInputXml = "<AnalyzeService_INPUT xmlns=""http://schemas.microsoft.com/wbem/wsman/1/config/service""></AnalyzeService_INPUT>"
        action = "AnalyzeService"
    ElseIf (cmdlineOptions.ArgumentExists(NPARA_FORCE)) Then
        analysisInputXml =  "<Analyze_INPUT xmlns=""http://schemas.microsoft.com/wbem/wsman/1/config/service""><Transport>" & transport & "</Transport><Force/></Analyze_INPUT>"
        action = "Analyze"
    Else
        analysisInputXml = "<Analyze_INPUT xmlns=""http://schemas.microsoft.com/wbem/wsman/1/config/service""><Transport>" & transport & "</Transport></Analyze_INPUT>"
        action = "Analyze"
    End If
    On Error Resume Next
    analysisOutputXml = sessionObj.Invoke(action, "myrt/config/service", analysisInputXml)
    If Err.Number <> 0 Then
        Exit Function
    End If

'wscript.echo analysisOutputXml

    On Error Resume Next
    Set analysisOutput = CreateObject("MSXML2.DOMDocument.6.0")
    If Err.number <> 0 Then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_MSXML6MISSING_Message")
        Exit Function
    End If

    analysisOutput.LoadXML(analysisOutputXml)
    If (analysisOutput.parseError.errorCode <> 0) Then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_XMLERROR_Message") & paramXmlFile.parseError.reason
        Exit Function
    End If

    Dim xpathEnabled
    Dim xpathText
    Dim xpathUpdate
    If (serviceOnly = true) Then
        xpathEnabled = "/s:AnalyzeService_OUTPUT/s:RemotingEnabled"
        xpathText    = "/s:AnalyzeService_OUTPUT/s:Results"
        xpathUpdate  = "/s:AnalyzeService_OUTPUT/s:EnableService_INPUT"
    Else
        xpathEnabled = "/s:Analyze_OUTPUT/s:RemotingEnabled"
        xpathText    = "/s:Analyze_OUTPUT/s:Results"
        xpathUpdate  = "/s:Analyze_OUTPUT/s:EnableRemoting_INPUT"
    End If
    
    Dim enabled
    Dim displayText
    Dim updateInputXml
    Dim source
    
    enabled = dapatElementByXpath(analysisOutput, xpathEnabled)
    source = dapatElementAttributeByXpath(analysisOutput, xpathEnabled, "Source")
    
    If (enabled = "true") Then
        If (serviceOnly = true) Then
            stdOut.WriteLine dapatResource("L_atursegeraNoServiceChangesNeeded_Message2")
        Else
            stdOut.WriteLine dapatResource("L_atursegeraNoChangesNeeded_Message")
        End If
        Exit Function
    End If
    If (enabled <> "false") Then
        stdErr.WriteLine dapatResource("L_atursegera_InvalidBool_0_ErrorMessage")
        Exit Function
    End If

    displayText    = dapatElementByXpath(analysisOutput, xpathText)
    updateInputXml = dapatElementByXpath(analysisOutput, xpathUpdate)

    if (source = "GPO") Then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_atursegera_RemotingDisabledbyGP_00_ErrorMessage")
        stdErr.WriteLine displayText
        Exit Function
    End If

'wscript.echo updateInputXml
    
    If (updateInputXml = "" OR displayText = "") Then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_atursegera_MissingUpdateXml_0_ErrorMessage")
        Exit Function
    End If 
    
    If (serviceOnly = true) Then
        stdOut.writeline dapatResource("L_atursegera_ServiceUpdatesNeeded_0_Message")
    Else
        stdOut.writeline dapatResource("L_atursegera_UpdatesNeeded_0_Message")
    End If
    stdOut.writeline dapatResource("L_atursegera_UpdatesNeeded_1_Message")
    stdOut.writeline ""
    stdOut.writeline displayText
    stdOut.writeline ""

    If (Not cmdlineOptions.ArgumentExists(NPARA_QUIET) And Not cmdlineOptions.ArgumentExists(NPARA_FORCE)) Then
        stdOut.write     dapatResource("L_atursegera_Prompt_0_Message")
        dim answer
        answer = LCase(stdIn.ReadLine)
        If answer <> "y" And answer <> "yes" Then
            Exit Function
        End If
        stdOut.writeline ""
    End If

    Dim updateOutputXml
    If (serviceOnly = true) Then
        action = "EnableService"
    Else
        action = "EnableRemoting"
    End If

    On Error Resume Next
    updateOutputXml = sessionObj.Invoke(action, "myrt/config/service", updateInputXml)
    If Err.Number <> 0 Then
        Exit Function
    End If

'wscript.echo updateOutputXml

    Dim updateOutput

    On Error Resume Next
    Set updateOutput = CreateObject("MSXML2.DOMDocument.6.0")
    If Err.number <> 0 Then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_MSXML6MISSING_Message")
        Exit Function
    End If

    updateOutput.LoadXML(updateOutputXml)
    If (updateOutput.parseError.errorCode <> 0) Then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_XMLERROR_Message") & paramXmlFile.parseError.reason
        Exit Function
    End If

    Dim xpathStatus
    Dim xpathResult
    If (serviceOnly = true) Then
        xpathStatus = "/s:EnableService_OUTPUT/s:Status"
        xpathResult = "/s:EnableService_OUTPUT/s:Results"
    Else
        xpathStatus = "/s:EnableRemoting_OUTPUT/s:Status"
        xpathResult = "/s:EnableRemoting_OUTPUT/s:Results"
    End If

    Dim status
    Dim resultText
    status     = dapatElementByXpath(updateOutput, xpathStatus)
    resultText = dapatElementByXpath(updateOutput, xpathResult)
    If (status = "succeeded") Then
        If (serviceOnly = true) Then
            stdOut.WriteLine dapatResource("L_atursegeraUpdatedService_Message")
        Else
            stdOut.WriteLine dapatResource("L_atursegeraUpdated_Message")
        End If
    Else
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_atursegeraUpdateFailed_ErrorMessage")
    End If

    If (resultText <> "") Then
        stdOut.WriteLine ""
        stdOut.WriteLine resultText
    End If

End Function

'''''''''''''''''''''    
' Bantuan to run xpath over msxml obj and find single element
Private Function dapatElementByXpath(msxmlObj, xpath)
    dapatElementByXpath = ""

    msxmlObj.setProperty "SelectionLanguage", "XPath" 
    msxmlObj.setproperty "SelectionNamespaces", "xmlns:s=""http://schemas.microsoft.com/wbem/wsman/1/config/service""" 

    Dim elementList
    Dim currentElement

    Set currentElement = msxmlObj.selectSingleNode(xpath)
    If Not currentElement is Nothing Then
        If currentElement.hasChildNodes() Then
            If currentElement.childNodes.length = 1 Then
                dim aNode
                Set aNode = currentElement.childNodes.nextNode()
                If aNode.nodeType = NODE_TEXT Then
                    dapatElementByXpath = aNode.text
                Exit Function
                End If
            End If
        End If
        dapatElementByXpath = currentElement.xml
    End If
    Exit Function

    Set elementList = msxmlObj.selectNodes(xpath)
    If elementList.length = 1 Then
        Set currentElement = elementList.nextNode()
        If currentElement.nodeType = NODE_TEXT Then
            dapatElementByXpath = currentElement.text
        Else
            dapatElementByXpath = currentElement.xml
        End If
    End If
End Function
'''''''''''''''''''''    
'Bantuan to run xpath over msxml obj and find single element
Private Function dapatElementAttributeByXpath(msxmlObj, xpath, attributeName)
    dapatElementAttributeByXpath = ""

    msxmlObj.setProperty "SelectionLanguage", "XPath" 
    msxmlObj.setproperty "SelectionNamespaces", "xmlns:s=""http://schemas.microsoft.com/wbem/wsman/1/config/service""" 

    Dim currentElement

    Set currentElement = msxmlObj.selectSingleNode(xpath)
    dapatElementAttributeByXpath = currentElement.dapatAttribute("Source")
        
End Function

'''''''''''''''''''''    
' Bantuan to run xpath over msxml obj and find single element
Private Function dapatElementXml(msxmlObj, currentElement)
    dapatElementXml = ""

    msxmlObj.setProperty "SelectionLanguage", "XPath" 
    msxmlObj.setproperty "SelectionNamespaces", "xmlns:s=""http://schemas.microsoft.com/wbem/wsman/1/config/service""" 

    Dim elementList
    
    dapatElementByXpath = currentElement.xml
    
End Function

'''''''''''''''''''''    
'Returns XML ns depending on the type of URI

private function dapatXmlNs(resUri)
    dim resUriLCase
    dim s1
    dim s2
    
    ASSERTBOOL Len(resUri) <> 0, dapatResource("L_URIZERO_Message")

    resUriLCase = LCase(resUri)

    if InStr(resUriLCase, URI_IPMI) <> 0 then
        dapatXmlNs = StripParams(resUri)
    elseif InStr(resUriLCase, URI_WMI) <> 0 then
        dapatXmlNs = StripParams(resUri)
    else 
        '//dapatXmlNs = StripParams(resUri) & ".xsd"
        '//This was reported by Intel as an interop issue. So now we are not appending a .xsd in the end.
        dapatXmlNs = StripParams(resUri)
    end if
    
    dapatXmlNs = "xmlns:p=""" & dapatXmlNs & """"
end function

'''''''''''''''''''''    
' Verify if tardapat is in IPv6 format

private function IsIPv6(tardapat)
    dim regexpObj
    Set regexpObj = New RegExp

    regexpObj.Pattern = PTRN_IPV6_S
    regexpObj.IgnoreCase = TRUE
    dim matches
    set matches = regExpObj.Execute(tardapat)
    if matches.Count <> 0 then
        IsIPv6 = true
    else 
        IsIPv6 = false
    end if
end function

'''''''''''''''''''''    
'Extracts XML root node nm. from URI

private function dapatRootNodeName(opr, resUri, actUri)
    dim uriTmp
    dim sfx
    dim s

    dim regexpObj
    Set regexpObj = New RegExp
         
    ASSERTBOOL Len(opr) <> 0, "'opr' parameter is 0 length or null"    
    
    sfx = ""
    select case opr
        case OP_PUT 
            uriTmp = resUri     
        case OP_CRE
            uriTmp = resUri
        case OP_INV
            uriTmp = actUri
            sfx = dapatSuffix(resUri)
        case else 
            dapatRootNodeName = ""
            exit function
    end select
    ASSERTBOOL Len(uriTmp) <> 0, dapatResource("L_URIZERO_Message")

    uriTmp = StripParams(uriTmp)

    regexpObj.Pattern = PTRN_URI_LAST
    regexpObj.IgnoreCase = TRUE
    dim matches
    set matches = regexpObj.Execute(uriTmp)
    ASSERTBOOL matches.Count = 1, dapatResource("L_NOLASTTOK_Message")

    uriTmp = matches(0)
    ASSERTBOOL Len(uriTmp) <> 0, dapatResource("L_URIZEROTOK_Message")
             
    dapatRootNodeName = uriTmp & sfx
end function

private function ProcessParameterHash(hashString)
    on error resume next    
    dim matches
    dim m

    dim regexpObj

    Set regexpObj = New RegExp
    regexpObj.Global = True
    regexpObj.IgnoreCase = True

    dim resultDictionary
    set resultDictionary = CreateObject("Scripting.Dictionary")

    
    If Len(hashString) > 0 then    
        If Len(hashString) > 2 Then
            If Mid(hashString,1,1) <> "{" Or Mid(hashString,Len(hashString),1) <> "}" Then
                stdErr.WriteLine dapatResource("L_HashSyntax_ErrorMessage")
                set ProcessParameterHash = Nothing
                Exit Function
            End If

            regexpObj.Pattern = PTRN_HASH_VALIDATE
            regexpObj.ignoreCase = true
            set matches = regexpObj.Execute(hashString)
            if matches.Count <> 1 then
                stdErr.WriteLine dapatResource("L_HashSyntax_ErrorMessage")
                set ProcessParameterHash = Nothing
                Exit Function
            end if

            'following check ensures that if we have unmatched substrings
            'we report a syntax error. the way we determine is first to 
            'calculate the expected string length by going through all
            'the matches and then comparing with input string length

            dim expectedLength

            regexpObj.Pattern = PTRN_HASH_TOK
            regexpObj.ignoreCase = true
            set matches = regexpObj.Execute(hashString)

            expectedLength = matches.Count-1
            for each m in matches             
                expectedLength = expectedLength + m.Length
            next
            'account for starting and closing {}
            expectedLength = expectedLength + 2
            if (expectedLength <> Len(hashString)) then 
                stdErr.WriteLine dapatResource("L_HashSyntax_ErrorMessage")
                set ProcessParameterHash = Nothing
                Exit Function
            end if
             
            regexpObj.Pattern = PTRN_HASH_TOK
            regexpObj.ignoreCase = true
            set matches = regexpObj.Execute(hashString)
            if matches.Count > 0 then
                for each m in matches
                    if resultDictionary.Exists(m.Submatches(0)) then
                        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_PUT_PARAM_NOARRAY_Message") & m.Submatches(0)
                        set ProcessParameterHash = Nothing
                        Exit Function
                    end if
                    if LCase(m.Submatches(1)) = "$null" then
                        resultDictionary.Add m.Submatches(0),null
                    else
                        resultDictionary.Add m.Submatches(0),m.Submatches(2)
                    end if
                next
            end if
        ElseIf hashString <> "{}" Then
            stdErr.WriteLine dapatResource("L_HashSyntax_ErrorMessage")
            set ProcessParameterHash = Nothing
            Exit Function
        End If
    Else
        stdErr.WriteLine dapatResource("L_HashSyntax_ErrorMessage")
        set ProcessParameterHash = Nothing
        Exit Function
    End If
        
    set ProcessParameterHash = resultDictionary
end function


private function CreateAndInitializeResourceLocator(wsman,resourceUri,cmdlineOptions)
    on error resume next
    
    Dim key
    dim resourceLocator
    dim paramMap
    Dim optionsValue

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' create the resource locator object

    Set resourceLocator = Wsman.CreateResourceLocator(resourceUri)
    if Err.number <> 0 then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_RESOURCELOCATOR_Message")
        set CreateAndInitializeResourceLocator = Nothing
        exit function
    end if

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' set the options on the resource locator
    optionsValue = cmdlineOptions.Argument("options")
    If Len(optionsValue) Then
        set paramMap = ProcessParameterHash(optionsValue)
        if paramMap Is Nothing then
            set CreateAndInitializeResourceLocator = Nothing
            'todo exit function
        end if
        for each key in paramMap
            if IsNull(paramMap(key)) then
                resourceLocator.AddOption key, null
            else
                resourceLocator.AddOption key,paramMap(key)
            end if
        next
    End If

    '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    ' set the fragment path and fragment dialect on the resource locator

    if(cmdlineOptions.ArgumentExists(NPARA_FRAGMENT)) then
        resourceLocator.FragmentPath = cmdlineOptions.Argument(NPARA_FRAGMENT)
    end if
    if(cmdlineOptions.ArgumentExists(NPARA_DIALECT)) then
        resourceLocator.FragmentDialect = cmdlineOptions.Argument(NPARA_DIALECT)
    end if

    set CreateAndInitializeResourceLocator = resourceLocator
end function



'''''''''''''''''''''    
'Reads input XML from the stdin or builds XML from @{...}

private function ProcessInput(wsman, operation, root, cmdlineOptions, resourceLocator,sessionObj,inputStr,formatOption)
    on error resume next
    
    dim parameterDic,key
    
    dim putStr
    dim elementList
    dim currentElement
    dim paramXmlFile
    dim tmpNode
    dim parameterString
    dim parameterCount
    dim xmlns
    
    'make sure it's a relevent operation
    select case operation
        case OP_PUT 
        case OP_CRE
        case OP_INV
        case else 
            inputStr = ""
            ProcessInput = true
            exit function
    end select

    xmlns = dapatXmlNs(resourceLocator.ResourceURI)

    'process the parameters into a Map
    parameterString = cmdlineOptions.Argument(NPARA_PSEUDO_AT)
    parameterCount = 0
    If Len(parameterString) Then
        set parameterDic = ProcessParameterHash(parameterString)
        'if parameter processing failed, exit
        if parameterDic Is Nothing then
            set ProcessInput = false
            exit function
        end if
        parameterCount = parameterDic.Count
    End If
    
    'if there were no parameters, dapat from file
    if parameterCount = 0 then 
        if cmdlineOptions.ArgumentExists(NPARA_FILE) then
            inputStr = ReadFile(cmdlineOptions.Argument(NPARA_FILE))
            ProcessInput = true
            exit function
        end if
    end if

    if operation = OP_CRE Or operation = OP_INV  then
        dim nilns
        nilns = ""
        dim parameters
        parameters = ""                
    if parameterCount > 0 then 
            for each key in parameterDic
                parameters = parameters & "<p:" & key
                if IsNull(parameterDic(key)) then
                    parameters = parameters & " " & ATTR_NIL
                    nilns = " " & NS_XSI
                end if 
                parameters = parameters & ">" & Escape(parameterDic(key)) & _
                    "</p:" & key & ">"                     
            next
        end if

        putStr = "<p:" & root & " " & xmlns & nilns & ">" & _
            parameters & "</p:" & root & ">"

    elseif operation = OP_PUT then

        if parameterCount = 0 then
                stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_PUT_PARAM_NOINPUT_Message")
            inputStr = ""
            ProcessInput = false
            exit function
        end if
        
        'dapat the original resource xml
        on error resume next
        putStr = sessionObj.dapat(resourceLocator)
        if Err.Number <> 0 then
            ASSERTERR sessionObj, formatOption
            inputStr = ""
            ProcessInput = false
            exit function
        end if
        
        'create an MSXML DomDocument object to work with the resource xml
        on error resume next
        Set paramXmlFile = CreateObject("MSXML2.DOMDocument.6.0")
        if Err.number <> 0 then
            stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_MSXML6MISSING_Message")
            inputStr = ""
            ProcessInput = false
            exit function
        end if
        paramXmlFile.async = false
        
        'load the domdocument with the resource xml   
        paramXmlFile.LoadXML(putStr)
        if (paramXmlFile.parseError.errorCode <> 0) then
            stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_XMLERROR_Message") & paramXmlFile.parseError.reason
            inputStr = ""
            ProcessInput = false
            exit function
        end if
        paramXmlFile.setProperty "SelectionLanguage", "XPath" 
        
        'loop through the command-line name/value pairs
        for each key in parameterDic
           'find the elements matching the key
            Dim xpathString
            xpathString = "/*/*[local-name()=""" & key & """]"
            if LCase(key) = "location" then
                'Ignore cim:Location
                xpathString = "/*/*[local-name()=""" & key & """ and namespace-uri() != """ & NS_CIMBASE & """]"
            end if
            Set elementList = paramXmlFile.selectNodes(xpathString)
            
            'make sure there is 1 - error on 0 or > 1
            if elementList.length = 0 then
                stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_PUT_PARAM_NOMATCH_Message") & key
                inputStr = ""
                ProcessInput = false
                Exit Function
            elseif elementList.length > 1 then
                stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_PUT_PARAM_MULTIMATCH_Message") & key
                inputStr = ""
                ProcessInput = false
                Exit Function                  
            else      
                'dapat the node from the list
                Set currentElement = elementList.nextNode()
                'make sure the node does not have anything other than 1 or less text children                    
                if currentElement.hasChildNodes() then
                    if currentElement.childNodes.length > 1 then
                        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_PUT_PARAM_NOTATTR_Message") & key
                        inputStr = ""
                        ProcessInput = false
                        Exit Function
                    else
                        dim aNode
                        Set aNode = currentElement.childNodes.nextNode()
                        if aNode.nodeType <> NODE_TEXT then
                            stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_PUT_PARAM_NOTATTR_Message") & key
                            inputStr = ""
                            ProcessInput = false
                            Exit Function
                        end if
                    end if
                end if
                if IsNull(parameterDic(key)) then
                    Set tmpNode = paramXmlFile.createNode(NODE_ATTRIBUTE,ATTR_NIL_NAME,NS_XSI_URI)
                    tmpNode.text = "true"
                    currentElement.setAttributeNode tmpNode
                    currentElement.text = ""
                else
                    'delete nil attribute if present
                    currentElement.attributes.removeNamedItem(ATTR_NIL_NAME)
                    currentElement.text = parameterDic(key)
                end if
            end If        
        next
        putStr = paramXmlFile.xml
    end if
    inputStr = putStr
    ProcessInput = true
end function

private function ReadStdIn()
    while Not stdIn.AtEndOfStream
        ReadStdIn = ReadStdIn & stdIn.ReadAll
    wend
end function

'''''''''''''''''''''    
' Escapes non XML chars

private function Escape(str)
    dim i 
    for i = 1 to Len(str)
        select case Mid(str, i, 1)
            case "&" 
                Escape = Escape & "&amp;"
            case "<"
                Escape = Escape & "&lt;"
            case ">"
                Escape = Escape & "&gt;"
            case """"
                Escape = Escape & "&quot;"
            case "'"
                Escape = Escape & "&apos;"
            case else 
                Escape = Escape & Mid(str, i, 1)
        end select
    next
end function

'''''''''''''''''''''    
' Checks if this script is running under cscript.exe

private function IsCScriptEnv()
    if InStrRev(LCase(WScript.FullName), "cscript.exe", -1) <> 0 then
        IsCScriptEnv = True
    else 
        IsCScriptEnv = False
    end if
end function

private function CreateSession(wsman, conStr, optDic, formatOption)
    dim sessionFlags
    dim conOpt 
    dim session
    dim authVal
    dim encodingVal
    dim encryptVal
    dim pw
    dim tout
    ' proxy information
    dim proxyAccessType
    dim proxyAccessTypeVal
    dim proxyAuthenticationMechanism
    dim proxyAuthenticationMechanismVal
    dim proxyUsername
    dim proxyPassword
     
    sessionFlags = 0
    proxyAccessType = 0
    proxyAccessTypeVal = 0
    proxyAuthenticationMechanism = 0
    proxyAuthenticationMechanismVal = 0
    proxyUsername = ""
    proxyPassword = ""
    
    set conOpt = Nothing

    if optDic.ArgumentExists(NPARA_ENCODING) then
        ASSERTNAL(NPARA_ENCODING)
        ASSERTBOOL optDic.ArgumentExists(NPARA_REMOTE), "The '-encoding' option is only valid when used with the '-remote' option"
        encodingVal = optDic.Argument(NPARA_ENCODING)
        if LCase(encodingVal) = "utf-16" then
            sessionFlags = sessionFlags OR wsman.SessionFlagUTF16
        elseif LCase(encodingVal) = "utf-8" then
            sessionFlags = sessionFlags OR wsman.SessionFlagUTF8
        else
            ' Invalid!  
            ASSERTBOOL false, "The specified encoding flag is invalid."
        end if
    end if

    if optDic.ArgumentExists(NPARA_UNENCRYPTED) then
        ASSERTBOOL optDic.ArgumentExists(NPARA_REMOTE),     "The '-" & NPARA_UNENCRYPTED & "' option is only valid when used with the '-remote' option"
        'C API will ensure that unencrypted is only used w/ http
        sessionFlags = sessionFlags OR wsman.SessionFlagNoEncryption
    end if

    if optDic.ArgumentExists(NPARA_USESSL) then
        ASSERTBOOL optDic.ArgumentExists(NPARA_REMOTE),     "The '-" & NPARA_USESSL & "' option is only valid when used with the '-remote' option"
        sessionFlags = sessionFlags OR wsman.SessionFlagUseSsl
    end if


    if optDic.ArgumentExists(NPARA_AUTH) then
        ASSERTNAL(NPARA_AUTH)
        authVal = optDic.Argument(NPARA_AUTH)
        select case LCase(authVal)
            case VAL_NO_AUTH
                sessionFlags = sessionFlags OR wsman.SessionFlagUseNoAuthentication
                ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT),     "The '-" & NPARA_CERT & "' option is not valid for '-auth:none'"
                ASSERTBOOL not optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option is not valid for '-auth:none'"
                ASSERTBOOL not optDic.ArgumentExists(NPARA_PASSWORD), "The '-" & NPARA_PASSWORD & "' option is only valid for '-auth:none'"
            case VAL_BASIC
                'Use -username and -password.  
                ASSERTBOOL optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option must be specified for '-auth:basic'"
                ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option is not valid for '-auth:basic'"
                sessionFlags = sessionFlags OR wsman.SessionFlagCredUsernamePassword OR wsman.SessionFlagUseBasic
            case VAL_DIGEST
                'Use -username and -password.  
                ASSERTBOOL optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option must be specified for '-auth:digest'"
                ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option is not valid for '-auth:digest'"
                sessionFlags = sessionFlags OR wsman.SessionFlagCredUsernamePassword OR wsman.SessionFlagUseDigest
            case VAL_KERBEROS
                '-username and -password are optional.  
                ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option is not valid for '-auth:kerberos'"
                sessionFlags = sessionFlags OR wsman.SessionFlagUseKerberos
            case VAL_NEGOTIATE
                '-username and -password are optional.  
                ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option is not valid for '-auth:negotiate'"
                sessionFlags = sessionFlags OR wsman.SessionFlagUseNegotiate
            case VAL_CERT
                '-certificate is mandatory.  
                ASSERTBOOL optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option must be specified for '-auth:certificate'"
                '-username or -password must not be used
                ASSERTBOOL not optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option is not valid for '-auth:certificate'"
                ASSERTBOOL not optDic.ArgumentExists(NPARA_PASSWORD), "The '-" & NPARA_PASSWORD & "' option is not valid for '-auth:certificate'"
                sessionFlags = sessionFlags OR wsman.SessionFlagUseClientCertificate
            case VAL_CREDSSP
                'Use -username and -password.  
                ASSERTBOOL osVersion >= osVista, "The specified '-" & NPARA_AUTH & "' flag '" & authVal & "' has an invalid value."
                ASSERTBOOL optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option must be specified for '-auth:credssp'"
                ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option is not valid for '-auth:credssp'"
                sessionFlags = sessionFlags OR wsman.SessionFlagCredUsernamePassword OR wsman.SessionFlagUseCredSSP
            case else 
                ASSERTBOOL false, "The specified '-" & NPARA_AUTH & "' flag '" & authVal & "' has an invalid value."
        end select
    end if
   
    if optDic.ArgumentExists(NPARA_USERNAME) then
        ASSERTBOOL not optDic.ArgumentExists(NPARA_CERT), "The '-" & NPARA_CERT & "' option cannot be used todapather with '-username'"
        set conOpt = wsman.CreateConnectionOptions
        conOpt.UserName = optDic.Argument(NPARA_USERNAME)
        if optDic.ArgumentExists(NPARA_PASSWORD) then
            conOpt.Password = optDic.Argument(NPARA_PASSWORD)
        end if
        sessionFlags = sessionFlags OR wsman.SessionFlagCredUsernamePassword
    end if
    
    if optDic.ArgumentExists(NPARA_DEFAULTCREDS) then
        ASSERTBOOL not optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option cannot be used todapather with '-defaultCreds'"
        ASSERTBOOL not optDic.ArgumentExists(NPARA_PASSWORD), "The '-" & NPARA_PASSWORD & "' option cannot be used todapather with '-defaultCreds'"
        'this is only valid if -auth:Negotiate is specified 
        ASSERTBOOL (LCase(optDic.Argument(NPARA_AUTH)) = VAL_NEGOTIATE), "The " & NPARA_DEFAULTCREDS & " option is only valid when the authentication mechanism is " & VAL_NEGOTIATE 
        'C API will ensure this is only used w/ https
        sessionFlags = sessionFlags OR wsman.SessionFlagAllowNegotiateImplicitCredentials
    end if
    
    if optDic.ArgumentExists(NPARA_CERT) then
        ASSERTBOOL not optDic.ArgumentExists(NPARA_USERNAME), "The '-" & NPARA_USERNAME & "' option cannot be used todapather with '-certificate'"
        ASSERTBOOL not optDic.ArgumentExists(NPARA_PASSWORD), "The '-" & NPARA_PASSWORD & "' option cannot be used todapather with '-certificate'"
        set conOpt = wsman.CreateConnectionOptions
        conOpt.CertificateThumbprint = optDic.Argument(NPARA_CERT)
        if optDic.ArgumentExists(NPARA_AUTH) then
            ASSERTBOOL (LCase(optDic.Argument(NPARA_AUTH)) = VAL_CERT), "The " & NPARA_CERT & " option is only valid when the authentication mechanism is " & VAL_CERT
        end if
        '-auth might be missing, in which case we assume -a:Certificate
        sessionFlags = sessionFlags OR wsman.SessionFlagUseClientCertificate
    end if
    
    if optDic.ArgumentExists(NPARA_PROXYACCESS) then
        ASSERTNAL(NPARA_PROXYACCESS)
        if conOpt Is Nothing then
            set conOpt = wsman.CreateConnectionOptions
        end if
        proxyAccessTypeVal = optDic.Argument(NPARA_PROXYACCESS)
        select case LCase(proxyAccessTypeVal)
            case VAL_PROXY_IE_CONFIG
                proxyAccessType = conOpt.ProxyIEConfig
            case VAL_PROXY_WINHTTP_CONFIG
                proxyAccessType = conOpt.ProxyWinHttpConfig
            case VAL_PROXY_AUTODETECT
                proxyAccessType = conOpt.ProxyAutoDetect
            case VAL_PROXY_NO_PROXY_SERVER
                proxyAccessType = conOpt.ProxyNoProxyServer
            case else 
                ASSERTBOOL false, "The specified '-" & NPARA_PROXYACCESS & "' field '" & proxyAccessTypeVal & "' has an invalid value."
        end select
    end if    
    if optDic.ArgumentExists(NPARA_PROXYAUTH) then
        ASSERTNAL(NPARA_PROXYAUTH)
        ASSERTBOOL optDic.ArgumentExists(NPARA_PROXYACCESS),     "The '-" & NPARA_PROXYAUTH & "' option is only valid when used with the '-" & NPARA_PROXYACCESS & "' option"
        if conOpt Is Nothing then
            set conOpt = wsman.CreateConnectionOptions
        end if
        proxyAuthenticationMechanismVal = optDic.Argument(NPARA_PROXYAUTH)
        select case LCase(proxyAuthenticationMechanismVal)
            case VAL_BASIC
                proxyAuthenticationMechanism = conOpt.ProxyAuthenticationUseBasic
            case VAL_DIGEST
                proxyAuthenticationMechanism = conOpt.ProxyAuthenticationUseDigest
            case VAL_NEGOTIATE
                proxyAuthenticationMechanism = conOpt.ProxyAuthenticationUseNegotiate
            case else 
                ASSERTBOOL false, "The specified '-" & NPARA_PROXYAUTH & "' flag '" & proxyAuthenticationMechanismVal & "' has an invalid value."
        end select
    end if
    if optDic.ArgumentExists(NPARA_PROXYUSERNAME) then
        ASSERTBOOL optDic.ArgumentExists(NPARA_PROXYAUTH),     "The '-" & NPARA_PROXYUSERNAME & "' option is only valid when used with the '-" & NPARA_PROXYAUTH & "' option"
        proxyUsername = optDic.Argument(NPARA_PROXYUSERNAME)
    end if
    if optDic.ArgumentExists(NPARA_PROXYPASSWORD) then
        ASSERTBOOL optDic.ArgumentExists(NPARA_PROXYUSERNAME),     "The '-" & NPARA_PROXYPASSWORD & "' option is only valid when used with the '-" & NPARA_PROXYUSERNAME & "' option"
        proxyPassword = optDic.Argument(NPARA_PROXYPASSWORD)
    end if

    if optDic.ArgumentExists(NPARA_PROXYACCESS) then
        on error resume next
        responseStr = conOpt.SetProxy(proxyAccessType, proxyAuthenticationMechanism, proxyUsername, proxyPassword)
        ASSERTERR conOpt, formatOption
        on error goto 0
     end if

    if optDic.ArgumentExists(NPARA_NOCACHK) then
        'C API will ensure this is only used w/ https
        sessionFlags = sessionFlags OR wsman.SessionFlagSkipCACheck
    end if

    if optDic.ArgumentExists(NPARA_NOCNCHK) then
        'C API will ensure this is only used w/ https
        sessionFlags = sessionFlags OR wsman.SessionFlagSkipCNCheck
    end if

    if optDic.ArgumentExists(NPARA_NOREVCHK) then
        'C API will ensure this is only used w/ https
        sessionFlags = sessionFlags OR wsman.SessionFlagSkipRevocationCheck
    end if

    if optDic.ArgumentExists(NPARA_SPNPORT) then
        'this is only valid if -auth is not specified or if -auth:Negotiate or -auth:Kerberos is specified 
        if optDic.ArgumentExists(NPARA_AUTH) then
            ASSERTBOOL (LCase(optDic.Argument(NPARA_AUTH)) = VAL_NEGOTIATE OR LCase(optDic.Argument(NPARA_AUTH)) = VAL_KERBEROS), "The " & NPARA_SPNPORT & " option is only valid when the authentication mechanism is " & VAL_NEGOTIATE & " or " & VAL_KERBEROS
        end if
        sessionFlags = sessionFlags OR wsman.SessionFlagEnableSPNServerPort
    end if

    on error resume next
    set session = wsman.CreateSession(conStr, sessionFlags, conOpt)
    ASSERTERR wsman, formatOption
    on error goto 0

    if optDic.ArgumentExists(NPARA_TIMEOUT) then
        ASSERTNAL(NPARA_TIMEOUT)
        tout = optDic.Argument(NPARA_TIMEOUT)
        ASSERTBOOL IsNumeric(tout), "Numeric value for -timeout option is expected"
        session.Timeout = optDic.Argument(NPARA_TIMEOUT)        
    end if
    
    set CreateSession = session
end function

private sub ASSERTERR(obj, formatOption)
    dim errNo
    dim errDesc
    dim responseStr
    dim formattedStr

    if Err.Number <> 0 then
        errNo = Err.Number
        errDesc = Err.Description
        responseStr = obj.Error
        If Reformat(responseStr,formattedStr,formatOption) Then
            stdErr.WriteLine formattedStr
        Else
            stdErr.WriteLine responseStr
        End if
        stdErr.WriteLine dapatResource("L_ERRNO_Message") & " " & errNo & " 0x" & Hex(errNo)
        stdErr.WriteLine errDesc
        WScript.Quit(ERR_GENERAL_FAILURE)
    end if
end sub

'Assert Named Argument Length
private sub ASSERTNAL(namedArg)
    if Len(wsmanCmdLineObj.Argument(namedArg)) = 0 then
        stdErr.WriteLine dapatResource("L_ERR_Message") & dapatResource("L_ARGNOVAL_Message") & namedArg
        WScript.Quit(ERR_GENERAL_FAILURE)
    end if
end sub

private sub ASSERTBOOL(bool, msg)
    if Not bool then
        stdErr.WriteLine dapatResource("L_ERR_Message") & msg
        WScript.Quit(ERR_GENERAL_FAILURE)
    end if
end sub

private function ReFormat(rawStr,formattedStr,formatOption)
    dim xslFile
    dim xmlFile
    dim xmlFileName
    dim xslFileName 
    dim FORMAT_XSL_PATH

    if Len(rawStr) = 0 then
        ReFormat = false
        exit function
    end if
    
    on error resume next
    err.clear
    
    if LCase(formatOption) = VAL_FORMAT_XML then
        formattedStr = rawStr
    else
        set xmlFile = CreateObject("MSXML2.DOMDOCUMENT.6.0")
        if Err.number <> 0 then
            stdErr.WriteLine dapatResource("L_MSXML6MISSING_Message")
            on error goto 0
            ReFormat = false
            exit function
        end if
 
        set xslFile = CreateObject("MSXML2.DOMDOCUMENT.6.0")
        if Err.number <> 0 then
            stdErr.WriteLine dapatResource("L_MSXML6MISSING_Message")
            on error goto 0
            ReFormat = false
            exit function
        end if
        
        xmlFile.async = false
        xslFile.async = false
            
        xmlFile.LoadXML(rawStr)
        if (xmlFile.parseError.errorCode <> 0) then
            stdErr.WriteLine dapatResource("L_XMLERROR_Message") & xmlFile.parseError.reason
            on error goto 0
            ReFormat = false
            exit function
        end If
        
        FORMAT_XSL_PATH = WSHShell.ExpandEnvironmentStrings("%systemroot%\system32\")
        if InStr(LCase(WScript.Path),"\syswow64") > 0 then
            FORMAT_XSL_PATH = WSHShell.ExpandEnvironmentStrings("%systemroot%\syswow64\")
        end if
             
        if LCase(formatOption) = VAL_FORMAT_TEXT then
            FORMAT_XSL_PATH = FORMAT_XSL_PATH & VAL_FORMAT_TEXT_XSLT
        elseif LCase(formatOption) = VAL_FORMAT_PRETTY then
            FORMAT_XSL_PATH = FORMAT_XSL_PATH & VAL_FORMAT_PRETTY_XSLT
        else
            stdErr.WriteLine dapatResource("L_FORMATLERROR_Message") & formatOption
            stdErr.WriteLine 
            on error goto 0
            ReFormat = false
            exit function
        end If

        if Not xslFile.load(FORMAT_XSL_PATH) then
            stdErr.WriteLine dapatResource("L_XSLERROR_Message") & FORMAT_XSL_PATH
            if xslFile.parseError.errorCode < 0 then
                stdErr.WriteLine xslFile.parseError.reason
            end if
            on error goto 0
            ReFormat = false
            exit function
        end if
        
        formattedStr = xmlFile.transformNode (xslFile)
        if Err.number <> 0 then
            stdErr.WriteLine Err.Description
            on error goto 0
            ReFormat = false
            exit function
        end if
    end if
    ReFormat = true
end function


Private Sub BantuMenu(topic, stream)
    Dim BantuMenu
    Set BantuMenu = CreateObject("Scripting.Dictionary")
    BantuMenu.Add OP_Bantu, "BantuBantu"
    BantuMenu.Add OP_dapat,  "Bantudapat"
    BantuMenu.Add OP_PUT,  "BantuSet"
    BantuMenu.Add OP_aturSSDL,  "BantuaturSSDL"
    BantuMenu.Add OP_CRE,  "BantuCreate"
    BantuMenu.Add OP_DEL,  "BantuDelete"
    BantuMenu.Add OP_ENU,  "BantuEnum"
    BantuMenu.Add OP_INV,  "BantuInvoke"
    BantuMenu.Add OP_atursegera,  "Bantuatursegera"
    BantuMenu.Add OP_IDENTIFY,  "BantuIdentify"
    BantuMenu.Add OP_BantuMSG,  "BantuMsg"

    BantuMenu.Add NPARA_USERNAME, "BantuAuth"
    BantuMenu.Add NPARA_PASSWORD, "BantuAuth"
    BantuMenu.Add NPARA_PROXYAUTH,     "BantuProxy"
    BantuMenu.Add NPARA_PROXYACCESS,     "BantuProxy"
    BantuMenu.Add NPARA_PROXYUSERNAME, "BantuProxy"
    BantuMenu.Add NPARA_PROXYPASSWORD, "BantuProxy"
    BantuMenu.Add NPARA_DIALECT,  "BantuSwitches"
    BantuMenu.Add NPARA_FILE,     "BantuInput"
    BantuMenu.Add NPARA_FILTER,   "BantuSwitches"
    BantuMenu.Add NPARA_REMOTE,   "BantuRemote"
    BantuMenu.Add NPARA_NOCACHK,  "BantuSwitches"
    BantuMenu.Add NPARA_NOCNCHK,  "BantuSwitches"
    BantuMenu.Add NPARA_NOREVCHK,  "BantuSwitches"
    BantuMenu.Add NPARA_DEFAULTCREDS,  "BantuSwitches"
    BantuMenu.Add NPARA_SPNPORT,  "BantuSwitches"
    BantuMenu.Add NPARA_TIMEOUT,  "BantuSwitches"
    BantuMenu.Add NPARA_AUTH,     "BantuAuth"
    BantuMenu.Add NPARA_UNENCRYPTED, "BantuRemote"
    BantuMenu.Add NPARA_USESSL,   "BantuRemote"
    BantuMenu.Add NPARA_ENCODING, "BantuSwitches"
    BantuMenu.Add NPARA_FORMAT,   "BantuSwitches"
    BantuMenu.Add NPARA_OPTIONS,  "BantuSwitches"
    BantuMenu.Add NPARA_FRAGMENT, "BantuSwitches"
    BantuMenu.Add "@{}",          "BantuInput"

    BantuMenu.Add Bantu_CONFIG,    "BantuConfig"
    BantuMenu.Add Bantu_CertMapping,    "BantuCertMapping"
    BantuMenu.Add Bantu_URIS,      "BantuUris"
    BantuMenu.Add Bantu_ALIAS,     "BantuAlias"
    BantuMenu.Add Bantu_ALIASES,   "BantuAlias"
    BantuMenu.Add Bantu_FILTERS,   "BantuFilters"
    BantuMenu.Add Bantu_SWITCHES,  "BantuSwitches"
    BantuMenu.Add Bantu_REMOTING,  "BantuRemote"
    BantuMenu.Add Bantu_INPUT,     "BantuInput"
    BantuMenu.Add Bantu_AUTH,      "BantuAuth"
    BantuMenu.Add Bantu_PROXY,     "BantuProxy"

    Dim BantuFctn
    topic = LCase(topic)
    If BantuMenu.Exists(topic) Then
        BantuFctn = BantuMenu(topic)
    Else
        BantuFctn = "BantuBantu"
    End If

    stream.WriteLine dapatResource("L_Bantu_Title_0_Message") & vbNewLine

    If topic <> "all" Then
        Dim cmd
        cmd = "Call " & BantuFctn & "(stream)"
        Execute(cmd)
    Else
        BantuAll(stream)
    End If
End Sub

Private Sub BantuTopic(stream, label)
    dim NL 
    NL = vbNewLine
    Dim seperator
    seperator = vbNewLine & "-------------------------------------------------------------------------------"
    stream.WriteLine seperator & NL & "TOPIC: " & label & NL

End Sub 

Private Sub BantuAll(stream)
    Dim seperator
    seperator = vbNewLine & "-------------------------------------------------------------------------------"
    dim NL 
    NL = vbNewLine

    BantuTopic stream, "myrt -alex"
    BantuBantu stream
    
    BantuTopic stream, "myrt dapat -alex"
    Bantudapat stream

    BantuTopic stream, "myrt set -alex"
    BantuSet stream

    BantuTopic stream, "myrt create -alex"
    BantuCreate stream

    BantuTopic stream, "myrt delete -alex"
    BantuDelete stream

    BantuTopic stream, "myrt enumerate -alex"
    BantuEnum stream

    BantuTopic stream, "myrt invoke -alex"
    BantuInvoke stream

    BantuTopic stream, "myrt identify -alex"
    BantuIdentify stream

    BantuTopic stream, "myrt atursegera -alex"
    Bantuatursegera stream

    BantuTopic stream, "myrt Bantumsg -alex"
    BantuMsg stream
	
    BantuTopic stream, "myrt bantu uris"
    BantuUris stream

    BantuTopic stream, "myrt Bantu alias"
    BantuAlias stream

    BantuTopic stream, "myrt bantu aturan"
    BantuConfig stream

    BantuTopic stream, "myrt Bantu aturSSDL"
    BantuaturSSDL stream

    BantuTopic stream, "myrt bantu siasat"
    BantuCertMapping stream

    BantuTopic stream, "myrt bantu mengawal"
    BantuRemote stream

    BantuTopic stream, "myrt bantu keutamaan"
    BantuAuth stream

    BantuTopic stream, "myrt bantu kompas"
    BantuProxy stream

    BantuTopic stream, "myrt bantu nilai"
    BantuInput stream

    BantuTopic stream, "myrt Bantu filters"
    BantuFilters stream

    BantuTopic stream, "myrt bantu altantuya"
    BantuSwitches stream
End Sub

''''''''''''''''''''''''''''''''''''''''''''
'Bantu - Bantu
Private Sub BantuBantu(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuBantu_000_0_Message") & NL & _
dapatResource("L_BantuBantu_001_0_Message") & NL & _
dapatResource("L_BantuBantu_001_1_Message") & NL & _
dapatResource("L_BantuBantu_002_0_Message") & NL & _
dapatResource("L_BantuBantu_003_0_Message") & NL & _
dapatResource("L_BantuBantu_004_0_Message") & NL & _
dapatResource("L_BantuBantu_005_0_Message") & NL & _
dapatResource("L_BantuBantu_007_0_Message") & NL & _
dapatResource("L_BantuBantu_008_0_Message") & NL & _
dapatResource("L_BantuBantu_009_0_Message") & NL & _
dapatResource("L_BantuBantu_010_0_Message") & NL & _
dapatResource("L_BantuBantu_011_0_Message") & NL & _
dapatResource("L_BantuBantu_012_0_Message") & NL & _
dapatResource("L_BantuBantu_013_0_Message") & NL & _
dapatResource("L_BantuBantu_014_0_Message") & NL & _
dapatResource("L_BantuBantu_015_0_Message") & NL & _
dapatResource("L_BantuBantu_015_1_Message") & NL & _
dapatResource("L_BantuBantu_016_0_Message") & NL & _
dapatResource("L_BantuBantu_016_1_Message") & NL & _
dapatResource("L_BantuBantu_016_3_Message") & NL & _
dapatResource("L_BantuBantu_016_4_Message") & NL & _
dapatResource("L_BantuBantu_017_0_Message") & NL & _
dapatResource("L_BantuBantu_018_0_Message") & NL & _
dapatResource("L_BantuBantu_019_0_Message") & NL & _
dapatResource("L_BantuBantu_020_0_Message") & NL & _
dapatResource("L_BantuBantu_021_0_Message") & NL & _
dapatResource("L_BantuBantu_021_2_Message") & NL & _
dapatResource("L_BantuBantu_022_0_Message") & NL & _
dapatResource("L_BantuBantu_023_0_Message") & NL & _
dapatResource("L_BantuBantu_024_0_Message") & NL & _
dapatResource("L_BantuBantu_025_0_Message") & NL & _
dapatResource("L_BantuBantu_026_0_Message")
End Sub

'''''''''''''''''''''
'Bantu - dapat
Private Sub Bantudapat(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_Bantudapat_000_0_Message") & NL & _
dapatResource("L_Bantudapat_001_0_Message") & NL & _
dapatResource("L_Bantudapat_002_0_Message") & NL & _
dapatResource("L_Bantudapat_003_0_Message") & NL & _
dapatResource("L_Bantudapat_004_0_Message") & NL & _
dapatResource("L_Bantudapat_005_0_Message") & NL & _
dapatResource("X_Bantudapat_006_0_Message") & NL & _
dapatResource("L_Bantudapat_007_0_Message") & NL & _
dapatResource("L_Bantudapat_008_0_Message") & NL & _
dapatResource("X_Bantudapat_009_0_Message") & NL & _
dapatResource("L_Bantudapat_010_0_Message") & NL & _ 
dapatResource("L_Bantudapat_014_0_Message") & NL & _
dapatResource("X_Bantudapat_015_0_Message") & NL & _
dapatResource("L_Bantudapat_016_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - aturSSDL
Private Sub BantuaturSSDL(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuaturSSDL_000_1_Message") & NL & _
dapatResource("L_BantuaturSSDL_001_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_002_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_002_1_Message") & NL & _
dapatResource("L_BantuaturSSDL_003_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_004_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_005_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_005_1_Message") & NL & _
dapatResource("L_BantuaturSSDL_006_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_010_0_Message") & NL & _
dapatResource("L_BantuaturSSDL_011_0_Message") & NL & _
dapatResource("X_BantuaturSSDL_012_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message")  & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - SET
Private Sub BantuSet(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuSet_001_0_Message") & NL & _
dapatResource("L_BantuSet_002_0_Message") & NL & _
dapatResource("L_BantuSet_003_0_Message") & NL & _
dapatResource("L_BantuSet_004_0_Message") & NL & _
dapatResource("L_BantuSet_005_0_Message") & NL & _
dapatResource("L_BantuSet_006_0_Message") & NL & _
dapatResource("L_BantuSet_007_0_Message") & NL & _
dapatResource("L_BantuSet_008_0_Message") & NL & _
dapatResource("L_BantuSet_009_0_Message") & NL & _
dapatResource("X_BantuSet_010_0_Message") & NL & _
dapatResource("L_BantuSet_011_0_Message") & NL & _
dapatResource("L_BantuSet_012_0_Message") & NL & _
dapatResource("X_BantuSet_013_0_Message") & NL & _
dapatResource("L_BantuSet_014_0_Message") & NL & _
dapatResource("L_BantuSet_018_0_Message") & NL & _
dapatResource("X_BantuSet_019_0_Message") & NL & _
dapatResource("L_BantuSet_020_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - CIPTA
Private Sub BantuCreate(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuCreate_001_0_Message") & NL & _
dapatResource("L_BantuCreate_002_0_Message") & NL & _
dapatResource("L_BantuCreate_003_0_Message") & NL & _
dapatResource("L_BantuCreate_004_0_Message") & NL & _
dapatResource("L_BantuCreate_005_0_Message") & NL & _
dapatResource("L_BantuCreate_006_0_Message") & NL & _
dapatResource("L_BantuCreate_007_0_Message") & NL & _
dapatResource("L_BantuCreate_008_0_Message") & NL & _
dapatResource("X_BantuCreate_009_0_Message") & NL & _
dapatResource("L_BantuCreate_010_0_Message") & NL & _
dapatResource("L_BantuCreate_011_0_Message") & NL & _
dapatResource("X_BantuCreate_012_0_Message") & NL & _
dapatResource("L_BantuCreate_013_0_Message") & NL & _
dapatResource("L_BantuCreate_014_0_Message") & NL & _
dapatResource("L_BantuCreate_015_0_Message") & NL & _
dapatResource("X_BantuCreate_016_0_Message") & NL & _
dapatResource("L_BantuCreate_017_0_Message") & NL & _
dapatResource("L_BantuCreate_022_0_Message") & NL & _
dapatResource("X_BantuCreate_023_0_Message") & NL & _
dapatResource("L_BantuCreate_024_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - BUANG
Private Sub BantuDelete(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuDelete_001_0_Message") & NL & _
dapatResource("L_BantuDelete_002_0_Message") & NL & _
dapatResource("L_BantuDelete_003_0_Message") & NL & _
dapatResource("L_BantuDelete_004_0_Message") & NL & _
dapatResource("L_BantuDelete_005_0_Message") & NL & _
dapatResource("X_BantuDelete_006_0_Message") & NL & _
dapatResource("L_BantuDelete_007_0_Message") & NL & _
dapatResource("L_BantuDelete_008_0_Message") & NL & _
dapatResource("X_BantuDelete_009_0_Message") & NL & _
dapatResource("L_BantuDelete_010_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - LAKSANA
Private Sub BantuEnum(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuEnum_001_0_Message") & NL & _
dapatResource("L_BantuEnum_001_1_Message") & NL & _
dapatResource("L_BantuEnum_002_0_Message") & NL & _
dapatResource("L_BantuEnum_003_0_Message") & NL & _
dapatResource("L_BantuEnum_004_0_Message") & NL & _
dapatResource("L_BantuEnum_005_0_Message") & NL & _
dapatResource("L_BantuEnum_006_0_Message") & NL & _
dapatResource("L_BantuEnum_006_1_Message") & NL & _
dapatResource("L_BantuEnum_006_2_Message") & NL & _
dapatResource("L_BantuEnum_006_3_Message") & NL & _
dapatResource("L_BantuEnum_006_4_Message") & NL & _
dapatResource("L_BantuEnum_006_5_Message") & NL & _
dapatResource("L_BantuEnum_006_6_Message") & NL & _
dapatResource("L_BantuEnum_006_7_Message") & NL & _
dapatResource("L_BantuEnum_006_8_Message") & NL & _
dapatResource("L_BantuEnum_006_9_Message") & NL & _
dapatResource("L_BantuEnum_006_10_Message") & NL & _
dapatResource("L_BantuEnum_006_11_Message") & NL & _
dapatResource("L_BantuEnum_006_12_Message") & NL & _
dapatResource("L_BantuEnum_006_13_Message") & NL & _
dapatResource("L_BantuEnum_006_14_Message") & NL & _
dapatResource("L_BantuEnum_006_15_Message") & NL & _
dapatResource("L_BantuEnum_006_16_Message") & NL & _
dapatResource("L_BantuEnum_006_17_Message") & NL & _
dapatResource("L_BantuEnum_006_18_Message") & NL & _
dapatResource("L_BantuEnum_006_19_Message") & NL & _
dapatResource("L_BantuEnum_006_20_Message") & NL & _
dapatResource("L_BantuEnum_006_21_Message") & NL & _
dapatResource("L_BantuEnum_006_22_Message") & NL & _
dapatResource("L_BantuEnum_006_23_Message") & NL & _
dapatResource("L_BantuEnum_007_0_Message") & NL & _
dapatResource("X_BantuEnum_008_0_Message") & NL & _
dapatResource("L_BantuEnum_009_0_Message") & NL & _
dapatResource("L_BantuEnum_010_0_Message") & NL & _
dapatResource("X_BantuEnum_011_0_Message") & NL & _
dapatResource("L_BantuEnum_012_0_Message") & NL & _
dapatResource("L_BantuEnum_016_0_Message") & NL & _
dapatResource("X_BantuEnum_017_0_Message") & NL & _
dapatResource("L_BantuEnum_018_0_Message") & NL & _
dapatResource("L_BantuEnum_019_0_Message") & NL & _
dapatResource("X_BantuEnum_020_0_Message") & NL & _
dapatResource("L_BantuEnum_021_0_Message") & NL & _
dapatResource("L_BantuEnum_022_0_Message") & NL & _
dapatResource("X_BantuEnum_023_0_Message") & NL & _
dapatResource("L_BantuEnum_024_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Filters_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - LAKSANA
Private Sub BantuInvoke(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuInvoke_001_0_Message") & NL & _
dapatResource("L_BantuInvoke_002_0_Message") & NL & _
dapatResource("L_BantuInvoke_003_0_Message") & NL & _
dapatResource("L_BantuInvoke_004_0_Message") & NL & _
dapatResource("L_BantuInvoke_005_0_Message") & NL & _
dapatResource("L_BantuInvoke_006_0_Message") & NL & _
dapatResource("L_BantuInvoke_007_0_Message") & NL & _
dapatResource("L_BantuInvoke_008_0_Message") & NL & _
dapatResource("X_BantuInvoke_009_0_Message") & NL & _
dapatResource("L_BantuInvoke_010_0_Message") & NL & _
dapatResource("L_BantuInvoke_011_0_Message") & NL & _
dapatResource("X_BantuInvoke_012_0_Message") & NL & _
dapatResource("L_BantuInvoke_013_0_Message") & NL & _
dapatResource("X_BantuInvoke_014_0_Message") & NL & _
dapatResource("L_BantuInvoke_015_0_Message") & NL & _
dapatResource("L_BantuInvoke_016_0_Message") & NL & _
dapatResource("X_BantuInvoke_017_0_Message") & NL & _
dapatResource("L_BantuInvoke_018_0_Message") & NL & _
dapatResource("L_BantuInvoke_019_0_Message") & NL & _
dapatResource("L_BantuInvoke_019_1_Message") & NL & _
dapatResource("X_BantuInvoke_020_0_Message") & NL & _
dapatResource("L_BantuInvoke_021_0_Message") & NL & _
dapatResource("L_BantuInvoke_022_0_Message") & NL & _
dapatResource("L_BantuInvoke_022_1_Message") & NL & _
dapatResource("X_BantuInvoke_023_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - IDENTIFY
Private Sub BantuIdentify(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("X_BantuIdentify_001_0_Message") & NL & _
dapatResource("L_BantuIdentify_003_0_Message") & NL & _
dapatResource("L_BantuIdentify_004_0_Message") & NL & _
dapatResource("L_BantuIdentify_005_0_Message") & NL & _
dapatResource("L_BantuIdentify_006_0_Message") & NL & _
dapatResource("L_BantuIdentify_007_0_Message") & NL & _
dapatResource("L_BantuIdentify_008_0_Message") & NL & _
dapatResource("L_BantuIdentify_009_0_Message") & NL & _
dapatResource("X_BantuIdentify_010_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Remoting_Message")
End Sub

'''''''''''''''''''''
'Bantu - BantuMSG
Private Sub BantuMsg(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("X_BantuBantuMessaage_001_0_Message") & NL & _
dapatResource("X_BantuBantuMessaage_002_0_Message") & NL & _
dapatResource("X_BantuBantuMessaage_003_0_Message") & NL & _
dapatResource("X_BantuBantuMessaage_004_0_Message") & NL & _
dapatResource("X_BantuBantuMessaage_006_0_Message")
End Sub


'''''''''''''''''''''
'Bantu - KEUTAMAAN
Private Sub BantuAuth(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuAuth_001_0_Message") & NL & _
dapatResource("L_BantuAuth_002_0_Message") & NL & _
dapatResource("L_BantuAuth_003_0_Message") & NL & _
dapatResource("L_BantuAuth_004_0_Message") & NL & _
dapatResource("L_BantuAuth_004_1_Message") & NL & _
dapatResource("L_BantuAuth_005_0_Message") & NL & _
dapatResource("L_BantuAuth_006_0_Message") & NL & _
dapatResource("L_BantuAuth_007_0_Message") & NL & _
dapatResource("L_BantuAuth_008_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_001_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_002_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_003_0_Message")
If osVersion >= osVista Then
    stream.WriteLine dapatResource("L_BantuAuthAuth_004_0_Message")
Else
    stream.WriteLine dapatResource("L_BantuAuthAuth_004_1_Message")
End If
stream.WriteLine _
dapatResource("L_BantuAuthAuth_005_0_Message") & NL & _
dapatResource("X_BantuAuthAuth_006_0_Message") & NL & _
dapatResource("X_BantuAuthAuth_007_0_Message") & NL & _
dapatResource("X_BantuAuthAuth_008_0_Message") & NL & _
dapatResource("X_BantuAuthAuth_009_0_Message") & NL & _
dapatResource("X_BantuAuthAuth_010_0_Message") & NL & _
dapatResource("X_BantuAuthAuth_010_1_Message")
If osVersion >= osVista Then
    stream.WriteLine dapatResource("X_BantuAuthAuth_010_2_Message")
End If
stream.WriteLine _
dapatResource("L_BantuAuthAuth_011_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_012_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_013_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_013_1_Message") & NL & _
dapatResource("L_BantuAuthAuth_013_2_Message") & NL & _
dapatResource("L_BantuAuthAuth_014_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_015_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_016_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_017_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_018_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_019_0_Message") & NL & _
dapatResource("L_BantuAuthAuth_020_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_001_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_002_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_003_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_004_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_005_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_006_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_007_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_008_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_009_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_010_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_011_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_011_1_Message") & NL & _
dapatResource("L_BantuAuthUsername_012_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_013_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_014_0_Message") & NL & _
dapatResource("L_BantuAuthUsername_015_0_Message")
If osVersion >= osVista Then
    stream.WriteLine dapatResource("L_BantuAuthUsername_016_0_Message")
End If
stream.WriteLine _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuAuthPassword_001_0_Message") & NL & _
dapatResource("L_BantuAuthPassword_002_0_Message") & NL & _
dapatResource("L_BantuAuthPassword_003_0_Message") & NL & _
dapatResource("L_BantuAuthPassword_004_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_001_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_002_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_003_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_004_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_005_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_006_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_007_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_008_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_009_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_010_0_Message") & NL & _
dapatResource("L_BantuAuthCertificate_011_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - PROXY
Private Sub BantuProxy(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("X_BantuProxy_001_0_Message") & NL & _
dapatResource("X_BantuProxy_002_0_Message") & NL & _
dapatResource("X_BantuProxy_002_1_Message") & NL & _
dapatResource("X_BantuProxy_003_0_Message") & NL & _
dapatResource("X_BantuProxy_004_0_Message") & NL & _
dapatResource("L_BantuProxy_005_0_Message") & NL & _
dapatResource("L_BantuProxy_006_0_Message") & NL & _
dapatResource("L_BantuProxy_007_0_Message") & NL & _
dapatResource("X_BantuProxyAccess_001_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_002_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_003_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_004_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_005_0_Message") & NL & _
dapatResource("X_BantuProxyAccess_006_0_Message") & NL & _
dapatResource("X_BantuProxyAccess_007_0_Message") & NL & _
dapatResource("X_BantuProxyAccess_008_0_Message") & NL & _
dapatResource("X_BantuProxyAccess_009_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_010_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_011_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_012_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_013_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_014_0_Message") & NL & _
dapatResource("L_BantuProxyAccess_015_0_Message") & NL & _
dapatResource("L_BantuProxyAuth_001_0_Message") & NL & _
dapatResource("L_BantuProxyAuth_002_0_Message") & NL & _
dapatResource("L_BantuProxyAuth_003_0_Message") & NL & _
dapatResource("L_BantuProxyAuth_004_0_Message") & NL & _
dapatResource("L_BantuProxyAuth_005_0_Message") & NL & _
dapatResource("X_BantuProxyAuth_007_0_Message") & NL & _
dapatResource("X_BantuProxyAuth_008_0_Message") & NL & _
dapatResource("X_BantuProxyAuth_009_0_Message") & NL & _
dapatResource("L_BantuProxyAuth_010_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_001_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_002_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_003_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_005_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_006_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_007_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_008_0_Message") & NL & _
dapatResource("L_BantuProxyUsername_009_0_Message") & NL & _
dapatResource("L_BantuProxyPassword_001_0_Message") & NL & _
dapatResource("L_BantuProxyPassword_002_0_Message") & NL & _
dapatResource("L_BantuProxyPassword_003_0_Message") & NL & _
dapatResource("L_BantuProxyPassword_004_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Auth_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - TAPISS
Private Sub BantuFilters(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuFilter_001_0_Message") & NL & _
dapatResource("X_BantuFilter_002_0_Message") & NL & _
dapatResource("X_BantuFilter_003_0_Message") & NL & _
dapatResource("X_BantuFilter_004_0_Message") & NL & _
dapatResource("L_BantuFilter_005_0_Message") & NL & _
dapatResource("X_BantuFilter_006_0_Message") & NL & _
dapatResource("L_BantuFilter_007_0_Message") & NL & _
dapatResource("X_BantuFilter_008_0_Message") & NL & _
dapatResource("L_BantuFilter_009_0_Message") & NL & _
dapatResource("X_BantuFilter_010_0_Message") & NL & _
dapatResource("L_BantuFilter_011_0_Message") & NL & _
dapatResource("L_BantuFilter_012_0_Message") & NL & _
dapatResource("X_BantuFilter_013_0_Message") & NL & _
dapatResource("L_BantuFilter_014_0_Message") & NL & _
dapatResource("X_BantuFilter_015_0_Message") & NL & _
dapatResource("X_BantuFilter_016_0_Message") & NL & _
dapatResource("X_BantuFilter_016_1_Message") & NL & _
dapatResource("X_BantuFilter_017_0_Message") & NL & _
dapatResource("L_BantuFilter_018_0_Message") & NL & _
dapatResource("X_BantuFilter_019_0_Message") & NL & _
dapatResource("L_BantuFilter_019_1_Message") & NL & _
dapatResource("L_BantuFilter_019_2_Message") & NL & _
dapatResource("X_BantuFilter_019_3_Message") & NL & _
dapatResource("X_BantuFilter_019_4_Message") & NL & _
dapatResource("X_BantuFilter_019_5_Message") & NL & _
dapatResource("L_BantuFilter_020_0_Message") & NL & _
dapatResource("X_BantuFilter_021_0_Message") & NL & _
dapatResource("X_BantuFilter_022_0_Message") & NL & _
dapatResource("L_BantuFilter_023_0_Message") & NL & _
dapatResource("X_BantuFilter_024_0_Message") & NL & _
dapatResource("L_BantuFilter_025_0_Message") & NL & _
dapatResource("L_BantuFilter_026_0_Message") & NL & _
dapatResource("X_BantuFilter_027_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Enumerate_Message")
End Sub


'''''''''''''''''''''
'Bantu - ALTANTUYA
Private Sub BantuSwitches(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuSwitchTimeout_001_0_Message") & NL & _
dapatResource("L_BantuSwitchTimeout_002_0_Message") & NL & _
dapatResource("L_BantuSwitchTimeout_003_0_Message") & NL & _
dapatResource("L_BantuSwitchTimeout_004_0_Message") & NL & _
dapatResource("X_BantuSwitchTimeout_005_0_Message") & NL & _
dapatResource("L_BantuSwitchTimeout_006_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_BantuSwitchSkipCACheck_001_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCACheck_002_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCACheck_003_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCACheck_004_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCACheck_005_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_BantuSwitchSkipCNCheck_001_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCNCheck_002_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCNCheck_003_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCNCheck_004_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCNCheck_005_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipCNCheck_006_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_BantuSwitchSkipRevCheck_001_0_Message") & NL & _
dapatResource("X_BantuSwitchSkipRevCheck_002_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipRevCheck_003_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipRevCheck_004_0_Message") & NL & _
dapatResource("L_BantuSwitchSkipRevCheck_005_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_BantuSwitchDefaultCreds_001_0_Message") & NL & _
dapatResource("X_BantuSwitchDefaultCreds_002_0_Message") & NL & _
dapatResource("L_BantuSwitchDefaultCreds_003_0_Message") & NL & _
dapatResource("L_BantuSwitchDefaultCreds_004_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuSwitchDialect_001_0_Message") & NL & _
dapatResource("L_BantuSwitchDialect_002_0_Message") & NL & _
dapatResource("L_BantuSwitchDialect_003_0_Message") & NL & _
dapatResource("L_BantuSwitchDialect_004_0_Message") & NL & _
dapatResource("X_BantuSwitchDialect_005_0_Message") & NL & _
dapatResource("L_BantuSwitchDialect_006_0_Message") & NL & _
dapatResource("X_BantuSwitchDialect_007_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuSwitchFragment_001_0_Message") & NL & _
dapatResource("L_BantuSwitchFragment_002_0_Message") & NL & _
dapatResource("L_BantuSwitchFragment_003_0_Message") & NL & _
dapatResource("L_BantuSwitchFragment_004_0_Message") & NL & _
dapatResource("L_BantuSwitchFragment_005_0_Message") & NL & _
dapatResource("X_BantuSwitchFragment_006_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuSwitchOption_001_0_Message") & NL & _
dapatResource("L_BantuSwitchOption_002_0_Message") & NL & _
dapatResource("L_BantuSwitchOption_003_0_Message") & NL & _
dapatResource("L_BantuSwitchOption_004_0_Message") & NL & _
dapatResource("L_BantuSwitchOption_005_0_Message") & NL & _
dapatResource("L_BantuSwitchOption_006_0_Message") & NL & _
dapatResource("X_BantuSwitchOption_007_0_Message") & NL & _
dapatResource("X_BantuSwitchOption_008_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_BantuSwitchSPNPort_001_0_Message") & NL & _
dapatResource("L_BantuSwitchSPNPort_002_0_Message") & NL & _
dapatResource("L_BantuSwitchSPNPort_003_0_Message") & NL & _
dapatResource("L_BantuSwitchSPNPort_004_0_Message") & NL & _
dapatResource("L_BantuSwitchSPNPort_005_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuSwitchEncoding_001_0_Message") & NL & _
dapatResource("L_BantuSwitchEncoding_002_0_Message") & NL & _
dapatResource("L_BantuSwitchEncoding_003_0_Message") & NL & _
dapatResource("L_BantuSwitchEncoding_004_0_Message") & NL & _
dapatResource("L_BantuSwitchEncoding_005_0_Message") & NL & _
dapatResource("L_BantuSwitchEncoding_006_0_Message") & NL & _
dapatResource("X_BantuSwitchEncoding_007_0_Message") & NL & _
dapatResource("X_BantuSwitchEncoding_008_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuSwitchFormat_001_0_Message") & NL & _
dapatResource("L_BantuSwitchFormat_002_0_Message") & NL & _
dapatResource("L_BantuSwitchFormat_003_0_Message") & NL & _
dapatResource("L_BantuSwitchFormat_004_0_Message") & NL & _
dapatResource("L_BantuSwitchFormat_005_0_Message") & NL & _
dapatResource("X_BantuSwitchFormat_006_0_Message") & NL & _
dapatResource("X_BantuSwitchFormat_007_0_Message") & NL & _
dapatResource("X_BantuSwitchFormat_008_0_Message")
End Sub

'''''''''''''''''''''
'Bantu - NILAI
Private Sub BantuInput(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuInput_001_0_Message") & NL & _
dapatResource("L_BantuInput_002_0_Message") & NL & _
dapatResource("L_BantuInput_003_0_Message") & NL & _
dapatResource("L_BantuInput_004_0_Message") & NL & _
dapatResource("L_BantuInput_005_0_Message") & NL & _
dapatResource("L_BantuInput_006_0_Message") & NL & _
dapatResource("L_BantuInput_007_0_Message") & NL & _
dapatResource("L_BantuInput_008_0_Message") & NL & _
dapatResource("L_BantuInput_009_0_Message") & NL & _
dapatResource("L_BantuInput_010_0_Message") & NL & _
dapatResource("L_BantuInput_011_0_Message") & NL & _
dapatResource("L_BantuInput_012_0_Message") & NL & _
dapatResource("L_BantuInput_013_0_Message") & NL & _
dapatResource("L_BantuInput_014_0_Message") & NL & _
dapatResource("L_BantuInput_015_0_Message") & NL & _
dapatResource("L_BantuInput_016_0_Message") & NL & _
dapatResource("L_BantuInput_017_0_Message") & NL & _
dapatResource("L_BantuInput_018_0_Message") & NL & _
dapatResource("L_BantuInput_019_0_Message") & NL & _
dapatResource("L_BantuInput_020_0_Message") & NL & _
dapatResource("L_BantuInput_021_0_Message") & NL & _
dapatResource("L_BantuInput_022_0_Message") & NL & _
dapatResource("X_BantuInput_023_0_Message") & NL & _
dapatResource("X_BantuInput_024_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Set_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Create_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Invoke_Message")
End Sub

'''''''''''''''''''''
'Bantu - MENGAWAL
Private Sub BantuRemote(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuRemote_001_0_Message") & NL & _
dapatResource("L_BantuRemote_002_0_Message") & NL & _
dapatResource("L_BantuRemote_003_0_Message") & NL & _
dapatResource("L_BantuRemote_004_0_Message") & NL & _
dapatResource("L_BantuRemote_005_0_Message") & NL & _
dapatResource("L_BantuRemote_006_0_Message") & NL & _
dapatResource("L_BantuRemote_007_0_Message") & NL & _
dapatResource("L_BantuRemote_008_0_Message") & NL & _
dapatResource("L_BantuRemote_009_0_Message") & NL & _
dapatResource("L_BantuRemote_010_0_Message") & NL & _
dapatResource("L_BantuRemote_011_0_Message") & NL & _
dapatResource("L_BantuRemote_012_0_Message") & NL & _
dapatResource("L_BantuRemote_012_1_Message") & NL & _
dapatResource("L_BantuRemote_012_2_Message") & NL & _
dapatResource("L_BantuRemote_012_3_Message") & NL & _
dapatResource("L_BantuRemote_012_4_Message") & NL & _
dapatResource("L_BantuRemote_012_5_Message") & NL & _
dapatResource("L_BantuRemote_012_6_Message") & NL & _
dapatResource("L_BantuRemote_013_0_Message") & NL & _
dapatResource("L_BantuRemote_014_0_Message") & NL & _
dapatResource("L_BantuRemote_015_0_Message") & NL & _
dapatResource("L_BantuRemote_016_0_Message") & NL & _
dapatResource("L_BantuRemote_017_0_Message") & NL & _
dapatResource("L_BantuRemote_018_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_001_0_Message") & NL & _
dapatResource("X_BantuRemoteExample_002_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_003_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_004_0_Message") & NL & _
dapatResource("X_BantuRemoteExample_005_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_006_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_007_0_Message") & NL & _
dapatResource("X_BantuRemoteExample_008_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_009_0_Message") & NL & _
dapatResource("L_BantuRemoteExample_010_0_Message") & NL & _
dapatResource("X_BantuRemoteExample_011_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuRemoteUnencrypted_001_0_Message") & NL & _
dapatResource("L_BantuRemoteUnencrypted_002_0_Message") & NL & _
dapatResource("L_BantuRemoteUnencrypted_003_0_Message") & NL & _
dapatResource("L_BantuRemoteUnencrypted_004_0_Message") & NL & _
dapatResource("L_BantuRemoteUnencrypted_005_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuRemoteUseSsl_001_0_Message") & NL & _
dapatResource("L_BantuRemoteUseSsl_002_0_Message") & NL & _
dapatResource("L_BantuRemoteUseSsl_003_0_Message") & NL & _
dapatResource("L_BantuRemoteUseSsl_004_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuRemoteConfig_001_0_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Config_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - ATURAN
Private Sub BantuConfig(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuConfig_001_0_Message") & NL & _
dapatResource("L_BantuConfig_002_0_Message") & NL & _
dapatResource("L_BantuConfig_003_0_Message") & NL & _
dapatResource("L_BantuConfig_004_0_Message") & NL & _
dapatResource("L_BantuConfig_005_0_Message") & NL & _
dapatResource("L_BantuConfig_006_0_Message") & NL & _
dapatResource("L_BantuConfig_007_0_Message") & NL & _
dapatResource("L_BantuConfig_008_0_Message") & NL & _
dapatResource("L_BantuConfig_009_0_Message") & NL & _
dapatResource("X_BantuConfig_010_0_Message") & NL & _
dapatResource("X_BantuConfig_011_0_Message") & NL & _
dapatResource("X_BantuConfig_012_0_Message") & NL & _
dapatResource("X_BantuConfig_012_1_Message") & NL & _
dapatResource("X_BantuConfig_012_2_Message") & NL & _
dapatResource("X_BantuConfig_012_3_Message") & NL & _
dapatResource("X_BantuConfig_012_4_Message") & NL & _
dapatResource("L_BantuConfig_013_0_Message") & NL & _
dapatResource("L_BantuConfig_014_0_Message") & NL & _
dapatResource("L_BantuConfig_015_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_001_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_002_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_003_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_004_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_005_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_006_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_007_0_Message") & NL & _
dapatResource("L_BantuConfigAddress_008_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_001_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_002_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_003_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_004_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_005_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_006_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_007_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_008_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_009_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_010_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_011_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_012_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_013_0_Message") & NL & _
dapatResource("L_BantuConfigTransport_014_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_001_0_Message") & NL & _
dapatResource("X_BantuConfigExamples_002_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_003_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_004_0_Message") & NL & _
dapatResource("X_BantuConfigExamples_005_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_006_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_007_0_Message") & NL & _
dapatResource("X_BantuConfigExamples_008_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_009_0_Message") & NL & _
dapatResource("L_BantuConfigExamples_010_0_Message") & NL & _
dapatResource("X_BantuConfigExamples_011_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_CertMapping_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - SIASAT
Private Sub BantuCertMapping(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuCertMapping_001_0_Message") & NL & _
dapatResource("L_BantuCertMapping_002_0_Message") & NL & _
dapatResource("L_BantuCertMapping_003_0_Message") & NL & _
dapatResource("L_BantuCertMapping_003_1_Message") & NL & _
dapatResource("L_BantuCertMapping_004_0_Message") & NL & _
dapatResource("L_BantuCertMapping_005_0_Message") & NL & _
dapatResource("L_BantuCertMapping_006_0_Message") & NL & _
dapatResource("L_BantuCertMapping_007_0_Message") & NL & _
dapatResource("L_BantuCertMapping_008_0_Message") & NL & _
dapatResource("L_BantuCertMapping_009_0_Message") & NL & _
dapatResource("L_BantuCertMapping_009_1_Message") & NL & _
dapatResource("L_BantuCertMapping_009_2_Message") & NL & _
dapatResource("L_BantuCertMapping_009_3_Message") & NL & _
dapatResource("L_BantuCertMapping_010_0_Message") & NL & _
dapatResource("L_BantuCertMapping_011_0_Message") & NL & _
dapatResource("L_BantuCertMapping_012_0_Message") & NL & _
dapatResource("L_BantuCertMapping_012_1_Message") & NL & _
dapatResource("L_BantuCertMapping_012_2_Message") & NL & _
dapatResource("L_BantuCertMapping_013_0_Message") & NL & _
dapatResource("L_BantuCertMapping_014_0_Message") & NL & _
dapatResource("L_BantuCertMapping_014_1_Message") & NL & _
dapatResource("L_BantuCertMapping_014_2_Message") & NL & _
dapatResource("L_BantuCertMapping_014_3_Message") & NL & _
dapatResource("L_BantuCertMapping_014_4_Message") & NL & _
dapatResource("L_BantuCertMapping_015_0_Message") & NL & _
dapatResource("L_BantuCertMapping_016_0_Message") & NL & _
dapatResource("L_BantuCertMapping_017_0_Message") & NL & _
dapatResource("L_BantuCertMapping_018_0_Message") & NL & _
dapatResource("L_BantuCertMapping_019_0_Message") & NL & _
dapatResource("L_BantuCertMapping_020_0_Message") & NL & _
dapatResource("L_BantuCertMapping_021_0_Message") & NL & _
dapatResource("L_BantuCertMapping_022_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuCertMappingExamples_001_0_Message") & NL & _
dapatResource("X_BantuCertMappingExamples_002_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuCertMappingExamples_003_0_Message") & NL & _
dapatResource("X_BantuCertMappingExamples_004_0_Message") & NL & _
dapatResource("L_BantuCertMappingExamples_005_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_aturSSDL_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - CUSTOMREMOTESHELL
Private Sub BantuCustomRemoteShell(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuCustomRemoteShell_001_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_001_1_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_002_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_003_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_004_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_005_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_006_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_007_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_008_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_009_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_010_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_011_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_011_1_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_012_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_012_1_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_012_2_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_013_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_013_1_Message") & NL & _
dapatResource("L_BantuCustomRemoteShell_014_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShellExamples_001_0_Message") & NL & _
dapatResource("X_BantuCustomRemoteShellExamples_002_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShellExamples_003_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShellExamples_004_0_Message") & NL & _
dapatResource("X_BantuCustomRemoteShellExamples_005_0_Message") & NL & _
dapatResource("L_BantuCustomRemoteShellExamples_006_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message")
End Sub

'''''''''''''''''''''
'Bantu - atursegera
Private Sub Bantuatursegera(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("X_Bantuatursegera_001_0_Message") & NL & _
dapatResource("X_Bantuatursegera_002_0_Message") & NL & _
dapatResource("L_Bantuatursegera_003_0_Message") & NL & _
dapatResource("L_Bantuatursegera_004_0_Message") & NL & _
dapatResource("L_Bantuatursegera_005_0_Message") & NL & _
dapatResource("L_Bantuatursegera_006_0_Message") & NL & _
dapatResource("L_Bantuatursegera_007_0_Message") & NL & _
dapatResource("L_Bantuatursegera_008_0_Message") & NL & _
dapatResource("X_Bantuatursegera_009_0_Message") & NL & _
dapatResource("X_Bantuatursegera_010_0_Message") & NL & _
dapatResource("X_Bantuatursegera_010_1_Message") & NL & _
dapatResource("L_Bantuatursegera_011_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_Bantuatursegera_012_0_Message") & NL & _
dapatResource("X_Bantuatursegera_013_0_Message") & NL & _
dapatResource("L_Bantuatursegera_014_0_Message") & NL & _
dapatResource("L_Bantuatursegera_015_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("X_Bantuatursegera_016_0_Message") & NL & _
dapatResource("X_Bantuatursegera_017_0_Message") & NL & _
dapatResource("L_Bantuatursegera_018_0_Message") & NL & _
dapatResource("L_Bantuatursegera_019_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Config_Message")
End Sub

'''''''''''''''''''''
'Bantu - URIS
Private Sub BantuUris(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuUris_001_0_Message") & NL & _
dapatResource("L_BantuUris_002_0_Message") & NL & _
dapatResource("L_BantuUris_003_0_Message") & NL & _
dapatResource("L_BantuUris_004_0_Message") & NL & _
dapatResource("X_BantuUris_005_0_Message") & NL & _
dapatResource("L_BantuUris_006_0_Message") & NL & _
dapatResource("L_BantuUris_007_0_Message") & NL & _
dapatResource("X_BantuUris_008_0_Message") & NL & _
dapatResource("X_BantuUris_009_0_Message") & NL & _
dapatResource("X_BantuUris_010_0_Message") & NL & _
dapatResource("L_BantuUris_011_0_Message") & NL & _
dapatResource("L_BantuUris_012_0_Message") & NL & _
dapatResource("X_BantuUris_013_0_Message") & NL & _
dapatResource("X_BantuUris_013_1_Message") & NL & _
dapatResource("X_BantuUris_014_0_Message") & NL & _
dapatResource("L_BantuUris_015_0_Message") & NL & _
dapatResource("L_BantuUris_015_1_Message") & NL & _
dapatResource("L_BantuUris_015_2_Message") & NL & _
dapatResource("L_BantuUris_015_3_Message") & NL & _
dapatResource("X_BantuUris_015_4_Message") & NL & _
dapatResource("L_BantuUris_015_5_Message") & NL & _
dapatResource("L_BantuUris_015_6_Message") & NL & _
dapatResource("L_BantuUris_015_7_Message") & NL & _
dapatResource("X_BantuUris_015_8_Message") & NL & _
dapatResource("L_BantuUris_015_9_Message") & NL & _
dapatResource("L_BantuUris_016_0_Message") & NL & _
dapatResource("L_BantuUris_017_0_Message") & NL & _
dapatResource("L_BantuUris_018_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Uris_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Input_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Switches_Message")
End Sub

'''''''''''''''''''''
'Bantu - GELAR
Private Sub BantuAlias(stream)
dim NL 
NL = vbNewLine
stream.WriteLine _
dapatResource("L_BantuAlias_001_0_Message") & NL & _
dapatResource("L_BantuAlias_002_0_Message") & NL & _
dapatResource("L_BantuAlias_003_0_Message") & NL & _
dapatResource("X_BantuAlias_004_0_Message") & NL & _
dapatResource("X_BantuAlias_005_0_Message") & NL & _
dapatResource("X_BantuAlias_006_0_Message") & NL & _
dapatResource("X_BantuAlias_007_0_Message") & NL & _
dapatResource("X_BantuAlias_008_0_Message") & NL & _
dapatResource("X_BantuAlias_009_0_Message") & NL & _
dapatResource("L_BantuAlias_010_0_Message") & NL & _
dapatResource("L_BantuAlias_011_0_Message") & NL & _
dapatResource("x_BantuAlias_012_0_Message") & NL & _
dapatResource("L_BantuAlias_013_0_Message") & NL & _
dapatResource("L_BantuAlias_014_0_Message") & NL & _
dapatResource("X_BantuAlias_015_0_Message") & NL & _
dapatResource("L_Bantu_Blank_0_Message") & NL & _
dapatResource("L_Bantu_SeeAlso_Title_Message") & NL & _
dapatResource("X_Bantu_SeeAlso_Aliases_Message")
End Sub
