select t2.StuName,t4.Classname,t3.TName,t1.Dresult,t1.Dtime from Detection t1
left join Student t2 on t1.StuID=t2.StuID
left join Teacher t3 on t2.TID=t3.TID
left join Class t4 on t4.CID=t2.CID



select * from Notice t1 where t1.NID=1



select t1.VID,t2.StuName,t4.Classname,t3.TName,t1.Vreason,t1.Hot,t1.Vtime,t5.Drname from Visit t1
left join Student t2 on t1.StuID=t2.StuID
left join Teacher t3 on t2.TID=t3.TID
left join Class t4 on t2.CID=t4.CID
left join Doctor t5 on t1.DRID=t5.DRID



select t2.StuName,t1.LstartTime,t1.LoverTime,t1.Lreason,t1.Lorschool,t1.Lview,t1.VState,t3.TName from Leave t1
left join Student t2 on t1.StuID=t2.StuID
left join Teacher t3 on t2.TID=t3.TID
where t1.LID=2



select t1.stuxh,t1.StuID,t1.StuName,t2.Classname,
(select COUNT(StuID)  from Detection t6 where t6.StuID=t1.StuID) as DCount,
(select COUNT(StuID)  from  Visit t7 where t7.StuID=t1.StuID) as VCount,
(select COUNT(StuID)  from Leave t8 where t8.StuID=t1.StuID) as LCount
from Student t1
left join Class t2 on t1.CID=t2.CID
left join Detection t3 on t1.StuID=t3.StuID
left join Visit t4 on t1.StuID=t4.StuID
left join Leave t5 on t1.StuID=t5.StuID
group by t1.stuxh,t1.StuName,t2.Classname,t1.StuID


select * 
from Student t1
left join Class t2 on t1.CID=t2.CID
left join Detection t3 on t1.StuID=t3.StuID
left join Visit t4 on t1.StuID=t4.StuID
left join Leave t5 on t1.StuID=t5.StuID



select t1.StuID,count(t2.VID) as VCount,count(t3.DID)as DCount,COUNT(t4.LID) as LID from Student t1
inner join Visit t2 on t1.StuID=t2.StuID
inner join Detection t3 on t1.StuID=t3.StuID
inner join Leave t4 on t1.StuID=t4.StuID
group by t1.StuID







select * from Student t1 where t1.StuID=1 


select * from Article




SELECT *  FROM Student t1
FULL OUTER JOIN Teacher t2 ON 1 = 0 
FULL OUTER JOIN Admin t3 ON 1 = 0;





select t1.UID,t2.AID,t1.State,t1.Apeople,t1.Atime,t1.UCount,t1.Uto,t2.Aname from [user] t1
left join Article t2 on t1.AID=t2.AID


select * from Teacher t1
left join Bmt t2 on t1.BMID=t2.BMID