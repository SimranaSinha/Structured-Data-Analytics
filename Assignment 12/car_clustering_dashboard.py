import streamlit as st
import pandas as pd
import numpy as np
from sklearn.cluster import KMeans
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler

# Load and preprocess data
df = pd.read_csv("Cars_specs.csv")

# Convert 'horsepower' to numeric and drop rows with missing values
df['horsepower'] = pd.to_numeric(df['horsepower'], errors='coerce')
df.dropna(subset=['horsepower', 'weight', 'mpg'], inplace=True)

# Standardize the features
scaler = StandardScaler()
features = df[['horsepower', 'weight', 'mpg']]
scaled_features = scaler.fit_transform(features)

# Sidebar - number of clusters and feature selection
st.sidebar.title("🔧 Clustering Settings")
n_clusters = st.sidebar.slider("Select number of clusters", min_value=2, max_value=10, value=3)
show_data = st.sidebar.checkbox("Show Raw Data")

# KMeans clustering
kmeans = KMeans(n_clusters=n_clusters, random_state=42)
df['cluster'] = kmeans.fit_predict(scaled_features)

# Dashboard title
st.title("🚗 Car Clustering Interactive Dashboard")
st.markdown("Use this interactive dashboard to explore how cars cluster based on horsepower, weight, and MPG.")

# Optional: show data
if show_data:
    st.subheader("🔍 Raw Car Data with Cluster Labels")
    st.dataframe(df[['car_name', 'horsepower', 'weight', 'mpg', 'cluster']])

# Tabs for visualizations
tab1, tab2, tab3 = st.tabs(["📊 Horsepower vs MPG", "⚖️ Weight vs MPG", "📈 Cluster Centroids"])

with tab1:
    fig1, ax1 = plt.subplots()
    sns.scatterplot(data=df, x='horsepower', y='mpg', hue='cluster', palette='Set2', ax=ax1, s=100)
    plt.title("Horsepower vs MPG")
    st.pyplot(fig1)

with tab2:
    fig2, ax2 = plt.subplots()
    sns.scatterplot(data=df, x='weight', y='mpg', hue='cluster', palette='Set2', ax=ax2, s=100)
    plt.title("Weight vs MPG")
    st.pyplot(fig2)

with tab3:
    # Show cluster centroids on original scale
    centroids = scaler.inverse_transform(kmeans.cluster_centers_)
    centroid_df = pd.DataFrame(centroids, columns=['horsepower', 'weight', 'mpg'])
    centroid_df.index = [f"Cluster {i}" for i in range(n_clusters)]
    st.subheader("📌 Cluster Centroids")
    st.dataframe(centroid_df.round(2))

    fig3, ax3 = plt.subplots()
    sns.scatterplot(data=centroid_df, x='horsepower', y='mpg', s=200, marker='X', color='black', label='Centroids')
    plt.title("Cluster Centroids - Horsepower vs MPG")
    st.pyplot(fig3)

st.markdown("---")
st.caption("Built with ❤️ using Streamlit")

