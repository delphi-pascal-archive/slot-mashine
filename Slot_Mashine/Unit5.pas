unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm5 = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Image2: TImage;
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation
uses Unit1;
{$R *.dfm}

procedure TForm5.Image2Click(Sender: TObject);
begin
Form5.Close;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
Form5.Label1.Caption:=inttostr(Config.Kanal * Multiplier * BonusPechalba);
Form5.Label2.Caption:=inttostr(BonusPechalba)+' x '+inttostr(Multiplier)+' x '+inttostr(Config.Kanal)+' = '+inttostr(Config.Kanal * Multiplier * BonusPechalba);
end;

end.
