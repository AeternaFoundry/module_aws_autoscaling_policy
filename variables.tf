variable "autoscaling_policies" {
  description = <<EOT
Map of autoscaling_policies, attributes below
Required:
    - autoscaling_group_name
    - name
Optional:
    - adjustment_type
    - cooldown
    - enabled
    - estimated_instance_warmup
    - metric_aggregation_type
    - min_adjustment_magnitude
    - policy_type
    - region
    - scaling_adjustment
    - predictive_scaling_configuration (block):
        - max_capacity_breach_behavior (optional)
        - max_capacity_buffer (optional)
        - metric_specification (required, block):
            - customized_capacity_metric_specification (optional, block):
                - metric_data_queries (required, block):
                    - expression (optional)
                    - id (required)
                    - label (optional)
                    - metric_stat (optional, block):
                        - metric (required, block):
                            - dimensions (optional, block):
                                - name (required)
                                - value (required)
                            - metric_name (required)
                            - namespace (required)
                        - stat (required)
                        - unit (optional)
                    - return_data (optional)
            - customized_load_metric_specification (optional, block):
                - metric_data_queries (required, block):
                    - expression (optional)
                    - id (required)
                    - label (optional)
                    - metric_stat (optional, block):
                        - metric (required, block):
                            - dimensions (optional, block):
                                - name (required)
                                - value (required)
                            - metric_name (required)
                            - namespace (required)
                        - stat (required)
                        - unit (optional)
                    - return_data (optional)
            - customized_scaling_metric_specification (optional, block):
                - metric_data_queries (required, block):
                    - expression (optional)
                    - id (required)
                    - label (optional)
                    - metric_stat (optional, block):
                        - metric (required, block):
                            - dimensions (optional, block):
                                - name (required)
                                - value (required)
                            - metric_name (required)
                            - namespace (required)
                        - stat (required)
                        - unit (optional)
                    - return_data (optional)
            - predefined_load_metric_specification (optional, block):
                - predefined_metric_type (required)
                - resource_label (optional)
            - predefined_metric_pair_specification (optional, block):
                - predefined_metric_type (required)
                - resource_label (optional)
            - predefined_scaling_metric_specification (optional, block):
                - predefined_metric_type (required)
                - resource_label (optional)
            - target_value (required)
        - mode (optional)
        - scheduling_buffer_time (optional)
    - step_adjustment (block):
        - metric_interval_lower_bound (optional)
        - metric_interval_upper_bound (optional)
        - scaling_adjustment (required)
    - target_tracking_configuration (block):
        - customized_metric_specification (optional, block):
            - metric_dimension (optional, block):
                - name (required)
                - value (required)
            - metric_name (optional)
            - metrics (optional, block):
                - expression (optional)
                - id (required)
                - label (optional)
                - metric_stat (optional, block):
                    - metric (required, block):
                        - dimensions (optional, block):
                            - name (required)
                            - value (required)
                        - metric_name (required)
                        - namespace (required)
                    - period (optional)
                    - stat (required)
                    - unit (optional)
                - return_data (optional)
            - namespace (optional)
            - period (optional)
            - statistic (optional)
            - unit (optional)
        - disable_scale_in (optional)
        - predefined_metric_specification (optional, block):
            - predefined_metric_type (required)
            - resource_label (optional)
        - target_value (required)
EOT

  type = map(object({
    autoscaling_group_name    = string
    name                      = string
    adjustment_type           = optional(string)
    cooldown                  = optional(number)
    enabled                   = optional(bool)
    estimated_instance_warmup = optional(number)
    metric_aggregation_type   = optional(string)
    min_adjustment_magnitude  = optional(number)
    policy_type               = optional(string)
    region                    = optional(string)
    scaling_adjustment        = optional(number)
    predictive_scaling_configuration = optional(object({
      max_capacity_breach_behavior = optional(string)
      max_capacity_buffer          = optional(string)
      metric_specification = object({
        customized_capacity_metric_specification = optional(object({
          metric_data_queries = list(object({
            expression = optional(string)
            id         = string
            label      = optional(string)
            metric_stat = optional(object({
              metric = object({
                dimensions = optional(list(object({
                  name  = string
                  value = string
                })))
                metric_name = string
                namespace   = string
              })
              stat = string
              unit = optional(string)
            }))
            return_data = optional(bool)
          }))
        }))
        customized_load_metric_specification = optional(object({
          metric_data_queries = list(object({
            expression = optional(string)
            id         = string
            label      = optional(string)
            metric_stat = optional(object({
              metric = object({
                dimensions = optional(list(object({
                  name  = string
                  value = string
                })))
                metric_name = string
                namespace   = string
              })
              stat = string
              unit = optional(string)
            }))
            return_data = optional(bool)
          }))
        }))
        customized_scaling_metric_specification = optional(object({
          metric_data_queries = list(object({
            expression = optional(string)
            id         = string
            label      = optional(string)
            metric_stat = optional(object({
              metric = object({
                dimensions = optional(list(object({
                  name  = string
                  value = string
                })))
                metric_name = string
                namespace   = string
              })
              stat = string
              unit = optional(string)
            }))
            return_data = optional(bool)
          }))
        }))
        predefined_load_metric_specification = optional(object({
          predefined_metric_type = string
          resource_label         = optional(string)
        }))
        predefined_metric_pair_specification = optional(object({
          predefined_metric_type = string
          resource_label         = optional(string)
        }))
        predefined_scaling_metric_specification = optional(object({
          predefined_metric_type = string
          resource_label         = optional(string)
        }))
        target_value = number
      })
      mode                   = optional(string)
      scheduling_buffer_time = optional(string)
    }))
    step_adjustment = optional(list(object({
      metric_interval_lower_bound = optional(string)
      metric_interval_upper_bound = optional(string)
      scaling_adjustment          = number
    })))
    target_tracking_configuration = optional(object({
      customized_metric_specification = optional(object({
        metric_dimension = optional(list(object({
          name  = string
          value = string
        })))
        metric_name = optional(string)
        metrics = optional(list(object({
          expression = optional(string)
          id         = string
          label      = optional(string)
          metric_stat = optional(object({
            metric = object({
              dimensions = optional(list(object({
                name  = string
                value = string
              })))
              metric_name = string
              namespace   = string
            })
            period = optional(number)
            stat   = string
            unit   = optional(string)
          }))
          return_data = optional(bool)
        })))
        namespace = optional(string)
        period    = optional(number)
        statistic = optional(string)
        unit      = optional(string)
      }))
      disable_scale_in = optional(bool)
      predefined_metric_specification = optional(object({
        predefined_metric_type = string
        resource_label         = optional(string)
      }))
      target_value = number
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.predictive_scaling_configuration == null || (v.predictive_scaling_configuration.metric_specification.customized_capacity_metric_specification == null || (length(v.predictive_scaling_configuration.metric_specification.customized_capacity_metric_specification.metric_data_queries) >= 1 && length(v.predictive_scaling_configuration.metric_specification.customized_capacity_metric_specification.metric_data_queries) <= 10))
      )
    ])
    error_message = "Each metric_data_queries list must contain between 1 and 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.predictive_scaling_configuration == null || (v.predictive_scaling_configuration.metric_specification.customized_load_metric_specification == null || (length(v.predictive_scaling_configuration.metric_specification.customized_load_metric_specification.metric_data_queries) >= 1 && length(v.predictive_scaling_configuration.metric_specification.customized_load_metric_specification.metric_data_queries) <= 10))
      )
    ])
    error_message = "Each metric_data_queries list must contain between 1 and 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.predictive_scaling_configuration == null || (v.predictive_scaling_configuration.metric_specification.customized_scaling_metric_specification == null || (length(v.predictive_scaling_configuration.metric_specification.customized_scaling_metric_specification.metric_data_queries) >= 1 && length(v.predictive_scaling_configuration.metric_specification.customized_scaling_metric_specification.metric_data_queries) <= 10))
      )
    ])
    error_message = "Each metric_data_queries list must contain between 1 and 10 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.min_adjustment_magnitude == null || (v.min_adjustment_magnitude >= 1)
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.target_tracking_configuration == null || (v.target_tracking_configuration.customized_metric_specification == null || (v.target_tracking_configuration.customized_metric_specification.metrics == null || alltrue([for item in v.target_tracking_configuration.customized_metric_specification.metrics : (item.label == null || (length(item.label) >= 1 && length(item.label) <= 2047))])))
      )
    ])
    error_message = "must be between 1 and 2047 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.target_tracking_configuration == null || (v.target_tracking_configuration.customized_metric_specification == null || (v.target_tracking_configuration.customized_metric_specification.metrics == null || alltrue([for item in v.target_tracking_configuration.customized_metric_specification.metrics : (item.metric_stat == null || (item.metric_stat.period == null || (contains([10, 30, 60], item.metric_stat.period))))])))
      )
    ])
    error_message = "must be one of: 10, 30, 60"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.target_tracking_configuration == null || (v.target_tracking_configuration.customized_metric_specification == null || (v.target_tracking_configuration.customized_metric_specification.metrics == null || alltrue([for item in v.target_tracking_configuration.customized_metric_specification.metrics : (item.metric_stat == null || (length(item.metric_stat.stat) >= 1 && length(item.metric_stat.stat) <= 100))])))
      )
    ])
    error_message = "must be between 1 and 100 characters"
  }
  validation {
    condition = alltrue([
      for k, v in var.autoscaling_policies : (
        v.target_tracking_configuration == null || (v.target_tracking_configuration.customized_metric_specification == null || (v.target_tracking_configuration.customized_metric_specification.period == null || (contains([10, 30, 60], v.target_tracking_configuration.customized_metric_specification.period))))
      )
    ])
    error_message = "must be one of: 10, 30, 60"
  }
  # Note: 16 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

