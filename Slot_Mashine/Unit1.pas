unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ImgList, ComCtrls, ToolWin;

type
  TForm1 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    Image13: TImage;
    Image14: TImage;
    Image15: TImage;
    Ekran10: TImage;
    Ekran11: TImage;
    Ekran12: TImage;
    Ekran13: TImage;
    Ekran20: TImage;
    Ekran21: TImage;
    Ekran22: TImage;
    Ekran23: TImage;
    Ekran30: TImage;
    Ekran31: TImage;
    Ekran32: TImage;
    Ekran33: TImage;
    Ekran40: TImage;
    Ekran41: TImage;
    Ekran42: TImage;
    Ekran43: TImage;
    Ekran50: TImage;
    Ekran51: TImage;
    Ekran52: TImage;
    Ekran53: TImage;
    Timer2: TTimer;
    Image16: TImage;
    Image17: TImage;
    Image18: TImage;
    Image19: TImage;
    Image20: TImage;
    Image21: TImage;
    Image22: TImage;
    Image23: TImage;
    Image24: TImage;
    Image25: TImage;
    ImageStart: TImage;
    ImageDouble: TImage;
    ImageTablica: TImage;
    ImageLinesPlus: TImage;
    ImageLinesMinus: TImage;
    ImageKanalPlus: TImage;
    ImageKanalMinus: TImage;
    Pechalba: TLabel;
    Credit: TLabel;
    Lines: TLabel;
    Kanal: TLabel;
    TotalKanal: TLabel;
    PaintBox1: TPaintBox;
    ImageBalans: TImage;
    ImageLinii: TImage;
    ImageKanal: TImage;
    ImageTotalKanal: TImage;
    ImagePechalba: TImage;
    FreeSpins1: TLabel;
    Timer3: TTimer;
    Image27: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ImageTablicaClick(Sender: TObject);
    procedure ImageLinesMinusClick(Sender: TObject);
    procedure ImageLinesPlusClick(Sender: TObject);
    procedure ImageKanalMinusClick(Sender: TObject);
    procedure ImageKanalPlusClick(Sender: TObject);
    procedure ImageStartClick(Sender: TObject);
    procedure ImageDoubleClick(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
Type
 Configxxx=record
 Credit:int64;
 Pechalba:int64;
 Lines:Cardinal;
 Kanal:Cardinal;
 TotalKanal:Cardinal;
 Level:Cardinal;
 MaxBet:Cardinal;
 Joker:Cardinal;
end;

const
 Bonus=11;
 Scater=12;
 Wild2=13;
 Wild5=14;
 Wild10=15;

var
  Form1: TForm1;
  Bufer:array [0..3,1..5] of byte;
  Start,Start1,Start2,Start3,Start4,Start5:integer;
  Flag1,Flag2,Flag3,Flag4,Flag5:boolean;
  Zavyrtane:Cardinal;
  Config:Configxxx;
  BuferLinii:array[1..50]of boolean;
  FreeSpins,Bonusi,Multiplier,BonusPechalba,Butilka:Cardinal;


  ButonStart:boolean;
  ButonDouble:boolean;
  ButonKanalPlus:boolean;
  ButonKanalMinus:boolean;
  ButonLinesPlus:boolean;
  ButonLinesMinus:boolean;
  ButonTablica:boolean;
implementation

uses Unit2, Unit3, Unit4, Unit5, Unit6;

{$R *.dfm}
//============================================================
procedure Ekran;forward;
procedure Ekran2;forward;
procedure Random11;forward;
Function  Random22:byte;forward;
procedure BuferToImages;forward;
Function  ImaLiPechalba:int64;forward;
Function  ProverkaNaLinia(X1,X2,X3,X4,X5:byte):int64;forward;
Function  ProverkaZaSkateri:Cardinal;forward;
Function  ProverkaZaBonusi:Cardinal;forward;
procedure ChertaneNaLinii;forward;
procedure ButonsEnabled;forward;
procedure ButonsDisabled;forward;
//============================================================
procedure TForm1.FormCreate(Sender: TObject);
begin
//
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Config.Credit:=5000;
Config.Pechalba:=0;
Config.Lines:=50;
Config.Kanal:=1;
Config.TotalKanal:=Config.Lines * Config.Kanal;
Config.Level:=1;
Config.MaxBet:=Config.Level * 10;
Ekran2;
FreeSpins:=0;
Form1.FreeSpins1.Caption:='';
Config.Joker:=0;
Randomize;

Bufer[0,1]:=Random(15)+1;
Bufer[1,1]:=Random(15)+1;
Bufer[2,1]:=Random(15)+1;
Bufer[3,1]:=Random(15)+1;

Bufer[0,2]:=Random(15)+1;
Bufer[1,2]:=Random(15)+1;
Bufer[2,2]:=Random(15)+1;
Bufer[3,2]:=Random(15)+1;

Bufer[0,3]:=Random(15)+1;
Bufer[1,3]:=Random(15)+1;
Bufer[2,3]:=Random(15)+1;
Bufer[3,3]:=Random(15)+1;

Bufer[0,4]:=Random(15)+1;
Bufer[1,4]:=Random(15)+1;
Bufer[2,4]:=Random(15)+1;
Bufer[3,4]:=Random(15)+1;

Bufer[0,5]:=Random(15)+1;
Bufer[1,5]:=Random(15)+1;
Bufer[2,5]:=Random(15)+1;
Bufer[3,5]:=Random(15)+1;

Flag1:=True;
Flag2:=True;
Flag3:=True;
Flag4:=True;
Flag5:=True;
Random11;
Random11;
Random11;
Random11;
BuferToImages;
Start:=-125;
Start1:=Start;
Start2:=Start;
Start3:=Start;
Start4:=Start;
Start5:=Start;
Ekran;
ButonsEnabled;
  ButonDouble:=False;
  Form1.ImageDouble.Picture.Bitmap:=Form1.Image19.Picture.Bitmap;
end;

procedure Random11;
Label 11,22,33,44,55;
begin
IF Flag1=True Then
 begin
Bufer[3,1]:=Bufer[2,1];
Bufer[2,1]:=Bufer[1,1];
Bufer[1,1]:=Bufer[0,1];
11:
Bufer[0,1]:=Random22;
 IF Bufer[0,1]=Bufer[1,1] Then Goto 11;
 IF Bufer[0,1]=Bufer[2,1] Then Goto 11;
 IF Bufer[0,1]=Bufer[3,1] Then Goto 11;
 IF Bufer[0,1]=13 Then Goto 11;
 IF Bufer[0,1]=14 Then Goto 11;
 IF Bufer[0,1]=15 Then Goto 11;
end;

IF Flag2=True Then
 begin
Bufer[3,2]:=Bufer[2,2];
Bufer[2,2]:=Bufer[1,2];
Bufer[1,2]:=Bufer[0,2];
22:
Bufer[0,2]:=Random22;
 IF Bufer[0,2]=Bufer[1,2] Then Goto 22;
 IF Bufer[0,2]=Bufer[2,2] Then Goto 22;
 IF Bufer[0,2]=Bufer[3,2] Then Goto 22;
 IF Bufer[0,2]=14 Then Goto 22;
 IF Bufer[0,2]=15 Then Goto 22;
end;

IF Flag3=True Then
 begin
Bufer[3,3]:=Bufer[2,3];
Bufer[2,3]:=Bufer[1,3];
Bufer[1,3]:=Bufer[0,3];
33:
Bufer[0,3]:=Random22;
 IF Bufer[0,3]=Bufer[1,3] Then Goto 33;
 IF Bufer[0,3]=Bufer[2,3] Then Goto 33;
 IF Bufer[0,3]=Bufer[3,3] Then Goto 33;
 IF Bufer[0,3]=14 Then Goto 33;
 IF Bufer[0,3]=15 Then Goto 33;
end;

IF Flag4=True Then
 begin
Bufer[3,4]:=Bufer[2,4];
Bufer[2,4]:=Bufer[1,4];
Bufer[1,4]:=Bufer[0,4];
44:
Bufer[0,4]:=Random22;
 IF Bufer[0,4]=Bufer[1,4] Then Goto 44;
 IF Bufer[0,4]=Bufer[2,4] Then Goto 44;
 IF Bufer[0,4]=Bufer[3,4] Then Goto 44;
 IF Bufer[0,4]=13 Then Goto 44;
 IF Bufer[0,4]=15 Then Goto 44;
end;

IF Flag5=True Then
 begin
Bufer[3,5]:=Bufer[2,5];
Bufer[2,5]:=Bufer[1,5];
Bufer[1,5]:=Bufer[0,5];
55:
Bufer[0,5]:=Random22;
 IF Bufer[0,5]=Bufer[1,5] Then Goto 55;
 IF Bufer[0,5]=Bufer[2,5] Then Goto 55;
 IF Bufer[0,5]=Bufer[3,5] Then Goto 55;
 IF Bufer[0,5]=13 Then Goto 55;
 IF Bufer[0,5]=14 Then Goto 55;
end;

end;

Function  Random22:byte;
var XX:Cardinal;
begin
Result:=0;
XX:=Random(40)+1;
  Case XX of
  1..5:Result:=1;
  6..10:Result:=2;
  11..15:Result:=3;
  16..20:Result:=4;
  21..25:Result:=5;
  26..27:Result:=6;
  28..29:Result:=7;
  30..31:Result:=8;
  32..33:Result:=9;
  34..35:Result:=10;
  36:Result:=11;
  37:Result:=12;
  38:Result:=13;
  39:Result:=14;
  40:Result:=15;
  end;

end;


procedure BuferToImages;
begin
 Case Bufer[0,1] of
 1:Form1.Ekran10.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran10.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran10.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran10.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran10.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran10.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran10.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran10.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran10.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran10.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran10.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran10.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran10.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran10.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran10.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[1,1] of
 1:Form1.Ekran11.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran11.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran11.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran11.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran11.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran11.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran11.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran11.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran11.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran11.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran11.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran11.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran11.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran11.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran11.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[2,1] of
 1:Form1.Ekran12.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran12.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran12.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran12.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran12.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran12.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran12.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran12.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran12.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran12.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran12.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran12.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran12.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran12.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran12.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[3,1] of
 1:Form1.Ekran13.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran13.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran13.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran13.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran13.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran13.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran13.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran13.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran13.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran13.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran13.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran13.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran13.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran13.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran13.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

//--------------------------------------------------------------------
 Case Bufer[0,2] of
 1:Form1.Ekran20.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran20.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran20.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran20.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran20.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran20.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran20.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran20.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran20.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran20.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran20.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran20.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran20.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran20.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran20.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[1,2] of
 1:Form1.Ekran21.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran21.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran21.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran21.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran21.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran21.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran21.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran21.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran21.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran21.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran21.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran21.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran21.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran21.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran21.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[2,2] of
 1:Form1.Ekran22.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran22.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran22.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran22.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran22.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran22.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran22.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran22.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran22.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran22.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran22.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran22.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran22.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran22.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran22.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[3,2] of
 1:Form1.Ekran23.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran23.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran23.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran23.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran23.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran23.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran23.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran23.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran23.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran23.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran23.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran23.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran23.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran23.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran23.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

//--------------------------------------------------------------------
 Case Bufer[0,3] of
 1:Form1.Ekran30.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran30.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran30.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran30.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran30.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran30.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran30.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran30.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran30.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran30.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran30.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran30.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran30.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran30.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran30.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[1,3] of
 1:Form1.Ekran31.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran31.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran31.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran31.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran31.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran31.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran31.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran31.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran31.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran31.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran31.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran31.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran31.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran31.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran31.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[2,3] of
 1:Form1.Ekran32.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran32.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran32.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran32.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran32.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran32.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran32.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran32.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran32.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran32.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran32.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran32.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran32.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran32.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran32.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[3,3] of
 1:Form1.Ekran33.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran33.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran33.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran33.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran33.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran33.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran33.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran33.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran33.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran33.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran33.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran33.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran33.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran33.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran33.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;
//--------------------------------------------------------------------
 Case Bufer[0,4] of
 1:Form1.Ekran40.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran40.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran40.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran40.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran40.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran40.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran40.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran40.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran40.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran40.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran40.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran40.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran40.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran40.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran40.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[1,4] of
 1:Form1.Ekran41.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran41.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran41.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran41.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran41.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran41.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran41.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran41.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran41.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran41.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran41.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran41.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran41.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran41.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran41.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[2,4] of
 1:Form1.Ekran42.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran42.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran42.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran42.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran42.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran42.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran42.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran42.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran42.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran42.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran42.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran42.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran42.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran42.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran42.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[3,4] of
 1:Form1.Ekran43.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran43.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran43.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran43.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran43.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran43.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran43.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran43.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran43.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran43.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran43.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran43.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran43.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran43.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran43.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;
//--------------------------------------------------------------------
 Case Bufer[0,5] of
 1:Form1.Ekran50.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran50.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran50.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran50.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran50.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran50.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran50.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran50.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran50.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran50.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran50.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran50.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran50.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran50.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran50.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[1,5] of
 1:Form1.Ekran51.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran51.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran51.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran51.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran51.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran51.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran51.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran51.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran51.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran51.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran51.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran51.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran51.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran51.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran51.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[2,5] of
 1:Form1.Ekran52.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran52.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran52.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran52.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran52.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran52.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran52.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran52.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran52.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran52.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran52.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran52.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran52.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran52.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran52.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

 Case Bufer[3,5] of
 1:Form1.Ekran53.Picture.Bitmap:=Form1.Image1.Picture.Bitmap;
 2:Form1.Ekran53.Picture.Bitmap:=Form1.Image2.Picture.Bitmap;
 3:Form1.Ekran53.Picture.Bitmap:=Form1.Image3.Picture.Bitmap;
 4:Form1.Ekran53.Picture.Bitmap:=Form1.Image4.Picture.Bitmap;
 5:Form1.Ekran53.Picture.Bitmap:=Form1.Image5.Picture.Bitmap;
 6:Form1.Ekran53.Picture.Bitmap:=Form1.Image6.Picture.Bitmap;
 7:Form1.Ekran53.Picture.Bitmap:=Form1.Image7.Picture.Bitmap;
 8:Form1.Ekran53.Picture.Bitmap:=Form1.Image8.Picture.Bitmap;
 9:Form1.Ekran53.Picture.Bitmap:=Form1.Image9.Picture.Bitmap;
 10:Form1.Ekran53.Picture.Bitmap:=Form1.Image10.Picture.Bitmap;
 11:Form1.Ekran53.Picture.Bitmap:=Form1.Image11.Picture.Bitmap;
 12:Form1.Ekran53.Picture.Bitmap:=Form1.Image12.Picture.Bitmap;
 13:Form1.Ekran53.Picture.Bitmap:=Form1.Image13.Picture.Bitmap;
 14:Form1.Ekran53.Picture.Bitmap:=Form1.Image14.Picture.Bitmap;
 15:Form1.Ekran53.Picture.Bitmap:=Form1.Image15.Picture.Bitmap;
 end;

end;

procedure Ekran;
begin
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,0,Start1,125,125,Form1.Ekran10.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,0,Start1+125,125,125,Form1.Ekran11.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,0,Start1+250,125,125,Form1.Ekran12.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,0,Start1+375,125,125,Form1.Ekran13.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);

Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,125,Start2,125,125,Form1.Ekran20.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,125,Start2+125,125,125,Form1.Ekran21.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,125,Start2+250,125,125,Form1.Ekran22.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,125,Start2+375,125,125,Form1.Ekran23.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);

Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,250,Start3,125,125,Form1.Ekran30.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,250,Start3+125,125,125,Form1.Ekran31.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,250,Start3+250,125,125,Form1.Ekran32.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,250,Start3+375,125,125,Form1.Ekran33.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);

Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,375,Start4,125,125,Form1.Ekran40.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,375,Start4+125,125,125,Form1.Ekran41.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,375,Start4+250,125,125,Form1.Ekran42.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,375,Start4+375,125,125,Form1.Ekran43.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);

Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,500,Start5,125,125,Form1.Ekran50.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,500,Start5+125,125,125,Form1.Ekran51.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,500,Start5+250,125,125,Form1.Ekran52.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);
Windows.BitBlt(Form1.PaintBox1.Canvas.Handle,500,Start5+375,125,125,Form1.Ekran53.Picture.Bitmap.Canvas.Handle,0,0,SRCCOPY);

