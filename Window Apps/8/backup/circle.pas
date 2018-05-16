unit circle;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,math,figures;
type
TCircle = class(TFigure)
protected
r:integer;
public
constructor create(ax,ay:integer);
//procedure MoveTo (dx, dy : integer);
procedure Show; override;
end;


implementation
uses Unit1;
constructor TCircle.create(ax,ay:integer);
begin
 inherited create(ax,ay);
 r:=randomrange(50,100);
  end;
{procedure TCircle.MoveTo (dx, dy : integer);

begin
show;
TCircle.create(randomrange(200,300),randomrange(100,300));
x := x+dx; y:=y+dy;
show;
end; }
procedure TCircle.Show;

begin
mainForm.background.canvas.ellipse(x-r,y-r,x+r,y+r);

end;

end.

