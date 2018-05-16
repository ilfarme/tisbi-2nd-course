program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, circle, Unit3, p_circle, figures, ellipse, container
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Контейнер-массив графических '
    +'объектов';
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.

