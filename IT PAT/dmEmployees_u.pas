unit dmEmployees_u;

interface

uses
  System.SysUtils, System.Classes, Data.Win.ADODB, Data.DB;

type
  TdmEmployees = class(TDataModule)
    conEmployees: TADOConnection;
    tblEmployees: TADOTable;
    dscEmployees: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEmployees: TdmEmployees;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
