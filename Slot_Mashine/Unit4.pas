unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm4 = class(TForm)
    Chasha9: TImage;
    Chasha10: TImage;
    Chasha11: TImage;
    Chasha12: TImage;
    Chasha13: TImage;
    Chasha14: TImage;
    Chasha15: TImage;
    Chasha1: TImage;
    Chasha2: TImage;
    Chasha4: TImage;
    Chasha5: TImage;
    Chasha6: TImage;
    Chasha7: TImage;
    Chasha8: TImage;
    Chasha3: TImage;
    ChashaBira: TImage;
    ChashaVino: TImage;
    ChashaKoniak: TImage;
    ChashaVodka: TImage;
    ChashaRakia: TImage;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure Chasha1Click(Sender: TObject);
    procedure Chasha2Click(Sender: TObject);
    procedure Chasha3Click(Sender: TObject);
    procedure Chasha4Click(Sender: TObject);
    procedure Chasha5Click(Sender: TObject);
    procedure Chasha6Click(Sender: TObject);
    procedure Chasha7Click(Sender: TObject);
    procedure Chasha8Click(Sender: TObject);
    procedure Chasha9Click(Sender: TObject);
    procedure Chasha10Click(Sender: TObject);
    procedure Chasha11Click(Sender: TObject);
    procedure Chasha12Click(Sender: TObject);
    procedure Chasha13Click(Sender: TObject);
    procedure Chasha14Click(Sender: TObject);
    procedure Chasha15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  Enable2:boolean;
  Buf:array[1..15]of Cardinal;
  XX1,XX2,XX3,XX4,XX5:byte;
implementation
uses Unit1, Unit3;
{$R *.dfm}
procedure Razpredelenie;forward;
Function Proverka22(XX:byte):boolean;forward;
procedure Poiaviavane;forward;

procedure Razpredelenie;
Label 11,12,13,21,22,23,31,32,33,41,42,43,51,52,53;
var XX,NN:byte;
begin
 For XX:=1 to 15 do Buf[XX]:=0;

11:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 11;
 Buf[NN]:=Bonusi * 5;
12:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 12;
 Buf[NN]:=Bonusi * 5;
13:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 13;
 Buf[NN]:=Bonusi * 5;
21:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 21;
 Buf[NN]:=Bonusi * 10;
22:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 22;
 Buf[NN]:=Bonusi * 10;
23:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 23;
 Buf[NN]:=Bonusi * 10;
31:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 31;
 Buf[NN]:=Bonusi * 20;
32:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 32;
 Buf[NN]:=Bonusi * 20;
33:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 33;
 Buf[NN]:=Bonusi * 20;
41:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 41;
 Buf[NN]:=Bonusi * 50;
42:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 42;
 Buf[NN]:=Bonusi * 50;
43:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 43;
 Buf[NN]:=Bonusi * 50;
51:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 51;
 Buf[NN]:=Bonusi * 150;
52:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 52;
 Buf[NN]:=Bonusi * 150;
53:
 NN:=Random(15)+1;
 IF Buf[NN]<>0 Then Goto 53;
 Buf[NN]:=Bonusi * 150;
end;

Function Proverka22(XX:byte):boolean;
begin
Result:=False;
IF Buf[XX]=(Bonusi*5) Then inc(XX1);
IF XX1 > 2 Then Result:=True;
IF XX1 > 2 Then BonusPechalba:=Bonusi*5;

IF Buf[XX]=(Bonusi*10) Then inc(XX2);
IF XX2 > 2 Then Result:=True;
IF XX2 > 2 Then BonusPechalba:=Bonusi*10;

IF Buf[XX]=(Bonusi*20) Then inc(XX3);
IF XX3 > 2 Then Result:=True;
IF XX3 > 2 Then BonusPechalba:=Bonusi*20;

IF Buf[XX]=(Bonusi*50) Then inc(XX4);
IF XX4 > 2 Then Result:=True;
IF XX4 > 2 Then BonusPechalba:=Bonusi*50;

IF Buf[XX]=(Bonusi*150) Then inc(XX5);
IF XX5 > 2 Then Result:=True;
IF XX5 > 2 Then BonusPechalba:=Bonusi*150;
end;

