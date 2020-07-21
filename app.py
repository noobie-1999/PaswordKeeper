from flask import Flask, request, jsonify
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
from cryptography.fernet import Fernet

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'password_keeper'
mysql = MySQL(app)

SECRET_KEY = b'wknp1C4nAiV8kWtZBG_Hbe8pOdQrzb0GAYchLYjIV4E='
f = Fernet(SECRET_KEY)

def encrypt(password):
    encoded = password.encode()
    return f.encrypt(encoded).decode()

def decrypt(password):
    return f.decrypt(password.encode()).decode()

@app.route('/app/user/auth', methods=['POST'])
def login():
    data = request.get_json()
    username = data['username']
    password = data['password']
    cursor = mysql.connection.cursor()
    result_rows = cursor.execute('SELECT * FROM USERS where username=("'+username+'")')
    if result_rows>0:
        user = cursor.fetchall()[0]
        if(check_password_hash(user[2],password)):
            return jsonify({"status":"success", "userID":user[0]})

    return jsonify({"status":"failure"})


@app.route('/app/user', methods=['POST'])
def signup():
    try:
        data = request.get_json()
        username = data['username']
        password = generate_password_hash(data['password'])
        print(username+" "+password)
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO USERS(username, password) values(%s,%s)",(username, password))
        mysql.connection.commit()
        cursor.close()
        return jsonify({"message":"account created"})
    except:
        return jsonify({"message":"account already exists"})
    

@app.route('/get/app/sites/list/', methods=['GET'])
def get_passwords():
    try:
        user_id = request.args.get('user')
        cursor = mysql.connection.cursor()
        result_rows = cursor.execute('select * from PASSWORDS where user_id='+user_id+';')
        if(result_rows==0):
            return jsonify({"passwords":[]})
        else:
            result = cursor.fetchall()
            password_list = []
            for res in result:
                temp_dict = {}
                temp_dict['website'] = res[3]
                temp_dict['password'] = decrypt(res[2])
                print(temp_dict)
                password_list.append(temp_dict)
            return jsonify({"passwords":password_list})
    except:
        return jsonify({"status":"failure"})

@app.route('/app/sites/', methods=['POST'])
def save_new_password():
    try:
        user_id = request.args.get('user')
        data = request.get_json()
        website = data['website']
        password = encrypt(data['password'])
        cursor = mysql.connection.cursor()
        cursor.execute("INSERT INTO PASSWORDS(user_id, password, websites) values(%s,%s,%s)",(int(user_id),password, website))
        mysql.connection.commit()
        cursor.close()
        return jsonify({"status":"success"})
    except:
        return jsonify({"status":"failure"})


if(__name__=='__main__'):
    app.run(debug=True)