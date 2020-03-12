USE [corso_tsql-abletech]

-- window functions
/*
SELECT [id]
      ,[squadra]
      ,[punti]
	  , ROW_NUMBER() OVER (order by punti desc) posizione
  FROM [dbo].[classifica]
order by 3  desc
*/

SELECT [id]
      ,[squadra]
      ,[punti]
	  , RANK() OVER (partition by punti order by squadra desc) posizione
	  , DENSE_RANK() OVER (partition by punti order by squadra desc) posizione2
  FROM [dbo].[classifica]
order by 3  desc

/*
select *
from (
	SELECT [id]
		  ,[descrizione]
		  ,[data]
		  , RANK() OVER (partition by cast(data as date) order by data desc) posizione
	FROM [dbo].[movimenti]) q
where  q.posizione = 1
*/


