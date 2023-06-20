from flask import Flask, request, jsonify, render_template
import os
import json
import pymysql.cursors
from dotenv import load_dotenv


app = Flask(__name__)

load_dotenv()


@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':

        #Establishing connection to DB

        connection = pymysql.connect(           
            host='db',
            user=os.getenv('MYSQL_USER'),
            password=os.getenv('MYSQL_PASSWORD'),
            database=os.getenv('MYSQL_DATABASE'),
            cursorclass=pymysql.cursors.DictCursor
        )

        name = request.form['username']

        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM users WHERE name = %s", (name,))
            username = cursor.fetchone()
            
            #Non-existing user flow: returning the table content

            if username is None:
                cursor.execute("SELECT * FROM users")
                all_users = cursor.fetchall()
                return jsonify(all_users), 404
            
            #Existing user flow: deleting the record from DB and saving it as JSON

            cursor.execute("DELETE FROM users WHERE name = %s", (name,))
            connection.commit()

            with open(f'jsonfiles/{name}.json', 'w') as f:
                json.dump(username, f)

        connection.close()

        return jsonify({"message": "User deleted", "user": username}), 200

    return render_template('index.html')


if __name__ == '__main__':
    if not os.path.exists('jsonfiles'):
        os.makedirs('jsonfiles') # Archive folder
    app.run(debug=True)
