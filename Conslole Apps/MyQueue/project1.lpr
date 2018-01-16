program project1;

type
  pQueueItem = ^TQueueItem;

  TQueueItem = record
    info: integer;
    Next: pQueueItem;
  end;

var
  pFirst, pLast, pTemp: pQueueItem;
  menu, a: integer;

  procedure print;
  begin
    writeln;
    pTemp := pFirst^.Next;
    Write('Элементы очереди: НАЧАЛО [');
    while pTemp <> nil do
    begin
      Write(pTemp^.info, ' ');
      pTemp := pTemp^.Next;
    end;
    WriteLn('] КОНЕЦ');
    writeln;
  end;

  procedure isEmpty;
  begin
    WriteLn;
    if pFirst = pLast then
      WriteLn('Очередь не содержит элементов.')
    else
      WriteLn('Очередь содержит элементы.');
    WriteLn;
  end;

  procedure push;
  begin
    writeln;
    new(pTemp);
    Write('Введите значение добавляемого элемента: ');
    ReadLn(a);
    pTemp^.info := a;
    pTemp^.Next := nil;
    pLast^.Next := pTemp;
    pLast := pTemp;
    WriteLn('Элемент [', a, '] успешно добавлен.');
    WriteLn;
  end;

  procedure pop;
  begin
    WriteLn;
    if pFirst = pLast then
    begin
      writeln;
      writeln('Очередь не содержит элементов.');
    end
    else
    begin
      pTemp := pFirst;
      WriteLn('Элемент успешно удалён!');
      pFirst := pFirst^.Next;
      if pFirst = nil then
        pLast := nil;
      dispose(pTemp);
    end;
    WriteLn;
  end;

begin
  new(pFirst);
  pFirst^.Next := nil;
  pLast := pFirst;

  repeat
    WriteLn('1. Проверка пустоты');
    WriteLn('2. Добавление элемента в конец очереди');
    WriteLn('3. Удаление элемента из начала очереди');
    WriteLn('4. Вывод текущего состояния очереди на экран');
    WriteLn('5. Выход');
    Write('Введите значение: ');
    ReadLn(menu);
    case menu of
      1: isEmpty;
      2: push;
      3: pop;
      4: print;
    end;
  until menu = 5;
end.
