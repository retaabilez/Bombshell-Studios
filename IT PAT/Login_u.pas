unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Overview_u, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, dmEmployees_u;

type
  TfrmLogin = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  sName, sSurname, sPassword : String;

implementation

{$R *.dfm}

uses Employees_u;

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
 frmLogin.Hide;
 frmOverview.Show;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var bFound : Boolean;
begin
  sName := edtName.Text;
  sSurname := edtSurname.Text;
  sPassword := edtPassword.Text;
  bFound := False;

  with dmEmployees do
  begin
    tblEmployees.First;

    while NOT tblEmployees.EOF do
    begin
     if (sName = tblEmployees['EMployeeName']) AND (sSurname = tblEmployees['EmployeeSurname']) AND (sPassword = tblEmployees['EmployeePassword']) then
      begin
       frmLogin.Hide;
       frmEmployees.Show;
       bFound := True;
      end;
     tblEmployees.Next;
    end;
  end;

  if bFound = False then
  begin
    MessageDlg('Account not found.',mtError,[mbOK],0);
  end;
end;

end.
