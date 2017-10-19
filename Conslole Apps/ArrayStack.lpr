program ArrayStack;
const n=3;

var
   Stack:array[0..n] of integer;
   SP,Temp: integer;
   menu:byte;

procedure push;
begin
  WriteLn;
  if SP <4 then begin
  Write('Введите значение нового элемента стека: ');
  ReadLn(Temp);
  Stack[SP]:=Temp;
  inc(SP);
  WriteLn('Элемент успешно добавлен.');
  end
  else writeln('Стек заполнен!');
  WriteLn;
end;

procedure pop;
begin
  WriteLn;
  if SP > 0 then begin
  dec(SP);
  WriteLn('Элемент ',Stack[SP],' удалён.');
  Stack[SP]:=0;
end
  else WriteLn('Стек пуст!');
  WriteLn;
end;

function isEmpty:boolean;
begin
  if SP = 0 then result:=true
  else result:=false;
  isEmpty:=result;
end;

function isFull:boolean;
begin
  if SP = 4 then result:=true
  else result:=false;
  isFull:=result;
end;

procedure show_stack;
var i:byte;
begin
  WriteLn;
  Write('ДНО СТЭКА [');
  for i:=0 to n do Write(' ',Stack[i]);
  Write(' ] ВЕРШИНА СТЕКА');
  WriteLn;
end;

BEGIN
  SP:=0;
  repeat
  WriteLn('1. Проверка пустоты стекового массива');
  WriteLn('2. Проверка заполненности стекового массива');
  WriteLn('3. Добавление элемента в вершину стека');
  WriteLn('4. Удаление элемента с вершины стека');
  WriteLn('5. Вывод текущего состояния стека на экран');
  Write('Введите значение: ');
  ReadLn(menu);
  case menu of
  1: begin
    WriteLn;
    if isEmpty = true then WriteLn('Стек пуст!')
    else WriteLn('Стек содержит элементы.');
    WriteLn
  end;
  2: begin
    WriteLn;
    if isFull = true then WriteLn('Стек заполнен!')
    else WriteLn('Стек не заполнен.');
    WriteLn;
  end;
  3: push;
  4: pop;
  5: show_stack;
  end;
  until menu = 6;
END.
