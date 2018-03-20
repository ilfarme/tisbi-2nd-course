unit Unit4;

{$mode objfpc}{$H+}

interface

uses Classes, SysUtils, Unit2,unit1;

type
  TContMass = class
  private
    Count: integer;
    Circ: array [1..100] of TCircle;
  public
    constructor Create;
    destructor Destroy;
    function Add(aCirc: TCircle): boolean;
    function Delete(ai: integer): boolean;
    function Search(aRad: integer; var Nom: integer): TCircle;
    procedure ShowAll;
    function GetCount: integer;
    procedure MoveAll(ax, ay: integer);
  end;

implementation

constructor TContMass.Create;
var
  i: integer;
begin
  for i := 1 to 100 do
    Circ[i] := nil;
  Count := 0;
end;

destructor TContMass.Destroy;
begin
  Free;
end;

function TContMass.GetCount: integer;
begin
  Result := Count;
end;

function TContMass.Add(aCirc: TCircle): boolean;
begin
  Result := False;
  if (Count < 100) then
  begin
    Count := Count + 1;
    Circ[Count] := aCirc;
    Result := True;
  end;
end;

function TContMass.Delete(ai: integer): boolean;
var
  i: integer;
begin
  for i := 1 to ai do
    Circ[i] := nil;
  Count := 0;
  Result := True;
end;

function TContMass.Search(aRad: integer; var Nom: integer): TCircle;
var
  i: integer;
begin
  Result := nil;
  if (Count > 0) then
    for i := 1 to Count do
      if (Circ[i].GetR = aRad) then
      begin
        Nom := i;
        Result := Circ[i];
        break;
      end;
end;

procedure TContMass.ShowAll;
var
  i, x, y, r: integer;
begin
 for i := 1 to Count do
 // Circ[i].Show;
 //  x := Circ[i].GetX;
  r := Circ[i].GetR;
     if  ( Circ[i] <> nil )    then   Circ[i].Show;

 //y := Circ[i].GetY;
 // r := Circ[i].GetR;
// Form1.Image1.Canvas.Ellipse(x - r, y - r, x + r, y + r);
end;

procedure TContMass.MoveAll(ax: integer; ay: integer);
var
  i: integer;
begin
  for i := 1 to Count do
    Circ[i].MoveTo(ax, ay);
end;

end.
