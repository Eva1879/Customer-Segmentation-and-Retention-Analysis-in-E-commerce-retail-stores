
## Intepreting data to identify trends and patterns and applying K-Nearest Neighbor Algorithm to learn on churn rates, recommend solutions and business strategies for an E-commerce retail store

# Problem Statement
Many online platforms use machine learning techniques to learn their customer's behaviours and patterns to recommend what they want to see more of! And so, even E-commerce retail stores, could benefit from this by learning different types of customers, and gain insights on their pattern of buying, spending, frequency of buying and customers who are likely to leave, in order to keep them engaged. Thus, as a beginner, i used a real world data, to pre-process the data and apply machine learning algorithms through data.

The objective of this project is to analyze online retail transaction data to understand customer purchasing behavior, segment customers into meaningful groups, estimate customer lifetime value, and predict customer churn to support data-driven retention strategies.

# Dataset Overview
This Online Retail II data set contains all the transactions occurring for a UK-based and registered, non-store online retail between 01/12/2009 and 09/12/2011.The company mainly sells unique all-occasion gift-ware. Many customers of the company are wholesalers.
link: https://www.kaggle.com/datasets/lakshmi25npathi/online-retail-dataset
- **Time Period taken**: December 2009 - December 2010
- **Total Customers**: 4,312 (each row, each customer)


Steps applied to build the model:
1. Getting a reliable online transactional data with sufficent samples
2. Cleaning the data, in order to mimic customer buyings, i.e. to remove cancelled purchases, empty rows(null), incomplete transactions, Price ranges < 0 or any negative values.
3. Apply feature Engineering techniques, select best features and transform them to Recency, Frequency and Monetary columns, and segregate the 4k rows based on this, this is for churn evaluation and prediction, based after 3 months (using actual dates of transaction) and 6 months (recency feature) respectively.
4. At random the customers are segregated based on K means clustering and indexed [0, 1, 2, 3] based on their selected features.
5. We create separate labels for churn rates, based on transactional data, and the model predicts churn (0/1) on 90 day and 180 days timeframe(recency).
6. Train the data using K-Nearest Neighbor (k=5), after splitting test, train and normalizing the data to scale the values of the features.
7. Evaluating the results


## 🔍 Customer Segmentation Analysis (4 Clusters)

### Cluster 0: Mid-tier Regulars
- **Size**: _3207__ customers
- **Recency**: Purchased within last _43__ days
- **Frequency**: _5_ purchases on average
- **Spending**: £_1743__ average per customer
- **Churn Rate**: low
- Lifetime Value: £14,842 average
- **Business Strategy**: 
 Product bundles to encourage more frequent purchases
 Reminder campaigns at 30-40 days since last purchase

### Cluster 1: "Churned/Lost" (At-Risk or Already Gone)
- **Size**: 825 customers (mostly churned customers) 
- **Recency**: Last purchase 265+ days ago (8.8 months)
- **Frequency**: Only 1-2 purchases (mostly one-time buyers)
- **Spending**: £597 average
- Lifetime Value: £1,587 average
- Churn Rate: 78.7% (most are gone)
- **Business Strategy**:
  - **Too late to save** - these customers are already gone
  - Focus on understanding WHY they left/ improve operations
  - Use insights to prevent future churn

    Of the 825 churned customers total, 824 came from this cluster...

### Cluster 2: "Power Shoppers" (Long-term customers: Corporate Accounts maybe)
- **Size**: _5__ customers
- **Recency**: Purchased recently (within _6__ days)
- **Frequency": 114 purchases (avg purchases in the cluster)
- **Spending**: £215,544 average
- **Churn Rate**: 0% 
 - Life time value- £22.8 MILLION average
- **Business Strategy**:
 Personal relationship management - assign dedicated account managers
 VIP treatment - exclusive events, early access
 Monitor closely - if one of these churns, it's a major revenue loss

### Cluster 3: "Steady Regulars" (Consistent, High Value)
- **Size**: __53_ customers (only 1 churned customer!)
- **Recency**: Purchased within last _15__ days
- **Frequency**: ~49 purchasers
- Spend per purchase: £29,040 average
- Lifetime Value: £1.55 MILLION average
- **Churn Rate**: 1%
- **Business Strategy**:
  - Top-tier benefits
  - Upsell relevant products

## 💰 Customer Lifetime Value (CLV) Insights: How many active customers and churned ones to drive revenue 

Cluster 2 (Whales)	£22.8M, 0.1%	~60%
Cluster 3 (High-Value)	£1.55M,	1.2%	~30%
Cluster 0 (Mid-Tier)	£14.8K,	74.4%	~9%
Cluster 1 (Churned)	£1.6K,	24.3%	~1%

**Key Insight**: Active customers are worth **30x more** than churned customers!

## ⏰ Recency Patterns


Cluster	             Re-engage at	      Win-back at   	Give up at
Cluster 2 (Whales)	   30 days	          60 days	        90 days
Cluster 3 (High-Value) 60 days	          90 days	        120 days
Cluster 0 (Mid-Tier)	 90 days	          120 days	      180 days
Cluster 1 (Churned)   	N/A	              N/A	           Already gone

  
## 📈 Frequency Patterns

- **One-time buyers**: 1 purchase only
  - These make up most churned customers
  - Critical to convert them to second purchase
  
- **Repeat buyers**: 3+ purchases
  - Much lower churn rate
  - These are your loyal customers

## 💵 Monetary Patterns

- **Low spenders** (< £500): Higher churn risk
- **Medium spenders** (£500-£2,000): Moderate churn risk
- **High spenders** (> £2,000): Very low churn risk

## 🎯 Actionable Business Recommendations

### Who should get retention offers?
Customers in Cluster 0 who haven't purchased in 90 days (mid-tier threshold)
Customers in Cluster 3 who haven't purchased in 60 days (high-value threshold)
Customers in Cluster 2 who haven't purchased in 30 days
One-time buyers from the last 3 months
Previously high spenders showing declining activity

### Who should get early access to new features?
Cluster 2 - £22.8M lifetime value
Cluster 3 (High-Value Regulars) - £1.55M lifetime value

### Who is likely to churn no matter what?
- **Cluster 1 customers** (already churned - 99.9% gone)
- One-time buyers from 6+ months ago
- Customers with extremely low spend (< £100 total)

### Who should we focus on saving?
Cluster 2 likely

## 🔮 Churn Prediction Model Results (identifying already churned customers in 180 days)

Accuracy: 99.81%

Precision: 99.51 %

Recall: 99.51 %

This seems to be overfitting, and the model seem to generalize Recency more! with only two mistakes

## 🔮 Churn Prediction Model Results (who will churn in the next 90 days)

Accuracy: 94.8%

Model missed 35 churned customers to think they would stay.
But, a better realistic model for future churn prediction, with 6 false positives too.


## ✅ Summary:

Cluster 0: 3,207 customers (78% of total)
Cluster 1: 825 customers (20% of total)
Clusters 2+3: 58 customers (2% of total)

So:

Cluster 0 is 78%, 
Clusters 2+3 are 2%,

Conceptual Notes:
To determine, the clustering values, we used the Elbow Method:
What is the Elbow Method?
The Elbow Method is a technique used to find the optimal number of clusters for K-Means clustering. It helps you answer the question: "How many groups should I split my customers into?"
We used the Elbow Method to find the Optimal K value, to group the clusters, a balance of 4 means all the clusters could be grouped similarly without farther away features

How It Works:
The Concept:
K-Means tries to make clusters where customers are similar inside each cluster and different from other clusters

It measures this with inertia (how spread out customers are within clusters)

Lower inertia = tighter, more similar clusters


