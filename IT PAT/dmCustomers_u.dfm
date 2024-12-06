object dmCustomers: TdmCustomers
  OldCreateOrder = False
  Height = 150
  Width = 215
  object conCustomers: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\Retaabile ' +
      'Zuzani\Documents\IT PAT\dbReservationSystem.mdb;Mode=ReadWrite;P' +
      'ersist Security Info=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 24
    Top = 24
  end
  object tblCustomers: TADOTable
    Active = True
    Connection = conCustomers
    CursorType = ctStatic
    TableName = 'tblCustomers'
    Left = 96
    Top = 48
  end
  object dscCustomers: TDataSource
    DataSet = tblCustomers
    Left = 152
    Top = 32
  end
end
