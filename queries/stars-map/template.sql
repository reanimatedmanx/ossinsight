select upper(u.country_code) as country_or_area, count(*) as count
from github_events
use index(index_github_events_on_repo_id)
left join users u ON github_events.actor_login = u.login
where repo_id = 41986369 and github_events.type = 'WatchEvent' and u.country_code is not null
group by 1
order by 2 desc;
