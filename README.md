# Amazon Vine Analysis (Module 16 Challenge)

## Overview
Sellby's stakeholders loved our analysis. They have now extended this project and wants us to analyze Amazon reviews written by members of the paid Amazon Vine program.

We are going to perform ETL on Amazon Product Reviews and determine any biases of Vine Reviews.

## Results
### Deliverable-1
#### Extraction
In this part we extracted the raw data from Amazon's gaming portal into PySpark DataFrames. 
#
#### Transformation
We then transformed the data into following 4 data frames with an intention to upload into RDS.
1. [customer_df](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/customers_table.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/customers_table.png?raw=true)

2. [products_df](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/products_table.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/products_table.png?raw=true)

3. [review_id_df](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/review_id_table.png?raw=true), and

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/review_id_table.png?raw=true)

4. [vine_df](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/vine_table.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/vine_table.png?raw=true)

#
#### Load
We then loaded all of these cleaned/transformed DataFrames into RDS/PostgreSQL.

[Customer Table](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/customers_table_count.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/customers_table_count.png?raw=true)

[Product Table](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/products_table_count.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/products_table_count.png?raw=true)

[Review_Id Table](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/review_id_table_count.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/review_id_table_count.png?raw=true)

[Vine Table](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/vine_table_count.png)

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/vine_table_count.png?raw=true)

#
### Deliverable-2
They have given us 3 options to run this analysis:
1. Use PySpark
1. Use Pandas
1. Use SQL in pgAdmin

#### **NOTE:** We have chosen to use SQL in pgAdmin.

### **Our Assumptions:**
To make our analysis more meaningful, we have mae following assumptions in this analysis.
1. We have accounted records with total_votes > 20
1. We have account records where ratio os helpful_votes to  total_votes is equal or greater than 50%. 

#
### 1. Reviews
We have total of 40,565 reviews. 

**Vine Reviews**
Out of these we have [94 vine reviews](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/vine_reviews.png).

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/vine_reviews.png?raw=true)


**Non-Vine Reviews**
Out of these we have [40,471 non-vine reviews](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/non-vine_reviews.png).

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/non-vine_reviews.png?raw=true)

#
### 2. Five-Star Review
We have total of 15,711 five-star reviews.

**Five-Star Vine Reviews**
Out of these we have [48 five-star vine reviews](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/5-Star%20Vine%20Review.png).

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/5-Star%20Vine%20Review.png?raw=true)


**Five-Star Non-Vine Reviews**
Out of these we have [15,663 five-star non-vine reviews](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/5-Star%20Non-Vine%20Review.png).


![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/5-Star%20Non-Vine%20Review.png?raw=true)

#
### 3. [Percentage of Five-Star Review](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/final_modified.png)

**Five-Star Vine Reviews**
We have 51.06 % five-star vine reviews. 

**Five-Star Non-Vine Reviews**
We have 38.7 % five-star non-vine reviews.

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/final_modified.png?raw=true)

## [Summary](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/entire%20DS_Modified.png)

We do sense some bias in the vine reviews.

To ensure, we looked at the entire data set and we found out that five-star vine reviews dropped from 51.06 % to 37.45 % and five-star non-vine reviews bumpped up from 38.7 % to 57.54 %. This confirms that there is some bias in the vine reviews.

![](https://github.com/neerajain9/Amazon_Vine_Analysis/blob/Data-Science/Resources/entire%20DS_Modified.png?raw=true)

**Recommendation:**
As we investigated the issue, it appears that helpful_votes data was manupulated in some way that is causing this discrepancy.

We do not understand the reason why we considered "(helpful_votes/total_votes) > 50%" filter. Perhaps, we can remove this filter to validate our hypothesis.