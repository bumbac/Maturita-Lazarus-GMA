unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  input, output:textfile;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var
  i,j,value:integer;
  cislo,zmena:char;
begin
 assignfile(input,'input.txt');
 assignfile(output,'output.txt');
 reset(input);
 rewrite(output);
 append(output);
  read(input,cislo);
  value:=1;
  memo1.append(cislo);
 repeat
 read(input,zmena);
 memo1.append(zmena);
 if   cislo=zmena then begin
   inc(value);
   cislo:=zmena;
   end
    else begin
      write(output,value);
      value:=1;
       cislo:=zmena;
    end;
  until eof(input) ;
        write(output,value);
  closefile(output);
  closefile(input);
end;
end.

