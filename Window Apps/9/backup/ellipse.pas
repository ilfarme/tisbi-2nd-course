unit ellipse;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,circleж
type
  TEllipse = class(TCircle)
    protected
      r2:integer;
    public
      constructor Create (ax,ay,ar,ar2:integer);
      procedure Show; override;
  end;

implementation
   uses unit1;
   constructor TEllipse.Create (ax,ay,ar,ar2:integer);
   begin
     inherited create(ax,ay);
     r:=ar;
     r2:=ar2;
   end;
   procedure TEllipse.Show;
   begin
     form1.background.canvas.ellipse(x-r,y-r2,x+r,y+r2);
   end;

end.

