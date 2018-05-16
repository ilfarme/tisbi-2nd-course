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
procedure Show; override;
end;


implementation
uses Unit1;
constructor TCircle.create(ax,ay:integer);
begin
 inherited create(ax,ay);
 r:=randomrange(50,100);
  end;

procedure TCircle.Show;

begin
mainForm.background.canvas.ellipse(x-r,y-r,x+r,y+r);

end;

end.

