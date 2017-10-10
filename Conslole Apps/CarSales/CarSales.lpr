program car_sales;

const
  n = 19;
type
  car = record
    model: string[60];
    year: integer;
    price: integer;
  end;
var
  stock: array[0..n] of car;
  slot, i, menu: byte;

  procedure add_car;
  begin
    if slot < n then
    begin
      WriteLn;
      Write('Марка и модель авто: ');
      ReadLn(stock[slot].model);
      Write('Год прозводства: ');
      ReadLn(stock[slot].year);
      Write('Цена: ');
      ReadLn(stock[slot].price);
      WriteLn('Автомобиль успешно добавлен в базу.');
      Inc(slot);
    end
    else
      WriteLn('В базе нет свободных мест для добавления нового авто!');
    WriteLn;
  end;

  procedure show_cars;
  begin
    WriteLn;
    for i:= 0 to slot-1 do
    begin
      Write(stock[i].model);
      Write(' год выпуска: ',stock[i].year);
      WriteLn(' по цене: ',stock[i].price);
      WriteLn;
    end;
    WriteLn;
    WriteLn;
  end;

  procedure search;
  var
    car_model: string[50];
    j: byte;
  begin
    j := 0;
    Write('Напишите модель авто: ');
    ReadLn(car_model);
    WriteLn;
    for i := 0 to slot do
      if stock[i].model = car_model then
      begin
        WriteLn(stock[i].model, ' ', stock[i].year, ' по цене ', stock[i].price);
        Inc(j);
      end;
    WriteLn('Всего найдено: ', j);
    WriteLn;
  end;

  procedure higherthan500;
  var
    j: byte;
  begin
    WriteLn;
    for j:= 0 to slot-1 do
    if stock[j].price > 500000 then
    begin
      Write(stock[j].model);
      Write(' год выпуска: ',stock[j].year);
      WriteLn(' по цене: ',stock[j].price);
    end;
    WriteLn;
end;

begin
  slot := 0;
  repeat
    WriteLn('1. Добавить авто');
    WriteLn('2. Показать авто в наличии');
    WriteLn('3. Поиск авто');
    WriteLn('4. Дороже 500 тысяч');
    WriteLn('5. Выход');
    Write('Введите значение: ');
    ReadLn(menu);
    case menu of
      1: add_car;
      2: show_cars;
      3: search;
      4: higherthan500;
    end;
  until menu = 5;
end.
