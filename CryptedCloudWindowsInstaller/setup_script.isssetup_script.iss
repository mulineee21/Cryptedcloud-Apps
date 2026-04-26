[Setup]
AppId={{8A2C3E5D-4F1A-4B6B-B6B1-D4E5F6G7H8I9}
AppName=CryptedCloud
AppVersion=1.2
AppPublisher=CryptedCloud
DefaultDirName={autopf}\CryptedCloud
DefaultGroupName=CryptedCloud
UninstallDisplayIcon={app}\Browser\firefox.exe
Compression=lzma
SolidCompression=yes
OutputDir=userdocs:Inno Setup Outputs
OutputBaseFilename=CryptedCloud_Setup
PrivilegesRequired=lowest

[Languages]
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"

[Files]
; Copiamos todo el contenido de la carpeta Tor Browser a la carpeta de la app
Source: "C:\InstaladorCrypted\Tor Browser\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs

[Icons]
; --- USAMOS EL ICONO PARA EL ACCESO DIRECTO DEL ESCRITORIO ---
Name: "{autodesktop}\CryptedCloud"; Filename: "{app}\Browser\firefox.exe"; \
    Parameters: "-no-remote -new-window http://sf7fefc34xkrqtsptpr52jt5avqkotwnvvhs5nahpx3mewqyteyvbnqd.onion/login"; \
    WorkingDir: "{app}\Browser"; \
    IconFilename: "{app}\logo.ico"

; --- USAMOS EL ICONO PARA EL ACCESO DIRECTO DEL MENÚ INICIO ---
Name: "{group}\CryptedCloud"; Filename: "{app}\Browser\firefox.exe"; \
    Parameters: "-no-remote -new-window http://sf7fefc34xkrqtsptpr52jt5avqkotwnvvhs5nahpx3mewqyteyvbnqd.onion/login"; \
    WorkingDir: "{app}\Browser"; \
    IconFilename: "{app}\logo.ico"
    
    
[Run]
; En [Run] no se usa WorkingDir, el instalador lo gestiona con la ruta del Filename
Filename: "{app}\Browser\firefox.exe"; \
    Parameters: "-no-remote -new-window http://sf7fefc34xkrqtsptpr52jt5avqkotwnvvhs5nahpx3mewqyteyvbnqd.onion/login"; \
    Description: "{cm:LaunchProgram,CryptedCloud}"; Flags: postinstall nowait skipifsilent

[Code]
function InitializeSetup(): Boolean;
var
  ResultCode: Integer;
begin
  Result := True;
  // Cerramos cualquier proceso previo para evitar errores de escritura
  Exec('taskkill.exe', '/f /im firefox.exe', '', SW_HIDE, ewWaitUntilTerminated, ResultCode);
end;