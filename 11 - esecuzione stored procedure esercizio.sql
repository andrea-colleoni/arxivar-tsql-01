USE [arxivar_corso]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[sp_InserisciPersona]
		@nome = N'Ada',
		@cognome = N'Verdi',
		@dataNascita = '1978-05-07',
		@citta = N'Perugia'

SELECT	'Return Value' = @return_value

GO
