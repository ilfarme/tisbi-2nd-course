unit Unit2;

{$mode objfpc}{$H+}

interface

uses Classes, SysUtils, Dialogs, Unit1;

type
  TCircle = class
  private
    x, y: integer;
    r: integer;
  public
    constructor Create; overload;
    constructor Create(ax, ay, ar: integer); overload;
    destructor Destroy;
    function GetX: integer;
    function GetY: integer;
    function GetR: integer;
    procedure SetXY(ax, ay: integer);
    procedure SetR(ar: integer);
    procedure MoveTo(ax, ay: integer);
    procedure Show;
  end;



implementation

constructor TCircle.Create;
begin
  x := 0;
  y := 0;
  r := 0;
end;

constructor TCircle.Create(ax, ay, ar: integer);
begin
  x := ax;
  y := ay;
  r := ar;
end;

destructor TCircle.Destroy;
begin
  Free;
end;

function TCircle.GetX: integer;
begin
  Result := x;
end;

function TCircle.GetY: integer;
begin
  Result := y;
end;

function TCircle.GetR: integer;
begin
  Result := r;
end;

procedure TCircle.SetXY(ax, ay: integer);
begin
  x := ax;
  y := ay;
end;

procedure TCircle.SetR(ar: integer);
begin
  r := ar;
end;

procedure TCircle.Show;
begin
  Form1.Image1.Canvas.Ellipse(x - r, y - r, x + r, y + r);
end;

procedure TCircle.MoveTo(ax, ay: integer);
begin
  Show;
  x := x + ax;
  y := y + ay;
  Show;
end;

end.
