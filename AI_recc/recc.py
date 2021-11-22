import pandas as pd
from flask import Flask ,request,jsonify


app = Flask(__name__)
## [0,0,0,0,0,0,3,0,0,2] <<= data input

@app.route('/rec/<data>')
def commerce(data):
    # 데이터 변환작업
    str_data = []
    for i in data:
        str_data.append(int(i))

    #Data
    x = [str_data]
    cluster_result = kmeans.predict(x)

    return str(cluster_result[0])


## 머신러닝 모델생성
df_csv = pd.read_csv(r'Data.csv')

# 체크
# for col in df_csv.columns:
#     print('{} : {}'.format(col,df_csv[col].unique()))

num_col = []
for col in num_col:
    df_csv[col] = pd.to_numeric(df_csv[col])
    df_csv[col].fillna(df_csv[col].mean(), inplace=True)
df_csv.isnull().sum()

from sklearn.cluster import KMeans
X = df_csv[["sosul", "essay", "column", "misul", "gungang", "hobby", "children", "gojun", "science",
            "manhwa"]].values.astype('int32')

# 모델생성
kmeans = KMeans(n_clusters=4)

kmeans.fit(X)
y_kmeans = kmeans.predict(X)
#print(y_kmeans)

df_y = pd.DataFrame(y_kmeans, columns={"cluster"})

df_csv["cluster"] = df_y["cluster"]
df_cluster_pairplot = df_csv[
    ["sosul", "essay", "column", "misul", "gungang", "hobby", "children", "gojun", "science", "manhwa", 'cluster']]

if __name__ == "__main__":
    app.run(host='3.36.39.51', port=5000, debug=True)
