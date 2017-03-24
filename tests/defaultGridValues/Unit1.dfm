object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 282
  ClientWidth = 771
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 25
    Width = 771
    Height = 120
    Align = alTop
    DataSource = atdbDM.specimenDataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'process_id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'specimen_id'
        Width = 62
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'specie'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'additional_identifier'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'age'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'lims_number'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'death_date'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'brain_region_dissection'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_received'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lspecie'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'date_entered'
        Width = 64
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'entered_by'
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 771
    Height = 25
    DataSource = atdbDM.specimenDataSource
    Align = alTop
    TabOrder = 1
    OnClick = DBNavigator1Click
  end
end
