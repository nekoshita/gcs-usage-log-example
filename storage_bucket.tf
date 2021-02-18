resource "google_storage_bucket" "private_bucket_project_owner_and_one_user_can_access" {
  name     = "private_bucket_project_owner_and_one_user_can_access"
  location = var.gcp_regions["tokyo"]

  # アクセス制御をUniformモードにする
  uniform_bucket_level_access = true

  # このオプションをtrueにしておくと、バケット内にデータが残っていても削除してくれる
  # 本番運用時はtrueにしない方がおそらくいいが、これはサンプルのためtrueにしておく
  force_destroy = true

  # 使用状況ログを有効にする
  # https://cloud.google.com/storage/docs/access-logs#delivery
  logging {
    log_bucket        = google_storage_bucket.my_bucket_access_log.name
    log_object_prefix = google_storage_bucket.my_bucket_access_log.name
  }
}
