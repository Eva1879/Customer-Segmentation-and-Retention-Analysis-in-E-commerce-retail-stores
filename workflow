                    RAW TRANSACTION DATA
                            │
                            ▼
                 CALCULATE RFM FEATURES
              (Recency, Frequency, Monetary)
                            │
                            ▼
              ┌─────────────┴─────────────┐
              │                           │
              ▼                           ▼
      180-DAY DEFINITION           90-DAY DEFINITION
      "Churn if Recency > 180"     "Churn if no purchase
              │                    in last 90 days of data"
              │                           │
              └─────────────┬─────────────┘
                            │
                            ▼
                    LABELS CREATED
              Churn_180 = 0 or 1
              Churn_90 = 0 or 1
                            │
                            ▼
                      TRAIN MODEL
              (KNN learns patterns from features)
                            │
                            ▼
                      PREDICTIONS
                            │
        ┌───────────────────┼───────────────────┐
        ▼                   ▼                   ▼
  CUSTOMER A          CUSTOMER B           CUSTOMER C
  Recency: 250        Recency: 30           Recency: 85
  Frequency: 1         Frequency: 10         Frequency: 2
  Monetary: £100       Monetary: £5,000      Monetary: £300
        │                   │                   │
        ▼                   ▼                   ▼
  PREDICT:              PREDICT:             PREDICT:
  CHURN (1)             ACTIVE (0)            ????
                                         (Based on patterns
                                          from similar customers)




