-- Analyzes carrier performance metrics
SELECT 
    t.carrier,
    c.on_time_delivery_rate,
    c.cargo_damage_rate,
    COUNT(t.contract_id) AS total_contracts,
    SUM(t.revenue_usd) AS total_revenue,
    AVG(t.discount_offered) AS avg_discount
FROM 
    nyshex_transactions t
JOIN 
    carrier_performance c ON t.carrier = c.carrier
GROUP BY 
    t.carrier, c.on_time_delivery_rate, c.cargo_damage_rate
ORDER BY 
    total_revenue DESC;