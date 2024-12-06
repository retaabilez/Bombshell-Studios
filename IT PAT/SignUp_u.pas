unit SignUp_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Overview_u, dmEmployees_u, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmSignup = class(TForm)
    Image1: TImage;
    pnlSignUp: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    edtName: TEdit;
    edtSurname: TEdit;
    edtJob: TEdit;
    Label3: TLabel;
    edtPass: TEdit;
    Button3: TButton;
    Button1: TButton;
    edtCell: TEdit;
    Label5: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSignup: TfrmSignup;

implementation

{$R *.dfm}

procedure TfrmSignup.Button1Click(Sender: TObject);
begin
 frmSignup.Hide;
 frmOverview.Show;
end;

procedure TfrmSignup.Button3Click(Sender: TObject);
var sName, sSurname, sJob, sPassword : STring;
    iCell : Integer;
    bCell, bAll: Boolean;
begin
 // input

 bCell := False;

 if edtName.Text = '' then
 begin
   Showmessage('Please enter your name.');
 end
 else
 begin
   sName := edtName.Text;
 end;

 if edtSurname.Text = '' then
 begin
   Showmessage('Please enter your surname.');
 end
 else
 begin
   sSurname := edtsurname.Text;
 end;

 if edtJob.Text = '' then
 begin
   Showmessage('Please enter your job title.');
 end
 else
 begin
   sJob := edtJob.Text;
 end;

 if edtPass.Text = '' then
 begin
   Showmessage('Please enter your password.');
 end
 else
 begin
   sPassword := edtPass.Text;
 end;

 if NOT Length(edtCell.Text) = 10  then
 begin
  Showmessage('Cellphone number invalid.');
 end
 else
 begin
  iCell := StrToInt(edtCell.Text);
  bCell := True;
 end;

 // processing

  if bCell = True AND NOT ((sPassword = '') OR (sName = '') OR (sSurname = '')) then
  begin
   bAll := True;
  end;

  if bAll = True then
  begin
     with dmEmployees do
    begin
     tblEmployees.Append;

     tblEmployees['EmployeeName'] := sName;
     tblEmployees['EmployeeSurname'] := sSurname;
     tblEmployees['EmployeeNumber'] := IntToStr(iCell);
     tblEmployees['EmployeeJob'] := sJob;
     tblEmployees['EmployeePassword'] := sPassword;

     tblEmployees.Post;
    end;
  end;


 // output


end;

end.
