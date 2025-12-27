with raw as (

    select * from {{source('stripe','payment')}}

),

transformed as (

    select 

        id as payment_id,
        {{cents_to_dollars("amount",6)}} as payment_amount,
        paymentmethod as payment_method,
        status as payment_status,
        orderid as order_id,
        created as payment_created_at,
        _batched_at

    from raw

)

select * from transformed 