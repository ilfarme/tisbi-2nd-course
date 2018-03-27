program SortMethods;

const
  n = 10001;
type
  arr = array [1..n] of integer;
var
  mas: arr;
  average, compare, changes, i, j, k: integer;
  menu: byte;

  procedure Print;
  begin
    for i := 1 to k do
      Write(mas[i]:4, ' ');
    WriteLn;
    WriteLn;
    Write('Число сравнений: ', compare, ' ');
    WriteLn('Число перестановок: ', changes);
    WriteLn;
  end;

  procedure BubbleSort;
  var
    Temp: integer;
  begin
    compare := 0;
    changes := 0;
    for i := 2 to k do
    begin
      for j := k downto i do
      begin
        compare := compare + 1;
        if mas[j - 1] > mas[j] then
        begin
          changes := changes + 1;
          temp := mas[j - 1];
          mas[j - 1] := mas[j];
          mas[j] := temp;
        end;
      end;
    end;
    WriteLn('Успешно отсортировано:');
    Print;
    WriteLn;
  end;

  procedure InsertMethod;
  var
    temp: integer;
  begin
    compare := 0;
    changes := 0;
    for i := 2 to k do
    begin
      temp := mas[i];
      j := i - 1;
      while (j > 0) and (temp < mas[j]) do
      begin
        mas[j + 1] := mas[j];
        j := j - 1;
        compare := compare + 1;
        changes := changes + 1;
      end;
      mas[j + 1] := temp;
    end;
    WriteLn('Успешно отсортировано:');
    Print;
    WriteLn;
  end;

  procedure SelectMethod;
  var
    temp, b: integer;
  begin
    compare := 0;
    changes := 0;
    for i := 1 to k - 1 do
    begin
      b := i;
      temp := mas[i];
      for j := i + 1 to k do
      begin
        if mas[j] < temp then
        begin
          b := j;
          temp := mas[j];
        end;
        compare := compare + 1;
      end;
      if mas[i] <> mas[b] then
        changes := changes + 1;
      mas[b] := mas[i];
      mas[i] := temp;
    end;
    WriteLn('Успешно отсортировано:');
    Print;
    WriteLn;
  end;

  procedure MQuickSort;
  var
    temp: integer;
    procedure QuickSort(left, right: integer);
    begin
      i := left;
      j := right;
      if mas[i] > mas[j] then
      begin
        temp := mas[i];
        mas[i] := mas[j];
        mas[j] := temp;
      end;
      if mas[(i + j) div 2] > mas[j] then
      begin
        temp := mas[(i + j) div 2];
        mas[(i + j) div 2] := mas[j];
        mas[j] := temp;
      end;
      if mas[i] > mas[(i + j) div 2] then
      begin
        temp := mas[i];
        mas[i] := mas[(i + j) div 2];
        mas[(i + j) div 2] := temp;
      end;
      average := mas[(i + j) div 2];
      repeat
        compare := compare + 1;
        while (mas[i] < average) do
          i := i + 1;
        compare := compare + 1;
        while (mas[j] > average) do
          j := j - 1;
        if (i <= j) then
        begin
          changes := changes + 1;
          temp := mas[i];
          mas[i] := mas[j];
          mas[j] := temp;
          i := i + 1;
          j := j - 1;
        end;
      until (i > j);
      if (left < j) then
        QuickSort(left, j);
      if (i < right) then
        QuickSort(i, right);
    end;

  begin
    compare := 0;
    changes := 0;
    QuickSort(1, k);
    WriteLn('Успешно отсортировано:');
    Print;
  end;

  procedure Init;
  begin
    WriteLn('Максимально допустимый размер массива: ', n-1);
    Write('Введите размерность массива: ');
    ReadLn(k);
    WriteLn;
    for i := 1 to k do
      mas[i] := random(201) - 100;
    for i := 1 to k do
      Write(mas[i]:4, ' ');
    ReadLn;
  end;

begin
  Randomize;
  WriteLn('Эта программа демонстрирует работу простейших алгоритмов сортировки.');
  WriteLn('Сейчас будет сгенерирован случайный массив данных. Нажмите Enter, чтобы продолжить.');
  ReadLn;
  Init;
  WriteLn;
  repeat
    WriteLn('Работа с исходными данными: ');
    WriteLn('1. Создать массив случайных чисел');
    WriteLn('2. Вывести массив на экран');
    WriteLn;
    WriteLn('Выбор метода сортировки:');
    WriteLn('3. Методом обмена');
    WriteLn('4. Методом вставок');
    WriteLn('5. Методом выбора');
    WriteLn('6. Быстрая сортировка');
    WriteLn('7. Выход');
    Write('Введите значение: ');
    ReadLn(menu);
    WriteLn;
    case menu of
      1: Init;
      2: Print;
      3: BubbleSort;
      4: InsertMethod;
      5: SelectMethod;
      6: MQuickSort;
    end;
  until menu = 7;
end.
