object Form1: TForm1
  Left = 192
  Top = 107
  Anchors = []
  BorderIcons = []
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 51
  ClientWidth = 128
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object ServerLogger: TServerSocket
    Active = True
    Port = 6213
    ServerType = stNonBlocking
    OnAccept = ServerLoggerAccept
    OnClientDisconnect = ServerLoggerClientDisconnect
    OnClientError = ServerLoggerClientError
    Left = 8
    Top = 8
  end
  object TmrLogger: TTimer
    Enabled = False
    Interval = 1
    OnTimer = TmrLoggerTimer
    Left = 48
    Top = 8
  end
  object ServerSocket1: TServerSocket
    Active = True
    Port = 143
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientRead = ServerSocket1ClientRead
    Left = 88
    Top = 8
  end
end
