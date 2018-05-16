unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, Buttons, StdCtrls,circle,p_circle,math,ellipse,container;

type

  { TForm1 }

  TForm1 = class(TForm)
    createContainerBtn: TButton;
    createFullContainer: TButton;
    background: TImage;
    MainMenu1: TMainMenu;
    menuContainer: TMenuItem;
    menuCreate: TMenuItem;
    menuDelete: TMenuItem;
    menuMoveTo: TMenuItem;
    menuDestroyAll: TMenuItem;
    menuExit: TMenuItem;
    procedure createContainerBtnClick(Sender: TObject);
    procedure createFullContainerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuCreateClick(Sender: TObject);
    procedure menuDeleteClick(Sender: TObject);
    procedure menuMoveToClick(Sender: TObject);
    procedure menuDestroyAllClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
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
  myContainer:TArrayCircleContainer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.menuExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  background.canvas.Pen.Mode:=pmNotXOR;
end;

procedure TForm1.createContainerBtnClick(Sender: TObject);
begin
   if myContainer<>nil then
   myContainer.ShowAll;
  myContainer:=TArrayCircleContainer.Create;
  showmessage('Контейнер успешно создан.');
end;

procedure TForm1.createFullContainerClick(Sender: TObject);
  var i,res:integer;
begin
  randomize;
  if myContainer<>nil then
   myContainer.ShowAll;
  myContainer:=TArrayCircleContainer.Create;
  for i:=1 to random(20) do begin
  res:=random(4);
 if res = 1 then begin
   myContainer.ShowAll;
  circ1:=TCircle.create(randomrange(200,300),randomrange(100,300));
  myContainer.add(circ1);
   myContainer.ShowAll;
  end;
  if res = 2 then begin
    myContainer.ShowAll;
  circ2:=PCircle.create(randomrange(200,300),randomrange(100,300));
  myContainer.add(circ2);
   myContainer.ShowAll;
  end;
  if res = 3 then begin
   myContainer.ShowAll;
  ell:=TEllipse.create(randomrange(200,300),randomrange(100,300),randomrange(100,200),randomrange(10,100));
  myContainer.add(ell);
   myContainer.ShowAll;
  end;
  end;
  showmessage('Контейнер успешно создан.');
end;

procedure TForm1.menuCreateClick(Sender: TObject);
var res:integer;
begin
  randomize;
  if myContainer=nil then
  showmessage('Ошибка! Сначала создайте контейнер.')
  else
   begin
    res:=0;
    while res = 0 do
      res:=random(4);

 if res = 1 then begin
   myContainer.ShowAll;
  circ1:=TCircle.create(randomrange(200,300),randomrange(100,300));
  myContainer.add(circ1);
   myContainer.ShowAll;
  end;
  if res = 2 then begin
    myContainer.ShowAll;
  circ2:=PCircle.create(randomrange(200,300),randomrange(100,300));
  myContainer.add(circ2);
   myContainer.ShowAll;
  end;
  if res = 3 then begin
   myContainer.ShowAll;
  ell:=TEllipse.create(randomrange(200,300),randomrange(100,300),randomrange(100,200),randomrange(10,100));
  myContainer.add(ell);
   myContainer.ShowAll;
  end;
  end;
   end;

procedure TForm1.menuDeleteClick(Sender: TObject);
begin
   if myContainer=nil then exit;
    myContainer.ShowAll;
   myContainer.delete;
   myContainer.ShowAll;
end;

procedure TForm1.menuMoveToClick(Sender: TObject);
begin
  if myContainer=nil then exit;
   myContainer.MoveaLL(RandomRange(-100,100),RandomRange(-100,100));
end;

procedure TForm1.menuDestroyAllClick(Sender: TObject);
begin
 if myContainer=nil then
  showmessage('Ошибка! Сначала создайте контейнер.')
  else  begin
   myContainer.ShowAll;
  myContainer.free;
  myContainer:=nil;
  showmessage('Контейнер уничтожен!')
  end;
end;





end.

