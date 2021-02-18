resource "google_storage_bucket" "my_bucket_access_log" {
  name     = "my_bucket_access_log"
  location = var.gcp_regions["tokyo"]

  # アクセス制御をUniformモードにする
  uniform_bucket_level_access = true

  # このオプションをtrueにしておくと、バケット内にデータが残っていても削除してくれる
  # 本番運用時はtrueにしない方がおそらくいいが、これはサンプルのためtrueにしておく
  force_destroy = true
}

# IMAポリシーをバケットに付与する
resource "google_storage_bucket_iam_policy" "my_bucket_access_log" {
  bucket      = google_storage_bucket.my_bucket_access_log.name
  policy_data = data.google_iam_policy.my_bucket_access_log.policy_data
}

data "google_iam_policy" "my_bucket_access_log" {
  binding {
    # 定義済みのロール。保有する権限の詳細は以下
    # https://cloud.google.com/storage/docs/access-control/iam-roles#standard-roles
    role = "roles/storage.admin"

    # ロールを付与する対象のユーザーやサービスアカウント
    members = [
      "projectOwner:${var.gcp_project_id}",
    ]
  }


  binding {
    # 使用状況ログを書き込むための権限を付与する
    # https://cloud.google.com/storage/docs/access-logs#delivery
    role = "roles/storage.legacyBucketWriter"

    members = [
      "group:cloud-storage-analytics@google.com",
    ]
  }
}
