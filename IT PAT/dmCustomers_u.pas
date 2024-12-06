unit dmCustomers_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmCustomers = class(TDataModule)
    conCustomers: TADOConnection;
    tblCustomers: TADOTable;
    dscCustomers: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmCustomers: TdmCustomers;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
