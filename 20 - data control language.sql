USE [master]
GO
CREATE LOGIN [pippo] 
WITH PASSWORD=N'password', 
DEFAULT_DATABASE=[corso_tsql-abletech], 
CHECK_EXPIRATION=OFF, 
CHECK_POLICY=OFF
GO
ALTER SERVER 
ROLE [sysadmin] 
ADD MEMBER [pippo]
GO

-- DCL: Data Control Language (auth/authz => grant, revoke, create user, alter user)
-- DDL: Data Definition Language (create, alter, drop)
-- DML: Data Manipluaton Languae (insert, update, delete, select)