end;

procedure Ekran2;
begin
Form1.Credit.Caption:=inttostr(Config.Credit);
Form1.Lines.Caption:=inttostr(Config.Lines);
Form1.Kanal.Caption:=inttostr(Config.Kanal);
Form1.TotalKanal.Caption:=inttostr(Config.TotalKanal);
Form1.Pechalba.Caption:=inttostr(Config.Pechalba);
IF FreeSpins > 0 Then Form1.FreeSpins1.Caption:= inttostr(FreeSpins) Else Form1.FreeSpins1.Caption:='';

end;

procedure ButonsEnabled;
begin
  ButonStart:=True;
IF Config.Pechalba > 0 Then  ButonDouble:=True;
  ButonKanalPlus:=True;
  ButonKanalMinus:=True;
  ButonLinesPlus:=True;
  ButonLinesMinus:=True;
  ButonTablica:=True;

  Form1.ImageStart.Picture.Bitmap:=Form1.Image16.Picture.Bitmap;
IF Config.Pechalba > 0 Then  Form1.ImageDouble.Picture.Bitmap:=Form1.Image18.Picture.Bitmap;
  Form1.ImageKanalPlus.Picture.Bitmap:=Form1.Image22.Picture.Bitmap;
  Form1.ImageKanalMinus.Picture.Bitmap:=Form1.Image24.Picture.Bitmap;
  Form1.ImageLinesPlus.Picture.Bitmap:=Form1.Image22.Picture.Bitmap;
  Form1.ImageLinesMinus.Picture.Bitmap:=Form1.Image24.Picture.Bitmap;
  Form1.ImageTablica.Picture.Bitmap:=Form1.Image20.Picture.Bitmap;
