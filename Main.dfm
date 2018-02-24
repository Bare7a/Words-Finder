object FormMain: TFormMain
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Word Finder'
  ClientHeight = 494
  ClientWidth = 262
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label_Characters: TLabel
    Left = 6
    Top = 33
    Width = 38
    Height = 13
    Caption = 'Letters:'
  end
  object Label_Min: TLabel
    Left = 6
    Top = 62
    Width = 59
    Height = 13
    Caption = 'Min Length: '
  end
  object Label_MaxCharacters: TLabel
    Left = 133
    Top = 62
    Width = 63
    Height = 13
    Caption = 'Max Length: '
  end
  object Label_Language: TLabel
    Left = 6
    Top = 6
    Width = 51
    Height = 13
    Caption = 'Language:'
  end
  object Label_WordsFound: TLabel
    Left = 154
    Top = 6
    Width = 71
    Height = 13
    Caption = 'Words Found: '
  end
  object Label_WordsFoundNumber: TLabel
    Left = 224
    Top = 6
    Width = 3
    Height = 13
    Caption = ' '
  end
  object Edit_Characters: TEdit
    Left = 50
    Top = 30
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button_FindWord: TButton
    Left = 183
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Find Word'
    TabOrder = 6
    OnClick = Button_FindWordClick
  end
  object Memo_Words: TMemo
    Left = 6
    Top = 91
    Width = 252
    Height = 396
    Lines.Strings = (
      'Memo_Words')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 7
  end
  object Edit_MinCharacters: TEdit
    Left = 68
    Top = 59
    Width = 40
    Height = 21
    TabOrder = 2
    Text = '0'
  end
  object UpDown_MinCharacters: TUpDown
    Left = 110
    Top = 59
    Width = 16
    Height = 21
    Associate = Edit_MinCharacters
    TabOrder = 3
    OnClick = UpDown_MinCharactersClick
  end
  object Edit_MaxCharacters: TEdit
    Left = 199
    Top = 59
    Width = 40
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object UpDown_MaxCharacters: TUpDown
    Left = 241
    Top = 59
    Width = 16
    Height = 21
    Associate = Edit_MaxCharacters
    TabOrder = 5
    OnClick = UpDown_MaxCharactersClick
  end
  object ComboBox_Language: TComboBox
    Left = 61
    Top = 3
    Width = 86
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'Bulgarian'
    OnSelect = ComboBox_LanguageSelect
  end
end
