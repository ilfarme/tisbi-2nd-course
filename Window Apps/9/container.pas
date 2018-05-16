unit container;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,figures,list;
type
TArrayCircleContainer = class
    private
      First:ListItem;
      public
        constructor Create;
        FUNCTION GetFirst:ListItem;
        procedure add(aFig:TFigure);
        FUNCTION delete:ListItem;
        procedure ShowAll;
        procedure MoveAll(dx,dy:integer);
  end;

implementation
constructor TArrayCircleContainer.Create;
begin
First:=nil;
end;


procedure TArrayCircleContainer.add(aFig:TFigure);
begin
First:=listitem.Create(first,aFig);
end;
function TArrayCircleContainer.delete:ListItem;
var Temp,pTemp:ListItem;
begin
Temp:=First;
pTemp:=First;
if temp = nil then
exit;
if temp.GetNext = nil then
first:=nil;
while Temp.GetNext <> nil do
begin
ptemp:=Temp;
Temp:=Temp.GetNext;
end;
ptemp.SetNext(nil);

end;

function TArrayCircleContainer.GetFirst:ListItem;
begin
result:=First;
end;
procedure TArrayCircleContainer.ShowAll;
var Temp:ListItem;
begin
Temp:=First;
while(Temp<>nil) do
 begin
   Temp.GetFig.show;
   Temp:=Temp.GetNext;
 end;
end;
procedure TArrayCircleContainer.MoveAll(dx,dy:integer);
var Temp:ListItem;
begin
Temp:=First;
while(Temp<>nil) do
 begin
   Temp.GetFig.MoveTo(dx,dy);
   Temp:=Temp.GetNext;
 end;
end;


end.

