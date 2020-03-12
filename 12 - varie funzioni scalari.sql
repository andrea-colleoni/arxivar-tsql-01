declare @id int

set @id = null

print ISNULL(@id, 1)
print COALESCE(@id, null, null, null, 1)

print GETDATE() -- NO!! => CURDATE, SYSDATE, NOW, TODAY
print current_timestamp

select reverse('otto')