object frmEmployees: TfrmEmployees
  Left = 0
  Top = 0
  Caption = 'frmEmployees'
  ClientHeight = 322
  ClientWidth = 762
  Color = 14673642
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgEmployees: TDBGrid
    Left = 8
    Top = 8
    Width = 746
    Height = 161
    DataSource = dmEmployees.dscEmployees
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 24
    Top = 181
    Width = 161
    Height = 33
    Caption = 'Display Total Reservations'
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 220
    Width = 161
    Height = 33
    Caption = 'Edit Password'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 24
    Top = 259
    Width = 161
    Height = 33
    Caption = 'Edit Name'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 208
    Top = 181
    Width = 161
    Height = 33
    Caption = 'View Reservation Details'
    TabOrder = 4
  end
  object ListBox1: TListBox
    Left = 400
    Top = 175
    Width = 354
    Height = 139
    ItemHeight = 13
    TabOrder = 5
  end
end
