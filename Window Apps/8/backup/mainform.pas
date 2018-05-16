unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, Buttons, StdCtrls,unit2,Unit4,math,ellipse,container,figures;

type

  { TForm1 }

  TForm1 = class(TForm)
    createContainer: TButton;
    createFullContainer: TButton;
    background: TImage;
    MainMenu1: TMainMenu;
    menuCreate: TMenuItem;
    menuContainerObj: TMenuItem;
    menuMoveRect: TMenuItem;
    menuContainerObjAdd: TMenuItem;
    menuContainerObjDelete: TMenuItem;
    menuContainerObjMoveTo: TMenuItem;
    MenuItem16: TMenuItem;
    menuMove: TMenuItem;
    MenuItem3: TMenuItem;
    menuCreateElleps: TMenuItem;
    menuMoveElleps: TMenuItem;
    menuCreateCircle: TMenuItem;
    menuCreateRect: TMenuItem;
    menuRotate: TMenuItem;
    menuMoveCircle: TMenuItem;
    procedure createContainerClick(Sender: TObject);
    procedure createFullContainerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuMoveRectClick(Sender: TObject);
    procedure menuContainerObjAddClick(Sender: TObject);
    procedure menuContainerObjDeleteClick(Sender: TObject);
    procedure menuContainerObjMoveToClick(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure menuCreateEllepsClick(Sender: TObject);
    procedure menuMoveEllepsClick(Sender: TObject);
    procedure menuCreateCircleClick(Sender: TObject);
    procedure menuCreateRectClick(Sender: TObject);
    procedure menuRotateClick(Sender: TObject);
    procedure menuMoveCircleClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  circ1: tCircle;
  circ2:PCircle;
  ell:TEllipse;
  kont:TArrayCircleContainer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.menuCreateEllepsClick(Sender: TObject);
begin
   ell:=tellipse.create(randomrange(200,300),randomrange(100,300),randomrange(100,200),randomrange(10,100));
  ell.Show;
end;

procedure TForm1.menuMoveEllepsClick(Sender: TObject);
begin
   if ell=nil then exit;
  ell.MoveTo(RandomRange(-100,100),RandomRange(-100,100));
end;





procedure TForm1.menuCreateCircleClick(Sender: TObject);
begin
   circ1:=TCircle.create(randomrange(200,300),randomrange(100,300));
  circ1.Show;
end;

procedure TForm1.menuCreateRectClick(Sender: TObject);
begin
  circ2:=PCircle.create(randomrange(200,300),randomrange(100,300));
  circ2.Show;
end;

procedure TForm1.menuRotateClick(Sender: TObject);
begin
  if ell=nil then exit;
  ell.Rotate90;
end;



procedure TForm1.menuMoveCircleClick(Sender: TObject);
begin
  if circ1=nil then exit;
  Circ1.MoveTo(RandomRange(-100,100),RandomRange(-100,100));
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  background.canvas.Pen.Mode:=pmNotXOR;
end;

procedure TForm1.createContainerClick(Sender: TObject);
begin
   if kont<>nil then
   kont.ShowAll;
  kont:=TArrayCircleContainer.Create;
  showmessage('Контейнер создан!');
end;

procedure TForm1.createFullContainerClick(Sender: TObject);
  var i,res:integer;
begin
  randomize;
  if kont<>nil then
   kont.ShowAll;
  kont:=TArrayCircleContainer.Create;
  for i:=1 to random(20) do begin
  res:=random(4);
 if res = 1 then begin
   kont.ShowAll;
  circ1:=TCircle.create(randomrange(200,300),randomrange(100,300));
  kont.add(circ1);
   kont.ShowAll;
  end;
  if res = 2 then begin
    kont.ShowAll;
  circ2:=PCircle.create(randomrange(200,300),randomrange(100,300));
  kont.add(circ2);
   kont.ShowAll;
  end;
  if res = 3 then begin
   kont.ShowAll;
  ell:=TEllipse.create(randomrange(200,300),randomrange(100,300),randomrange(100,200),randomrange(10,100));
  kont.add(ell);
   kont.ShowAll;
  end;
  end;
  showmessage('Контейнер создан!');
end;





procedure TForm1.menuMoveRectClick(Sender: TObject);
begin
  if circ2=nil then exit;
  Circ2.MoveTo(RandomRange(-100,100),RandomRange(-100,100));
end;

procedure TForm1.menuContainerObjAddClick(Sender: TObject);
var res:integer;
begin
  if kont=nil then
  showmessage('Создайте контейнер')
  else
   begin
    res:=0;
    while res = 0 do
      res:=random(4);

 if res = 1 then begin
   kont.ShowAll;
  circ1:=TCircle.create(randomrange(200,300),randomrange(100,300));
  kont.add(circ1);
   kont.ShowAll;
  end;
  if res = 2 then begin
    kont.ShowAll;
  circ2:=PCircle.create(randomrange(200,300),randomrange(100,300));
  kont.add(circ2);
   kont.ShowAll;
  end;
  if res = 3 then begin
   kont.ShowAll;
  ell:=TEllipse.create(randomrange(200,300),randomrange(100,300),randomrange(100,200),randomrange(10,100));
  kont.add(ell);
   kont.ShowAll;
  end;
  end;
   end;

procedure TForm1.menuContainerObjDeleteClick(Sender: TObject);
begin
   if kont=nil then exit;
    kont.ShowAll;
   kont.delete(kont.GetCount);
   kont.ShowAll;
end;

procedure TForm1.menuContainerObjMoveToClick(Sender: TObject);
begin
  if kont=nil then exit;
   kont.MoveaLL(RandomRange(-100,100),RandomRange(-100,100));
end;

procedure TForm1.MenuItem16Click(Sender: TObject);
  var i:integer;
begin
 if kont=nil then
  showmessage('Создайте контейнер')
  else  begin
   kont.ShowAll;
  for i:= 1 to kont.GetCount do
  kont.delete(i);
  kont.free;
  kont:=nil;
  showmessage('Контейнер уничтожен!')
  end;
end;





end.

