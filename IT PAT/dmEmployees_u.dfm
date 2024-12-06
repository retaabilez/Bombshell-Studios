object dmEmployees: TdmEmployees
  OldCreateOrder = False
  Height = 150
  Width = 215
  object conEmployees: TADOConnection
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
  object tblEmployees: TADOTable
    Active = True
    Connection = conEmployees
    CursorType = ctStatic
    TableName = 'tblEmployees'
    Left = 88
    Top = 80
  end
  object dscEmployees: TDataSource
    DataSet = tblEmployees
    Left = 144
    Top = 32
  end
end
