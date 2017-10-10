program uniq_mass;
const n=19;
var a: array[0..N] of integer;
  menu:byte;

procedure gen_mas;
var i:byte;
begin
   WriteLn;
   for i:=0 to n do begin
     a[i]:=random(10);
     end;
   WriteLn('Массив успешно сгенерирован.');
   WriteLn;
end;

procedure show_mas;
var i:byte;
begin
   WriteLn;
   WriteLn('Вывожу массив...');
   Write('[ ');
   for i:=0 to N do begin
      Write(a[i], ' ');
      end;
   Write(']');
   WriteLn;
end;

procedure search_mas;
var uniq:boolean;
  i, j:byte;
begin
   WriteLn;
   Write('Уникальные элементы: ');
   for i:=0 to n do begin
      uniq:=true;
      for j:=0 to n do
         if (a[i] = a[j]) and (i <> j) then begin
            uniq:=false;
            break;
         end;
      if uniq = True then Write(a[i],' ');
      end;
   WriteLn;writeln;
end;



BEGIN
randomize;
repeat
  writeln('1. Генерация массива.');
  writeln('2. Вывод массива.');
  writeln('3. Поиск уникального элемента.');
  writeln('4. Выход.');
  Write('Введите значение: ');
  ReadLn(menu);
  case menu of
  1:gen_mas;
  2:show_mas;
  3:search_mas;
  end;
  until menu=4;
END.
