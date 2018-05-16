unit container;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,klassFigur;
type
TArrayCircleContainer = class
    private
      Figs:array[1..100] of TFigure;
      count:integer;
      public
        constructor Create;
        FUNCTION GetCount:integer;
        FUNCTION add(aFig:TFigure):boolean;
        FUNCTION delete(ai:integer):TFigure;
        procedure ShowAll;
        procedure MoveAll(dx,dy:integer);
  end;

implementation
constructor TArrayCircleContainer.Create;
var i:integer;
begin
for i:=1 to 100 do Figs[i]:=nil;
count:=0;
end;


function TArrayCircleContainer.add(aFig:TFigure):boolean;
begin
result:=false;
if count<100 then
begin
count:=count+1;
Figs[count]:=aFig;
result:=true;
end;
end;
function TArrayCircleContainer.delete(ai:integer):TFigure;
begin
result:=nil;
if (count>0) and (ai<=count) then
begin
result:=Figs[ai];
count:=count-1;
end;
end;

function TArrayCircleContainer.GetCount:integer;
begin
result:=Count;
end;
procedure TArrayCircleContainer.ShowAll;
var i:integer;
begin
for i:=1 to GetCount do
Figs[i].show;
end;
procedure TArrayCircleContainer.MoveAll(dx,dy:integer);
var i:integer;
begin
for i:=1 to GetCount do
Figs[i].MoveTo(dx,dy);
end;


end.

