object RegisterFreshCSBatchForm: TRegisterFreshCSBatchForm
  Left = 0
  Top = 0
  Caption = 'Register Fresh Coverslip Batch'
  ClientHeight = 137
  ClientWidth = 484
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 168
    Top = 24
    Width = 24
    Height = 13
    Caption = 'Type'
  end
  object Label2: TLabel
    Left = 346
    Top = 24
    Width = 23
    Height = 13
    Caption = 'Date'
  end
  object mDT: TDateTimePicker
    Left = 344
    Top = 40
    Width = 121
    Height = 21
    Date = 0.587392870373150800
    Time = 0.587392870373150800
    Enabled = False
    TabOrder = 0
  end
  object mCSCount: TIntegerLabeledEdit
    Left = 16
    Top = 40
    Width = 121
    Height = 21
    EditLabel.Width = 102
    EditLabel.Height = 13
    EditLabel.Caption = 'Number of Coverslips'
    TabOrder = 1
    Text = '100'
    Value = 100
  end
  object mCSTypeLookup: TDBLookupComboBox
    Left = 168
    Top = 40
    Width = 145
    Height = 21
    KeyField = 'id'
    ListField = 'type'
    ListSource = csDM.csTypeDSource
    TabOrder = 2
  end
  object mRegisterBtn: TButton
    Left = 176
    Top = 80
    Width = 105
    Height = 41
    Caption = 'Register'
    TabOrder = 3
    OnClick = mRegisterBtnClick
  end
end