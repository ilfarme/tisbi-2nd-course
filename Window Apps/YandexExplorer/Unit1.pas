unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.OleCtrls, SHDocVw, Vcl.ToolWin;

type
  TForm1 = class(TForm)
    ToolBar1: TToolBar;
    WebBrowser1: TWebBrowser;
    Edit1: TEdit;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    Button1: TButton;
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton6Click(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses Unit2;

procedure TForm1.Button1Click(Sender: TObject);
begin
Form2.ShowModal;
end;

procedure TForm1.ToolButton10Click(Sender: TObject);
begin
  WebBrowser1.GoHome;
end;

procedure TForm1.ToolButton1Click(Sender: TObject);
begin
WebBrowser1.Navigate(Edit1.Text); //��������� �� ����� ��������
end;

procedure TForm1.ToolButton3Click(Sender: TObject);
begin
WebBrowser1.GoForward;
end;

procedure TForm1.ToolButton4Click(Sender: TObject);
begin
WebBrowser1.GoBack;
end;

procedure TForm1.ToolButton6Click(Sender: TObject);
begin
WebBrowser1.Refresh;
end;

procedure TForm1.ToolButton8Click(Sender: TObject);
begin
WebBrowser1.Stop;
end;

end.
