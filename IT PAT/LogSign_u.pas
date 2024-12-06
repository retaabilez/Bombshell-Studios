unit LogSign_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmLogSign = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Image1: TImage;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogSign: TfrmLogSign;

implementation

{$R *.dfm}

uses Overview_u, Login_u, SignUp_u;

procedure TfrmLogSign.Button1Click(Sender: TObject);
begin
 frmLogSign.Hide;
 frmLogin.Show;
end;

procedure TfrmLogSign.Button2Click(Sender: TObject);
begin
 frmLogSign.Hide;
 frmSignup.Show;
end;

procedure TfrmLogSign.Button3Click(Sender: TObject);
begin
 frmLogSign.Hide;
 frmOverview.Show;
end;

end.
