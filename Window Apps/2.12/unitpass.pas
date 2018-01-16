unit unitpass;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TFPassword }

  TFPassword = class(TForm)
    BCheck: TButton;
    BCancel: TButton;
    E1: TEdit;
    L1: TLabel;
    procedure BCancelClick(Sender: TObject);
    procedure BCheckClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FPassword: TFPassword;

implementation
Uses Unit1;

{$R *.lfm}

{ TFPassword }

procedure TFPassword.BCheckClick(Sender: TObject);
var i:integer;
begin
  i:=StrToInt(E1.text);
  If i=12345 then
  begin
    Form1.Show;
    Close;
    end
  else ShowMessage('Ошибка!');
  end;

procedure TFPassword.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

end;


procedure TFPassword.BCancelClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

