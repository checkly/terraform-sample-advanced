variable "checkly_api_key" {}
variable "checkly_account_id" {}
variable "custom_url" {}

terraform {
  required_providers {
    checkly = {
      source = "checkly/checkly"
      # use fixed version for production setups
      version = "~> 1.0"
    }
  }
}

provider "checkly" {
  api_key    = var.checkly_api_key
  account_id = var.checkly_account_id
}

resource "checkly_check" "get-users" {
  name                      = "GET users"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 1
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  environment_variables = {
    "key" = "value"
  }

  group_id = checkly_check_group.users-api.id

  request {
    url              = "https://danube-webshop.herokuapp.com/api/books"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.length"
      comparison = "EQUALS"
      target     = "30"
    }
  }
}

resource "checkly_check" "post-user" {
  name                      = "POST user"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 1
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  group_id = checkly_check_group.users-api.id

  request {
    url              = "https://danube-webshop.herokuapp.com/api/books"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.length"
      comparison = "EQUALS"
      target     = "30"
    }
  }
}

resource "checkly_check_group" "users-api" {
  name      = "Users API"
  activated = true
  muted     = false

  locations = [
    "eu-west-1",
    "eu-central-1"
  ]

  alert_channel_subscription {
    channel_id = checkly_alert_channel.slack_ac.id
    activated  = true
  }

  concurrency               = 2
  double_check              = true
  use_global_alert_settings = false
}

resource "checkly_check" "create-order" {
  name                      = "create order"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 1
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  group_id = checkly_check_group.orders-api.id

  request {
    url              = "https://danube-webshop.herokuapp.com/api/books"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.length"
      comparison = "EQUALS"
      target     = "30"
    }
  }
}

resource "checkly_check" "update-order" {
  name                      = "update order"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 1
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  group_id = checkly_check_group.orders-api.id

  request {
    url              = "https://danube-webshop.herokuapp.com/api/books"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.length"
      comparison = "EQUALS"
      target     = "30"
    }
  }
}

resource "checkly_check" "cancel-order" {
  name                      = "cancel order"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 1
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  group_id = checkly_check_group.orders-api.id

  request {
    url              = "https://danube-webshop.herokuapp.com/api/books"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.length"
      comparison = "EQUALS"
      target     = "30"
    }
  }
}

resource "checkly_check" "add-to-wishlist" {
  name                      = "add to wishlist"
  type                      = "API"
  activated                 = true
  should_fail               = false
  frequency                 = 1
  double_check              = true
  ssl_check                 = true
  use_global_alert_settings = true
  degraded_response_time    = 5000
  max_response_time         = 10000

  locations = [
    "eu-central-1",
    "us-west-1"
  ]

  group_id = checkly_check_group.orders-api.id

  request {
    url              = "https://danube-webshop.herokuapp.com/api/books"
    follow_redirects = true
    assertion {
      source     = "STATUS_CODE"
      comparison = "EQUALS"
      target     = "200"
    }
    assertion {
      source     = "JSON_BODY"
      property   = "$.length"
      comparison = "EQUALS"
      target     = "30"
    }
  }
}

resource "checkly_check_group" "orders-api" {
  name      = "Orders API"
  activated = true
  muted     = false

  locations = [
    "eu-west-1",
    "eu-central-1"
  ]
  concurrency               = 2
  double_check              = true
  use_global_alert_settings = false

  alert_channel_subscription {
    channel_id = checkly_alert_channel.pagerduty_ac.id
    activated  = true
  }

  alert_channel_subscription {
    channel_id = checkly_alert_channel.slack_ac.id
    activated  = true
  }
}

resource "checkly_alert_channel" "pagerduty_ac" {
  pagerduty {
    account      = "checkly"
    service_key  = "key1"
    service_name = "pdalert"
  }
}

resource "checkly_alert_channel" "slack_ac" {
  slack {
    channel = "#checkly-notifications"
    url     = "https://hooks.slack.com/services/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g"
  }
}


resource "checkly_check_group" "test_group1" {
  name      = "Critical User Flows"
  activated = true
  muted     = false
  tags = [
    "terraform", "critical-user-flows"
  ]
  concurrency = 10
  locations = [
    "us-west-1",
  ]
}

resource "checkly_check" "browser-check" {
  for_each = fileset("${path.module}/critical-user-flows", "*") // Iterates through the files in the scripts folder in your project's directory

  name         = each.key // Sets the check name to match the file's 
  group_id     = checkly_check_group.test_group1.id
  type         = "BROWSER"
  activated    = true
  frequency    = 60
  double_check = true
  ssl_check    = false
  locations = [
    "us-west-1",
    "us-east-1"
  ]
  use_global_alert_settings = false

  alert_channel_subscription {
    channel_id = checkly_alert_channel.slack_ac.id
    activated  = true
  }
  environment_variables = { // This sets check-level environment variables
    TEST_USER_ID    = "7d8d8288-43a6-44b0-ba08-4c5736c1b6ed",
    USER_EMAIL      = "user@email.com",
    USER_PASSWORD   = "supersecure1",
    FILE_PATH       = "tests/fixtures/file.jpg",
    TEST_FILE_PATH  = "tests/fixtures/invoice-20-07-02.pdf",
    ENVIRONMENT_URL = "https://checklyhq.com"
    PRODUCTS_NUMBER = "3"
  }

  script = file("${path.module}/critical-user-flows/${each.key}") // Assigns the script contained in each file to each new created check resource
}

resource "checkly_maintenance_windows" "maintenance-1" {
  name            = "Maintenance Windows"
  starts_at       = "2023-04-24T00:00:00.000Z"
  ends_at         = "2023-04-25T00:00:00.000Z"
  repeat_unit     = "MONTH"
  repeat_ends_at  = "2024-08-24T00:00:00.000Z"
  repeat_interval = 1
  tags = [
    "auto", "terraform"
  ]
}

resource "checkly_dashboard" "dashboard-main" {
  custom_url      = var.custom_url                           // A unique subdomain name under "checklyhq.com"
  custom_domain   = "status.${var.custom_url}.com"               // A custom user domain
  logo            = "https://www.danube-web.shop/logo.png" // URL pointing to an image/logo for the page
  header          = "Public dashboard"                     // What text to display at the top of your dashboard
  refresh_rate    = 60                                     // How often to refresh the dashboard in seconds
  paginate        = false                                  // Determines if pagination is on or off
  pagination_rate = 30                                     // How often to trigger pagination in seconds
  hide_tags       = false                                  // Whether to show or hide the tags on the dashboard
  width           = "FULL"                                 // Determines whether to use the full screen or focus in the center
  tags = [                                                 // One or more tags that filter which checks to display on the dashboard
    "auto", "terraform"
  ]
}
