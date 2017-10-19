program ArrayQueue;

const
  n = 2;
var
  First, Last, Count, menu: byte;
  a: array[0..n] of byte;

  procedure push;
  begin
    WriteLn;
    if (Count > n) then
      WriteLn('Очередь переполнена! Сначала удалите элемент(ы).');
    if (Count < n + 1) then
    begin
      a[Last] := 1 + random(13);
      WriteLn('Элемент [', a[Last], '] успешно добавлен.');
      Inc(Last);
      if (Last > n) then
        Last := 0;
      Inc(Count);
    end;
    WriteLn;
  end;

  procedure pop;
  begin
    WriteLn;
    if (Count = 0) then
      WriteLn('Удаление невозможно! Пустая очередь.');
    if (Count > 0) then
    begin
      WriteLn('Элемент [', a[First], '] успешно удалён.');
      a[First] := 0;
      Inc(First);
      if (First > n) then
        First := 0;
      Dec(Count);
    end;
    WriteLn;
  end;

  procedure isEmpty;
  begin
    WriteLn;
    if (Count = n + 1) then
      WriteLn('Очередь заполнена!')
    else if (Count > 0) then
      WriteLn('Очередь содержит элементы, но не заполнена.');
    if (Count = 0) then
      WriteLn('Очередь пуста!');
    WriteLn;
  end;

  procedure printQueue;
  var
    i: byte;
  begin
    WriteLn;
    Write('[');
    for i := 0 to n do
      Write(a[i], '|');
    Write(']');
    WriteLn;
  end;

begin
  randomize;
  First := 0;
  Last := 0;
  Count := 0;
  repeat
    WriteLn('1. Проверка пустоты/заполненности очереди');
    WriteLn('2. Добавление элемента в конец очереди');
    WriteLn('3. Удаление элемента из начала очереди');
    WriteLn('4. Вывод текущего состояния очереди на экран');
    WriteLn('5. Выход');
    WriteLn('6. Запасный выход');
    WriteLn('7. Аварийный выход');
    Write('Введите значение: ');
    ReadLn(menu);
    case menu of
      1: isEmpty;
      2: push;
      3: pop;
      4: printQueue;
    end;
  until menu = 5;
end.
