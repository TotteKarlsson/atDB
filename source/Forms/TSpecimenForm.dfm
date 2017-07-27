object SpecimenForm: TSpecimenForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Specimen Form'
  ClientHeight = 399
  ClientWidth = 339
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 339
    Height = 348
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 384
    ExplicitHeight = 268
    object Label2: TLabel
      Left = 24
      Top = 24
      Width = 44
      Height = 13
      Caption = 'animal_id'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 24
      Top = 64
      Width = 57
      Height = 13
      Caption = 'intake_date'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 24
      Top = 184
      Width = 30
      Height = 13
      Caption = 'specie'
    end
    object Label1: TLabel
      Left = 24
      Top = 245
      Width = 53
      Height = 13
      Caption = 'Entered by'
    end
    object Label5: TLabel
      Left = 24
      Top = 104
      Width = 43
      Height = 13
      Caption = 'summary'
      FocusControl = DBMemo1
    end
    object DBEdit2: TDBEdit
      Left = 24
      Top = 40
      Width = 250
      Height = 21
      DataField = 'animal_id'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 24
      Top = 80
      Width = 250
      Height = 21
      DataField = 'intake_date'
      DataSource = DataSource1
      TabOrder = 1
    end
    object UserCB: TDBLookupComboBox
      Left = 24
      Top = 264
      Width = 250
      Height = 21
      DataField = 'LUser'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 24
      Top = 203
      Width = 250
      Height = 21
      DataField = 'LSpecie'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBMemo1: TDBMemo
      Left = 24
      Top = 120
      Width = 250
      Height = 58
      DataField = 'summary'
      DataSource = DataSource1
      TabOrder = 4
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 339
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 268
    ExplicitWidth = 384
    DesignSize = (
      339
      51)
    object Button1: TButton
      Left = 259
      Top = 16
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Post'
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 304
    end
    object CancelBtn: TButton
      Left = 178
      Top = 16
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 223
    end
  end
  object DataSource1: TDataSource
    DataSet = atdbDM.specimenCDS
    Left = 312
    Top = 80
  end
end
