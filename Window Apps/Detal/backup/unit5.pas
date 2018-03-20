unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Unit2, unit3;

type
  TDetal = class
  private
    Circ: TCircle;
    Rect: TRectangle;
  public
    constructor Create(acx, acy, ar, arx1, ary1, arx2, ary2: integer); overload;
    constructor Create(aCirc: TCircle; aRect: TRectangle); overload;
    procedure Show;
  end;

implementation

constructor TDetal.Create(acx, acy, ar, arx1, ary1, arx2, ary2: integer);
begin
  randomize;
  Circ := TCircle.Create(acx, acy, ar);
  Circ.Show;
  Rect := TRectangle.Create(arx1, ary1, arx2, ary2);
  Rect.Show;
end;

constructor TDetal.Create(aCirc: TCircle; aRect: TRectangle);
begin
  Circ := aCirc;
  Circ.Show;
  Rect := aRect;
  Rect.Show;
end;

procedure TDetal.Show;
var ran:integer;
begin
  randomize;
  ran:=random(100);
  Circ.MoveTo(ran,ran);
  Rect.MoveTo(ran,ran);
end;

end.
