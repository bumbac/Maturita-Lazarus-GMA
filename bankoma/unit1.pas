unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  bank:array[1..7] of integer;
  pap:array[1..7] of integer;
implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  vstup,bankovka, pocet, vsetko,i:integer;
begin
image1.canvas.brush.color:=clwhite;                     //vymazava plochu
image1.canvas.fillrect(clientrect);
vstup:=strtoint(Edit1.text);                            //user input
if (vstup mod 5>0) OR (vstup>17700)                     //ochrana proti minciam a velkej sume
  then
      image1.canvas.textout(150,100, 'Choj do pice')
  else
    begin
       vsetko:=0;
       bankovka:=0;
       repeat
           vsetko:=0;
           for i:=1 to 7 do
             begin                                      //scitanie hodnot v bankomate
                  vsetko:=vsetko+bank[i]*pap[i];
             end;
           label3.caption:=inttostr(vsetko);
           if vstup<=vsetko                             //podmienka na vyber
           then
               begin

                  for i:=1 to 5 do
                    begin

                    end;


                 bankovka:=bankovka+1;
                 pocet:=vstup div pap[bankovka];        //vypocet bankoviek
                 if (pocet>bank[bankovka])
                   then
                     begin
                         label1.caption:='Prepacte, vydavame v mensich bankovkach';
                         vstup:=vstup-bank[bankovka]*pap[bankovka];
                         bank[bankovka]:=0;             //vynulovanie poctu bankovky
                     end
                   else
                       begin
                       bank[bankovka]:=bank[bankovka]-pocet;  //odratavanie bankoviek z banku
                       vstup:=vstup-pocet*pap[bankovka];      //odratavanie zo vstupu
                       end;

               end

           else
           begin
           label2.caption:='Tuto sumu nemozem vydat, chod prec!';
           vstup:=0;                                    //ochrana proti preteceniu
           end;


       until vstup<5;
       for i:=1 to 7 do                                 //vypis bankoviek
         begin
           image1.canvas.textout(20, 20*i,'Bankovka '+inttostr(pap[i])+ ':   '+inttostr(bank[i]));
         end;
    end;
   vsetko:=0;
           for i:=1 to 7 do
             begin                                      //vypis dispozicie
                  vsetko:=vsetko+bank[i]*pap[i];
             end;
           label6.caption:=inttostr(vsetko)+'€';

end;

procedure TForm1.Button2Click(Sender: TObject);
var
i:integer;
begin
for i:=1 to 7 do
bank[i]:=20;
 label6.caption:='17700€';
end;

procedure TForm1.FormCreate(Sender: TObject);
var
i:integer;
begin
for i:=1 to 7 do
bank[i]:=20;
pap[1]:= 500;
pap[2]:=200 ;
pap[3]:=100 ;
pap[4]:= 50;
pap[5]:= 20;
pap[6]:= 10;
pap[7]:=5 ;
 label6.caption:='17700€';
end;

end.

