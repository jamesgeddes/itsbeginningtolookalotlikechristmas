import boto3
import logging


def s3_download_file(bucket_name, file_key, file_name):
    s3 = boto3.client("s3")
    try:
        s3.download_file(Bucket=bucket_name, Key=file_key, Filename=file_name)
        return 0
    except:
        return 1


def s3_upload_file(file_name, bucket, object_name=None):
    # https://boto3.amazonaws.com/v1/documentation/api/latest/guide/s3-uploading-files.html
    """Upload a file to an S3 bucket

    :param file_name: File to upload
    :param bucket: Bucket to upload to
    :param object_name: S3 object name. If not specified then file_name is used
    :return: True if file was uploaded, else False
    """

    # If S3 object_name was not specified, use file_name
    if object_name is None:
        object_name = os.path.basename(file_name)

    # Upload the file
    s3_client = boto3.client("s3")
    try:
        response = s3_client.upload_file(file_name, bucket, object_name)
    except ClientError as e:
        logging.error(e)
        return False
    return True
