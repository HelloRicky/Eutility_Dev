# Eutility_Dev

The program is designed to verify the monthly electricity billing against the 30mins interval metering data.

Compare section include:
- Retailer Energy Cost
- Network Energy Cost (Demand/Capacity included)
- Marketing Pricing
- Metering Charge

Source:
- Monthly electricity invoice: Eutility demo invoices
- 30mins interval metering data: Eutility demo metering data

Compatibale invoice with:
- AGL
- Orgin
- ERM
- Momentum
- Energy Australia

Main languages used:
- ipython
- SQL

Methodology:
- Sort interval data
- Extract NMI info as parameters (e.g. tariff code, Loss factor, contract demand, contract rate)
- Calculate usage from interval data
- Calculate cost from interval data
- Compare with invoice data (*THIS IS DONE WITH POSTING TOOL IN ANOTHER PROJECT)

Main folder: SQL
