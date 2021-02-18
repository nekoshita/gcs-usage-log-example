# GCSバケットのオブジェクトの使用状況ログをとる

## 解説記事
https://zenn.dev/nekoshita/articles/5730d79bc39a20

## GCSバケットの作成
```
$ export GCP_PROJECT_ID="your-gcp-project-id"
$ export GCS_BUCKET_NAME="your-gcs-bucket-name"

$ bin/apply $GCP_PROJECT_ID $GCS_BUCKET_NAME
```

## GCSバケットの削除
```
$ export GCP_PROJECT_ID="your-gcp-project-id"
$ export GCS_BUCKET_NAME="your-gcs-bucket-name"

$ bin/destroy $GCP_PROJECT_ID $GCS_BUCKET_NAME
```