end;

procedure ButonsDisabled;
begin
  ButonStart:=False;
  ButonDouble:=False;
  ButonKanalPlus:=False;
  ButonKanalMinus:=False;
  ButonLinesPlus:=False;
  ButonLinesMinus:=False;
  ButonTablica:=False;

  Form1.ImageStart.Picture.Bitmap:=Form1.Image17.Picture.Bitmap;
  Form1.ImageDouble.Picture.Bitmap:=Form1.Image19.Picture.Bitmap;
  Form1.ImageKanalPlus.Picture.Bitmap:=Form1.Image23.Picture.Bitmap;
  Form1.ImageKanalMinus.Picture.Bitmap:=Form1.Image25.Picture.Bitmap;
  Form1.ImageLinesPlus.Picture.Bitmap:=Form1.Image23.Picture.Bitmap;
  Form1.ImageLinesMinus.Picture.Bitmap:=Form1.Image25.Picture.Bitmap;
  Form1.ImageTablica.Picture.Bitmap:=Form1.Image21.Picture.Bitmap;
end;

procedure ChertaneNaLinii;
begin
 IF BuferLinii[1]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[2]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[3]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[4]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[5]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;


 IF BuferLinii[6]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[7]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[8]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[9]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[10]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[11]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[12]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[13]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[14]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[15]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[16]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[17]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[18]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[19]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[20]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[21]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[22]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[23]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[24]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[25]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[26]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[27]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,187);
   Form1.PaintBox1.Canvas.LineTo(62,187);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[28]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[29]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[30]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[31]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[32]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[33]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[34]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[35]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[36]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[37]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[38]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[39]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[40]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[41]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,187);
   Form1.PaintBox1.Canvas.LineTo(615,187);
   end;

 IF BuferLinii[42]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[43]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,187);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[44]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[45]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,187);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,187);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[46]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[47]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[48]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,62);
   Form1.PaintBox1.Canvas.LineTo(312,62);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

 IF BuferLinii[49]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,312);
   Form1.PaintBox1.Canvas.LineTo(62,312);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,312);
   Form1.PaintBox1.Canvas.LineTo(562,62);
   Form1.PaintBox1.Canvas.LineTo(615,62);
   end;

 IF BuferLinii[50]=True Then
   begin
   Form1.PaintBox1.Canvas.Pen.Color:=clRed;
   Form1.PaintBox1.Canvas.Pen.Width:=5;
   Form1.PaintBox1.Canvas.MoveTo(10,62);
   Form1.PaintBox1.Canvas.LineTo(62,62);
   Form1.PaintBox1.Canvas.LineTo(187,312);
   Form1.PaintBox1.Canvas.LineTo(312,312);
   Form1.PaintBox1.Canvas.LineTo(437,62);
   Form1.PaintBox1.Canvas.LineTo(562,312);
   Form1.PaintBox1.Canvas.LineTo(615,312);
   end;

