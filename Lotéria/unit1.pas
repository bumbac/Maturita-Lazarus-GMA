unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;
  const
    N=5;

var
  Form1: TForm1;
  lotery:textfile;
  vyhra:string;
  tip:array[1..N] of integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j,z,rand,x,max,min,miesto:integer;
  kontrola:boolean;
begin
assignfile(lotery,'lotery.txt');
rewrite(lotery);
randomize;
for z:=1 to 10 do begin



     vyhra:='';
     for i:=1 to N do
     vyhra:=vyhra+'0';
i:=0;
repeat
     rand:=random(9)+1;
     inc(i);
     j:=0;
     kontrola:=false;
     repeat
     inc(j);
      if inttostr(rand)[1]=vyhra[j] then
      begin
      dec(i);
      j:=N;
      kontrola:=false;
      end
      else
      kontrola:=true;
     until j>=N;
      if kontrola=true
      then vyhra[i]:=inttostr(rand)[1];
until i=N;
memo1.append(vyhra);
for x:=1 to n do
for i:=1 to N-1 do begin
max:=strtoint(vyhra[i]);
if max>strtoint(vyhra[i+1]) then
begin
min:=strtoint(vyhra[i+1]);
vyhra[i+1]:=inttostr(max)[1];
vyhra[i]:=inttostr(min)[1];
end;
end;
writeln(lotery,vyhra);
end;



     vyhra:='';
     for i:=1 to N do
     vyhra:=vyhra+'0';
i:=0;
repeat
     rand:=random(9)+1;
     inc(i);
     j:=0;
     kontrola:=false;
     repeat
     inc(j);
      if inttostr(rand)[1]=vyhra[j] then
      begin
      dec(i);
      j:=N;
      kontrola:=false;
      end
      else
      kontrola:=true;
     until j>=N;
      if kontrola=true
      then vyhra[i]:=inttostr(rand)[1];
until i=N;
memo1.append(vyhra);
for x:=1 to n do
for i:=1 to N-1 do begin
max:=strtoint(vyhra[i]);
if max>strtoint(vyhra[i+1]) then
begin
min:=strtoint(vyhra[i+1]);
vyhra[i+1]:=inttostr(max)[1];
vyhra[i]:=inttostr(min)[1];
end;
end;
memo1.append('Vyhra: '+vyhra);
                       closefile(lotery);

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  z,i,bod,max:integer;
  tip,test,winner:string;
begin
reset(lotery);
max:=0;
repeat
readln(lotery,tip);
bod:=0;
for i:=1 to N do
for z:=1 to N do begin
test:=vyhra[z];
if tip[i]=test then
inc(bod);
end;

if max<bod then begin
max:=bod;
winner:=tip;
end;
until eof(lotery) ;
memo1.append('winner :'+winner);

end;

end.

