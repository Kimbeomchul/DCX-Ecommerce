from email.mime import application

import pandas as pd
from flask import Flask, render_template, redirect, request, url_for , flash
import requests


app = Flask(__name__)

# Backoffice API

@app.route('/', methods=['GET'])
def m():
    return render_template('login.jsp')
@app.route('/main', methods=['GET'])
def mv0():
    money = 0
    #아이템 조회
    url = "http://3.36.39.51/allitem"
    response = requests.get(url)
    items = response.json()

    # 판매금액 조회용
    url = "http://3.36.39.51/allpaylist"
    response = requests.get(url)
    pay = response.json()

    for i in pay:
        temp = i.get('item_code')
        for j in items:
            if j.get('item_code') == temp:
                money += j.get('item_price')

    # 책권수 조회
    url = "http://3.36.39.51/item_count"
    response = requests.get(url)
    count_book = response.json()

    # 유저수 조회
    url = "http://3.36.39.51/count_user"
    response = requests.get(url)
    count_user = response.json()

    return render_template('main.jsp', sales=money, count_book=count_book, count_user=count_user)



@app.route('/mvadd', methods=['GET'])
def mv1():
    return render_template('book_add.jsp')


@app.route('/mvser', methods=['GET'])
def mv2():
    url = "http://3.36.39.51/allitem"
    response = requests.get(url)

    obj = response.json()
    status = response.status_code
    print(status)
    return render_template('book_search.jsp', data=obj)

@app.route('/mvdel', methods=['GET'])
def mv3():
    url = "http://3.36.39.51/allitem"
    response = requests.get(url)

    obj = response.json()
    status = response.status_code
    print(status)

    return render_template('book_delete.jsp', data=obj)

@app.route('/mvusr', methods=['GET'])
def mv4():
    url = "http://3.36.39.51/user"
    response = requests.get(url)
    obj = response.json()
    print(obj)

    return render_template('user_search.jsp', data=obj)



@app.route('/mvsales', methods=['GET'])
def mv5():
    dics = {}
    money = 0
    #아이템 조회
    url = "http://3.36.39.51/allitem"
    response = requests.get(url)
    items = response.json()

    # 판매금액 조회용
    url = "http://3.36.39.51/allpaylist"
    response = requests.get(url)
    pay = response.json()

    for x in pay:
        for y in items:
            if y.get('item_code') == x.get('item_code'):
                dics[y.get('item_title')] = 0

    for i in pay:
        temp = i.get('item_code')
        for j in items:
            if j.get('item_code') == temp:
                dics[j.get('item_title')] += j.get('item_price')
                money += j.get('item_price')

    return render_template('sales.jsp', list=dics, money=money)



@app.route('/login', methods=['GET', 'POST'])
def login():
    result = request.form
    if result.get('id') == 'root' and result.get('pw') == 'root':

        return redirect('/main')

    flash("로그인 실패")
    return render_template('login.jsp')


@app.route('/delete', methods=['GET', 'POST'])
def delete():

    result = request.form
    url = "http://3.36.39.51/ditem"
    response = requests.delete(url, data= result)

    obj = response.request
    status = response.status_code
    print(status)
    print(obj)

    if response.raise_for_status() or status == 500:
        flash("책삭제에 실패했습니다.")
    if status == 200:
        flash("책삭제 성공 ")

    return render_template('main.jsp')

@app.route('/add', methods=['GET', 'POST'])
def add():

    result = request.form
    url = "http://3.36.39.51/aitem"
    response = requests.post(url, data= result)

    obj = response.request
    status = response.status_code
    print(status)
    print(obj)

    if response.raise_for_status() or status == 500:
        flash("책등록에 실패했습니다.")
        return render_template('main.jsp')


    flash("책등록 성공 ")
    return render_template('main.jsp')





# Backoffice END




## [0,0,0,0,0,0,3,0,0,2] <<= data input

## Ex) localhost:5000/rec/0000003002
## return cluster 1,2,3,4 spring에서 분기처리

# 머신러닝 API 리턴
@app.route('/rec/<data>/<id>')
def commerce(data, id):
    # 데이터 변환작업
    str_data = []
    for i in data:
        str_data.append(int(i))

    #Data
    x = [str_data]
    cluster_result = kmeans.predict(x)


    API_HOST = "http://3.36.39.51/addrecc"
    url = API_HOST
    headers = {'Content-Type': 'application/json', 'charset': 'UTF-8', 'Accept': '*/*'}
    body = {
        "recc" : str(cluster_result[0]),
        "member_id" : id
    }
    response = requests.post(url, data = body)
    print("response status %r" % response.status_code)
    print("response text %r" % response.text)

    return ''



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
    app.secret_key = 'super secret key'
    app.config['SESSION_TYPE'] = 'filesystem'
    app.run(host='0.0.0.0', port=5000, debug=False)

