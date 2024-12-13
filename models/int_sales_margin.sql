with
source as (

    SELECT * from {{source('gz_raw_data',)}}
),
renamed as (
    SELECT
    orders_id,
    pdt_id,
    revenue,
    quantity,
from source
)
SELECT * from renamed
