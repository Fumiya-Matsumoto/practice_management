## Model
### User
* id
* email
* encrypted_password
* reset_password_token
* reset_password_sent_at 
* remember_created_at
* name
* created_at
* updated_at
### Post
* id
* content
* created_at
* updated_at
* practice_timezone
* weather
* place
* kind_of_practice
* strength
* user_id
* practice_day
* practice_day_year
* practice_day_month
* practice_day_day
* distance
* time
* time_hour
* time_minute
* time_second"
* practice_day_of_week 
* interval_type
* pace_minute
* pace_second
* pace_undersecond
* distance_m
* time_hour_interval
* time_minute_interval
* time_second_interval
### PostRecord
* id
* post_id:integer
* time:time
* distance_km:float
* distance_m:float
* type：疾走かレストか:string
* number：〇〇本目:integer
* created_at
* updated_at

### Objective
* id
* user_id:integer
* month:integer
* content：string 目標
* todo：string 目標のためにすること
* created_at:
* updated_at