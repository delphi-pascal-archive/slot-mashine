unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls;

type
  TForm6 = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Timer1: TTimer;
    Shape1: TShape;
    Shape2: TShape;
    Image3: TImage;
    Image4: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Image5: TImage;
    Label1: TLabel;
    Timer2: TTimer;
    ImageVodka: TImage;
    ImageBira: TImage;
    List1: TImage;
    List2: TImage;
    List3: TImage;
    List4: TImage;
    List5: TImage;
    List6: TImage;
    List7: TImage;
    List8: TImage;
    List9: TImage;
    List10: TImage;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  VV:byte;
  DoublePechalba:int64;
  Level,Chislo:byte;
  Enable1:boolean;
implementation
uses Unit1;
{$R *.dfm}

procedure Poznavane;forward;
Function  Slu4aino:byte;forward;
procedure Poznato;forward;
procedure Nepoznato;forward;
procedure ListAdd(NN:byte);forward;



procedure ListAdd(NN:byte);
begin
Form6.List10.Picture.Bitmap:=Form6.List9.Picture.Bitmap;
Form6.List9.Picture.Bitmap:=Form6.List8.Picture.Bitmap;
Form6.List8.Picture.Bitmap:=Form6.List7.Picture.Bitmap;
Form6.List7.Picture.Bitmap:=Form6.List6.Picture.Bitmap;
Form6.List6.Picture.Bitmap:=Form6.List5.Picture.Bitmap;
Form6.List5.Picture.Bitmap:=Form6.List4.Picture.Bitmap;
Form6.List4.Picture.Bitmap:=Form6.List3.Picture.Bitmap;
Form6.List3.Picture.Bitmap:=Form6.List2.Picture.Bitmap;
Form6.List2.Picture.Bitmap:=Form6.List1.Picture.Bitmap;
IF NN=1 Then
   Form6.List1.Picture.Bitmap:=Form6.ImageVodka.Picture.Bitmap
   Else
   Form6.List1.Picture.Bitmap:=Form6.ImageBira.Picture.Bitmap;
end;




Function  Slu4aino:byte;
begin
Result:=Random(256);
Result:=Result and 1;
ListAdd(Result);
end;

procedure Poznavane;
begin
 IF Chislo=Slu4aino Then Poznato Else Nepoznato;
end;

procedure Poznato;
begin
inc(Level);
Case Level of
1:
  begin
  DoublePechalba:=strtoint(Form6.Panel1.Caption);
  Form6.Panel1.Color:=clLime;
  Form6.Timer1.Interval:=Form6.Timer1.Interval - 30;
  end;
2:
  begin
  DoublePechalba:=strtoint(Form6.Panel2.Caption);
  Form6.Panel2.Color:=clLime;
  Form6.Timer1.Interval:=Form6.Timer1.Interval - 30;
  end;
3:
 begin
 DoublePechalba:=strtoint(Form6.Panel3.Caption);
 Form6.Panel3.Color:=clLime;
 Form6.Timer1.Interval:=Form6.Timer1.Interval - 30;
 end;
4:
 begin
 DoublePechalba:=strtoint(Form6.Panel4.Caption);
 Form6.Panel4.Color:=clLime;
 Form6.Timer1.Interval:=Form6.Timer1.Interval - 30;
 end;
5:
 begin
 DoublePechalba:=strtoint(Form6.Panel5.Caption);
 Form6.Panel5.Color:=clLime;
 Form6.Timer1.Interval:=Form6.Timer1.Interval - 30;
 end;
6:
 begin
 DoublePechalba:=strtoint(Form6.Panel6.Caption);
 Form6.Panel6.Color:=clLime;
 Form6.Timer1.Interval:=Form6.Timer1.Interval - 30;
 Form6.Timer2.Enabled:=True;
 end;
