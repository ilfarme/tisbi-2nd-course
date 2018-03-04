unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  PairSplitter, ExtCtrls, ComCtrls, StdCtrls, Grids, Spin, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ComboBox1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    PairSplitter1: TPairSplitter;
    PairSplitter2: TPairSplitter;
    PairSplitter3: TPairSplitter;
    PairSplitterSide1: TPairSplitterSide;
    PairSplitterSide2: TPairSplitterSide;
    PairSplitterSide3: TPairSplitterSide;
    PairSplitterSide4: TPairSplitterSide;
    PairSplitterSide5: TPairSplitterSide;
    PairSplitterSide6: TPairSplitterSide;
    SpinEdit1: TSpinEdit;
    StringGrid1: TStringGrid;
    ToolBar1: TToolBar;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

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

Procedure TForm1.Button5Click(Sender: TObject);
begin
  Close;
end;

Procedure TForm1.Button1Click(Sender: TObject);
begin
  StringGrid1.Cells[0,0]:='';
  for j:=1 to StringGrid1.RowCount-1 do
    StringGrid1.Rows[j].clear;
  StringGrid1.RowCount:=1;
  Button3.Visible:=false;
  Button4.Visible:=false;
end;

Procedure TForm1.Button2Click(Sender: TObject);
begin
  MyStud.SetFam(Edit1.text);
end;

Procedure TForm1.Button3Click(Sender: TObject);
begin
  MyStud.AddOcenky (SpinEdit1.Value);
end;

Procedure TForm1.Button4Click(Sender: TObject);
begin
  MyStud.SredBall;
end;


end.

