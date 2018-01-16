unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, DateTimePicker, Forms, Controls, Graphics,
  Dialogs, ExtCtrls, Spin, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    BSave: TButton;
    BCancel: TButton;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    E1: TEdit;
    E2: TEdit;
    L1: TLabel;
    L2: TLabel;
    L3: TLabel;
    L4: TLabel;
    L5: TLabel;
    L6: TLabel;
    L7: TLabel;
    L8: TLabel;
    P1: TPanel;
    P2: TPanel;
    SpinEdit1: TSpinEdit;
    SpinEdit2: TSpinEdit;
    SpinEdit3: TSpinEdit;
    procedure BCancelClick(Sender: TObject);
    procedure BSaveClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.BCancelClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TForm2.BSaveClick(Sender: TObject);
begin
   ModalResult:=mrOK;
end;


end.

