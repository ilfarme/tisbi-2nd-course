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
    MCreat: TMenuItem;
    MCreatArray: TMenuItem;
    MCircl: TMenuItem;
    MCreatCircl: TMenuItem;
    MCreatPryam: TMenuItem;
    MClean: TMenuItem;
    MClose: TMenuItem;
    MMoveArrCircl: TMenuItem;
    MMoveArrPryam: TMenuItem;
    MMoveCircl: TMenuItem;
    MMovePryam: TMenuItem;
    MPryam: TMenuItem;
    MMoveArray: TMenuItem;
    MMove: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure MCirclClick(Sender: TObject);
    procedure MCloseClick(Sender: TObject);
    procedure MCreatCirclClick(Sender: TObject);
    procedure MCreatPryamClick(Sender: TObject);
    procedure MCleanClick(Sender: TObject);
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

uses Unit2, Unit4;

{$R *.lfm}

{ TForm1 }

var
  MyCirc1: TCircle;
  MyRectangle1: TRectangle;
  ArrOfCircs: array [1..100] of TCircle;
  ArrOfRectangles: array [1..100] of TRectangle;
  i: integer;
  ax, ay, ar: integer;
  z, x: integer;

procedure TForm1.FormCreate(Sender: TObject);
begin
  randomize;
  Image1.Canvas.Pen.Mode := pmNotXOR;
end;

procedure TForm1.MCirclClick(Sender: TObject);
begin
  MyCirc1 := TCircle.Create(200, 100, 40);
  MyCirc1.Show;
end;

procedure TForm1.MCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MCreatCirclClick(Sender: TObject);
begin
  randomize;
  for i := 1 to 100 do
    ArrOfCircs[i] := TCircle.Create(Random(500), Random(500), Random(100));
  for i := 1 to 100 do
    ArrOfCircs[i].Show;
end;

procedure TForm1.MCreatPryamClick(Sender: TObject);
begin
  randomize;
  for i := 1 to 100 do
    ArrOfRectangles[i] := TRectangle.Create(Random(550), Random(550),
      Random(100), Random(100));
  for i := 1 to 100 do
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

procedure TForm1.MMoveArrCirclClick(Sender: TObject);
begin
  randomize;
  if ArrOfCircs[i] = nil then
    ShowMessage('404: Массив не найден.')
  else
  begin
    z := randomrange(-100, 101);
    x := randomrange(-100, 101);
    for i := 1 to 100 do
      ArrOfCircs[i].MoveTo(x, z);
  end;
end;

procedure TForm1.MMoveArrPryamClick(Sender: TObject);
begin
  randomize;
  if ArrOfRectangles[i] = nil then
    ShowMessage('404: Массив не найден.')
  else
  begin
    z := randomrange(-100, 101);
    x := randomrange(-100, 101);
    for i := 1 to 100 do
      ArrOfRectangles[i].MoveTo(x, z);
  end;
end;

procedure TForm1.MMoveCirclClick(Sender: TObject);
begin
  randomize;
  if MyCirc1 = nil then
    ShowMessage('404: Окружность не найдена.')
  else
    MyCirc1.MoveTo(RandomRange(-100, 100), RandomRange(-100, 100));
end;

procedure TForm1.MMovePryamClick(Sender: TObject);
begin
  randomize;
  if MyRectangle1 = nil then
    ShowMessage('Прямоугольника нет!')
  else
    MyRectangle1.MoveTo(RandomRange(-100, 100), RandomRange(-100, 100));
end;

procedure TForm1.MPryamClick(Sender: TObject);
begin
  MyRectangle1 := TRectangle.Create(Random(500), Random(500), Random(200), Random(200));
  MyRectangle1.Show;
end;

end.
