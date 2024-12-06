unit dmReservations_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmReservations = class(TDataModule)
    conReservationDB: TADOConnection;
    tblReservation: TADOTable;
    dscReservation: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmReservations: TdmReservations;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
