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
  Write('������ ���祭�� ������ ����� �⥪�: ');
  ReadLn(Temp);
  Stack[SP]:=Temp;
  inc(SP);
  WriteLn('������� �ᯥ譮 ��������.');
  end
  else writeln('�⥪ ��������!');
  WriteLn;
end;

procedure pop;
begin
  WriteLn;
  if SP > 0 then begin
  dec(SP);
  WriteLn('������� ',Stack[SP],' 㤠��.');
  Stack[SP]:=0;
end
  else WriteLn('�⥪ ����!');
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
  Write('��� ����� [');
  for i:=0 to n do Write(' ',Stack[i]);
  Write(' ] ������� �����');
  WriteLn;
end;

BEGIN
  SP:=0;
  repeat
  WriteLn('1. �஢�ઠ ������ �⥪����� ���ᨢ�');
  WriteLn('2. �஢�ઠ ������������ �⥪����� ���ᨢ�');
  WriteLn('3. ���������� ����� � ���設� �⥪�');
  WriteLn('4. �������� ����� � ���設� �⥪�');
  WriteLn('5. �뢮� ⥪�饣� ���ﭨ� �⥪� �� �࠭');
  Write('������ ���祭��: ');
  ReadLn(menu);
  case menu of
  1: begin
    WriteLn;
    if isEmpty = true then WriteLn('�⥪ ����!')
    else WriteLn('�⥪ ᮤ�ন� ������.');
    WriteLn
  end;
  2: begin
    WriteLn;
    if isFull = true then WriteLn('�⥪ ��������!')
    else WriteLn('�⥪ �� ��������.');
    WriteLn;
  end;
  3: push;
  4: pop;
  5: show_stack;
  end;
  until menu = 6;
END.
