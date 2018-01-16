unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  ComCtrls, Buttons, Grids, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Edit1: TEdit;
    MainMenu1: TMainMenu;
    MPReturn: TMenuItem;
    MExit: TMenuItem;
    MPIssue: TMenuItem;
    MProcessing: TMenuItem;
    MSName: TMenuItem;
    MSSurname: TMenuItem;
    MSearch: TMenuItem;
    MTClearTheLine: TMenuItem;
    MTRemoveTheLine: TMenuItem;
    MTAddTheLine: TMenuItem;
    MTable: TMenuItem;
    MFSave: TMenuItem;
    MFOpen: TMenuItem;
    MFile: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SpeedBOpen: TSpeedButton;
    SpeedBSave: TSpeedButton;
    SpeedBAddTheLine: TSpeedButton;
    SpeedBRemoveTheLine: TSpeedButton;
    SpeedBClearTheLine: TSpeedButton;
    SpeedBSurname: TSpeedButton;
    SpeedBName: TSpeedButton;
    SpeedBIssue: TSpeedButton;
    SpeedBReturn: TSpeedButton;
    SpeedBExit: TSpeedButton;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Splitter5: TSplitter;
    Splitter6: TSplitter;
    StringGrid1: TStringGrid;
    ToolBar1: TToolBar;
    procedure FormCreate(Sender: TObject);
    procedure MExitClick(Sender: TObject);
    procedure MPReturnClick(Sender: TObject);
    procedure MFOpenClick(Sender: TObject);
    procedure MFSaveClick(Sender: TObject);
    procedure MPIssueClick(Sender: TObject);
    procedure MSNameClick(Sender: TObject);
    procedure MSSurnameClick(Sender: TObject);
    procedure MTAddTheLineClick(Sender: TObject);
    procedure MTClearTheLineClick(Sender: TObject);
    procedure MTRemoveTheLineClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MFOpenClick(Sender: TObject);
var
f: TextFile;
i,j: integer;
t: string;
begin
     if OpenDialog1.Execute then   begin

     AssignFile(f, 'Test.txt');
     Reset(f);
     j:=1;
    while not eof(f) do
     begin
     for i := 1 to StringGrid1.colcount - 1 do
     begin
      readln(f,t);
       StringGrid1.Cells[i, j] := t;
     end;
    inc(j);
    StringGrid1.RowCount:=j+1;
     end;
     end;
      StringGrid1.RowCount:=j;
       CloseFile(f);
end;



procedure TForm1.MPReturnClick(Sender: TObject);
var i:integer;
begin
     for i:= StringGrid1.Row to StringGrid1.Row do
     if StringGrid1.Cells[3,i] = '' then ShowMessage('Ошибка! Отсутствуют данные.')
     else
     StringGrid1.Cells[3,i]:=IntToStr(StrToInt(StringGrid1.Cells[3,i])+1);
end;

procedure TForm1.MExitClick(Sender: TObject);
begin
  close;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
     StringGrid1.Cells[0,0]:='№';
     StringGrid1.Cells[1,0]:='Фамилия автора';
     StringGrid1.Cells[2,0]:='Название книги';
     StringGrid1.Cells[3,0]:='Кол-во';
end;

procedure TForm1.MFSaveClick(Sender: TObject);
var
f: TextFile;
x, y: integer;
t:string;
begin
     if SaveDialog1.Execute then  begin
     AssignFile(f,'Test.txt');
     Rewrite(f);
     for X := 1 to StringGrid1.RowCount-1  do
     for y := 1 to StringGrid1.ColCount-1  do begin
     t:=StringGrid1.cells[y, x];
     writeln(f,t);
     end;
     end;
     CloseFile(f);
end;

procedure TForm1.MPIssueClick(Sender: TObject);
var i:integer;
begin
     for i:= StringGrid1.Row to StringGrid1.Row do
     if StringGrid1.Cells[3,i] = '' then ShowMessage('Ошибка! Отсутствуют данные.')
     else
     if StringGrid1.Cells[3,i] = IntToStr(0) then ShowMessage('Нет в наличии')
     else
     StringGrid1.Cells[3,i]:=inttostr(StrToInt(StringGrid1.Cells[3,i])-1);
end;

procedure TForm1.MSNameClick(Sender: TObject);
var Col,Row:integer;
s:string;
begin
     if Edit1.Text = '' then ShowMessage('Введите название книги')
     else begin
               s := Edit1.Text;
               Row := -1;
               for Col := 2 to 2 do
               begin
                    Row := StringGrid1.Cols[Col].IndexOf(S);
                    if Row > -1 then Break;
               end;
               if Row > -1 then
               ShowMessage('Найдено в строке под № ' + IntToStr(Row))
               else
               ShowMessage('Не найдено.');
          end;
end;

procedure TForm1.MSSurnameClick(Sender: TObject);
var Col,Row:integer;
s:string;
begin
     if Edit1.Text = '' then ShowMessage('Введите фамилию')
     else begin
               s := Edit1.Text;
               Row := -1;
               for Col := 1 to 1 do
               begin
                    Row := StringGrid1.Cols[Col].IndexOf(S);
                    if Row > -1 then Break;
               end;
               if Row > -1 then
               ShowMessage('Найдено в строке под № ' + IntToStr(Row))
               else
               ShowMessage('Не найдено.');
          end;
end;

procedure TForm1.MTAddTheLineClick(Sender: TObject);
var m,j,i: integer;
begin
     StringGrid1.RowCount:=StringGrid1.RowCount+1;
     for m:=StringGrid1.RowCount-2 downto StringGrid1.Row+1  do
     begin
          StringGrid1.Rows[m+1]:=StringGrid1.Rows[m];
          StringGrid1.Rows[m].Clear;
     end;
     j:=0;
     with StringGrid1 do
     for i:= 1 to RowCount-1 do
     Cells[j, i]:= IntToStr(i);
end;

procedure TForm1.MTClearTheLineClick(Sender: TObject);
var i,j:integer;
begin
     for i := StringGrid1.Row to StringGrid1.Row do
     for j := 0 to StringGrid1.ColCount - 1 do
     StringGrid1.Cells[1,i]:='';
     StringGrid1.Cells[2,i]:='';
     StringGrid1.Cells[3,i]:='';
end;

procedure TForm1.MTRemoveTheLineClick(Sender: TObject);
var n,i,j: integer;
begin
     for n:=StringGrid1.Row to StringGrid1.RowCount-2 do
     begin
          StringGrid1.Rows[n]:=StringGrid1.Rows[n+1];
          StringGrid1.Rows[n+1].Clear;
     end;
     StringGrid1.RowCount:=StringGrid1.RowCount-1;
     j:=0;
     with StringGrid1 do
     for i:= 1 to RowCount-1 do
     Cells[j, i]:= IntToStr(i);
end;
end.

