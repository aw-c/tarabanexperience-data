SELECT json_group_array(
    json_object(
        'name', steam_name, 
        'taraban.kills', IFNULL(json_extract(data, '$."taraban.kills"'), 0),
        'taraban.deaths', IFNULL(json_extract(data, '$."taraban.deaths"'), 0),
        'taraban.side', json_extract(data, '$."taraban.side"')
    )
) as "taraban.info" 
FROM ix_players 
WHERE json_extract(data, '$."taraban.side"') IS NOT NULL;