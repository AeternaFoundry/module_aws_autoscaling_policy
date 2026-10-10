output "autoscaling_policies_id" {
  description = "Map of id values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "autoscaling_policies_adjustment_type" {
  description = "Map of adjustment_type values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.adjustment_type if v.adjustment_type != null && length(v.adjustment_type) > 0 }
}
output "autoscaling_policies_arn" {
  description = "Map of arn values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.arn if v.arn != null && length(v.arn) > 0 }
}
output "autoscaling_policies_autoscaling_group_name" {
  description = "Map of autoscaling_group_name values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.autoscaling_group_name if v.autoscaling_group_name != null && length(v.autoscaling_group_name) > 0 }
}
output "autoscaling_policies_cooldown" {
  description = "Map of cooldown values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.cooldown if v.cooldown != null }
}
output "autoscaling_policies_enabled" {
  description = "Map of enabled values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.enabled if v.enabled != null }
}
output "autoscaling_policies_estimated_instance_warmup" {
  description = "Map of estimated_instance_warmup values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.estimated_instance_warmup if v.estimated_instance_warmup != null }
}
output "autoscaling_policies_metric_aggregation_type" {
  description = "Map of metric_aggregation_type values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.metric_aggregation_type if v.metric_aggregation_type != null && length(v.metric_aggregation_type) > 0 }
}
output "autoscaling_policies_min_adjustment_magnitude" {
  description = "Map of min_adjustment_magnitude values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.min_adjustment_magnitude if v.min_adjustment_magnitude != null }
}
output "autoscaling_policies_name" {
  description = "Map of name values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.name if v.name != null && length(v.name) > 0 }
}
output "autoscaling_policies_policy_type" {
  description = "Map of policy_type values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.policy_type if v.policy_type != null && length(v.policy_type) > 0 }
}
output "autoscaling_policies_predictive_scaling_configuration" {
  description = "Map of predictive_scaling_configuration values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => one(v.predictive_scaling_configuration) if v.predictive_scaling_configuration != null && length(v.predictive_scaling_configuration) > 0 }
}
output "autoscaling_policies_region" {
  description = "Map of region values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.region if v.region != null && length(v.region) > 0 }
}
output "autoscaling_policies_scaling_adjustment" {
  description = "Map of scaling_adjustment values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.scaling_adjustment if v.scaling_adjustment != null }
}
output "autoscaling_policies_step_adjustment" {
  description = "Map of step_adjustment values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => v.step_adjustment if v.step_adjustment != null && length(v.step_adjustment) > 0 }
}
output "autoscaling_policies_target_tracking_configuration" {
  description = "Map of target_tracking_configuration values across all autoscaling_policies, keyed the same as var.autoscaling_policies"
  value       = { for k, v in aws_autoscaling_policy.autoscaling_policies : k => one(v.target_tracking_configuration) if v.target_tracking_configuration != null && length(v.target_tracking_configuration) > 0 }
}

