uses graphabc;
function func(x: real): real;
begin
  func := 1 * x * x * x + (-1) * x * x + (-4) * x + 17;
end;
var i,n: integer;
x1, y1, x0, y0,downx,upx,step,o,y1h,x1h: real;
var
  y3, y4: real;
  sq: real;
  Efn: real;
  Ef: real;
  N1: integer;
  x3: real;
begin
  Writeln('Введите нижнюю границу интегрирования:');
  Readln(downx);
  Writeln('Введите верхнюю границу интегрирования:');
  Readln(upx);
  Writeln('Введите шаг интегрирования:');
  Readln(step);
  writeln('Введите масштаб');
  readln(n);
  ClearWindow;
    N1 := 0;
  sq := 0;
  x3 := downx;
  Ef := step * step * step;
   repeat
    inc(N1);
    y3 := func(x3);
    x3 := x3 + step;
    y4 := func(x3);
    sq := sq + ((y3 + y4) / 2) * step - Ef;
   until x3 > upx;
SetFontColor(clred);
Writeln('Площадь вычисляемой фигуры равна: ', sq:0:4);
Efn := N1 * step * step * step;
Writeln('Погрешность: ', Efn:0:4);
setwindowsize (800,550);
SetFontColor(clred);
SetFontSize(10);
textout (30,30,'1 * x * x * x + (-1) * x * x + (-4) * x + 17');
setpencolor (clblack);
setpenwidth (1);
line (80,400,720,400);
line (400,30,400,520);
SetFontSize(8);
for i:=-15 to 15 do
begin
line (400+i*n,395,400+i*n,405);
textout (395+i*n,410, floattostr (i));
end;
textout (720,420, 'X');
for i:=-18 to 5 do
begin
line (395,400+i*n,405,400+i*n);
textout (370,400+i*n, '');
textout (375,395+i*n, floattostr (-i*(10)));
end;
textout (420,20, 'Y');
downx:=400+(downx*n);
upx:=400+(upx*n);
step:=n*step;
o:=downx;
for i:=-300 to 300 do
begin
x1:=i/n;
y1:= 1 * x1 * x1 * x1 + (-1) * x1 * x1 + (-4) * x1 + 17;
line(trunc(x0), trunc(y0), trunc(400+x1*n), trunc(400-y1*(n/10)), clBlue);
if trunc(400+x1*n)=downx then line(trunc(400+x1*n), trunc(400-y1*(n/10)), trunc(downx), 400, clred);
if (trunc(400+x1*n)=o) and (o<upx) then 
begin 
line(trunc(400+x1*n), trunc(400-y1*(n/10)), trunc(o), 400, clred); 
x1h:=(i+step)/n;
y1h:=1 * x1h * x1h * x1h + (-1) * x1h * x1h + (-4) * x1h + 17;
line(trunc(400+x1h*n),trunc(400-y1h*(n/10)), trunc(400+x1*n), trunc(400-y1*(n/10)),clred);
o:=o+step; 
end;
if trunc(400+x1*n)=upx then line(trunc(400+x1*n), trunc(400-y1*(n/10)), trunc(upx), 400, clred); 
x0:=trunc(400+x1*n);
y0:=trunc(400-y1*(n/10));
end;
end.