unit Overview_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Employees_u;

type
  TfrmOverview = class(TForm)
    btnReservation: TButton;
    btnCustomer: TButton;
    imgVisual: TImage;
    btnBack: TButton;
    btnEmployee: TButton;
    procedure btnReservationClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOverview: TfrmOverview;

implementation

{$R *.dfm}

uses Reservation_u, LogSign_u, Home_u;

procedure TfrmOverview.btnReservationClick(Sender: TObject);
begin
  frmOverview.Hide;
  frmReservation.Show;
end;

procedure TfrmOverview.btnCustomerClick(Sender: TObject);
begin
 frmOverview.Hide;
  frmEmployees.Show;
end;

procedure TfrmOverview.btnBackClick(Sender: TObject);
begin
  frmOverview.Hide;
 frmHome.Show;
end;

end.
