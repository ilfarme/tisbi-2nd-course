unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Grids;

type

  { TFonts }

  TFonts = class(TForm)
    FontDG: TDrawGrid;
    FontCB: TComboBox;
    Panel1: TPanel;
    procedure FontCBClick(Sender: TObject);
    procedure FontDGClick(Sender: TObject);
    procedure FontDGDrawCell(Sender: TObject; aCol, aRow: Integer;
      aRect: TRect; aState: TGridDrawState);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Fonts: TFonts;

implementation

{$R *.lfm}

{ TFonts }

procedure TFonts.FontDGDrawCell(Sender: TObject; aCol, aRow: Integer;
  aRect: TRect; aState: TGridDrawState);
begin
  with FontDG.Canvas do
TextRect(aRect, aRect.Left, aRect.Top,Char((ARow+1)*32+ACol));
end;

procedure TFonts.FontDGClick(Sender: TObject);
begin

end;

procedure TFonts.FontCBClick(Sender: TObject);
begin
    FontDG.Font.Name:=FontCB.Text;
end;

procedure TFonts.FormCreate(Sender: TObject);
begin
  with FontCB do
begin
  Items:=Screen.Fonts;
  ItemIndex:=Items.IndexOf(Font.Name);
end;
end;
end.

