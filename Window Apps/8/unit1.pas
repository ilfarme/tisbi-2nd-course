unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ExtCtrls, Buttons, StdCtrls,circle,p_circle,math,ellipse,container,figures;

type

  { TmainForm }

  TmainForm = class(TForm)
    createContainer: TButton;
    createFullContainer: TButton;
    background: TImage;
    MainMenu1: TMainMenu;
    menuContainerObj: TMenuItem;
    menuContainerObjAdd: TMenuItem;
    menuContainerObjDelete: TMenuItem;
    menuContainerObjMoveTo: TMenuItem;
    menuContainerObjDestroy: TMenuItem;
    menuExit: TMenuItem;
    procedure createContainerClick(Sender: TObject);
    procedure createFullContainerClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure menuMoveRectClick(Sender: TObject);
    procedure menuContainerObjAddClick(Sender: TObject);
    procedure menuContainerObjDeleteClick(Sender: TObject);
    procedure menuContainerObjMoveToClick(Sender: TObject);
    procedure menuContainerObjDestroyClick(Sender: TObject);
    procedure menuExitClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  mainForm: TmainForm;
  circ1: tCircle;
  circ2:PCircle;
  ell:TEllipse;
  myContainer:TArrayCircleContainer;
implementation

{$R *.lfm}

{ TmainForm }

procedure TmainForm.menuExitClick(Sender: TObject);
begin
  close;
end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  background.canvas.Pen.Mode:=pmNotXOR;
end;

procedure TmainForm.createContainerClick(Sender: TObject);
begin
   if myContainer<>nil then
   myContainer.ShowAll;
  myContainer:=TArrayCircleContainer.Create;
  showmessage('Контейнер успешно создан.');
end;

procedure TmainForm.createFullContainerClick(Sender: TObject);
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
  showmessage('Контейнер создан!');
end;





procedure TmainForm.menuMoveRectClick(Sender: TObject);
begin
  if circ2=nil then exit;
  Circ2.MoveTo(RandomRange(-100,100),RandomRange(-100,100));
end;

procedure TmainForm.menuContainerObjAddClick(Sender: TObject);
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

procedure TmainForm.menuContainerObjDeleteClick(Sender: TObject);
begin
   if myContainer=nil then exit;
    myContainer.ShowAll;
   myContainer.delete(myContainer.GetCount);
   myContainer.ShowAll;
end;

procedure TmainForm.menuContainerObjMoveToClick(Sender: TObject);
begin
  if myContainer=nil then exit;
   myContainer.MoveaLL(RandomRange(-100,100),RandomRange(-100,100));
end;

procedure TmainForm.menuContainerObjDestroyClick(Sender: TObject);
  var i:integer;
begin
 if myContainer=nil then
  showmessage('Ошибка! Сначала создайте контейнер')
  else  begin
   myContainer.ShowAll;
  for i:= 1 to myContainer.GetCount do
  myContainer.delete(i);
  myContainer.free;
  myContainer:=nil;
  showmessage('Контейнер уничтожен!')
  end;
end;

end.