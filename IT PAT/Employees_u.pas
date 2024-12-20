unit Employees_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, dmEmployees_u,
  Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TfrmEmployees = class(TForm)
    dbgEmployees: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ListBox1: TListBox;
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmployees: TfrmEmployees;

implementation

{$R *.dfm}

procedure TfrmEmployees.Button2Click(Sender: TObject);
begin
  with dmEmployees do
  begin
    tblEmployees.Edit;
    tblEMployees['EmployeePassword'] := InputBox('Change your password','Enter your new password','');
    Showmessage('Changes made successfully!');
    tblEmployees.Post;
  end;
end;

procedure TfrmEmployees.Button3Click(Sender: TObject);
begin
 with dmEmployees do
  begin
    tblEmployees.Edit;
    tblEMployees['EmployeeName'] := InputBox('Change the name','Edit employee name','');
    tblEMployees['EmployeeSurname'] := InputBox('Change the surname','Edit employee surname','');
    Showmessage('Changes made successfully!');
    tblEmployees.Post;
  end;
end;

procedure TfrmEmployees.FormActivate(Sender: TObject);
begin
 dbgEmployees.Columns[0].Width := 115;
 dbgEmployees.Columns[1].Width := 145;
 dbgEmployees.Columns[2].Width := 160;
 dbgEmployees.Columns[3].Width := 160;
 dbgEmployees.Columns[4].Width := 170;
 dbgEmployees.Columns[5].Width := 270;


end;

end.
