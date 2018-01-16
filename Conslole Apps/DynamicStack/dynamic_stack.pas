program dynamic_stack;

type
  pStackItem = ^TStackItem;

  TStackItem = record
    info: integer;
    pred: pStackItem;
  end;

var
  sp, pTemp: pStackItem;
  menu, a: integer;

  procedure print;
  begin
    writeln;
    pTemp := sp;
    WriteLn('Элементы стека: ');
    Write(' [');
    while pTemp <> nil do
    begin
      Write(pTemp^.info, ' ');
      pTemp := pTemp^.pred;
    end;
    Write('] ');
    writeln;
    writeln;
  end;

  procedure proverka;
  begin
    writeln;
    if sp = nil then
    begin
      writeln('Cтек пуст!');
      writeln;
    end
    else
    begin
      writeln('Стек содержит элементы');
    end;
  end;

  procedure push;
  begin
    writeln;
    new(pTemp);
    Write('Введите значение нового элемента: ');
    readln(a);
    pTemp^.info := a;
    pTemp^.pred := sp;
    sp := pTemp;
  end;

  procedure pop;
  begin
    if sp = nil then
    begin
      writeln;
      writeln('Стек пуст!');
    end
    else
    begin
      pTemp := sp;
      sp := pTemp^.pred;
      dispose(pTemp);
    end;
  end;

begin
  sp := nil;
  repeat
    writeln('1. Проверка пустоты');
    writeln('2. Добавление элемента на вершину стека');
    writeln('3. Удаление элемента с вершины стека');
    writeln('4. Аварийный выход');
    Write('Введите значение: ');
    readln(menu);
    case menu of
      1: proverka;
      2: push;
      3: pop;
      4: print;
    end;
  until menu = 5;
end.
