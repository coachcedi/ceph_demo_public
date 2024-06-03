from flask import Flask, request, render_template, jsonify, send_file
import tempfile
import boto3
from botocore.client import Config
import os

app = Flask(__name__)

# Configuration
endpoint_url = 'http://192.168.0.2:8080'
bucket_name = 'test'
access_key = os.getenv('AWS_ACCESS_KEY_ID', 'test')
secret_key = os.getenv('AWS_SECRET_ACCESS_KEY', 'test')

session = boto3.session.Session()
s3_client = session.client(
    's3',
    endpoint_url=endpoint_url,
    aws_access_key_id=access_key,
    aws_secret_access_key=secret_key,
    config=Config(signature_version='s3v4')
)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/upload', methods=['POST'])
def upload():
    file = request.files['file']
    if file:
        s3_client.upload_fileobj(file, bucket_name, file.filename)
        return jsonify({'message': f'File {file.filename} uploaded successfully'})
    return jsonify({'message': 'No file uploaded'}), 400

@app.route('/download/<filename>', methods=['GET'])
def download(filename):
    with tempfile.NamedTemporaryFile(delete=False) as tmp_file:
        s3_client.download_file(bucket_name, filename, tmp_file.name)
        tmp_file.close()
        
        return send_file(tmp_file.name, as_attachment=True, download_name=filename)

if __name__ == '__main__':
    app.run(debug=True)
