object RegisterFreshCSBatchForm: TRegisterFreshCSBatchForm
  Left = 0
  Top = 0
  Caption = 'Register Fresh Coverslip Batch'
  ClientHeight = 269
  ClientWidth = 598
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
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
  object Image1: TImage
    Left = 464
    Top = 96
    Width = 105
    Height = 105
    Proportional = True
    Stretch = True
  end
  object Label3: TLabel
    Left = 16
    Top = 160
    Width = 76
    Height = 13
    Caption = 'Todays batches'
  end
  object DateTimePicker1: TDateTimePicker
    Left = 344
    Top = 40
    Width = 186
    Height = 21
    Date = 42697.587392870370000000
    Time = 42697.587392870370000000
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
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 168
    Top = 40
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 16
    Top = 96
    Width = 105
    Height = 41
    Caption = 'Register'
    TabOrder = 3
    OnClick = Button1Click
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 176
    Width = 137
    Height = 85
    DataSource = csDM.csFreshBatchesDSource
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'batchcode'
        Width = 61
        Visible = True
      end>
  end
  object Barcode2D_DataMatrixEcc2001: TBarcode2D_DataMatrixEcc200
    Image = Image1
    Stretch = True
    Left = 360
    Top = 168
  end
  object DBBarcode2D1: TDBBarcode2D
    DataField = 'Test'
    Barcode2D = Barcode2D_DataMatrixEcc2001
    Left = 368
    Top = 104
  end
  object DataSource1: TDataSource
    Left = 216
    Top = 112
  end
end
