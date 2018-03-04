unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Unit1;

type
  TRect = class
  private
    x, y, v, sh: integer;
  public
    constructor Create1; overload;
    constructor Create1(ax, ay: integer); overload;
    destructor Destroy;
    function GetX: integer;
    function GetY: integer;
    procedure SetXY(ax, ay: integer);
    procedure MoveTo(ax, ay: integer);
    procedure Show;
  end;

implementation

constructor TRect.Create1;
begin
  x := 0;
  y := 0;
  v := 0;
  sh := 0;
end;

constructor TRect.Create1(ax, ay: integer);
begin
  x := ax;
  y := ay;
end;

destructor TRect.Destroy;
begin
  Free;
end;

function TRect.GetX: integer;
begin
  Result := x;
end;

function TRect.GetY: integer;
begin
  Result := y;
end;

procedure TRect.SetXY(ax, ay: integer);
begin
  x := ax;
  y := ay;
end;

procedure TRect.Show;
begin
  Form1.Image1.Canvas.Rectangle(x, y, x + sh, y + v);
end;

procedure TRect.MoveTo(ax, ay: integer);
begin
  Show;
  x := x + ax;
  y := y + ay;
  Show;
end;


end.
