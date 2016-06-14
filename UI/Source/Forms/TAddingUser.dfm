object AddUserForm: TAddUserForm
  Left = 0
  Top = 0
  Caption = 'AddUserForm'
  ClientHeight = 179
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBEdit1: TDBEdit
    Left = 48
    Top = 64
    Width = 121
    Height = 21
    DataField = 'user_name'
    DataSource = DataModule1.usersDataSource
    TabOrder = 0
  end
end
