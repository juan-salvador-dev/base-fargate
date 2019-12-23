import boto3

""" listar objectos de un bucket
s3 = boto3.resource('s3')
mybucket = s3.Bucket('helloworldproduct')
objects = mybucket.objects.all()

for name in objects:
    print(name.key)
"""
"""
s3 = boto3.resource('s3')
copy_source = {
    'Bucket': 'helloworldproduct',
    'Key': 'descarga.jpeg'
}
bucket = s3.Bucket('producthello')
obj = bucket.Object('move.jpeg')
obj.copy(copy_source)
print('object copy')
"""
print("hello wolrd")