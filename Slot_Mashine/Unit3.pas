unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, StdCtrls;

type
  TForm3 = class(TForm)
    Butilka1: TImage;
    Butilka4: TImage;
    Butilka3: TImage;
    Butilka2: TImage;
    Butilka5: TImage;
    Image5: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure FormShow(Sender: TObject);
    procedure Butilka1Click(Sender: TObject);
    procedure Butilka2Click(Sender: TObject);
    procedure Butilka3Click(Sender: TObject);
    procedure Butilka4Click(Sender: TObject);
    procedure Butilka5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  Multi:array[1..5]of byte;
  Enable1:Boolean;
implementation
uses Unit1;
{$R *.dfm}
procedure Razpredelenie;forward;
Function Proverka11(XX:byte):boolean;forward;
procedure Poiaviavane;forward;


procedure Poiaviavane;
begin
Enable1:=False;
Form3.Refresh;
Sleep(1000);
Form3.Label1.Caption:='X'+inttostr(Multi[1]);
Form3.Label1.Visible:=True;
Form3.Refresh;
Sleep(1000);
Form3.Label2.Caption:='X'+inttostr(Multi[2]);
Form3.Label2.Visible:=True;
Form3.Refresh;
Sleep(1000);
Form3.Label3.Caption:='X'+inttostr(Multi[3]);
Form3.Label3.Visible:=True;
Form3.Refresh;
Sleep(1000);
Form3.Label4.Caption:='X'+inttostr(Multi[4]);
Form3.Label4.Visible:=True;
Form3.Refresh;
Sleep(1000);
Form3.Label5.Caption:='X'+inttostr(Multi[5]);
Form3.Label5.Visible:=True;
Form3.Refresh;
Sleep(6000);
Form3.Close;
end;


Function Proverka11(XX:byte):boolean;
begin
Result:=False;
IF Multi[1]=XX Then Result:=True;
IF Multi[2]=XX Then Result:=True;
IF Multi[3]=XX Then Result:=True;
IF Multi[4]=XX Then Result:=True;
IF Multi[5]=XX Then Result:=True;
end;


procedure Razpredelenie;
Label 11;
var XX,NN:byte;
begin
 For XX:=1 to 5 do Multi[XX]:=0;

 For XX:=1 to 5 do
 begin
 11:
 NN:=Random(5)+1;
 IF Proverka11(NN)=True Then Goto 11;
 Multi[XX]:=NN;
 end;
end;



procedure TForm3.FormShow(Sender: TObject);
begin
Form3.Label1.Visible:=False;
Form3.Label2.Visible:=False;
Form3.Label3.Visible:=False;
Form3.Label4.Visible:=False;
Form3.Label5.Visible:=False;
Form3.Label1.Caption:='';
Form3.Label2.Caption:='';
Form3.Label3.Caption:='';
Form3.Label4.Caption:='';
Form3.Label5.Caption:='';
Form3.Label1.Font.Size:=10;
Form3.Label2.Font.Size:=10;
Form3.Label3.Font.Size:=10;
Form3.Label4.Font.Size:=10;
Form3.Label5.Font.Size:=10;
Butilka:=0;
Multiplier:=0;
BonusPechalba:=0;
Razpredelenie;
Enable1:=True;
end;

procedure TForm3.Butilka1Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Multiplier:=Multi[1];
Butilka:=1;
Form3.Label1.Font.Size:=20;
Form3.Label1.Caption:='X'+inttostr(Multi[1]);
Form3.Label1.Visible:=True;
Poiaviavane;
end;

procedure TForm3.Butilka2Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Multiplier:=Multi[2];
Butilka:=2;
Form3.Label2.Font.Size:=20;
Form3.Label2.Caption:='X'+inttostr(Multi[2]);
Form3.Label2.Visible:=True;
Poiaviavane;
end;

procedure TForm3.Butilka3Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Butilka:=3;
Multiplier:=Multi[3];
Form3.Label3.Font.Size:=20;
Form3.Label3.Caption:='X'+inttostr(Multi[3]);
Form3.Label3.Visible:=True;
Poiaviavane;
end;

procedure TForm3.Butilka4Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Butilka:=4;
Multiplier:=Multi[4];
Form3.Label4.Font.Size:=20;
Form3.Label4.Caption:='X'+inttostr(Multi[4]);
Form3.Label4.Visible:=True;
Poiaviavane;
end;

procedure TForm3.Butilka5Click(Sender: TObject);
begin
IF Enable1=False Then Exit;
Multiplier:=Multi[5];
Butilka:=5;
Form3.Label5.Font.Size:=20;
Form3.Label5.Caption:='X'+inttostr(Multi[5]);
Form3.Label5.Visible:=True;
Poiaviavane;
end;

end.
