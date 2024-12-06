unit Reservation_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Overview_u, Data.DB, Vcl.StdCtrls,
  Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, dmReservations_u, Vcl.Imaging.pngimage,
  Vcl.DBCtrls, dmCustomers_u;

type
  TfrmReservation = class(TForm)
    lblDate: TLabel;
    dtpDate: TDateTimePicker;
    dbgReservation: TDBGrid;
    imgLogo: TImage;
    lblService: TLabel;
    cbxService: TComboBox;
    btnDateSearch: TButton;
    btnServiceSearch: TButton;
    btnAdd: TButton;
    btnCreateReport: TButton;
    btnSaveReport: TButton;
    btnHome: TButton;
    btnCustomer: TButton;
    btnToday: TButton;
    btnDelete: TButton;
    dbnReservations: TDBNavigator;
    redOutput: TRichEdit;
    Button1: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnTodayClick(Sender: TObject);
    procedure btnCustomerClick(Sender: TObject);
    procedure btnServiceSearchClick(Sender: TObject);
    procedure btnNameSearchClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnCreateReportClick(Sender: TObject);
    procedure btnSaveReportClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDateSearchClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmReservation: TfrmReservation;

implementation

{$R *.dfm}

procedure TfrmReservation.btnAddClick(Sender: TObject);
var bReservationMade : Boolean;
begin
  bReservationMade := False;
  with dmReservations do
  begin
    if bReservationMade = False then
    begin
     tblReservation.Append;
     tblReservation['ReservationDate'] := StrToDate(InputBox('New Reservation','Enter Date (yyyy/mm/dd)',''));
     tblReservation['ReservationTime'] := StrToInt(InputBox('New Reservation', 'Enter Time (24-hour clock)',''));
     tblReservation['ReservationType'] := InputBox('New Reservation', 'Enter Service','');
     bReservationMade := True;
    end;

    if bReservationMade = True then
    begin
      if tblReservation['ReservationType'] = 'Nails' then
      begin
        tblReservation['Nails'] := True;
        tblReservation['EmployeeID'] := 1;
      end;

      if tblReservation['ReservationType'] = 'Makeup' then
      begin
        tblReservation['Makeup'] := True;
        tblReservation['EmployeeID'] := 6;
      end;

      if tblReservation['ReservationType'] = 'Hair' then
      begin

       tblReservation['Hair'] := True;

         if Inputbox('Hair reservation','Hair service?','') = 'Braid/Weave' then
        begin
          tblReservation['EmployeeID'] := 4;
        end
        else
        begin
          if Inputbox('Hair reservation','Hair service?','') = 'Relax/Blowout' then
          begin
           tblReservation['EmployeeID'] := 3;
          end
          else
          begin
            if Inputbox('Hair reservation','Hair service?','') = 'Dye' then
            begin
            tblReservation['EmployeeID'] := 7;
           end
          end;
        end;

      end;

      if tblReservation['ReservationType'] = 'Massage' then
      begin
        tblReservation['Massage'] := True;
        tblReservation['EmployeeID'] := 5;
      end;

       if tblReservation['ReservationType'] = 'Trim' then
      begin
        tblReservation['Trim'] := True;
        tblReservation['EmployeeID'] := 2;
      end;
    end;

  tblReservation.Post;
  end;
end;

procedure TfrmReservation.btnCreateReportClick(Sender: TObject);
var dtDate :TDateTime;
    iCount, iNails, iHair, iMakeup, iMassage : integer;
begin
 // input
 redOutput.Clear;
 dtDate := dtpDate.Date;
 iCount := 0;
 iNails := 0;
 iHair := 0;
 iMakeup := 0;
 iMassage := 0;

 // processing

 with dmReservations do
 begin
  tblReservation.First;
  while NOT tblReservation.EOF do
   begin
    if tblReservation['ReservationDate'] = dtDate then
    begin
     inc(iCount);
     if tblReservation['ReservationType'] = 'Nails' then
     begin
       inc(iNails);
     end
     else
     begin
       if tblReservation['ReservationType'] = 'Hair' then
       begin
        inc(iHair);
       end
       else
       begin
          if tblReservation['ReservationType'] = 'Massage' then
        begin
         inc(iMassage);
        end
        else
        begin
           inc(iMakeup);
        end;
       end;
     end;

    end;
    tblReservation.Next;
   end;


 end;

 // output

  redOutput.Lines.Add('Date Selected: ' + DateToStr(dtDate));
  redOutput.Lines.Add('Total Nail Appointments: ' + IntToStr(iNails));
  redOutput.Lines.Add('Total Hair Appointments: ' + IntToStr(iHair));
  redOutput.Lines.Add('Total Massage Appointments: ' + IntToStr(iMassage));
  redOutput.Lines.Add('Total Makeup Appointments: ' + IntToStr(iMakeup));
  redOutput.Lines.Add('===========================');
