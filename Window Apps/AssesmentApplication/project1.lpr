program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, Unit2, Unit3, Unit5, Unit4
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TLoginPage, LoginPage);
  Application.CreateForm(TSelectTest, SelectTest);
  Application.CreateForm(TTest, Test);
  Application.CreateForm(TResults, Results);
  Application.CreateForm(TUserResults, UserResults);
  Application.Run;
end.

