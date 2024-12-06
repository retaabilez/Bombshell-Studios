object dmReservations: TdmReservations
  OldCreateOrder = False
  Height = 243
  Width = 326
  object conReservationDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\Retaabile Zuzani\Documents\IT PAT\dbReservationSystem.mdb;Mo' +
      'de=ReadWrite;Persist Security Info=False;Jet OLEDB:System databa' +
      'se="";Jet OLEDB:Registry Path="";Jet OLEDB:Database Password="";' +
      'Jet OLEDB:Engine Type=5;Jet OLEDB:Database Locking Mode=1;Jet OL' +
      'EDB:Global Partial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions' +
      '=1;Jet OLEDB:New Database Password="";Jet OLEDB:Create System Da' +
      'tabase=False;Jet OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Co' +
      'py Locale on Compact=False;Jet OLEDB:Compact Without Replica Rep' +
      'air=False;Jet OLEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 56
    Top = 40
  end
  object tblReservation: TADOTable
    Active = True
    Connection = conReservationDB
    CursorType = ctStatic
    TableName = 'tblReservation'
    Left = 136
    Top = 96
  end
  object dscReservation: TDataSource
    DataSet = tblReservation
    Left = 224
    Top = 40
  end
end
