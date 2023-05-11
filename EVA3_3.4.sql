delimiter //

create procedure contar_actores(cont int)
begin
	declare terminar int default FALSE;
    declare actorid int;
    declare cont_act int;
	declare cant_actores cursor for select id from actores;
    declare continue handler for not found set terminar = TRUE;
    
    open cant_actores;
    set cont_act = 0;
    contar_a: loop
    
		fetch cant_actores into actoresid;
		set cont = cont +1;
		if terminar then
		leave contar_a;
        end if;
    end loop;


end//

delimiter ;