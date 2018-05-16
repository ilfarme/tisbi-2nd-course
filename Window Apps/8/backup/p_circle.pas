unit p_circle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,math,figures;
type
PCircle = class(TFigure)
private
r,h:integer;
public
constructor create(ax,ay:integer);
//procedure MoveTo (dx, dy : integer);
procedure Show; override;
end;

implementation
uses unit1;
constructor PCircle.create(ax,ay:integer);
begin
   inherited create( ax,ay);
   r:=randomrange(50,100); h:=randomrange(50,150);
  end;
{procedure PCircle.MoveTo (dx, dy : integer);

begin
show;
PCircle.create(randomrange(200,300),randomrange(100,300));
x := x+dx; y:=y+dy;
show;
end;}
procedure PCircle.Show;

begin
form1.background.canvas.Rectangle(x,y,x+r,y+h);

end;
end.

