unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, Math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Image1: TImage;
    MainMenu1: TMainMenu;
    MClean: TMenuItem;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MCirclClick(Sender: TObject);
    procedure MConteinerAddClick(Sender: TObject);
    procedure MConteinerCreateClick(Sender: TObject);
    procedure MConteinerDeleteClick(Sender: TObject);
    procedure MConteinerMoveClick(Sender: TObject);
    procedure MCreatCirclClick(Sender: TObject);
    procedure MCreatPryamClick(Sender: TObject);
    procedure MCleanClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MMoveArrCirclClick(Sender: TObject);
    procedure MMoveArrPryamClick(Sender: TObject);
    procedure MMoveCirclClick(Sender: TObject);
    procedure MMovePryamClick(Sender: TObject);
    procedure MPryamClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit5;

{$R *.lfm}

{ TForm1 }

var
  MyCirc1: TCircle;
  MyRectangle1: TRectangle;
  ArrOfCircs: array [1..10] of TCircle;
  ArrOfRectangles: array [1..10] of TRectangle;
  MyContMass: TContMass;
  MyDetal: TDetal;
  i: integer;
  z, x: integer;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Image1.Canvas.Pen.Mode := pmNotXOR;
end;

procedure TForm1.MCirclClick(Sender: TObject);
var
  x, y, r: integer;
begin
  randomize;
  x := Random(200);
  y := Random(100);
  r := Random(40);
  MyCirc1 := TCircle.Create(x, y, r);
  MyCirc1.Show;
end;

procedure TForm1.MCreatCirclClick(Sender: TObject);
begin
  randomize;
  for i := 1 to 10 do
    ArrOfCircs[i] := TCircle.Create(Random(100), Random(100), Random(100));
  for i := 1 to 10 do
    ArrOfCircs[i].Show;
end;

procedure TForm1.MCreatPryamClick(Sender: TObject);
begin
  randomize;
  for i := 1 to 10 do
    ArrOfRectangles[i] := TRectangle.Create(Random(150), Random(150),
      Random(100), Random(100));
  for i := 1 to 10 do
    ArrOfRectangles[i].Show;
end;

procedure TForm1.MCleanClick(Sender: TObject);
begin
  ArrOfCircs[i] := nil;
  ArrOfRectangles[i] := nil;
  MyRectangle1 := nil;
  MyCirc1 := nil;
  Image1.Picture := nil;
  Image1.Canvas.Pen.Mode := pmNotXOR;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
var
  x1, y1, x2, y2: integer;
  x, y: real;
begin
  randomize;
  x1 := randomrange(50, 149);
  y1 := randomrange(50, 149);
  x2 := randomrange(151, 300);
  y2 := randomrange(151, 300);

  x := sqrt(sqr(x2) - sqr(x1));
  y := sqrt(sqr(y2) - sqr(y1));

  MyDetal := TDetal.Create(Trunc(Int(x)), Trunc(Int(y)), randomrange(5, 40),
    x1, y1, x2, y2);

  //MyDetal:= TDetal.Create(Trunc(Int(x)),Trunc(Int(y)),randomrange(5, 40),
  //  50,70,150,170);
end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  MyDetal.Show;
end;

procedure TForm1.MMoveArrCirclClick(Sender: TObject);
begin
  randomize;
  z := randomrange(-100, 101);
  x := randomrange(-100, 101);
  for i := 1 to 10 do
    ArrOfCircs[i].MoveTo(x, z);
end;

procedure TForm1.MMoveArrPryamClick(Sender: TObject);
begin
  randomize;
  z := randomrange(-100, 101);
  x := randomrange(-100, 101);
  for i := 1 to 10 do
    ArrOfRectangles[i].MoveTo(x, z);
end;

procedure TForm1.MMoveCirclClick(Sender: TObject);
begin
  randomize;
  MyCirc1.MoveTo(RandomRange(-100, 100), RandomRange(-100, 100));
end;

procedure TForm1.MMovePryamClick(Sender: TObject);
begin
  randomize;
  MyRectangle1.MoveTo(RandomRange(-100, 100), RandomRange(-100, 100));
end;

procedure TForm1.MPryamClick(Sender: TObject);
var
  x, y, sh, v: integer;
begin
  randomize;
  x := Random(500);
  y := Random(500);
  sh := Random(200);
  v := Random(200);
  MyRectangle1 := TRectangle.Create(x, y, sh, v);
  MyRectangle1.Show;
end;

procedure TForm1.MConteinerAddClick(Sender: TObject);
var
  x, y, r: integer;
begin
  randomize;
  x := Random(500);
  y := Random(250);
  r := Random(40);
  if MyContMass.Add(TCircle.Create(x, y, r)) <> True then
    ShowMessage('Контейнер заполнен.');
  MyContMass.ShowAll;
end;

procedure TForm1.MConteinerCreateClick(Sender: TObject);
begin
  MyContMass := TContMass.Create;
  ShowMessage('Контейнер создан.');
end;

procedure TForm1.MConteinerDeleteClick(Sender: TObject);
begin
  MyContMass.Delete(MyContMass.GetCount);
  MyCirc1 := nil;
  Image1.Picture := nil;
  Image1.Canvas.Pen.Mode := pmNotXOR;
  ShowMessage('Все удалено!');
end;

procedure TForm1.MConteinerMoveClick(Sender: TObject);
var
  x, y: integer;
begin
  randomize;
  x := Random(200);
  y := Random(100);
  MyContMass.MoveAll(x, y);
end;

end.
