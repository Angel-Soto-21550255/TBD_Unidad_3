delimiter //
create procedure antidad_actores(in cant int)
begin
	select count(*) into cant from actor;
    
end//
delimiter ;