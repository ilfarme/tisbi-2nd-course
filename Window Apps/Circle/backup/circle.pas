unit Circle;

{$mode objfpc}{$H+}

interface
type
  TCircle = class
    private
      x,y:integer;
      public
        constructor Create; overload;
        constructor Create(ax,ay,ar:integer);
        function GetX:integer;
        function GetY:integer;
        function GetR:integer;
        procedure SetXY(ax,ay:integer);
        procedure SetR(ar:integer);
        procedure MoveTo(ax,ay:integer);
        procedure Show;
  end;

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs;

type
  TForm1 = class(TForm)
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

constructor TCircle.Create;
begin

  x:=0; y:=0; r:=0;
  end;

function TCircle.GetX:integer;
begin
  result:=x;
  end;

procedure TCircle.Show;
begin
  //вывод кругляшков
end;

procedure TCircle.MoveTo(ax,ay:integer);
begin
  //если окружность нарисована, степерть её.
  x:=ax; y:=ay;
  end;
end;

end.

