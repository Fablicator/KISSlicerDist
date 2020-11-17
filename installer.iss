[Setup]
AppName = KISSlicer
AppVersion = 1.6.3
ChangesAssociations = yes
CloseApplications = yes
DefaultDirName = {sd}\Fablicator\KISSlicer
DefaultGroupName = KISSlicer
OutputBaseFilename = kisslicer-setup-win10
OutputDir = release
UninstallDisplayName = KISSlicer
UninstallDisplayIcon = {app}\KISSlicer64.exe,0

[Types]
Name: "main"; Description: "Select printer type"; Flags: iscustom

[Components]
Name: "required"; Description: "Required files"; Types: main; Flags: fixed
Name: "cfg"; Description: "Configuration"; Types: main
Name: "cfg/mx"; Description: "MX"; Types: main; Flags: exclusive
Name: "cfg/sx"; Description: "SX"; Types: main; Flags: exclusive
Name: "cfg/fm1"; Description: "FM1"; Types: main; Flags: exclusive

[Tasks]
Name: desktopicon; Description: "Create a &desktop shortcut"; GroupDescription: "Additional icons:"
Name: defaultsicon; Description: "Create a &desktop shortcut to reset defaults"; GroupDescription: "Additional icons:"
Name: associate; Description: "&Associate .stl files"; GroupDescription: "Other tasks:"

[Files]
Source: "KISSlicer64.exe"; DestDir: "{app}"; Components: required
Source: "reset-defaults.bat"; DestDir: "{app}"; Components: required
Source: "profiles\mx\*"; DestDir: "{app}"; Components: cfg\mx; Flags: recursesubdirs
Source: "profiles\mx\*"; DestDir: "{app}\defaults"; Components: cfg\mx; Flags: recursesubdirs
Source: "profiles\sx\*"; DestDir: "{app}"; Components: cfg\sx; Flags: recursesubdirs
Source: "profiles\sx\*"; DestDir: "{app}\defaults"; Components: cfg\sx; Flags: recursesubdirs
Source: "profiles\fm1\*"; DestDir: "{app}"; Components: cfg\fm1; Flags: recursesubdirs
Source: "profiles\fm1\*"; DestDir: "{app}\defaults"; Components: cfg\fm1; Flags: recursesubdirs

[Registry]
Root: HKA; Subkey: "Software\Classes\.stl"; ValueType: string; ValueName: ""; ValueData: "STLFile.stl"; Flags: uninsdeletevalue; Tasks: associate
Root: HKA; Subkey: "Software\Classes\.stl\OpenWithProgids"; ValueType: string; ValueName: "STLFile.stl"; ValueData: ""; Flags: uninsdeletevalue; Tasks: associate
Root: HKA; Subkey: "Software\Classes\STLFile.stl"; ValueType: string; ValueName: ""; ValueData: "STL File"; Flags: uninsdeletekey; Tasks: associate
Root: HKA; Subkey: "Software\Classes\STLFile.stl\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\KISSlicer64.exe,0"; Tasks: associate
Root: HKA; Subkey: "Software\Classes\STLFile.stl\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\KISSlicer64.exe"" ""%1"""; Tasks: associate
Root: HKA; Subkey: "Software\Classes\Applications\KISSlicer64.exe\SupportedTypes"; ValueType: string; ValueName: ".stl"; ValueData: ""; Tasks: associate

[Icons]
Name: "{group}\KISSlicer"; Filename: "{app}\KISSlicer64.exe"; WorkingDir: "{app}"
Name: "{group}\Reset KISSlicer defaults"; Filename: "{app}\reset-defaults.bat"; WorkingDir: "{app}"
Name: "{group}\Uninstall KISSlicer"; Filename: "{uninstallexe}"
Name: "{userdesktop}\KISSlicer"; Filename: "{app}\KISSlicer64.exe"; WorkingDir: "{app}"; Tasks: desktopicon
Name: "{userdesktop}\Reset KISSlicer defaults"; Filename: "{app}\reset-defaults.bat"; WorkingDir: "{app}"; Tasks: defaultsicon

[UninstallDelete]
Type: files; Name: "{app}\_KS_backup_profiles.ini" 