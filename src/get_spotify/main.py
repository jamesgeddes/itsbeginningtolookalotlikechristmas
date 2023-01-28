from src.get_spotify.spotify import get_popularity
from dotenv import load_dotenv
from os import getenv
from datetime import datetime
from aws import s3_upload_file, s3_download_file
import logging
import boto3
from botocore.exceptions import ClientError
import os
import vars

load_dotenv()
client_id = getenv("SPOTIFY_CLIENT_ID")
client_secret = getenv("SPOTIFY_CLIENT_SECRET")


def main():
    # 1. Try to get data from S3 bucket - if nothing there then that's ok
    s3_download_file(
        bucket_name=vars.bucket_name,
        file_key=vars.file_key,
        file_name=vars.file_key,
    )

    # 2. Get popularity score from spotify
    popularity = get_popularity(
        client_id=client_id, client_secret=client_secret, song_id=vars.song_id
    )
    timestamp_popularity = f"{datetime.now()}, {popularity}\n"

    # 3. Append popularity to data
    with open(vars.file_key, "a") as file:
        file.write(timestamp_popularity)

    # 4. Load data back to S3 bucket
    s3_upload_file(
        file_name=vars.file_key,
        bucket=vars.bucket_name,
        object_name=vars.file_key,
    )

    # 5. Cake


if __name__ == "__main__":
    main()
