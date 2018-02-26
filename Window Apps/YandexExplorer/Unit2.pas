unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.OleCtrls, SHDocVw, Vcl.StdCtrls,
  Vcl.ToolWin, Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    ToolBar1: TToolBar;
    Button1: TButton;
    Button2: TButton;
    WebBrowser1: TWebBrowser;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
WebBrowser1.Navigate('www.yandex.ru');
end;

procedure TForm2.Button2Click(Sender: TObject);
var
i:integer;
s: String;
html_tag: Variant;
begin
	  html_tag:= WebBrowser1.OleObject.Document.forms.item(0).elements;
	  for i:=0 to (html_tag.Length-1) do
	  begin
	    if html_tag.item(i).name = 'login' then  //ищем элемент с именем "login"11	      html_tag.item(i).value:= 'thedelphi';  //и присваиваем ему значение

	    if html_tag.item(i).name = 'passwd' then  //ищем элемент с именем "passwd"14	      html_tag.item(i).value:= 'delphi';  //и присваиваем ему значение

	    if html_tag.item(i).value = 'Войти' then //ищем элемент со значением "Войти"
	      html_tag.item(i).click;  // и нажимаем на него
  end;

end;

end.
