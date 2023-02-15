use qlht;


create event Evt_IsRegions
on schedule at current_timestamp + interval 20 second
on completion preserve
do
    insert into regions(region_name) value ('hoang');