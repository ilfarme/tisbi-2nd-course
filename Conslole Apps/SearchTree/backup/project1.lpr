program project1;

type
  pSTreeNode = ^TSTreeNode;

  TSTreeNode = record
    key, kol: integer;
    left: pSTreeNode;
    right: pSTreeNode;
    //добавить ещё одно поле для добавления неуникальных узлов
    //чтобы не сломалась структура
  end;

var
  pRoot, pResult, pParent, pTemp: pSTreeNode;
  menu: byte;
  sKey, NewKey, kol_i: integer;
  //NodeInfo:Char; //Информационное поле добавляемой вершины

  function Search(akey: integer): pSTreeNode;
  begin
    pTemp := pRoot;
    Result := nil;
    while (pTemp <> nil) do
    begin
      if (akey = pTemp^.key) then
      begin
        WriteLn('Элемент найден: ', pTemp^.key);
        Result := pTemp;
        break;
      end
      else if (akey < pTemp^.key) then
      begin
        pParent := pTemp;
        pTemp := pTemp^.left;
      end
      else
      begin
        pParent := pTemp;
        pTemp := pTemp^.right;
      end;
    end;
  end;

  procedure AddNode(var pTemp: pSTreeNode; akey: integer);
  begin
    if (pTemp = nil) then
    begin
      New(pTemp);
      pTemp^.key := akey;
      pTemp^.left := nil;
      pTemp^.right := nil;
      pTemp^.kol := 1;
      kol_i := pTemp^.kol;
    end
    else if (akey < pTemp^.key) then
      AddNode(pTemp^.left, akey)
    else if (akey > pTemp^.key) then
      AddNode(pTemp^.right, akey)
    //обработка неуникального ключа
    else
    begin
      WriteLn('Такой ключ уже существует! Добавляю неуникальный ключ.');
      New(pTemp);
      pTemp^.key := akey;
      pTemp^.left := nil;
      pTemp^.right := nil;
      pTemp^.kol := kol_i + 1;
      kol_i := pTemp^.kol;
    end;
  end;

  procedure Print(pTemp: pSTreeNode; tabs: integer);
  var
    i: integer;
  begin
    if (pTemp <> nil) then
      with pTemp^ do
      begin
        Print(pTemp^.left, tabs + 6);
        for i := 0 to tabs do
          Write(' ');
        WriteLn('    /');
        for i := 0 to tabs do
          Write(' ');
        WriteLn('   /');
        for i := 0 to tabs do
          Write(' ');
        WriteLn('  ', pTemp^.key, ' (', pTemp^.kol, ')');
        for i := 0 to tabs do
          Write(' ');
        WriteLn('   \');
        for i := 0 to tabs do
          Write(' ');
        WriteLn('    \');
        Print(pTemp^.right, tabs + 6);
      end;
  end;

  procedure Pop(sKey: integer);
  var pRTemp:pSTreeNode;
  begin
    if (Search(sKey) <> nil) then
    begin
      if (pTemp^.left = nil) and (pTemp^.right = nil) then
      begin //если вершина терминальная
        WriteLn;
        WriteLn('Вершина терминальная, удаляю.');
        WriteLn('Родителем является: ', pParent^.key);
        if pParent^.left = pTemp then
          pParent^.left := nil;
        if pParent^.right = pTemp then
          pParent^.right := nil;
        WriteLn('Успешно удалено.');
        WriteLn;
      end //если у вершины есть хотя бы один потомок
      else if (pTemp^.left = nil) xor (pTemp^.right = nil) then
      begin
        WriteLn;
        WriteLn('У вершины есть один потомок, удаляю безопасным методом.');
        WriteLn('Родителем является: ', pParent^.key);
        if (pTemp^.left = nil) then
        begin
          pParent^.right := pTemp^.right;
          pTemp^.right := nil;
        end;
        if (pTemp^.right = nil) then
        begin
          pParent^.left := pTemp^.left;
          pTemp^.left := nil;
        end;
        WriteLn('Успешно удалено.');
        WriteLn;
      end
      else if (pParent^.left <> nil) and (pParent^.right <> nil) then
      begin //если у вершины есть оба потомка
        WriteLn;
        WriteLn('У вершины есть два потомка: удаляю методом замены.');
        WriteLn('Родителем является: ', pParent^.key);
        pRTemp:=pTemp^.left;
        while (pRTemp <> nil) do
        begin
          if (pRTemp^.right = nil) then break;
          pParent:=pRTemp;
          Pop(pRTemp^.key);
        end;
      end;
    end
    else
    begin
      WriteLn;
      WriteLn('404: Вершина не найдена.');
      WriteLn;
    end;
  end;

begin
  repeat
    WriteLn('1. Поиск вершины с заданным значением ключа');
    WriteLn('2. Добавление новой вершины');
    WriteLn('3. Нарисовать дерево в консоли');
    WriteLn('4. Удаление вершины с заданным значением ключа');
    WriteLn('5. Выход из программы');
    Write('Введите значение: ');
    ReadLn(menu);
    case menu of
      1:
      begin
        WriteLn;
        Write('Введите значение ключа для поиска: ');
        ReadLn(sKey);
        pResult := Search(sKey);
        WriteLn(pResult^.key);
      end;
      2:
      begin
        Write('Введите ключ добавляемого элемента: ');
        ReadLn(NewKey);
        AddNode(pRoot, NewKey);
        WriteLn('Успешно добавлено.');
        WriteLn;
      end;
      3: Print(pRoot, 0);
      4:
      begin
        Write('Введите ключ вершины для удаления: ');
        ReadLn(sKey);
        Pop(sKey);
      end;
    end;
  until menu = 5;
end.
