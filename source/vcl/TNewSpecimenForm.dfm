object NewSpecimenForm: TNewSpecimenForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Specimen Form'
  ClientHeight = 560
  ClientWidth = 657
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
    Width = 657
    Height = 509
    Align = alClient
    TabOrder = 0
    ExplicitWidth = 851
    ExplicitHeight = 843
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
    object Label9: TLabel
      Left = 16
      Top = 365
      Width = 113
      Height = 13
      Caption = 'brain_region_dissection'
      FocusControl = DBEdit8
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
      ListField = 'name'
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
    object DBEdit8: TDBEdit
      Left = 16
      Top = 381
      Width = 512
      Height = 21
      DataField = 'brain_region_dissection'
      DataSource = DataSource1
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 509
    Width = 657
    Height = 51
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 843
    ExplicitWidth = 851
    DesignSize = (
      657
      51)
    object Button1: TButton
      Left = 577
      Top = 16
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Post'
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 771
    end
    object Button2: TButton
      Left = 496
      Top = 16
      Width = 60
      Height = 25
      Anchors = [akTop, akRight]
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
      ExplicitLeft = 690
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
end
