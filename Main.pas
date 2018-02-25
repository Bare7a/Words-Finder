unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TFormMain = class(TForm)
    Edit_Characters: TEdit;
    Label_Characters: TLabel;
    Button_FindWord: TButton;
    Memo_Words: TMemo;
    Edit_MinCharacters: TEdit;
    Label_Min: TLabel;
    UpDown_MinCharacters: TUpDown;
    Label_MaxCharacters: TLabel;
    Edit_MaxCharacters: TEdit;
    UpDown_MaxCharacters: TUpDown;
    Label_Language: TLabel;
    ComboBox_Language: TComboBox;
    Label_WordsFound: TLabel;
    Label_WordsFoundNumber: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Button_FindWordClick(Sender: TObject);
    procedure ComboBox_LanguageSelect(Sender: TObject);
    procedure UpDown_MaxCharactersClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDown_MinCharactersClick(Sender: TObject; Button: TUDBtnType);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    dictionary, dictionaryList : TStringList;
    function ListFiles(const AFolder, AFilter: string) : TStringList;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.Button_FindWordClick(Sender: TObject);
var
  minLength, maxlength, charPosition, wordsFound, i, j: integer;
  charactersList, charactersListTemp : string;
  wordPass : Boolean;
begin
  minLength := UpDown_MinCharacters.Position;
  maxLength := UpDown_MaxCharacters.Position;
  charactersList := Edit_Characters.Text;

  Memo_Words.Clear;
  wordPass := False;
  wordsFound := 0;

  for i := 0 to dictionary.Count - 1 do
  begin
    if (Length(dictionary[i]) >= minLength) and (Length(dictionary[i]) <= maxLength) then
    begin
      charactersListTemp := charactersList;

      for j := 1 to Length(dictionary[i]) do
      begin
        charPosition := AnsiPos(AnsiLowerCase(dictionary[i][j]), AnsiLowerCase(charactersListTemp));

        if charPosition = 0 then
        begin
          wordPass := False;
          Break;
        end else
        begin
          Delete(charactersListTemp, charPosition, 1);
          wordPass := True;
        end;
      end;

      if wordPass then
      begin
        wordsFound := wordsFound + 1;
        Memo_Words.Lines.Add(dictionary[i]);
      end;
    end;
  end;

  self.Label_WordsFoundNumber.Caption := IntToStr(wordsFound);
end;

procedure TFormMain.ComboBox_LanguageSelect(Sender: TObject);
begin
  dictionary.Free;
  dictionary := TStringList.Create;

  dictionary.LoadFromFile('dictionaries\' + dictionaryList[ComboBox_Language.ItemIndex] + '.txt');;
end;

procedure TFormMain.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Chr(VK_RETURN) then
  begin
    self.Button_FindWord.OnClick(Sender);
  end;
end;

procedure TFormMain.FormShow(Sender: TObject);
var
  I: Integer;
begin
  Self.UpDown_MinCharacters.Position := 3;
  Self.UpDown_MaxCharacters.Position := 8;

  dictionaryList := ListFiles('dictionaries','*.txt');

  ComboBox_Language.Items.BeginUpdate;
  ComboBox_Language.Items.Clear;

  for I := 0 to dictionaryList.Count - 1 do
    ComboBox_Language.Items.Add(dictionaryList[i]);

  ComboBox_Language.Items.EndUpdate;

  ComboBox_Language.ItemIndex := 0;
  ComboBox_Language.OnSelect(Sender);

  FormMain.KeyPreview := True;

  Memo_Words.Clear;
end;

procedure TFormMain.UpDown_MaxCharactersClick(Sender: TObject;
  Button: TUDBtnType);
begin
  UpDown_MaxCharacters.Min := UpDown_MinCharacters.Position;
end;

procedure TFormMain.UpDown_MinCharactersClick(Sender: TObject;
  Button: TUDBtnType);
begin
  UpDown_MinCharacters.Max := UpDown_MaxCharacters.Position;
end;

function TFormMain.ListFiles(const AFolder, AFilter: string) : TStringList;
var
  vFindHandle: THandle;
  vFilter    : String;
  vFindData  : WIN32_FIND_DATA;
  vResult : TStringList;
begin
  vResult := TStringList.Create;
  
  try
    vFilter := AFolder + '\' + AFilter;
    vFindHandle := FindFirstFile(PChar(vFilter), vFindData);
//    if vFindHandle = INVALID_HANDLE_VALUE then
//      Exit;

    repeat
      vResult.Add(ChangeFileExt(vFindData.cFileName, ''));
    until not FindNextFile(vFindHandle, vFindData);
      Windows.FindClose(vFindHandle);
  finally
    Result := vResult;
  end;
end;

end.
