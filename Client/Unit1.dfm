object Form1: TForm1
  Left = 133
  Top = 103
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'SuperSmash Online Keylogger'
  ClientHeight = 306
  ClientWidth = 497
  Color = clScrollBar
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Lucida Sans Unicode'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 15
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 305
    Height = 273
    TabOrder = 0
    object RichLogger: TMemo
      Left = 8
      Top = 16
      Width = 289
      Height = 249
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 320
    Top = 8
    Width = 169
    Height = 113
    Caption = 'Connectie:'
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 13
      Height = 15
      Caption = 'Ip:'
    end
    object Edit1: TEdit
      Left = 32
      Top = 24
      Width = 121
      Height = 23
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = '127.0.0.1'
    end
    object Panel1: TPanel
      Left = 8
      Top = 56
      Width = 153
      Height = 25
      BorderStyle = bsSingle
      Caption = 'Verbinden'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Panel1Click
    end
    object Panel2: TPanel
      Left = 8
      Top = 80
      Width = 153
      Height = 25
      BorderStyle = bsSingle
      Caption = 'Verbreken'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Panel2Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 320
    Top = 128
    Width = 169
    Height = 153
    Caption = 'Options'
    TabOrder = 2
    object Panel3: TPanel
      Left = 8
      Top = 24
      Width = 153
      Height = 25
      BorderStyle = bsSingle
      Caption = 'Starten'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Panel3Click
    end
    object Panel4: TPanel
      Left = 8
      Top = 56
      Width = 153
      Height = 25
      BorderStyle = bsSingle
      Caption = 'Stoppen'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Panel4Click
    end
    object Panel5: TPanel
      Left = 8
      Top = 88
      Width = 153
      Height = 25
      BorderStyle = bsSingle
      Caption = 'Logging opslaan'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Panel5Click
    end
    object Panel6: TPanel
      Left = 8
      Top = 120
      Width = 153
      Height = 25
      BorderStyle = bsSingle
      Caption = 'Logging legen'
      Color = clBackground
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -11
      Font.Name = 'Lucida Sans Unicode'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnClick = Panel6Click
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 287
    Width = 497
    Height = 19
    Panels = <>
  end
  object ChkAuto: TCheckBox
    Left = 520
    Top = 24
    Width = 97
    Height = 17
    Caption = 'ChkAuto'
    TabOrder = 4
  end
  object ClientLogger: TClientSocket
    Active = True
    ClientType = ctNonBlocking
    Port = 6213
    OnConnect = ClientLoggerConnect
    OnRead = ClientLoggerRead
    OnError = ClientLoggerError
    Left = 304
    Top = 88
  end
  object ClientSocket1: TClientSocket
    Active = True
    ClientType = ctNonBlocking
    Port = 143
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    OnError = ClientSocket1Error
    Left = 304
    Top = 56
  end
  object SaveDialog1: TSaveDialog
    Left = 304
    Top = 120
  end
end