end;

procedure TfrmReservation.btnCustomerClick(Sender: TObject);
var sCustomerID : STring;
begin

  redOutput.Clear;
  sCustomerID := dmReservations.tblReservation['CustomerID'];

   dmCustomers.tblCustomers.First;

   while NOT dmCustomers.tblCustomers.EOF do
   begin
     if dmCustomers.tblCustomers['CustomerID'] = sCustomerID then
     begin
       redOutput.Lines.Add('Customer Name: ' + dmCustomers.tblCustomers['CustomerName'] + ' ' + dmCustomers.tblCustomers['CustomerSurname']);
       redOutput.Lines.Add('Cellphone number: ' + '0' + IntToStr(dmCustomers.tblCustomers['CustomerNumber']));
       redOutput.Lines.Add('Email Address: ' + dmCustomers.tblCustomers['CustomerEmail']);
     end;
    dmCustomers.tblCustomers.Next;
   end;



end;

procedure TfrmReservation.btnDateSearchClick(Sender: TObject);
var dtDate : TDateTimePicker;
begin
  {dtDate := dtpDate.Date;
  with dmReservations do
  begin
   tblReservation.First;
    while NOT tblReservation.EOF do
    begin
     if tblREservation['ReservationDate'] = dtpDate then
      begin
       tblReservation.Filtered := False;
       tblReservation.Filter := 'ReservationDate =' + dtpDate;
       tblReservation.Filtered := True;
      end;
      tblReservation.Next;
    end;

  end;    }
end;

procedure TfrmReservation.btnDeleteClick(Sender: TObject);
begin
 with dmReservations do
 begin
   if MessageDlg('Are you sure you want to delete this reservation?', mtWarning, [mbYes, mbNo], 0) = mrYes then
   begin
     tblReservation.Delete;
   end;
 end;
end;

procedure TfrmReservation.btnNameSearchClick(Sender: TObject);
var sName, sSurname : String;
begin
 sName := InputBox('Name','Enter first name','');
 sSurname := InputBox('Surname','Enter last name','');

  with dmCustomers do
  begin
   tblCustomers.First;
    while NOT tblCustomers.EOF do
    begin
     if (tblCustomers['CustomerName'] = sName) AND (tblCustomers['CustomerSurname'] = sSurname)  then
      begin

      end;
      tblCustomers.Next;
    end;

  end;

end;

procedure TfrmReservation.btnSaveReportClick(Sender: TObject);
var tReport : Textfile;
    sLine : String;
    i : Integer;
begin
 if NOT FileExists('reports.txt') then
 begin
   Showmessage('Textfile not found.');
   Exit;
 end
 else
 begin
   AssignFile(tReport, 'reports.txt');
 end;

  Append(tReport);

   for i := 1 to redOutput.Lines.Count -1 do
   begin
     sLine := redOutput.Lines[i];
     WriteLn(tReport, sLine);
   end;
   CloseFile(tReport);

   Showmessage('Report saved!');

end;

procedure TfrmReservation.btnServiceSearchClick(Sender: TObject);
var sService : String;
begin
  sService := cbxService.Items[cbxService.ItemIndex];

  with dmReservations do
  begin
   tblReservation.First;
    while NOT tblReservation.EOF do
    begin
     if tblREservation['ReservationType'] then
      begin
       tblReservation.Filtered := False;
       tblReservation.Filter := 'ReservationType =' + sService;
       tblReservation.Filtered := True;
      end;
      tblReservation.Next;
    end;

  end;


end;

procedure TfrmReservation.btnTodayClick(Sender: TObject);
var dtToday : TDateTime;
begin
 { dtToday := Date;
 with dmReservations do
 begin
   tblReservation.First;
   tblReservation.Filtered := False;
   while NOT tblReservation.EOF do
    begin
      if tblReservation['ReservationDate'] = dtToday then
       begin
         tblReservation.Filter := 'ReservationDate =' + DateToStr(dtToday);
         tblReservation.Filtered := True;
       end;
    end;
 end; }
end;

procedure TfrmReservation.FormActivate(Sender: TObject);
begin
 dbgReservation.Columns[0].Width := 115;
 dbgReservation.Columns[1].Width := 105;
 dbgReservation.Columns[2].Width := 140;
 dbgReservation.Columns[3].Width := 140;
 dbgReservation.Columns[4].Width := 140;
end;

end.
