program ReservationSystem_p;

uses
  Vcl.Forms,
  Home_u in 'Home_u.pas' {frmHome},
  Overview_u in 'Overview_u.pas' {frmOverview},
  LogSign_u in 'LogSign_u.pas' {frmLogSign},
  Login_u in 'Login_u.pas' {frmLogin},
  SignUp_u in 'SignUp_u.pas' {frmSignup},
  Reservation_u in 'Reservation_u.pas' {frmReservation},
  dmReservation_u in 'dmReservation_u.pas' {dmReservation: TDataModule},
  dmReservations_u in 'dmReservations_u.pas' {dmReservations: TDataModule},
  Employees_u in 'Employees_u.pas' {frmEmployees},
  dmEmployees_u in 'dmEmployees_u.pas' {dmEmployees: TDataModule},
  dmCustomers_u in 'dmCustomers_u.pas' {dmCustomers: TDataModule},
  EmployeeOverview_u in 'EmployeeOverview_u.pas' {frmEmployee};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmOverview, frmOverview);
  Application.CreateForm(TfrmLogSign, frmLogSign);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmReservation, frmReservation);
  Application.CreateForm(TdmReservation, dmReservation);
  Application.CreateForm(TdmReservations, dmReservations);
  Application.CreateForm(TfrmEmployees, frmEmployees);
  Application.CreateForm(TdmEmployees, dmEmployees);
  Application.CreateForm(TdmCustomers, dmCustomers);
  Application.CreateForm(TfrmEmployee, frmEmployee);
  Application.Run;
end.
