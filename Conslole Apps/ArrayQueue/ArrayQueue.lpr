program ArrayQueue;
const n = 2;
Var
  First, Last, menu:byte;
  a:array[0..n] of byte;

Procedure push;
Begin
  if (Last < n+1) then
    begin
      a[Last]:=random(10);
      inc(Last);
      WriteLn('Элемент успешно занесён в очередь.')
    end else Last:=0
End;

Procedure pop;
Begin
  if (First = Last = true) then WriteLn('Очередь пуста!')
  else begin
  a[First]:=0;
  inc(First);
  end;
End;

procedure isEmpty;
begin
  if (First = Last = true) then WriteLn('Очередь пуста!')
  else WriteLn('Очередь содержит элементы.')
end;
procedure isFull;
begin
if (Last = n) then WriteLn('Очередь заполнена!')
else if (First = Last = true) then WriteLn('Очередь пуста!')
  else WriteLn('Очередь не заполнена но содержит элементы')
end;

procedure printQueue;
var i:byte;
begin
WriteLn;
Write('[ ');
 For i:=0 to n do Write(a[i]);
 Write(' ]');
end;

BEGIN
  repeat
  WriteLn('1. Проверка пустоты');
  WriteLn('2. Проверка заполненности очереди');
  WriteLn('3. Добавление элемента в конец очереди');
  WriteLn('4. Удаление элемента из начала очереди');
  WriteLn('5. Вывод текущего состояния очереди на экран');
  WriteLn('6. Выход');
  WriteLn('7. Запасный выход');
  WriteLn('8. Аварийный выход');
  Write('Введите значение: ');
  ReadLn(menu);
  case menu of
  1: isEmpty;
  2: isFull;
  3: push;
  4: pop;
  5: printQueue;
  end;
  until menu=6;
END.
