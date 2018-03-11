program project1;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  hsize = 10; //размер таблицы

type
  PocketArr = record
    Key: integer;
    Str: string;
  end;

type
  pList = ^TList;
  TList = record
    elt: string;
    npt: pList;
  end;

  ListFL = record
    First, Last: pList;
    Str: string;
  end;

var
  HashTable: array [0..hsize] of ListFL;
  Cmp: integer;

  function AddToDList(var obj: ListFL; elt: string): integer;
  var
    Res: integer;
    pTemp: pList;
  begin
    Res := 0;
    if obj.First = nil then
    begin
      New(pTemp);
      pTemp^.elt := elt;
      obj.First := pTemp;
      obj.Last := pTemp;
      Res := 1;
    end
    else
    begin
      New(pTemp);
      pTemp^.elt := elt;
      obj.Last^.npt := pTemp;
      obj.Last := pTemp;
    end;
    Result := Res;
  end;

  procedure PrintList(obj: ListFL);
  var
    pCurrent: pList;
  begin
    if obj.First <> nil then
    begin
      pCurrent := obj.First;
      while pCurrent <> nil do
      begin
        Write(pCurrent^.elt, ' ');
        pCurrent := pCurrent^.npt;
      end;
    end
    else
      Write('Пусто');
  end;

  function FindList(str: string; obj: ListFL): boolean;
  var
    pCurrent: pList;
    Res: boolean;
  begin
    Res := False;
    if obj.First <> nil then
    begin
      pCurrent := obj.First;
      while pCurrent <> nil do
      begin
        Inc(cmp);
        if pCurrent^.elt = Str then
        begin
          Res := True;
          break;
        end;
        pCurrent := pCurrent^.npt;
      end;
    end
    else
      Res := False;
    Result := Res;
  end;

  procedure PrintArrayList(obj: array of ListFL);
  var
    i: integer;
  begin
    for i := 0 to High(obj) do
    begin
      Write(i, ': ');
      Write(obj[i].Str, ' ');
      PrintList(HashTable[i]);
      writeln;
    end;
  end;

  function Hash(str: string): integer;
  var
    Sum, i, Len, Res: integer;
  begin
    Sum := 0;
    Len := Length(str);
    for i := 1 to Len do
      Sum := Sum + Ord(str[i]);
    Res := Sum mod (High(HashTable) + 1);
    Result := Res;
  end;

  function AddToHash(str: string; var arr: array of ListFL): integer;
  var
    hsh: integer;
  begin
    hsh := Hash(str);
    Result := hsh;
    if arr[hsh].Str = '' then
      arr[hsh].Str := str
    else
    begin
      if arr[hsh].Str <> str then
        AddToDList(arr[hsh], str);
    end;
  end;

  function DelFromDList(str: string; var obj: ListFL): integer;
  var
    pCurt, pPrev: pList;
    Res: integer;
  begin
    pCurt := obj.First;
    while (pCurt <> nil) and (pCurt^.elt <> str) do
    begin
      pprev := pCurt;
      pCurt := pCurt^.npt;
    end;
    if pCurt <> nil then
    begin
      if obj.First = pCurt then
      begin
        obj.First := pCurt^.npt;
        Dispose(pCurt);
      end
      else
      begin
        pPrev^.npt := pCurt^.npt;
        Dispose(pCurt);
      end;
      Res := 1;
    end
    else
      Res := 0;
    Result := Res;
  end;

  function DelFromHash(str: string; var arr: array of ListFL): integer;
  var
    hsh, res: integer;
    pTemp: pList;
  begin
    hsh := Hash(str);
    Res := 0;
    if str = arr[hsh].Str then
    begin
      if arr[hsh].First = nil then
        arr[hsh].Str := ''
      else
      begin
        pTemp := arr[hsh].First;
        arr[hsh].First := pTemp^.npt;
        arr[hsh].Str := pTemp^.elt;
        Dispose(pTemp);
      end;
      Res := 1;
    end
    else if DelFromDList(str, arr[hsh]) = 1 then
      Res := 1;
    Result := Res;
  end;

  function FindInHash(str: string; arr: array of ListFL): integer;
  var
    hsh, r: integer;
  begin
    hsh := Hash(str);
    cmp := 0;
    Inc(cmp);
    if str = arr[hsh].Str then
      R := hsh
    else
    begin
      if FindList(str, arr[hsh]) = True then
        R := hsh
      else
        R := -1;
    end;
    writeln(cmp);
    Result := R;
  end;

  procedure ShowMenu;
  begin
    WriteLn('1. Добавить элемент');
    WriteLn('2: Удалить элемент');
    WriteLn('3: Найти элемент');
    WriteLn('4: Напечатать таблицу на экран');
    WriteLn('5: Выход');
  end;

  procedure Command;
  var
    num: integer;
    menu: byte;
    str: string;
  begin
    Write('Введите значение: ');
    ReadLn(menu);
    case menu of
      1:
      begin
        str := '';
        while str = '' do
        begin
          Write('Введите строку: ');
          ReadLn(str);
        end;
        num := AddToHAsh(str, HashTable);
        if num = -1 then
          WriteLn('Добавление отменено.')
        else
          WriteLn('Добавление успешно значение хэша: ',num);
      end;
      2:
      begin
        Write('Введите строку: ');
        ReadLn(str);
        if DelFromHash(str, HashTable) = 0 then
          WriteLn('404: Not Found')
        else
          WriteLn('Элемент успешно удалён');
      end;
      3:
      begin
        Write('Введите строку: ');
        ReadLn(str);
        num := FindInHash(str, HashTable);
        if num = -1 then
          WriteLn('404: Not Found')
        else
          WriteLn('Элемент существует под ключём ', num);
      end;
      4: PrintArrayList(HashTable);
      5: Exit;
    end;
    WriteLn;
    ShowMenu;
    Command;
  end;

begin
  ShowMenu;
  Command;
end.
