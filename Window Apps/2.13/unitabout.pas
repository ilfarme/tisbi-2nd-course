unit unitAbout;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type

  { TFAbout }

  TFAbout = class(TForm)
    BClose: TButton;
    Img1: TImage;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    Pan1: TPanel;
    Pan2: TPanel;
    Pan3: TPanel;
    Pan4: TPanel;
    Timer: TTimer;
    procedure BCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure L1Click(Sender: TObject);
    procedure L2Click(Sender: TObject);
    procedure L3Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FAbout: TFAbout;

implementation

{$R *.lfm}

{ TFAbout }

procedure TFAbout.BCloseClick(Sender: TObject);
begin
  close;
end;

procedure TFAbout.FormCreate(Sender: TObject);
begin

end;

procedure TFAbout.L1Click(Sender: TObject);
begin

end;

procedure TFAbout.L2Click(Sender: TObject);
begin

end;

procedure TFAbout.L3Click(Sender: TObject);
begin

end;

end.

