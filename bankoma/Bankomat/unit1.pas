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
    Edit1: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label8: TLabel;
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
  storage: array [1..7] of integer;
  value: array [1..7] of integer;
  withdraw: array [1..7] of integer;
  sum,rep,rep2: integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var i,pay: integer;
begin

  pay:=StrToInt(Edit1.Text);
  sum:=0;
  rep:=0;
  rep2:=0;

  for i:=1 to 7 do
        sum:=sum+storage[i]*value[i];


  IF (StrToInt(Edit1.Text) <= sum)
     THEN
         IF (StrToInt(Edit1.Caption) mod 5 = 0)
            THEN
                begin
                     Image1.Canvas.FillRect(clientRect);
                     repeat
                           rep:=rep+1;
                           IF pay div value[rep] <= storage[rep]
                              THEN begin
                                   withdraw[rep]:=pay div value[rep];
                                   storage[rep]:=storage[rep]-withdraw[rep];
                                   pay:=pay-withdraw[rep]*value[rep];
                                   end
                                      ELSE begin
                                           withdraw[rep]:=storage[rep];
                                           storage[rep]:=storage[rep]-storage[rep];
                                           pay:=pay-withdraw[rep]*value[rep];
                                           end;
                        {rep:=rep+1;
                        IF ((pay div value[rep]) <= (storage[rep]))
                           THEN begin pay:=pay-storage[rep]*value[rep];
                           end;
                        withdraw[rep]:=pay div value[rep];
                        storage[rep]:=storage[rep]-withdraw[rep];
                        pay:=pay-withdraw[rep]*value[rep];}
                        until rep=7;
                        repeat
                        rep2:=rep2+1;
                        Image1.Canvas.TextOut(20,20*rep2,IntToStr(withdraw[rep2]));
                        Image1.Canvas.TextOut(120,20*rep2,IntToStr(value[rep2])+'€ = '+IntToStr(storage[rep2]));
                        until rep2=7;
                end

                ELSE
                    ShowMessage('ATM does not support withdrawal of coins.')

                    ELSE
                        ShowMessage('ATM has insufficient funds to complete the withdrawal.');

  sum:=0;
  for i:=1 to 7 do
     sum:=sum+storage[i]*value[i];

  Label8.Caption:=IntToStr(sum);

end;

procedure TForm1.Button2Click(Sender: TObject);
var i: integer;
begin
  sum:=0;
  rep:=0;

  for i:=1 to 7 do
      begin
      storage[i]:=20;
      end;

  for i:=1 to 7 do
        sum:=sum+storage[i]*value[i];

  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(clientRect);
  Label8.Caption:=IntToStr(sum);
end;

procedure TForm1.FormCreate(Sender: TObject);
var i: integer;
begin

  Image1.Canvas.Brush.Color:=clWhite;
  Image1.Canvas.FillRect(clientRect);

  value[1]:=500;
  value[2]:=200;
  value[3]:=100;
  value[4]:=50;
  value[5]:=20;
  value[6]:=10;
  value[7]:=5;

  for i:=1 to 7 do
      begin
      storage[i]:=20;
      Image1.Canvas.TextOut(120,20*i,IntToStr(value[i])+'€ = '+IntToStr(storage[i]));
      end;

end;

end.