7:
 begin
 DoublePechalba:=strtoint(Form6.Panel7.Caption);
 Form6.Panel7.Color:=clLime;
 Form6.Timer1.Enabled:=False;
 Form6.Timer2.Enabled:=False;
 Form6.Label1.Caption:=inttostr(DoublePechalba);
 Form6.Refresh;
 Sleep(4000);
 Form6.Close;
 end;
end;

Form6.Label1.Caption:=inttostr(DoublePechalba);
end;

procedure Nepoznato;
begin
Enable1:=False;
DoublePechalba:=0;
Form6.Label1.Caption:=inttostr(DoublePechalba);
 Form6.Timer1.Enabled:=False;
 Form6.Timer2.Enabled:=False;
inc(Level);
Case Level of
1:Form6.Panel1.Color:=clMaroon;
2:Form6.Panel2.Color:=clMaroon;
3:Form6.Panel3.Color:=clMaroon;
4:Form6.Panel4.Color:=clMaroon;
5:Form6.Panel5.Color:=clMaroon;
6:Form6.Panel6.Color:=clMaroon;
7:Form6.Panel7.Color:=clMaroon;
end;


Form6.Refresh;
Sleep(4000);
Form6.Close;
end;



procedure TForm6.FormShow(Sender: TObject);
begin
Form6.Timer1.Enabled:=True;
Form6.Timer2.Enabled:=False;
IF Config.Joker=0 Then Form6.Image4.Visible:=True;

Form6.Panel1.Color:=clYellow;
Form6.Panel2.Color:=clYellow;
Form6.Panel3.Color:=clYellow;
Form6.Panel4.Color:=clYellow;
Form6.Panel5.Color:=clYellow;
Form6.Panel6.Color:=clYellow;
Form6.Panel7.Color:=clYellow;

Form6.Panel1.Caption:=inttostr(Config.Pechalba *2);
Form6.Panel2.Caption:=inttostr(Config.Pechalba *4);
Form6.Panel3.Caption:=inttostr(Config.Pechalba *8);
Form6.Panel4.Caption:=inttostr(Config.Pechalba *16);
Form6.Panel5.Caption:=inttostr(Config.Pechalba *32);
Form6.Panel6.Caption:=inttostr(Config.Pechalba *64);
Form6.Panel7.Caption:=inttostr(Config.Pechalba *300);

DoublePechalba:=Config.Pechalba;
Randomize;
Level:=0;
Form6.Label1.Caption:=inttostr(DoublePechalba);

  ButonDouble:=False;
  Form1.ImageDouble.Picture.Bitmap:=Form1.Image19.Picture.Bitmap;

  Enable1:=True;
Form6.Timer1.Interval:=400;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form6.Timer1.Enabled:=False;
end;

procedure TForm6.Timer1Timer(Sender: TObject);
var NN:byte;
begin
inc(VV);
NN:=VV and 1;
IF NN=0 Then
  begin
  Form6.Shape1.Visible:=True;
  Form6.Shape2.Visible:=False;
  end Else begin
  Form6.Shape1.Visible:=False;
  Form6.Shape2.Visible:=True;
  end;

end;

procedure TForm6.Image4Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
inc(Config.Joker);
Form6.Image4.Visible:=False;
ListAdd(Chislo);
Poznato;
end;

procedure TForm6.Image1Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Form6.Shape1.Visible:=True;
Form6.Shape2.Visible:=False;
Form6.Refresh;
Chislo:=1;
Poznavane;
Sleep(1000);
end;

procedure TForm6.Image2Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Form6.Shape1.Visible:=False;
Form6.Shape2.Visible:=True;
Form6.Refresh;
Chislo:=0;
Poznavane;
Sleep(1000);
end;

procedure TForm6.Image3Click(Sender: TObject);
begin
Form6.Close;
end;

procedure TForm6.Timer2Timer(Sender: TObject);
var XX,YY:integer;
begin
XX:=Random(31)-15;
YY:=Random(31)-15;
Form6.Top:=Form6.Top + YY;
Form6.Left:=Form6.Left + XX;
end;

end.
