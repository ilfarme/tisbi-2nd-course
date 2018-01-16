unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ComCtrls,
  StdCtrls, Menus, Buttons, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ColorDialog1: TColorDialog;
    ColorDialog2: TColorDialog;
    ComboBox1: TComboBox;
    FontDialog1: TFontDialog;
    MainMenu1: TMainMenu;
    Memo1: TMemo;
    MenuFile: TMenuItem;
    MenuFileNew: TMenuItem;
    MenuFileOpen: TMenuItem;
    MenuFileSave: TMenuItem;
    MenuEdit: TMenuItem;
    MenuEditCut: TMenuItem;
    MenuEditCopy: TMenuItem;
    MenuEditPaste: TMenuItem;
    MenuSettingsBGColor: TMenuItem;
    MenuSettingsFont: TMenuItem;
    MenuSettings: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedButtonSettingsFont: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButtonEditCut: TSpeedButton;
    SpeedButtonEditCopy: TSpeedButton;
    SpeedButtonEditPaste: TSpeedButton;
    SpeedButtonNew: TSpeedButton;
    SpeedButtonOpen: TSpeedButton;
    SpeedButtonSave: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    ToolBar1: TToolBar;
    procedure ComboBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure MenuEditCopyClick(Sender: TObject);
    procedure MenuFileClick(Sender: TObject);
    procedure MenuFileNewClick(Sender: TObject);
    procedure MenuFileOpenClick(Sender: TObject);
    procedure MenuFileSaveClick(Sender: TObject);
    procedure MenuSettingsBGColorClick(Sender: TObject);
    procedure MenuSettingsFontClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButtonEditPasteClick(Sender: TObject);
    procedure SpeedButtonSettingsFontClick(Sender: TObject);
    procedure SpeedButtonEditCopyClick(Sender: TObject);
    procedure SpeedButtonEditCutClick(Sender: TObject);
    procedure SpeedButtonNewClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuFileNewClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin

end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
  Memo1.Font.Name:=ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ComboBox1.Items:=Screen.Fonts;
end;

procedure TForm1.MenuEditCopyClick(Sender: TObject);
begin

end;

procedure TForm1.MenuFileClick(Sender: TObject);
begin

end;

procedure TForm1.MenuFileOpenClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  if OpenDialog1.Execute  then
  Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TForm1.MenuFileSaveClick(Sender: TObject);
begin
  if SaveDialog1.Execute  then
  Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TForm1.MenuSettingsBGColorClick(Sender: TObject);
begin
  if ColorDialog1.Execute then
  Memo1.Color:=(ColorDialog1.Color);
end;

procedure TForm1.MenuSettingsFontClick(Sender: TObject);
begin
  if FontDialog1.Execute then
  Memo1.Font.Assign(FontDialog1.Font);
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin

end;

procedure TForm1.SpeedButtonEditPasteClick(Sender: TObject);
begin
  Memo1.PasteFromClipboard;
end;

procedure TForm1.SpeedButtonSettingsFontClick(Sender: TObject);
begin

end;

procedure TForm1.SpeedButtonEditCopyClick(Sender: TObject);
begin
  Memo1.CopyToClipboard
end;

procedure TForm1.SpeedButtonEditCutClick(Sender: TObject);
begin
  Memo1.CutToClipboard;
end;

procedure TForm1.SpeedButtonNewClick(Sender: TObject);
begin

end;

end.

