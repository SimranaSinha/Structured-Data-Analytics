import streamlit as st
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.linear_model import LinearRegression

# Load and preprocess data
@st.cache_data
def load_data():
    df = pd.read_csv("Cars_specs.csv")
    df['horsepower'] = pd.to_numeric(df['horsepower'].replace('?', pd.NA))
    df = df.dropna()
    df['origin'] = df['origin'].map({1: 'USA', 2: 'Europe', 3: 'Japan'})
    df['model_year'] = df['model'] + 1900
    df.drop(columns=['model'], inplace=True)
    return df

df = load_data()

# Sidebar Filters
st.sidebar.title("🔧 Filter Options")
years = st.sidebar.multiselect("Model Year", sorted(df['model_year'].unique()), default=sorted(df['model_year'].unique()))
origin = st.sidebar.multiselect("Origin", df['origin'].unique(), default=df['origin'].unique())
cyls = st.sidebar.multiselect("Cylinders", sorted(df['cylinders'].unique()), default=sorted(df['cylinders'].unique()))
hp_range = st.sidebar.slider("Horsepower Range", int(df['horsepower'].min()), int(df['horsepower'].max()),
                             (int(df['horsepower'].min()), int(df['horsepower'].max())))
normalize = st.sidebar.checkbox("Normalize Weight & Horsepower")

# Apply filters
filtered_df = df[
    (df['model_year'].isin(years)) &
    (df['origin'].isin(origin)) &
    (df['cylinders'].isin(cyls)) &
    (df['horsepower'] >= hp_range[0]) &
    (df['horsepower'] <= hp_range[1])
].copy()

# Normalize if checked
if normalize:
    filtered_df['horsepower'] = (filtered_df['horsepower'] - filtered_df['horsepower'].mean()) / filtered_df['horsepower'].std()
    filtered_df['weight'] = (filtered_df['weight'] - filtered_df['weight'].mean()) / filtered_df['weight'].std()

# KPIs Section
st.title("🚗 Car Specs Interactive Dashboard")
st.subheader("📊 Key Performance Indicators")

col1, col2, col3 = st.columns(3)
col1.metric("Average MPG", f"{filtered_df['mpg'].mean():.2f}")
col2.metric("Average Horsepower", f"{filtered_df['horsepower'].mean():.2f}")
col3.metric("Average Weight", f"{filtered_df['weight'].mean():.2f}")

# Top & Bottom Fuel Efficiency
st.markdown("#### 🔝 Top 5 Most Fuel-Efficient Cars")
st.dataframe(filtered_df.sort_values(by='mpg', ascending=False).head(5)[['car_name', 'mpg']])

st.markdown("#### 🔻 Top 5 Least Fuel-Efficient Cars")
st.dataframe(filtered_df.sort_values(by='mpg', ascending=True).head(5)[['car_name', 'mpg']])

# Visualizations
st.header("📈 Visualizations")

# MPG vs Weight
st.subheader("MPG vs Weight (color by Cylinders)")
fig1, ax1 = plt.subplots()
sns.scatterplot(data=filtered_df, x='weight', y='mpg', hue='cylinders', palette='viridis', ax=ax1)
st.pyplot(fig1)

# Horsepower Histogram
st.subheader("Horsepower Distribution")
fig2, ax2 = plt.subplots()
sns.histplot(filtered_df['horsepower'], bins=20, kde=True, ax=ax2)
st.pyplot(fig2)

# MPG Trend over Years
st.subheader("MPG Trend by Model Year")
fig3, ax3 = plt.subplots()
sns.lineplot(data=filtered_df.groupby('model_year')['mpg'].mean().reset_index(), x='model_year', y='mpg', marker='o', ax=ax3)
st.pyplot(fig3)

# Bar Chart - Avg Horsepower by Origin
st.subheader("Average Horsepower by Origin")
fig4, ax4 = plt.subplots()
sns.barplot(data=filtered_df.groupby('origin')['horsepower'].mean().reset_index(), x='origin', y='horsepower', ax=ax4)
st.pyplot(fig4)

# Regression Model
st.header("📉 Predict MPG")
X = filtered_df[['weight', 'horsepower']]
y = filtered_df['mpg']

model = LinearRegression()
model.fit(X, y)

# Scatter plot with regression trend line
st.subheader("MPG Prediction Trend (Weight vs Horsepower)")
fig5, ax5 = plt.subplots()
sns.scatterplot(x=filtered_df['weight'], y=filtered_df['mpg'], label="Actual MPG", ax=ax5)
predicted = model.predict(X)
sns.lineplot(x=filtered_df['weight'], y=predicted, color='red', label='Regression Line', ax=ax5)
ax5.set_xlabel("Weight")
ax5.set_ylabel("MPG")
st.pyplot(fig5)

# User Prediction
st.subheader("🎯 Predict MPG for Custom Input")
custom_weight = st.number_input("Enter Weight", value=int(df['weight'].mean()))
custom_hp = st.number_input("Enter Horsepower", value=int(df['horsepower'].mean()))

if normalize:
    custom_weight = (custom_weight - df['weight'].mean()) / df['weight'].std()
    custom_hp = (custom_hp - df['horsepower'].mean()) / df['horsepower'].std()

predicted_mpg = model.predict([[custom_weight, custom_hp]])[0]
st.success(f"Predicted MPG: {predicted_mpg:.2f}")