procedure Poiaviavane;
begin
Enable2:=False;
Form4.Repaint;
Sleep(300);
Form4.Label1.Caption:=inttostr(Buf[1]);
Form4.Label1.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label2.Caption:=inttostr(Buf[2]);
Form4.Label2.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label3.Caption:=inttostr(Buf[3]);
Form4.Label3.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label4.Caption:=inttostr(Buf[4]);
Form4.Label4.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label5.Caption:=inttostr(Buf[5]);
Form4.Label5.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label6.Caption:=inttostr(Buf[6]);
Form4.Label6.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label7.Caption:=inttostr(Buf[7]);
Form4.Label7.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label8.Caption:=inttostr(Buf[8]);
Form4.Label8.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label9.Caption:=inttostr(Buf[9]);
Form4.Label9.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label10.Caption:=inttostr(Buf[10]);
Form4.Label10.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label11.Caption:=inttostr(Buf[11]);
Form4.Label11.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label12.Caption:=inttostr(Buf[12]);
Form4.Label12.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label13.Caption:=inttostr(Buf[13]);
Form4.Label13.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label14.Caption:=inttostr(Buf[14]);
Form4.Label14.Visible:=True;
Form4.Repaint;
Sleep(300);
Form4.Label15.Caption:=inttostr(Buf[15]);
Form4.Label15.Visible:=True;
Form4.Repaint;
Sleep(6000);
Form4.Close;
end;


procedure TForm4.FormShow(Sender: TObject);
begin
 Case Butilka of
 1:
   begin
   Form4.Chasha1.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha2.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha3.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha4.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha5.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha6.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha7.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha8.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha9.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha10.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha11.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha12.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha13.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha14.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   Form4.Chasha15.Picture.Bitmap:=Form4.ChashaVodka.Picture.Bitmap;
   end;
 2:
   begin
   Form4.Chasha1.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha2.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha3.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha4.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha5.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha6.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha7.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha8.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha9.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha10.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha11.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha12.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha13.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha14.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   Form4.Chasha15.Picture.Bitmap:=Form4.ChashaKoniak.Picture.Bitmap;
   end;
 3:
   begin
   Form4.Chasha1.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha2.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha3.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha4.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha5.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha6.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha7.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha8.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha9.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha10.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha11.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha12.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha13.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha14.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   Form4.Chasha15.Picture.Bitmap:=Form4.ChashaRakia.Picture.Bitmap;
   end;
 4:
   begin
   Form4.Chasha1.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha2.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha3.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha4.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha5.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha6.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha7.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha8.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha9.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha10.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha11.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha12.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha13.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha14.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   Form4.Chasha15.Picture.Bitmap:=Form4.ChashaVino.Picture.Bitmap;
   end;
 5:
   begin
   Form4.Chasha1.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha2.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha3.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha4.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha5.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha6.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha7.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha8.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha9.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha10.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha11.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha12.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha13.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha14.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   Form4.Chasha15.Picture.Bitmap:=Form4.ChashaBira.Picture.Bitmap;
   end;
 end;

Form4.Label1.Visible:=False;
Form4.Label2.Visible:=False;
Form4.Label3.Visible:=False;
Form4.Label4.Visible:=False;
Form4.Label5.Visible:=False;
Form4.Label6.Visible:=False;
Form4.Label7.Visible:=False;
Form4.Label8.Visible:=False;
Form4.Label9.Visible:=False;
Form4.Label10.Visible:=False;
Form4.Label11.Visible:=False;
Form4.Label12.Visible:=False;
Form4.Label13.Visible:=False;
Form4.Label14.Visible:=False;
Form4.Label15.Visible:=False;

Form4.Label1.Caption:='';
Form4.Label2.Caption:='';
Form4.Label3.Caption:='';
Form4.Label4.Caption:='';
Form4.Label5.Caption:='';
Form4.Label6.Caption:='';
Form4.Label7.Caption:='';
Form4.Label8.Caption:='';
Form4.Label9.Caption:='';
Form4.Label10.Caption:='';
Form4.Label11.Caption:='';
Form4.Label12.Caption:='';
Form4.Label13.Caption:='';
Form4.Label14.Caption:='';
Form4.Label15.Caption:='';

Form4.Label1.Font.Size:=10;
Form4.Label2.Font.Size:=10;
Form4.Label3.Font.Size:=10;
Form4.Label4.Font.Size:=10;
Form4.Label5.Font.Size:=10;
Form4.Label6.Font.Size:=10;
Form4.Label7.Font.Size:=10;
Form4.Label8.Font.Size:=10;
Form4.Label9.Font.Size:=10;
Form4.Label10.Font.Size:=10;
Form4.Label11.Font.Size:=10;
Form4.Label12.Font.Size:=10;
Form4.Label13.Font.Size:=10;
Form4.Label14.Font.Size:=10;
Form4.Label15.Font.Size:=10;

