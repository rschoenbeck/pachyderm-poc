select * from raw_data.loan
where fund_raising_time is not null
order by fund_raising_time desc
limit 10;
