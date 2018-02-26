﻿unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Timer1: TTimer;
    Label1: TLabel;
    SumClick: TLabel;
    Label2: TLabel;
    Time: TLabel;
    Timer2: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
Time.Caption:='15';
if Timer1.Enabled=false then
begin
Button1.Caption:='Поймай меня!';
Timer1.Enabled:=true;
Timer2.Enabled:=true;
end
else
SumClick.Caption:=IntToStr(StrToInt(SumClick.Caption)+1);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
Button1.Left:=random(form1.ClientWidth-button1.Width);
Button1.Top:=random(form1.ClientHeight-button1.Height);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin
if StrToInt(Time.Caption)>0 then
Time.Caption:=IntToStr(StrToInt(Time.Caption)-1)
else
begin
Timer1.Enabled:=false;
Timer2.Enabled:=false;
Button1.Left:=144;
Button1.Top:=152;
Button1.Caption:='Повторить';
if SumClick.Caption='0' then
ShowMessage('Вы проиграли!')
else
ShowMessage('Поздравляем! Вы выиграли и поймали кнопку '+SumClick.Caption+' раз');
end;
end;

end.