Form4.Label16.Caption:='X'+inttostr(Multiplier);
Case Butilka of
1:Form4.Image2.Picture.Bitmap:=Form3.Butilka1.Picture.Bitmap;
2:Form4.Image2.Picture.Bitmap:=Form3.Butilka2.Picture.Bitmap;
3:Form4.Image2.Picture.Bitmap:=Form3.Butilka3.Picture.Bitmap;
4:Form4.Image2.Picture.Bitmap:=Form3.Butilka4.Picture.Bitmap;
5:Form4.Image2.Picture.Bitmap:=Form3.Butilka5.Picture.Bitmap;
end;

Enable2:=True;
BonusPechalba:=0;

XX1:=0;
XX2:=0;
XX3:=0;
XX4:=0;
XX5:=0;

Razpredelenie;
end;

procedure TForm4.Chasha1Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label1.Font.Size:=20;
Form4.Label1.Caption:=inttostr(Buf[1]);
Form4.Label1.Visible:=True;
IF Proverka22(1)=True Then Poiaviavane;
end;

procedure TForm4.Chasha2Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label2.Font.Size:=20;
Form4.Label2.Caption:=inttostr(Buf[2]);
Form4.Label2.Visible:=True;
IF Proverka22(2)=True Then Poiaviavane;
end;

procedure TForm4.Chasha3Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label3.Font.Size:=20;
Form4.Label3.Caption:=inttostr(Buf[3]);
Form4.Label3.Visible:=True;
IF Proverka22(3)=True Then Poiaviavane;
end;

procedure TForm4.Chasha4Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label4.Font.Size:=20;
Form4.Label4.Caption:=inttostr(Buf[4]);
Form4.Label4.Visible:=True;
IF Proverka22(4)=True Then Poiaviavane;
end;

procedure TForm4.Chasha5Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label5.Font.Size:=20;
Form4.Label5.Caption:=inttostr(Buf[5]);
Form4.Label5.Visible:=True;
IF Proverka22(5)=True Then Poiaviavane;
end;

procedure TForm4.Chasha6Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label6.Font.Size:=20;
Form4.Label6.Caption:=inttostr(Buf[6]);
Form4.Label6.Visible:=True;
IF Proverka22(6)=True Then Poiaviavane;
end;

procedure TForm4.Chasha7Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label7.Font.Size:=20;
Form4.Label7.Caption:=inttostr(Buf[7]);
Form4.Label7.Visible:=True;
IF Proverka22(7)=True Then Poiaviavane;
end;

procedure TForm4.Chasha8Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label8.Font.Size:=20;
Form4.Label8.Caption:=inttostr(Buf[8]);
Form4.Label8.Visible:=True;
IF Proverka22(8)=True Then Poiaviavane;
end;

procedure TForm4.Chasha9Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label9.Font.Size:=20;
Form4.Label9.Caption:=inttostr(Buf[9]);
Form4.Label9.Visible:=True;
IF Proverka22(9)=True Then Poiaviavane;
end;

procedure TForm4.Chasha10Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label10.Font.Size:=20;
Form4.Label10.Caption:=inttostr(Buf[10]);
Form4.Label10.Visible:=True;
IF Proverka22(10)=True Then Poiaviavane;
end;

procedure TForm4.Chasha11Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label11.Font.Size:=20;
Form4.Label11.Caption:=inttostr(Buf[11]);
Form4.Label11.Visible:=True;
IF Proverka22(11)=True Then Poiaviavane;
end;

procedure TForm4.Chasha12Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label12.Font.Size:=20;
Form4.Label12.Caption:=inttostr(Buf[12]);
Form4.Label12.Visible:=True;
IF Proverka22(12)=True Then Poiaviavane;
end;

procedure TForm4.Chasha13Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label13.Font.Size:=20;
Form4.Label13.Caption:=inttostr(Buf[13]);
Form4.Label13.Visible:=True;
IF Proverka22(13)=True Then Poiaviavane;
end;

procedure TForm4.Chasha14Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label14.Font.Size:=20;
Form4.Label14.Caption:=inttostr(Buf[14]);
Form4.Label14.Visible:=True;
IF Proverka22(14)=True Then Poiaviavane;
end;

procedure TForm4.Chasha15Click(Sender: TObject);
begin
IF Enable2=False Then Exit;
Form4.Label15.Font.Size:=20;
Form4.Label15.Caption:=inttostr(Buf[15]);
Form4.Label15.Visible:=True;
IF Proverka22(15)=True Then Poiaviavane;
end;

end.
