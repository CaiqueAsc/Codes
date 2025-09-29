Create TABLE Padrao.dt_ads_unified as
with gg as (Select date, campaign_id,campaign_name,	ad_group_id,	ad_group_name,	impressions,	clicks,	cost,	conversions, 0 as video_views
, 'Google' as platform
from `Padrao.Google_ads`)

, tt as(Select date,	campaign_id,	campaign_name,	adgroup_id,	adgroup_name,	impressions,	clicks,	cost,	conversions,	video_views
, 'Tiktok' as platform
from `Padrao.Tiktok_ads`)

,fb as(Select date,	campaign_id,	campaign_name,	ad_set_id as adgroup_id,	ad_set_name as adgroup_name,	impressions,	clicks,	spend as cost,	conversions,	video_views
, 'Facebook' as platform
from `Padrao.facebook_ads`)

Select *
from gg

union all

select *
from tt

union all

Select *
from fb

-- I could use an Except() function in the Select to make the renames smaller, but I think this way is easier to visualize what I did. (Coloco esse comentario ou não? Se usasse essa função daria problema na ordem das colunas talvez)