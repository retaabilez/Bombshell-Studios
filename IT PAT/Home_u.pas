unit Home_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Overview_u;

type
  TfrmHome = class(TForm)
    imgLogo: TImage;
    btnEnter: TButton;
    edtLogin: TEdit;
    btnExit: TButton;
    lblSlogan: TLabel;
    procedure btnEnterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;
  const Password = 1234;
implementation

{$R *.dfm}

procedure TfrmHome.btnEnterClick(Sender: TObject);
begin

 if edtLogin.Text = '' then
    begin
      Showmessage('Please enter the password.');
    end
    else
    begin
     if StrToInt(edtLogin.Text) = Password then
      begin
      frmHome.Hide;
      frmOverview.Show;
      end
      else
      begin
       Showmessage('Password is incorrect.');
      end;
    end;


end;

end.