end;




Function  ImaLiPechalba;
var XX:integer; NN:int64;
begin
Result:=0;
 For XX:=1 to 50 do BuferLinii[XX]:=False;


 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[2,2],Bufer[2,3],Bufer[2,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[1]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[1,3],Bufer[1,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[2]:=True;
  end;
 
 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[3,3],Bufer[3,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[3]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[3,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[4]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[1,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[5]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[1,2],Bufer[1,3],Bufer[1,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[6]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[3,2],Bufer[3,3],Bufer[3,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[7]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[2,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[8]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[2,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[9]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[2,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[10]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[2,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[11]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[2,3],Bufer[3,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[12]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[2,3],Bufer[1,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[13]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[3,2],Bufer[2,3],Bufer[1,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[14]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[1,2],Bufer[2,3],Bufer[3,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[15]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[1,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[16]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[3,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[17]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[1,2],Bufer[2,3],Bufer[1,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[18]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[3,2],Bufer[2,3],Bufer[3,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[19]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[2,2],Bufer[1,3],Bufer[2,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[20]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[2,2],Bufer[3,3],Bufer[2,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[21]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[1,3],Bufer[3,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[22]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[3,3],Bufer[1,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[23]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[3,2],Bufer[3,3],Bufer[3,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[24]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[1,2],Bufer[1,3],Bufer[1,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[25]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[3,2],Bufer[1,3],Bufer[3,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[26]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[2,1],Bufer[1,2],Bufer[3,3],Bufer[1,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[27]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[1,2],Bufer[3,3],Bufer[1,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[28]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[3,2],Bufer[1,3],Bufer[3,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[29]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[1,2],Bufer[2,3],Bufer[3,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[30]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[3,2],Bufer[2,3],Bufer[1,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[31]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[3,2],Bufer[2,3],Bufer[3,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[32]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[1,2],Bufer[2,3],Bufer[1,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[33]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[3,3],Bufer[3,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[34]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[1,3],Bufer[1,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[35]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[1,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[36]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[3,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[37]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[3,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[38]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[1,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[39]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[1,3],Bufer[1,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[40]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[3,3],Bufer[3,4],Bufer[2,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[41]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[2,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[42]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[2,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[43]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[2,2],Bufer[1,3],Bufer[2,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[44]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[2,2],Bufer[3,3],Bufer[2,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[45]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[1,2],Bufer[1,3],Bufer[1,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[46]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[3,2],Bufer[3,3],Bufer[3,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[47]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[1,2],Bufer[1,3],Bufer[1,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[48]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[3,1],Bufer[3,2],Bufer[3,3],Bufer[3,4],Bufer[1,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[49]:=True;
  end;

 NN:=ProverkaNaLinia(Bufer[1,1],Bufer[3,2],Bufer[3,3],Bufer[1,4],Bufer[3,5]);
 IF NN > 0 Then
  begin
  Result:=Result + NN;
  BuferLinii[50]:=True;
  end;

end;
//================================================================
Function  ProverkaNaLinia(X1,X2,X3,X4,X5:byte):int64;
var NN,XX2,XX3,XX4,XX5:integer;
begin
Result:=0;
//----------------------------- 1 5
NN:=1;
XX2:=0;
XX3:=5;
XX4:=10;
XX5:=50;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 1 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 1 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;

//----------------------------- 2 5
NN:=2;
XX2:=0;
XX3:=5;
XX4:=15;
XX5:=75;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 2 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 2 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;


//----------------------------- 3 5
NN:=3;
XX2:=0;
XX3:=8;
XX4:=20;
XX5:=100;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 3 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 3 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;


//----------------------------- 4 5
NN:=4;
XX2:=0;
XX3:=10;
XX4:=25;
XX5:=125;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 4 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 4 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;



//----------------------------- 5 5
NN:=5;
XX2:=0;
XX3:=15;
XX4:=50;
XX5:=150;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 5 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 5 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;


//----------------------------- 6 5
NN:=6;
XX2:=2;
XX3:=15;
XX4:=40;
XX5:=200;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 6 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 6 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;
//----------------------------- 6 2
IF (X1=NN)and(X2=NN) Then
  begin
  Result:=XX2 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2) Then
  begin
  Result:=XX2 * 2;
  Exit;
  end;



//----------------------------- 7 5
NN:=7;
XX2:=2;
XX3:=20;
XX4:=60;
XX5:=300;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 7 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 7 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;
//----------------------------- 7 2
IF (X1=NN)and(X2=NN) Then
  begin
  Result:=XX2 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2) Then
  begin
  Result:=XX2 * 2;
  Exit;
  end;



  //----------------------------- 8 5
NN:=8;
XX2:=3;
XX3:=20;
XX4:=80;
XX5:=400;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 8 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 8 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;
//----------------------------- 8 2
IF (X1=NN)and(X2=NN) Then
  begin
  Result:=XX2 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2) Then
  begin
  Result:=XX2 * 2;
  Exit;
  end;



//----------------------------- 9 5
NN:=9;
XX2:=4;
XX3:=30;
XX4:=100;
XX5:=500;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 9 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 9 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;
//----------------------------- 9 2
IF (X1=NN)and(X2=NN) Then
  begin
  Result:=XX2 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2) Then
  begin
  Result:=XX2 * 2;
  Exit;
  end;


//----------------------------- 10 5
NN:=10;
XX2:=5;
XX3:=40;
XX4:=200;
XX5:=1000;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 50;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=NN) Then
  begin
  Result:=XX5 * 4;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=NN) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 20;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=NN)and(X5=Wild10) Then
  begin
  Result:=XX5 * 40;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 100;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5)and(X5=Wild10) Then
  begin
  Result:=XX5 * 200;
  Exit;
  end;
//----------------------------- 10 4
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=NN) Then
  begin
  Result:=XX4 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 5;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 10;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2)and(X4=Wild5) Then
  begin
  Result:=XX4 * 20;
  Exit;
  end;
//----------------------------- 10 3
IF (X1=NN)and(X2=NN)and(X3=NN) Then
  begin
  Result:=XX3 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=NN) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=NN)and(X3=Wild2) Then
  begin
  Result:=XX3 * 2;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2)and(X3=Wild2) Then
  begin
  Result:=XX3 * 4;
  Exit;
  end;
//----------------------------- 10 2
IF (X1=NN)and(X2=NN) Then
  begin
  Result:=XX2 * 1;
  Exit;
  end;
IF (X1=NN)and(X2=Wild2) Then
  begin
  Result:=XX2 * 2;
  Exit;
  end;

end;
//================================================================
Function  ProverkaZaSkateri;
begin
Result:=0;
IF Bufer[1,1]=Scater Then Inc(Result);
IF Bufer[2,1]=Scater Then Inc(Result);
IF Bufer[3,1]=Scater Then Inc(Result);

IF Bufer[1,2]=Scater Then Inc(Result);
IF Bufer[2,2]=Scater Then Inc(Result);
IF Bufer[3,2]=Scater Then Inc(Result);

IF Bufer[1,3]=Scater Then Inc(Result);
IF Bufer[2,3]=Scater Then Inc(Result);
IF Bufer[3,3]=Scater Then Inc(Result);

IF Bufer[1,4]=Scater Then Inc(Result);
IF Bufer[2,4]=Scater Then Inc(Result);
IF Bufer[3,4]=Scater Then Inc(Result);

IF Bufer[1,5]=Scater Then Inc(Result);
IF Bufer[2,5]=Scater Then Inc(Result);
IF Bufer[3,5]=Scater Then Inc(Result);
end;

//================================================================
Function  ProverkaZaBonusi;
begin
Result:=0;
IF Bufer[1,1]=Bonus Then Inc(Result);
IF Bufer[2,1]=Bonus Then Inc(Result);
IF Bufer[3,1]=Bonus Then Inc(Result);

IF Bufer[1,2]=Bonus Then Inc(Result);
IF Bufer[2,2]=Bonus Then Inc(Result);
IF Bufer[3,2]=Bonus Then Inc(Result);

IF Bufer[1,3]=Bonus Then Inc(Result);
IF Bufer[2,3]=Bonus Then Inc(Result);
IF Bufer[3,3]=Bonus Then Inc(Result);

IF Bufer[1,4]=Bonus Then Inc(Result);
IF Bufer[2,4]=Bonus Then Inc(Result);
IF Bufer[3,4]=Bonus Then Inc(Result);

IF Bufer[1,5]=Bonus Then Inc(Result);
IF Bufer[2,5]=Bonus Then Inc(Result);
IF Bufer[3,5]=Bonus Then Inc(Result);
end;



procedure TForm1.Timer1Timer(Sender: TObject);
var NN:Cardinal;
begin
Start:=Start+10;
IF Start>0 Then
  begin
  Start:=-125;
  Random11;
  BuferToImages;
  inc(Zavyrtane);
  end;

IF Start<-150 Then Start:=0;

 Case Zavyrtane of
 0..7:
   begin
   Form1.Timer1.Interval:=1;
   Start1:=Start;
   Start2:=Start;
   Start3:=Start;
   Start4:=Start;
   Start5:=Start;
   end;
 8..11:
   begin
   Form1.Timer1.Interval:=5;
   Flag1:=False;
   Start1:=-125;
   Start2:=Start;
   Start3:=Start;
   Start4:=Start;
   Start5:=Start;
   end;
 12..14:
   begin
   Form1.Timer1.Interval:=10;
   Flag1:=False;
   Start1:=-125;
   Flag2:=False;
   Start2:=-125;
   Start3:=Start;
   Start4:=Start;
   Start5:=Start;
   end;
 15..17:
   begin
   Form1.Timer1.Interval:=15;
   Flag1:=False;
   Start1:=-125;
   Flag2:=False;
   Start2:=-125;
   Flag3:=False;
   Start3:=-125;
   Start4:=Start;
   Start5:=Start;
   end;
 18..20:
   begin
   Form1.Timer1.Interval:=20;
   Flag1:=False;
   Start1:=-125;
   Flag2:=False;
   Start2:=-125;
   Flag3:=False;
   Start3:=-125;
   Flag4:=False;
   Start4:=-125;
   Start5:=Start;
   end;
 {21..23:
   begin
   Form1.Timer1.Interval:=30;
   Flag1:=False;
   Start1:=-125;
   Flag2:=False;
   Start2:=-125;
   Flag3:=False;
   Start3:=-125;
   Flag4:=False;
   Start4:=-125;
   Start5:=Start;  
   end;}
 else
 begin
 Form1.Timer1.Enabled:=False;
 Zavyrtane:=0;
 Start:=-125;
   Start1:=Start;
   Start2:=Start;
   Start3:=Start;
   Start4:=Start;
   Start5:=Start;
   Flag1:=False;
   Flag2:=False;
   Flag3:=False;
   Flag4:=False;
   Flag5:=False;
   //Form1.Image19.BringToFront;
   Form1.Timer2.Enabled:=True;

   Config.Pechalba:=ImaLiPechalba;
   IF Config.Pechalba > 0 Then
     begin
     Config.Pechalba:=Config.Pechalba * Config.Kanal;
     Config.Credit:=Config.Credit + Config.Pechalba;
     ChertaneNaLinii;
     end;
    Ekran2;

    Bonusi:=ProverkaZaBonusi;
    IF Bonusi > 2 Then
      begin
      Sleep(1000);
      Multiplier:=0;
      Butilka:=0;
      BonusPechalba:=0;
      Form3.ShowModal;
      Form4.ShowModal;
      Form5.ShowModal;
      BonusPechalba:=Config.Kanal * Multiplier * BonusPechalba;
      Config.Credit:=Config.Credit + BonusPechalba;
      end;


    NN:=ProverkaZaSkateri;
    Case NN of
     3: FreeSpins := FreeSpins +10 ;
     4: FreeSpins := FreeSpins +15 ;
     5: FreeSpins := FreeSpins +20 ;
    end;
    IF FreeSpins > 0 Then
      begin
      Form1.Timer3.Enabled:=True;
      ButonsDisabled;
      Ekran2;
      end;

    IF FreeSpins = 0 Then ButonsEnabled;
 end;
 end;

Ekran;
end;



procedure TForm1.Timer2Timer(Sender: TObject);
begin
//Flag1:=True;
//Flag2:=True;
//Flag3:=True;
//Flag4:=True;
//Flag5:=True;
Ekran;
ChertaneNaLinii;
end;

procedure TForm1.ImageTablicaClick(Sender: TObject);
begin
IF ButonTablica=False Then Exit;
Form2.ShowModal;
end;

procedure TForm1.ImageLinesMinusClick(Sender: TObject);
begin
IF ButonLinesMinus=False Then Exit;
Dec(Config.Lines);
IF Config.Lines < 1 Then Config.Lines:=1;
Config.TotalKanal:=Config.Lines * Config.Kanal;
Ekran2;
end;

procedure TForm1.ImageLinesPlusClick(Sender: TObject);
begin
IF ButonLinesPlus=False Then Exit;
Inc(Config.Lines);
IF Config.Lines > 50 Then Config.Lines:=50;
Config.TotalKanal:=Config.Lines * Config.Kanal;
Ekran2;
end;

procedure TForm1.ImageKanalMinusClick(Sender: TObject);
begin
IF ButonKanalMinus=False Then Exit;
Dec(Config.Kanal);
IF Config.Kanal < 1 Then Config.Kanal:=1;
Config.TotalKanal:=Config.Lines * Config.Kanal;
Ekran2;
end;

procedure TForm1.ImageKanalPlusClick(Sender: TObject);
begin
IF ButonKanalPlus=False Then Exit;
Inc(Config.Kanal);
IF Config.Kanal > Config.MaxBet Then Config.Kanal:=Config.MaxBet;
Config.TotalKanal:=Config.Lines * Config.Kanal;
Ekran2;
end;

procedure TForm1.ImageStartClick(Sender: TObject);
var XX:integer;
begin
IF ButonStart=False Then Exit;
For XX:=1 to 50 do BuferLinii[XX]:=False;
IF Config.Credit < Config.TotalKanal Then Exit;
Config.Credit:=Config.Credit - Config.TotalKanal;
Ekran2;

Randomize;
Flag1:=True;
Flag2:=True;
Flag3:=True;
Flag4:=True;
Flag5:=True;
Form1.Timer1.Enabled:=True;
Form1.Timer1.Interval:=1;
Form1.Timer2.Enabled:=False;
ButonsDisabled;
end;

procedure TForm1.ImageDoubleClick(Sender: TObject);
begin
IF ButonDouble=False Then Exit;
Config.Credit:=Config.Credit - Config.Pechalba;
Ekran2;
Form6.ShowModal;
Config.Credit:=Config.Credit + DoublePechalba;
Ekran2;
end;

procedure TForm1.Timer3Timer(Sender: TObject);
var XX:integer;
begin
FreeSpins := FreeSpins - 1;
For XX:=1 to 50 do BuferLinii[XX]:=False;
Ekran2;

Randomize;
Flag1:=True;
Flag2:=True;
Flag3:=True;
Flag4:=True;
Flag5:=True;
Form1.Timer1.Enabled:=True;
Form1.Timer1.Interval:=1;
Form1.Timer2.Enabled:=False;
ButonsDisabled;
Form1.Timer3.Enabled:=False;
end;

end.
