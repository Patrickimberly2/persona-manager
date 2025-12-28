bucket         = "your-tf-state-bucket"
key            = "persona-manager/<env>/terraform.tfstate"
region         = "us-east-1"
dynamodb_table = "tf-locks"
encrypt        = true
