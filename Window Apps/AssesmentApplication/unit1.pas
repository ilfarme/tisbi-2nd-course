unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus, Unit2, Unit3, LMessages;

type

  { TLoginPage, TSelectTest }

  TLoginPage = class(TForm)
    ConfirmBtn: TButton;
    CancelBtn: TButton;
    UsernameEnter: TEdit;
    Welcome: TLabel;
    procedure CancelBtnClick(Sender: TObject);
    procedure ConfirmBtnClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: char);
    procedure FormShortCut(var Msg: TLMKey; var Handled: Boolean);
    procedure UsernameEnterChange(Sender: TObject);
    procedure WelcomeClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  LoginPage: TLoginPage;

implementation

{$R *.lfm}

{ TLoginPage }

procedure TLoginPage.WelcomeClick(Sender: TObject);
begin

end;

procedure TLoginPage.ConfirmBtnClick(Sender: TObject);
begin
  if LoginPage.UsernameEnter.Text = '' then
    ShowMessage('Введите имя, пожалуйста')
  else
  if LoginPage.UsernameEnter.Text = 'Например: Иван Иванов' then
    ShowMessage('Введите имя, пожалуйста')
  else
  begin
    SelectTest.Username.Caption := LoginPage.UsernameEnter.Text;
    SelectTest.ShowModal;
  end;
end;

procedure TLoginPage.FormKeyPress(Sender: TObject; var Key: char);
begin

end;

procedure TLoginPage.FormShortCut(var Msg: TLMKey; var Handled: Boolean);
begin

end;

procedure TLoginPage.UsernameEnterChange(Sender: TObject);
begin

end;

procedure TLoginPage.CancelBtnClick(Sender: TObject);
begin
  Close;
end;

end.
