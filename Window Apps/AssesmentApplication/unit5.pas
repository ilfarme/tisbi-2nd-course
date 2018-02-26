unit Unit5;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TResults }

  TResults = class(TForm)
    TrueAnswersResult: TLabel;
    Fails: TLabel;
    TrueAnswersAmount: TLabel;
    CloseResultBtn: TButton;
    AmountOfQuestions: TLabel;
    QuestionsAmount: TLabel;
    Results: TLabel;
    TrueAnswersAmount1: TLabel;
    YourResult: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure CloseResultBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Results: TResults;

implementation
 uses Unit3;
{$R *.lfm}

{ TResults }

procedure TResults.FormCreate(Sender: TObject);
begin

end;

procedure TResults.FormActivate(Sender: TObject);
var Ocenka:real;
begin
  QuestionsAmount.Caption:=IntToStr(QuestionNum);
  TrueAnswersResult.Caption:=IntToStr(TrueAnswers);
  Fails.Caption:=IntToStr(FalseAnswers);
  //Вычисляем оценку
  Ocenka:=(TrueAnswers*100)/QuestionNum; //вес правилных ответов
  Results.Caption:=FloatToStr(Ocenka)+'%';
end;

procedure TResults.CloseResultBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TResults.Button1Click(Sender: TObject);
begin

end;

end.

