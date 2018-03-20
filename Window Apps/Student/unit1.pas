unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  PairSplitter, ExtCtrls, ComCtrls, StdCtrls, Grids, Spin, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    CreateStud: TButton;
    enterLastName: TButton;
    addMark: TButton;
    averageBall: TButton;
    CloseProg: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    ToolBar1: TToolBar;
    procedure CreateStudClick(Sender: TObject);
    procedure enterLastNameClick(Sender: TObject);
    procedure addMarkClick(Sender: TObject);
    procedure averageBallClick(Sender: TObject);
    procedure CloseProgClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PairSplitterSide2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpinEdit1Change(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  j:byte;
  MyStud:TStudent;

implementation

{$R *.lfm}

{ TForm1 }

Procedure TForm1.FormCreate(Sender: TObject);
begin
  MyStud.Create;
end;

procedure TForm1.PairSplitterSide2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin

end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin

end;

Procedure TForm1.CloseProgClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin

end;

Procedure TForm1.CreateStudClick(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:='';
  for j:=1 to StringGrid1.RowCount-1 do
  StringGrid1.Rows[j].clear;
  StringGrid1.RowCount:=1;
  addMark.Visible:=false;
  averageBall.Visible:=false;
end;

Procedure TForm1.enterLastNameClick(Sender: TObject);
begin
  MyStud.SetFam(Edit1.text);
end;

Procedure TForm1.addMarkClick(Sender: TObject);
begin
  MyStud.AddOcenky (SpinEdit1.Value);
end;

Procedure TForm1.averageBallClick(Sender: TObject);
begin
  MyStud.SredBall;
end;


end.

