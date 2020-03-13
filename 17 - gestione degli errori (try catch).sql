declare @num int,
		@testo varchar(max)

set @testo = 'A'

begin try
	set @num = cast(@testo as int)
end try
begin catch
	print error_number()
	print error_severity()
	print error_state()
	print error_procedure()
	print error_line()
	print error_message()

	set @num = 1
end catch

print @num