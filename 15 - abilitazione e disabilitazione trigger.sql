disable trigger [trg_Classifica] on classifica
enable trigger [trg_Classifica] on classifica


execute sp_settriggerorder @triggername = 'trg_Classifica', @order = 'First', @stmttype = 'INSERT'
-- @order = 'Last'