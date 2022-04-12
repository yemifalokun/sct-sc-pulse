**NOTE: This semantic layer requires exporting SAP data into BigQuery through Cloud Data Fusion**

___
# Readme: SCM Digital Twin Semantic Layer in Looker (LookML)

## This semantic layer has been released in public preview, and we are actively looking for opportunities to collect feedback and refine the LookML, as well as dashboards. If you are interested in helping us make this semantic layer better please email us at {scm-private-twin@google.com}

### What does this semantic layer do for me?

- Expertise - Leverage analytics expertise of Looker
- Central Data Platform - Take advantage of Looker's data platform functionality, including data actions, scheduling, permissions, alerting, parameterization, and row level security allowing users to only see what data they have access

### Semantic layer Info
This semantic layer is modeled on the Private and Public Datasets. Then Data is consolidated into a few Looker Explores optimized for flexible analysis. This semantic layer should serve as a template that can be further enhanced

### Semantic layer Structure
- SCM Digital Twin - It provides a comprehensive view designed to help with Order, Inventory, asset, Location, and Weather views. It brings them all together to get a better insight.

### Views
There are three different types of data sets which are described below

#### Private Data Set
- Asset
- Inventory
- Location
- Order
- Product

#### Public Data Set
- Weather

#### Derived Data Set
- Inventory Extended
- Order Extended

### Explores
- Forecast - Forecast, product, and location views are joined, keeping forecast as the base view
- Inventory - Inventory, product, location and location weather views are joined, keeping inventory as the base view
- Order - Order, asset, location, product and location weather views are joined, keeping order as the base view
- Location - Location and location weather views are joined, keeping location as the base view
- Product - Product, inventory and order views are joined, keeping product as the base view
- Inventory Extended - Inventory extended and order extended views are joined, keeping inventory extended as the base view

### List Of KPI's

- #### Inventory Turns
Inventory turns, also referred to as inventory turnover and inventory turnover ratio, are a popular measurement used in inventory management to assess operational and supply chain efficiency

- #### Total Inventory
Inventory valuation is the monetary amount associated with the goods in the inventory at the end of an accounting period

- #### Days On Hand
The days of inventory on hand is a measure of how quickly a business uses up the average inventory it keeps in stock

- #### Open SO
An open sales order is where the order has not been delivered (physical goods)

- #### Open PO
An open purchase order (PO), also known as a standing PO, is a PO that has been issued to a vendor, against which specified purchases can be made, for a certain amount of time

- #### Open Delivery
Open deliveries are those deliveries which are not Posted to Goods Issue

- #### Open Production Order
A production order is used to define the material to be produced, plant location where production has to be done, date and time of production, and quantity of goods required. A Production Order also defines which components and sequence of operations are to b used and how the order costs are to be settled

### Required Customization
- Some fields which are not going to be used, should be set hidden

Copyright 2021 Google Inc. All rights reserved.

The use of this software is governed by the Pre-GA Offering Terms section of the the Service Specific Terms set forth at
https://cloud.google.com/terms/service-terms#general-service-terms
