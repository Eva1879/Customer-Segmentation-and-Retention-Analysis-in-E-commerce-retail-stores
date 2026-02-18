
## Problem Statement
The objective of this project is to analyze online retail transaction data to understand customer purchasing behavior, segment customers into meaningful groups, estimate customer lifetime value, and predict customer churn to support data-driven retention strategies.


# Customer Segmentation & Churn Analysis for the year (2009-2010)

# Dataset Overview
This Online Retail II data set contains all the transactions occurring for a UK-based and registered, non-store online retail between 01/12/2009 and 09/12/2011.The company mainly sells unique all-occasion gift-ware. Many customers of the company are wholesalers.
link: https://www.kaggle.com/datasets/lakshmi25npathi/online-retail-dataset
- **Time Period taken**: December 2009 - December 2010
- **Total Customers**: 4,312 (each row, each customer)

What is the Elbow Method?
The Elbow Method is a technique used to find the optimal number of clusters for K-Means clustering. It helps you answer the question: "How many groups should I split my customers into?"
We used the Elbow Method to find the Optimal K value, to group the clusters, a balance of 4 means all the clusters could be grouped similarly without farther away features

How It Works:
The Concept:
K-Means tries to make clusters where customers are similar inside each cluster and different from other clusters

It measures this with inertia (how spread out customers are within clusters)

Lower inertia = tighter, more similar clusters



## 🔍 Customer Segmentation Analysis (4 Clusters)

### Cluster 0: "VIP Champions" (Loyal High-Value)
- **Size**: _3207__ customers
- **Recency**: Purchased within last _43__ days
- **Frequency**: _5_ purchases on average
- **Spending**: £_1743__ average per customer
- **Churn Rate**: Very low
- **Business Strategy**: 
  - Reward loyalty with exclusive perks
  - Give early access to new products
  - Ask for reviews and referrals
  - Personal thank-you notes

### Cluster 1: "Churned/Lost" (At-Risk or Already Gone)
- **Size**: 825 customers (ALL churned customers) out of 1k customers
- **Recency**: Last purchase 265+ days ago (8.8 months)
- **Frequency**: Only 1-2 purchases (mostly one-time buyers)
- **Spending**: Low (£614 average)
- **Churn Rate**: 99.9% (Most certain)
- **Business Strategy**:
  - **Too late to save** - these customers are already gone
  - Focus on understanding WHY they left/ improve operations
  - Use insights to prevent future churn

### Cluster 2: "Promising Newcomers" (Recent, Low Spend)
- **Size**: _5__ customers
- **Recency**: Purchased recently (within _6__ days)
- **Frequency": 116 purchases (new customers)
- **Spending**: Low to medium
- **Churn Rate**: Low (just arrived!)
- **Business Strategy**:
  - Send welcome offers
  - Encourage second purchase
  - Build relationship early

### Cluster 3: "Steady Regulars" (Consistent, Medium Value)
- **Size**: __53_ customers (only 1 churned customer!)
- **Recency**: Purchased within last ___ days
- **Frequency**: Regular purchasers
- **Spending": Medium to high
- **Churn Rate**: Almost zero
- **Business Strategy**:
  - Maintain relationship
  - Upsell relevant products
  - Birthday/anniversary discounts
  - Loyalty program middle tier

## 💰 Customer Lifetime Value (CLV) Insights

| Segment | Average CLV | Business Impact |
|---------|-------------|-----------------|
| **Active Customers** | £69,828 | Core revenue drivers |
| **Churned Customers** | £2,326 | Lost revenue potential |

**Key Insight**: Active customers are worth **30x more** than churned customers!

## ⏰ Recency Patterns

- **Active customers**: Last shopped 1-6 months ago
- **Churned customers**: Last shopped 6-12+ months ago
- **Warning sign**: If a customer hasn't purchased in 3 months, they're at risk

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
- **Customers in Cluster 0 and 2** who haven't purchased in 60-90 days
- One-time buyers from the last 3 months
- Previously high spenders showing declining activity

### Who should get early access to new features?
- **Cluster 0 (VIP Champions)** - they're your brand advocates
- Customers with high CLV (> £10,000)
- Frequent purchasers (10+ orders)

### Who is likely to churn no matter what?
- **Cluster 1 customers** (already churned - 99.9% gone)
- One-time buyers from 6+ months ago
- Customers with extremely low spend (< £100 total)

### Who should we focus on saving?
1. **Priority 1**: Cluster 2 customers showing signs of disengagement
2. **Priority 2**: One-time buyers from last 3 months
3. **Priority 3**: Previously high-value customers with recent drop in activity

## 🔮 Churn Prediction Model Results (180 days of churned values)

Accuracy: 99.81%

Precision: 99.51 %

Recall: 99.51 %

This seems to be overfitting, and the model seem to generalize Recency more! with only two mistakes

## 🔮 Churn Prediction Model Results (90 days of churned values)

Accuracy: 94.8%

Model missed 35 churned customers to think they would stay.
But, much better model for future churn prediction, with less false positives too.

### Top Factors Predicting Churn:
1. **Recency** - Days since last purchase (most important)
2. **Frequency** - Total number of purchases
3. **Monetary Value** - Total spend
4. **Cluster assignment**
5. **CLV**

## ✅ Summary: The 80/20 Rule

- **20% of customers** (Cluster 0) drive 80% of revenue
- **19% of customers** (Cluster 1) have already churned
- **61% of customers** (Clusters 2 & 3) are active but need nurturing



