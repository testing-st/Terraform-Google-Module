output "bucket" {
  description = "The created storage bucket"
  value       = google_storage_bucket.bucket
}

output "name" {
  description = "Bucket name."
  value       = google_storage_bucket.bucket.name
}

output "url" {
  description = "Bucket URL."
  value       = google_storage_bucket.bucket.url
}

/* output "internal_kms_configuration" {
  description = "The intenal KMS Resource."
  value       = var.internal_encryption_config.create_encryption_key ? module.encryption_key[0] : null
} */