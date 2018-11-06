SELECT * from
    (SELECT st_name
     , year
     , ac_no
     , ac_name
     , cand_name
     , cand_sex
     , totvotpoll
    FROM (SELECT st_name
     , year
     , ac_no
     , ac_name
     , cand_name
     , cand_sex
     , totvotpoll
     , MAX(totvotpoll) OVER (PARTITION BY st_name, year, ac_no) max_totvotpoll
      FROM indian_election) as a
 WHERE totvotpoll = max_totvotpoll) as election
 LEFT JOIN india_state
    ON  election.st_name = india_state."State";

SELECT distinct "State", st_name
    FROM indian_election  as election
    OUTER JOIN india_state
    ON  election.st_name = india_state."State" ;
