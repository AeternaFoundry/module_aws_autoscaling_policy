resource "aws_autoscaling_policy" "autoscaling_policies" {
  for_each = var.autoscaling_policies

  autoscaling_group_name    = each.value.autoscaling_group_name
  name                      = each.value.name
  adjustment_type           = each.value.adjustment_type
  cooldown                  = each.value.cooldown
  enabled                   = each.value.enabled
  estimated_instance_warmup = each.value.estimated_instance_warmup
  metric_aggregation_type   = each.value.metric_aggregation_type
  min_adjustment_magnitude  = each.value.min_adjustment_magnitude
  policy_type               = each.value.policy_type
  region                    = each.value.region
  scaling_adjustment        = each.value.scaling_adjustment

  dynamic "predictive_scaling_configuration" {
    for_each = each.value.predictive_scaling_configuration != null ? [each.value.predictive_scaling_configuration] : []
    content {
      max_capacity_breach_behavior = predictive_scaling_configuration.value.max_capacity_breach_behavior
      max_capacity_buffer          = predictive_scaling_configuration.value.max_capacity_buffer
      metric_specification {
        dynamic "customized_capacity_metric_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification.customized_capacity_metric_specification != null ? [predictive_scaling_configuration.value.metric_specification.customized_capacity_metric_specification] : []
          content {
            dynamic "metric_data_queries" {
              for_each = customized_capacity_metric_specification.value.metric_data_queries
              content {
                expression = metric_data_queries.value.expression
                id         = metric_data_queries.value.id
                label      = metric_data_queries.value.label
                dynamic "metric_stat" {
                  for_each = metric_data_queries.value.metric_stat != null ? [metric_data_queries.value.metric_stat] : []
                  content {
                    metric {
                      dynamic "dimensions" {
                        for_each = metric_stat.value.metric.dimensions != null ? metric_stat.value.metric.dimensions : []
                        content {
                          name  = dimensions.value.name
                          value = dimensions.value.value
                        }
                      }
                      metric_name = metric_stat.value.metric.metric_name
                      namespace   = metric_stat.value.metric.namespace
                    }
                    stat = metric_stat.value.stat
                    unit = metric_stat.value.unit
                  }
                }
                return_data = metric_data_queries.value.return_data
              }
            }
          }
        }
        dynamic "customized_load_metric_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification.customized_load_metric_specification != null ? [predictive_scaling_configuration.value.metric_specification.customized_load_metric_specification] : []
          content {
            dynamic "metric_data_queries" {
              for_each = customized_load_metric_specification.value.metric_data_queries
              content {
                expression = metric_data_queries.value.expression
                id         = metric_data_queries.value.id
                label      = metric_data_queries.value.label
                dynamic "metric_stat" {
                  for_each = metric_data_queries.value.metric_stat != null ? [metric_data_queries.value.metric_stat] : []
                  content {
                    metric {
                      dynamic "dimensions" {
                        for_each = metric_stat.value.metric.dimensions != null ? metric_stat.value.metric.dimensions : []
                        content {
                          name  = dimensions.value.name
                          value = dimensions.value.value
                        }
                      }
                      metric_name = metric_stat.value.metric.metric_name
                      namespace   = metric_stat.value.metric.namespace
                    }
                    stat = metric_stat.value.stat
                    unit = metric_stat.value.unit
                  }
                }
                return_data = metric_data_queries.value.return_data
              }
            }
          }
        }
        dynamic "customized_scaling_metric_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification.customized_scaling_metric_specification != null ? [predictive_scaling_configuration.value.metric_specification.customized_scaling_metric_specification] : []
          content {
            dynamic "metric_data_queries" {
              for_each = customized_scaling_metric_specification.value.metric_data_queries
              content {
                expression = metric_data_queries.value.expression
                id         = metric_data_queries.value.id
                label      = metric_data_queries.value.label
                dynamic "metric_stat" {
                  for_each = metric_data_queries.value.metric_stat != null ? [metric_data_queries.value.metric_stat] : []
                  content {
                    metric {
                      dynamic "dimensions" {
                        for_each = metric_stat.value.metric.dimensions != null ? metric_stat.value.metric.dimensions : []
                        content {
                          name  = dimensions.value.name
                          value = dimensions.value.value
                        }
                      }
                      metric_name = metric_stat.value.metric.metric_name
                      namespace   = metric_stat.value.metric.namespace
                    }
                    stat = metric_stat.value.stat
                    unit = metric_stat.value.unit
                  }
                }
                return_data = metric_data_queries.value.return_data
              }
            }
          }
        }
        dynamic "predefined_load_metric_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification.predefined_load_metric_specification != null ? [predictive_scaling_configuration.value.metric_specification.predefined_load_metric_specification] : []
          content {
            predefined_metric_type = predefined_load_metric_specification.value.predefined_metric_type
            resource_label         = predefined_load_metric_specification.value.resource_label
          }
        }
        dynamic "predefined_metric_pair_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification.predefined_metric_pair_specification != null ? [predictive_scaling_configuration.value.metric_specification.predefined_metric_pair_specification] : []
          content {
            predefined_metric_type = predefined_metric_pair_specification.value.predefined_metric_type
            resource_label         = predefined_metric_pair_specification.value.resource_label
          }
        }
        dynamic "predefined_scaling_metric_specification" {
          for_each = predictive_scaling_configuration.value.metric_specification.predefined_scaling_metric_specification != null ? [predictive_scaling_configuration.value.metric_specification.predefined_scaling_metric_specification] : []
          content {
            predefined_metric_type = predefined_scaling_metric_specification.value.predefined_metric_type
            resource_label         = predefined_scaling_metric_specification.value.resource_label
          }
        }
        target_value = predictive_scaling_configuration.value.metric_specification.target_value
      }
      mode                   = predictive_scaling_configuration.value.mode
      scheduling_buffer_time = predictive_scaling_configuration.value.scheduling_buffer_time
    }
  }

  dynamic "step_adjustment" {
    for_each = each.value.step_adjustment != null ? each.value.step_adjustment : []
    content {
      metric_interval_lower_bound = step_adjustment.value.metric_interval_lower_bound
      metric_interval_upper_bound = step_adjustment.value.metric_interval_upper_bound
      scaling_adjustment          = step_adjustment.value.scaling_adjustment
    }
  }

  dynamic "target_tracking_configuration" {
    for_each = each.value.target_tracking_configuration != null ? [each.value.target_tracking_configuration] : []
    content {
      dynamic "customized_metric_specification" {
        for_each = target_tracking_configuration.value.customized_metric_specification != null ? [target_tracking_configuration.value.customized_metric_specification] : []
        content {
          dynamic "metric_dimension" {
            for_each = customized_metric_specification.value.metric_dimension != null ? customized_metric_specification.value.metric_dimension : []
            content {
              name  = metric_dimension.value.name
              value = metric_dimension.value.value
            }
          }
          metric_name = customized_metric_specification.value.metric_name
          dynamic "metrics" {
            for_each = customized_metric_specification.value.metrics != null ? customized_metric_specification.value.metrics : []
            content {
              expression = metrics.value.expression
              id         = metrics.value.id
              label      = metrics.value.label
              dynamic "metric_stat" {
                for_each = metrics.value.metric_stat != null ? [metrics.value.metric_stat] : []
                content {
                  metric {
                    dynamic "dimensions" {
                      for_each = metric_stat.value.metric.dimensions != null ? metric_stat.value.metric.dimensions : []
                      content {
                        name  = dimensions.value.name
                        value = dimensions.value.value
                      }
                    }
                    metric_name = metric_stat.value.metric.metric_name
                    namespace   = metric_stat.value.metric.namespace
                  }
                  period = metric_stat.value.period
                  stat   = metric_stat.value.stat
                  unit   = metric_stat.value.unit
                }
              }
              return_data = metrics.value.return_data
            }
          }
          namespace = customized_metric_specification.value.namespace
          period    = customized_metric_specification.value.period
          statistic = customized_metric_specification.value.statistic
          unit      = customized_metric_specification.value.unit
        }
      }
      disable_scale_in = target_tracking_configuration.value.disable_scale_in
      dynamic "predefined_metric_specification" {
        for_each = target_tracking_configuration.value.predefined_metric_specification != null ? [target_tracking_configuration.value.predefined_metric_specification] : []
        content {
          predefined_metric_type = predefined_metric_specification.value.predefined_metric_type
          resource_label         = predefined_metric_specification.value.resource_label
        }
      }
      target_value = target_tracking_configuration.value.target_value
    }
  }
}

