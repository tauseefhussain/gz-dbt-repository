WITH sales_data AS (
    SELECT
        s.order_id,
        s.product_id,
        s.revenue,
        s.quantity,
        p.purchase_price,
        s.quantity * p.purchase_price AS purchase_cost,
    
        s.revenue - (s.quantity * p.purchase_price) AS margin
    FROM 
        {{ ref('stg_gz_raw_data__raw_gz_sales') }} AS s
    JOIN 
        {{ ref('stg_gz_raw_data__raw_gz_product') }} AS p
    ON 
        s.product_id = p.product_id
)

SELECT
    order_id,
    product_id,
    revenue,
    quantity,
    purchase_cost,
    margin
FROM 
    sales_data