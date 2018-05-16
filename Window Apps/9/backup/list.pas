unit list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils,klassFigur;
type
  ListItem = class
    private
      Next:ListItem;
      Fig:TFigure;
    public
      constructor Create(aNext:ListItem; aFig:TFigure);
      function GetNext:ListItem;
      function GetFig:TFigure;
      procedure SetNext(aNext:ListItem);
      procedure SetFig(aFig:TFigure);
  end;

implementation
  constructor ListItem.Create(aNext:ListItem; aFig:TFigure);
  begin
  Fig:=aFig;
  Next:=aNext;
  end;
   function ListItem.GetNext:ListItem;
   begin
   result:=Next;
   end;

   function ListItem.GetFig:TFigure;
   begin
   result:=Fig;
   end;

   procedure ListItem.SetNext(aNext:ListItem);
   begin
   Next:=aNext;
   end;

   procedure ListItem.SetFig(aFig:TFigure);
   begin
   Fig:=aFig;
   end;

end.

