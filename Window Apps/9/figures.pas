unit figures;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;
type
TFigure = class
protected
x,y:integer;
public
constructor Create(ax,ay:integer);
procedure show; virtual; abstract;
procedure MoveTo(ax,ay: integer);
end;
implementation
 constructor TFigure.Create(ax,ay:integer);
 begin
  x:=ax;
  y:=ay;
 end;
procedure TFigure.MoveTo(ax,ay: integer);
begin
 show;
 x := x+ax; y:=y+ay;
 show;
end;

end.

