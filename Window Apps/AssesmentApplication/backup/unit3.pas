unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Menus;

type

  { TTest }

  TTest = class(TForm)
    ConfirmBtn: TButton;
    Answer: TEdit;
    EnterAnswer: TLabel;
    QuestionCounter: TLabel;
    QuestionText: TLabel;
    Question: TLabel;
    procedure ConfirmBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure QuestionTextClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

  const n = 5; //количество вопросов
        INFO_QUESTIONS_TXT = 'InfoQuestionsDatabase.txt';
        INFO_ANSWERS_TXT = 'InfoAnswersDatabase.txt';

        MATH_QUESTIONS_TXT = 'MathQuestionsDatabase.txt';
        MATH_ANSWERS_TXT = 'MathAnswersDatabase.txt';

        RESULTS_TXT = 'TestResults.txt';

var
  Test: TTest;
  InformaticsDatabase:array[1..n] of string;
  QuestionNum,TrueAnswers,FalseAnswers:byte;
  ThisQuestion, ThisAnswer:string;
  Questions,Answers,TestResults:text;
  isMath,isInfo:boolean;
implementation
 uses Unit1, Unit2, Unit5;
{$R *.lfm}

{ TTest }

procedure TTest.FormCreate(Sender: TObject);
begin

end;

procedure TTest.QuestionTextClick(Sender: TObject);
begin

end;

procedure TTest.ConfirmBtnClick(Sender: TObject);
begin
  //проверка ответа на вопрос
  ReadLn(Answers, ThisAnswer);
  WriteLn(TestResults,Answer.Text);
  If ThisAnswer = Answer.Text
  then Inc(TrueAnswers)
  else Inc(FalseAnswers);
  //смена вопроса
  If EOF(Questions) then begin
  Question.Caption:='';
  QuestionCounter.Caption:='';
  QuestionText.Caption:='Тест завершён.';
  Results.ShowModal;
  CloseFile(TestResults);
  end
  else begin
  Inc(QuestionNum);
  QuestionCounter.Caption:=IntToStr(QuestionNum);
  ReadLn(Questions, ThisQuestion);
  QuestionText.Caption:=ThisQuestion;
  end;
end;

procedure TTest.FormActivate(Sender: TObject);
const
      RESULTS_HEADER = 'Результаты теста по ';
      MATH = 'Математике';
      INFO = 'Информатике';
begin
  AssignFile(TestResults, RESULTS_TXT);
  Append(TestResults);
  WriteLn(TestResults);
  WriteLn(TestResults);
  WriteLn(TestResults, LoginPage.UsernameEnter.Text);
  Write(TestResults, RESULTS_HEADER);
  If isInfo = True then begin
  AssignFile(Questions, INFO_QUESTIONS_TXT);
  AssignFile(Answers, INFO_ANSWERS_TXT);
  WriteLn(TestResults, MATH);
  end;
  If isMath = True then begin
  AssignFile(Questions, MATH_QUESTIONS_TXT);
  AssignFile(Answers, MATH_ANSWERS_TXT);
  WriteLn(TestResults, INFO);
  end;
  Reset(Questions);
  Reset(Answers);
  QuestionNum:=1;
  QuestionCounter.Caption:=IntToStr(QuestionNum);
  TrueAnswers:=0;
  FalseAnswers:=0;
  ReadLn(Questions, ThisQuestion);//пропускаем заголовочную информацию файла вопросов
  ReadLn(Answers, ThisAnswer);//пропускаем заголовочную информацию файла ответов
  ReadLn(Questions, ThisQuestion);
  QuestionText.Caption:=ThisQuestion;
end;

end.

