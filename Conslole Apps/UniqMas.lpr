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
   WriteLn('���ᨢ �ᯥ譮 ᣥ���஢��.');
   WriteLn;
end;

procedure show_mas;
var i:byte;
begin
   WriteLn;
   WriteLn('�뢮�� ���ᨢ...');
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
   Write('�������� ������: ');
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
  writeln('1. ������� ���ᨢ�.');
  writeln('2. �뢮� ���ᨢ�.');
  writeln('3. ���� 㭨���쭮�� �����.');
  writeln('4. ��室.');
  Write('������ ���祭��: ');
  ReadLn(menu);
  case menu of
  1:gen_mas;
  2:show_mas;
  3:search_mas;
  end;
  until menu=4;
END.
