object Form1: TForm1
  Left = 192
  Top = 125
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 256
    Top = 40
    Width = 17
    Height = 13
    Caption = 'NIK'
  end
  object lbl2: TLabel
    Left = 256
    Top = 64
    Width = 29
    Height = 13
    Caption = 'NAMA'
  end
  object lbl3: TLabel
    Left = 256
    Top = 88
    Width = 23
    Height = 13
    Caption = 'TELP'
  end
  object lbl4: TLabel
    Left = 256
    Top = 112
    Width = 30
    Height = 13
    Caption = 'EMAIL'
  end
  object lbl5: TLabel
    Left = 256
    Top = 136
    Width = 40
    Height = 13
    Caption = 'ALAMAT'
  end
  object lbl6: TLabel
    Left = 256
    Top = 160
    Width = 41
    Height = 13
    Caption = 'MEMBER'
  end
  object lbl7: TLabel
    Left = 408
    Top = 168
    Width = 60
    Height = 13
    Caption = ' DISKON     :'
  end
  object lbl8: TLabel
    Left = 480
    Top = 168
    Width = 71
    Height = 13
    Caption = 'Terisi Otomatis'
  end
  object lbl9: TLabel
    Left = 208
    Top = 384
    Width = 77
    Height = 13
    Caption = 'Masukkan Nama'
  end
  object edt1: TEdit
    Left = 312
    Top = 40
    Width = 161
    Height = 21
    TabOrder = 0
  end
  object edt2: TEdit
    Left = 312
    Top = 64
    Width = 161
    Height = 21
    TabOrder = 1
  end
  object edt3: TEdit
    Left = 312
    Top = 88
    Width = 161
    Height = 21
    TabOrder = 2
  end
  object edt4: TEdit
    Left = 312
    Top = 112
    Width = 161
    Height = 21
    TabOrder = 3
  end
  object edt5: TEdit
    Left = 312
    Top = 136
    Width = 161
    Height = 21
    TabOrder = 4
  end
  object cbb1: TComboBox
    Left = 312
    Top = 160
    Width = 89
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    OnChange = cbb1Change
    Items.Strings = (
      'YES'
      'NO')
  end
  object btn1: TButton
    Left = 168
    Top = 200
    Width = 81
    Height = 33
    Caption = 'BARU'
    TabOrder = 6
    OnClick = btn1Click
  end
  object btn2: TButton
    Left = 264
    Top = 200
    Width = 81
    Height = 33
    Caption = 'SIMPAN'
    TabOrder = 7
    OnClick = btn2Click
  end
  object btn3: TButton
    Left = 360
    Top = 200
    Width = 81
    Height = 33
    Caption = 'EDIT'
    TabOrder = 8
    OnClick = btn3Click
  end
  object btn4: TButton
    Left = 456
    Top = 200
    Width = 81
    Height = 33
    Caption = 'HAPUS'
    TabOrder = 9
    OnClick = btn4Click
  end
  object btn5: TButton
    Left = 552
    Top = 200
    Width = 81
    Height = 33
    Caption = 'BATAL'
    TabOrder = 10
    OnClick = btn5Click
  end
  object dbgrd1: TDBGrid
    Left = 232
    Top = 256
    Width = 393
    Height = 113
    DataSource = ds1
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = dbgrd1CellClick
  end
  object edt6: TEdit
    Left = 296
    Top = 376
    Width = 161
    Height = 21
    TabOrder = 12
    Text = 'edt1'
  end
  object con1: TZConnection
    ControlsCodePage = cGET_ACP
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    Connected = True
    DisableSavepoints = False
    HostName = 'localhost'
    Port = 3306
    Database = 'penjualan_uasvisual2'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'E:\Semester 4\Visual 2\fiture_member\fiture_member\libmysql.dll'
    Left = 16
    Top = 8
  end
  object zqry1: TZQuery
    Connection = con1
    Active = True
    SQL.Strings = (
      'select * from kustomer')
    Params = <>
    Left = 72
    Top = 8
  end
  object ds1: TDataSource
    DataSet = zqry1
    Left = 128
    Top = 16
  end
end
