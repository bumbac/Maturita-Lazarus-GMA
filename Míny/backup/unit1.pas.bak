unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );

  private
    { private declarations }
  public
    { public declarations }
  end;
 const
   R=9;
   S=9;
var
  Form1: TForm1;
  pole: array[1..S,1..R] of integer;
  pole2: array[1..S,1..R] of integer;
  pole3: array[1..S,1..R] of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  i,j,randx,randy,rozdiel,sucet:integer;
 begin
  randomize;
  image1.canvas.brush.color:=clwhite;
  image1.canvas.fillrect(clientrect);
  for i:=0 to S do                         //vykreslenie siete
        for j:=0 to R do
            begin
             image1.canvas.line(30*i, 30*j,30*S,30*j);    //riadok
             image1.canvas.line(30*j, 30*i,30*j, 30*R);   //stlpce

            end;
  for i:=1 to R do
      for j:=1 to S do                      //naplnenie pola
          pole[i,j]:=0;


  for i:=1 to 10 do
          begin
           randx:=random(S)+1;                   //vytvorenie random pozicii min
           randy:=random(R)+1;
           if pole[randx, randy]=1
              then            //zapisanie min do pola
                 begin
                  randx:=random(S)+1;                   //osetrenie proti prepisaniu
                  randy:=random(R)+1;
                  pole[randx, randy]:=1;
                 end
              else
                 pole[randx, randy]:=1;

           image1.canvas.ellipse(30*randx-10, 30*randy-10,30*randx-20, 30*randy-20 ); //kreslenie min
            pole2[randx, randy]:=randx;
            pole3[randx, randy]:=randy;

          end;
end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  randx, randy, i, j,F:integer;
begin
  image1.canvas.Line(x,y,x+1,y+1);
  for i:=0 to S-1 do
        for j:=0 to R-1 do
            for f:=1 to 30 do
              begin
                if (x=pole2[i,j]*30+F) AND (y=pole3[i,j]*30+F) AND (pole[i+1,j+1]=1)
                     then
                        image1.canvas.textout(200,300, 'Boom');

              end;
end;

end.

