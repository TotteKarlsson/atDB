object NewSpecimenForm: TNewSpecimenForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'NewSpecimenForm'
  ClientHeight = 894
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label10: TLabel
    Left = 18
    Top = 453
    Width = 36
    Height = 13
    Caption = 'Species'
  end
  object ScrollBox1: TScrollBox
    Left = 0
    Top = 0
    Width = 750
    Height = 843
    Align = alClient
    TabOrder = 0
    ExplicitTop = -1
    ExplicitHeight = 689
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 59
      Height = 13
      Caption = 'Specimen ID'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 16
      Top = 69
      Width = 36
      Height = 13
      Caption = 'Species'
    end
    object Label3: TLabel
      Left = 16
      Top = 125
      Width = 59
      Height = 13
      Caption = 'lims_number'
      FocusControl = DBEdit2
    end
    object Label4: TLabel
      Left = 16
      Top = 176
      Width = 18
      Height = 13
      Caption = 'age'
      FocusControl = DBEdit3
    end
    object Label5: TLabel
      Left = 16
      Top = 224
      Width = 94
      Height = 13
      Caption = 'additional_identifier'
      FocusControl = DBEdit4
    end
    object Label6: TLabel
      Left = 16
      Top = 271
      Width = 56
      Height = 13
      Caption = 'death_date'
      FocusControl = DBEdit5
    end
    object Label7: TLabel
      Left = 16
      Top = 317
      Width = 69
      Height = 13
      Caption = 'date_received'
      FocusControl = DBEdit6
    end
    object Label8: TLabel
      Left = 16
      Top = 360
      Width = 78
      Height = 13
      Caption = 'date_embedded'
      FocusControl = DBEdit7
    end
    object Label9: TLabel
      Left = 16
      Top = 408
      Width = 113
      Height = 13
      Caption = 'brain_region_dissection'
      FocusControl = DBEdit8
    end
    object Label11: TLabel
      Left = 16
      Top = 453
      Width = 106
      Height = 13
      Caption = 'Preprocess Treatment'
    end
    object Label12: TLabel
      Left = 16
      Top = 506
      Width = 80
      Height = 13
      Caption = 'Fixative Protocol'
    end
    object Label13: TLabel
      Left = 16
      Top = 556
      Width = 75
      Height = 13
      Caption = 'Postfix Protocol'
    end
    object Label14: TLabel
      Left = 16
      Top = 605
      Width = 75
      Height = 13
      Caption = 'Cryo Protection'
    end
    object Label15: TLabel
      Left = 16
      Top = 650
      Width = 75
      Height = 13
      Caption = 'Freeze Protocol'
    end
    object Label16: TLabel
      Left = 16
      Top = 708
      Width = 99
      Height = 13
      Caption = 'Substitution Protocol'
    end
    object Label17: TLabel
      Left = 16
      Top = 757
      Width = 94
      Height = 13
      Caption = 'Embedding Protocol'
    end
    object DBEdit1: TDBEdit
      Left = 16
      Top = 32
      Width = 512
      Height = 21
      DataField = 'specimen_id'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 16
      Top = 88
      Width = 512
      Height = 21
      DataField = 'Lspecie'
      DataSource = DataSource1
      KeyField = 'id'
      ListField = 'name'
      ListSource = DataSource2
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 16
      Top = 144
      Width = 134
      Height = 21
      DataField = 'lims_number'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit3: TDBEdit
      Left = 16
      Top = 192
      Width = 512
      Height = 21
      DataField = 'age'
      DataSource = DataSource1
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 16
      Top = 240
      Width = 512
      Height = 21
      DataField = 'additional_identifier'
      DataSource = DataSource1
      TabOrder = 4
    end
    object DBEdit5: TDBEdit
      Left = 16
      Top = 287
      Width = 134
      Height = 21
      DataField = 'death_date'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 16
      Top = 333
      Width = 134
      Height = 21
      DataField = 'date_received'
      DataSource = DataSource1
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 16
      Top = 376
      Width = 134
      Height = 21
      DataField = 'date_embedded'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit8: TDBEdit
      Left = 16
      Top = 424
      Width = 512
      Height = 21
      DataField = 'brain_region_dissection'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 18
      Top = 472
      Width = 512
      Height = 21
      DataField = 'Lpreproctreat'
      DataSource = DataSource1
      KeyField = 'id'
      ListField = 'protocol'
      ListSource = DataSource3
      TabOrder = 9
    end
    object DBLookupComboBox3: TDBLookupComboBox
      Left = 18
      Top = 527
      Width = 512
      Height = 21
      DataField = 'LfixationMethod'
      DataSource = DataSource1
      KeyField = 'id'
      ListField = 'protocol'
      ListSource = DataSource4
      TabOrder = 10
    end
    object DBLookupComboBox4: TDBLookupComboBox
      Left = 18
      Top = 575
      Width = 512
      Height = 21
      DataField = 'Lpostfix'
      DataSource = DataSource1
      ListSource = DataSource5
      TabOrder = 11
    end
    object DBLookupComboBox5: TDBLookupComboBox
      Left = 18
      Top = 623
      Width = 512
      Height = 21
      DataField = 'Lcryoprotection'
      DataSource = DataSource1
      ListSource = DataSource6
      TabOrder = 12
    end
    object DBLookupComboBox6: TDBLookupComboBox
      Left = 18
      Top = 670
      Width = 512
      Height = 21
      DataField = 'LfreezeProtocol'
      DataSource = DataSource1
      ListSource = DataSource7
      TabOrder = 13
    end
    object DBLookupComboBox7: TDBLookupComboBox
      Left = 18
      Top = 726
      Width = 512
      Height = 21
      DataField = 'LsubstitutionProtocol'
      DataSource = DataSource1
      ListSource = DataSource8
      TabOrder = 14
    end
    object DBLookupComboBox8: TDBLookupComboBox
      Left = 18
      Top = 774
      Width = 512
      Height = 21
      DataField = 'Lembedding'
      DataSource = DataSource1
      ListSource = DataSource9
      TabOrder = 15
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 843
    Width = 750
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 672
    ExplicitWidth = 744
    object Button1: TButton
      Left = 656
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Post'
      ModalResult = 1
      TabOrder = 1
    end
    object Button2: TButton
      Left = 575
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = atdbDM.specimenCDS
    Left = 576
    Top = 24
  end
  object DataSource2: TDataSource
    DataSet = atdbDM.speciesDS
    Left = 568
    Top = 80
  end
  object DataSource3: TDataSource
    DataSet = atdbDM.preprocesstreatmentDS
    Left = 544
    Top = 464
  end
  object DataSource4: TDataSource
    DataSet = atdbDM.fixationMethodDS
    Left = 552
    Top = 520
  end
  object DataSource5: TDataSource
    DataSet = atdbDM.postfix
    Left = 560
    Top = 576
  end
  object DataSource6: TDataSource
    DataSet = atdbDM.cryoprotectionDS
    Left = 624
    Top = 600
  end
  object DataSource7: TDataSource
    DataSet = atdbDM.freezeprotocolDS
    Left = 560
    Top = 656
  end
  object DataSource8: TDataSource
    DataSet = atdbDM.substitutionProtocol
    Left = 560
    Top = 712
  end
  object DataSource9: TDataSource
    DataSet = atdbDM.substitutionProtocol
    Left = 568
    Top = 768
  end
end
