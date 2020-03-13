create or alter procedure sp_GestioneErrori (
	@numero int
)
as 
begin
if @numero > 10
begin
	raiserror(N'hai specificato un numero troppo grande', 16, 1)  with nowait, SETERROR
end

print @numero

end

begin try
	exec sp_GestioneErrori @numero = 11
end try
begin catch
	print 'la procedura è andata in errore...'
end catch


/*
raiserror(N'errore applicativo, bla bla bla.....', 16, 1)

RAISERROR ('Error raised in TRY block.', -- Message text.  
            16, -- Severity.  
            1 -- State.  
            );  
*/