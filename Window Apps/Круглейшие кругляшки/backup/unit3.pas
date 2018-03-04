unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Unit1;
Type
TRect=class
    private
   x,y,v,sh:integer;
    public
   Constructor Create1; overload;
   Constructor Create1(ax,ay:integer); overload;
   Destructor Destroy;
   Function GetX:integer;
   Function GetY:integer;
   Procedure SetXY(ax,ay:integer);
   Procedure MoveTo(ax,ay:integer);
   Procedure Show;
 end;

implementation

Constructor TRect.Create1;
begin
   x:=0;
   y:=0;
   v:=0;
   sh:=0;
end;

Constructor TRect.Create1(ax,ay:integer);
begin
   x:=ax;
   y:=ay;
end;
Destructor TRect.Destroy;
begin
   free;
end;

Function TRect.GetX:integer;
begin
   result:=x;
end;

Function TRect.GetY:integer;
begin
   result:=y;
end;

Procedure TRect.SetXY(ax,ay:integer);
begin
  x:=ax;
  y:=ay;
end;

Procedure TRect.Show;
begin
  Form1.Image1.Canvas.Rectangle(x,y,x+sh,y+v);
end;

Procedure TRect.MoveTo(ax,ay:integer);
begin
   Show;
  x:=x+ax;
  y:=y+ay;
   Show;
 end;


end.

