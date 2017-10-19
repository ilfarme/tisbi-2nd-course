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
      Write('��ઠ � ������ ���: ');
      ReadLn(stock[slot].model);
      Write('��� �஧����⢠: ');
      ReadLn(stock[slot].year);
      Write('����: ');
      ReadLn(stock[slot].price);
      WriteLn('��⮬����� �ᯥ譮 �������� � ����.');
      Inc(slot);
    end
    else
      WriteLn('� ���� ��� ᢮������ ���� ��� ���������� ������ ���!');
    WriteLn;
  end;

  procedure show_cars;
  begin
    WriteLn;
    for i:= 0 to slot-1 do
    begin
      Write(stock[i].model);
      Write(' ��� ���᪠: ',stock[i].year);
      WriteLn(' �� 業�: ',stock[i].price);
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
    Write('������ ������ ���: ');
    ReadLn(car_model);
    WriteLn;
    for i := 0 to slot do
      if stock[i].model = car_model then
      begin
        WriteLn(stock[i].model, ' ', stock[i].year, ' �� 業� ', stock[i].price);
        Inc(j);
      end;
    WriteLn('�ᥣ� �������: ', j);
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
      Write(' ��� ���᪠: ',stock[j].year);
      WriteLn(' �� 業�: ',stock[j].price);
    end;
    WriteLn;
end;

begin
  slot := 0;
  repeat
    WriteLn('1. �������� ���');
    WriteLn('2. �������� ��� � ����稨');
    WriteLn('3. ���� ���');
    WriteLn('4. ��஦� 500 �����');
    WriteLn('5. ��室');
    Write('������ ���祭��: ');
    ReadLn(menu);
    case menu of
      1: add_car;
      2: show_cars;
      3: search;
      4: higherthan500;
    end;
  until menu = 5;
end.
