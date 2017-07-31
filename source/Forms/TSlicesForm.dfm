object SlicesForm: TSlicesForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Slices Form'
  ClientHeight = 691
  ClientWidth = 535
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
    Width = 535
    Height = 640
    Align = alClient
    TabOrder = 0
    ExplicitTop = -6
    ExplicitWidth = 499
    object Label1: TLabel
      Left = 322
      Top = 16
      Width = 11
      Height = 13
      Caption = 'ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 56
      Top = 80
      Width = 59
      Height = 13
      Caption = 'Specimen ID'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 56
      Top = 120
      Width = 23
      Height = 13
      Caption = 'Virus'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 56
      Top = 160
      Width = 61
      Height = 13
      Caption = 'Virus Dilution'
      FocusControl = DBEdit4
    end
    object Label5: TLabel
      Left = 56
      Top = 215
      Width = 60
      Height = 13
      Caption = 'Brain Region'
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 56
      Top = 266
      Width = 60
      Height = 13
      Caption = 'Culture Time'
      FocusControl = DBLookupComboBox1
    end
    object Label7: TLabel
      Left = 56
      Top = 526
      Width = 53
      Height = 13
      Caption = 'Entered By'
      FocusControl = DBLookupComboBox2
    end
    object Label8: TLabel
      Left = 56
      Top = 319
      Width = 106
      Height = 13
      Caption = 'Preprocess Treatment'
      FocusControl = DBLookupComboBox3
    end
    object Label9: TLabel
      Left = 56
      Top = 368
      Width = 80
      Height = 13
      Caption = 'Fixative Protocol'
      FocusControl = DBLookupComboBox4
    end
    object Label10: TLabel
      Left = 56
      Top = 418
      Width = 80
      Height = 13
      Caption = 'Fixation Protocol'
      FocusControl = DBLookupComboBox5
    end
    object Label11: TLabel
      Left = 56
      Top = 466
      Width = 75
      Height = 13
      Caption = 'Postfix Protocol'
      FocusControl = DBLookupComboBox6
    end
    object DBEdit1: TDBEdit
      Left = 322
      Top = 35
      Width = 134
      Height = 21
      DataField = 'id'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 56
      Top = 96
      Width = 134
      Height = 21
      DataField = 'specimen_id'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 56
      Top = 136
      Width = 400
      Height = 21
      DataField = 'virus'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 56
      Top = 176
      Width = 400
      Height = 21
      DataField = 'virus_dilution'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 56
      Top = 231
      Width = 400
      Height = 21
      DataField = 'brain_region_dissection'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 56
      Top = 282
      Width = 400
      Height = 21
      DataField = 'culture_timeL'
      DataSource = DataSource1
      DropDownRows = 15
      TabOrder = 5
      OnDropDown = DBLookupComboBoxDropDown
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 56
      Top = 542
      Width = 400
      Height = 21
      DataField = 'entered_byL'
      DataSource = DataSource1
      DropDownRows = 15
      TabOrder = 10
      OnDropDown = DBLookupComboBoxDropDown
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 56
      Top = 335
      Width = 400
      Height = 21
      DataField = 'preprocess_treatment_protocolL'
      DataSource = DataSource1
      DropDownRows = 15
      TabOrder = 6
      OnDropDown = DBLookupComboBoxDropDown
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 56
      Top = 384
      Width = 400
      Height = 21
      DataField = 'fixative_protocolL'
      DataSource = DataSource1
      DropDownRows = 15
      TabOrder = 7
      OnDropDown = DBLookupComboBoxDropDown
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 56
      Top = 434
      Width = 400
      Height = 21
      DataField = 'fixation_protocolL'
      DataSource = DataSource1
      DropDownRows = 15
      TabOrder = 8
      OnDropDown = DBLookupComboBoxDropDown
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 56
      Top = 482
      Width = 400
      Height = 21
      DataField = 'postfix_protocolL'
      DataSource = DataSource1
      DropDownRows = 15
      TabOrder = 9
      OnDropDown = DBLookupComboBoxDropDown
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 640
    Width = 535
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitWidth = 499
    DesignSize = (
      535
      51)
    object Button1: TButton
      Left = 455
      Top = 16
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Post'
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 419
    end
    object CancelBtn: TButton
      Left = 374
      Top = 16
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 338
    end
  end
  object DataSource1: TDataSource
    DataSet = atdbDM.slicesCDS
    Left = 240
    Top = 64
  end
end
