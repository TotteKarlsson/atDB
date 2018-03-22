; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "ATDB-PG"
#define MyAppVersion "0.6.8b"
#define MyAppPublisher "Smith Lab"
#define MyAppURL "http://www.example.com/"
#define MyAppExeName "atdb.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId                   = {{760E1227-9791-4704-A5AD-CA105046AE48}}
AppName                 = {#MyAppName}
AppVersion              = {#MyAppVersion}
AppVerName              = {#MyAppName}_{#MyAppVersion}
AppPublisher            = {#MyAppPublisher}
AppPublisherURL         = {#MyAppURL}
AppSupportURL           = {#MyAppURL}
AppUpdatesURL           = {#MyAppURL}
DefaultDirName          = {pf}\{#MyAppName}
DisableProgramGroupPage = yes
OutputBaseFilename      = {#MyAppName}-{#MyAppVersion}
OutputDir               = x:\atSoftwareReleases
Compression             = lzma
SolidCompression        = yes

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
Source: "P:\AppReleases\atdb\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{commonprograms}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

