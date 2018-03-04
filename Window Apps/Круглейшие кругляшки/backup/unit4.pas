unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Unit1;
Type
    TRectangle = class
private
 x, y, sh, v:  integer;

public
   constructor Create; overload;
   constructor Create(ax, ay, ash, av:integer); overload;
   destructor Destroy;
   function GetX: integer;
   function GetY: integer;
   procedure SetXY(ax, ay: integer);
   procedure MoveTo(ax, ay: integer);
   procedure Show;
end;

implementation

constructor  TRectangle.Create;
 begin
   x:=0; y:=0; sh:=0; v:=0;
 end;
constructor  TRectangle.Create(ax, ay, ash, av:integer);
 begin
   x:=ax; y:=ay; sh:=ash; v:=av;
 end;
function TRectangle.GetX: integer;
begin
  result:=x;
end;
function TRectangle.GetY: integer;
begin
  result:=y;
end;
procedure TRectangle.Show;
begin
  Form1.Image1.Canvas.Rectangle(x, y, x+sh, y+v);
end;
procedure TRectangle.MoveTo(ax, ay:integer);
begin
  Show;
  x:=x+ax;
  y:=y+ay;
  Show;
end;
procedure TRectangle.SetXY (ax,ay:integer);
begin
 x:=ax;
 y:=ay;
end;
destructor TRectangle.Destroy;
begin
 free;
end;

end.


