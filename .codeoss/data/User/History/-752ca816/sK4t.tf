resource "google_data_loss_prevention_job_trigger" "basic" {
    parent = "projects/my-project-name"
    description = var.description
    display_name = var.display_name
    trigger_id = var.trigger
    status =var.status
    dynamic "triggers" {
      for_each           =    var.triggers[*]
      content {
        manual = lookup(triggers.value,"manual","")
        dynamic "schedule" {
          for_each = lookup(trigger.value,"schedule",[])
          content {
            recurrence_period_duration = lookup(schedule.value,"recurrence_period_duration",null)
          }
        }
      }
    }
    inspect_job {
      inspect_template_name = var.inspect_template_name
        dynamic "inspect_config" {
          for_each =var.inspect_config[*]
          content {
            exclude_info_types = lookup(inspect_config.value,"exclude_info_types",null)
            include_quote      = lookup(inspect_config.value,"include_quote",null)
            min_likelihood     = lookup(inspect_config.value,"min_likelihood",null)
            dynamic"limits" {
              for_each = lookup(inspect_config.value,"limits",[])
              content{ 
                max_findings_per_item    = lookup(limits.value,"max_findings_per_item",null)
                max_findings_per_request = lookup(limits.value,"max_findings_per_request",null)
                dynamic "max_findings_per_info_type"{
                  for_each = var.max_findings_per_info_type[*]
                  content {
                    max_findings        =lookup(max_findings_per_info_type.value,"max_findings",null)
                    dynamic "info_type"{
                     for_each = lookup(max_findings_per_info_type.value,"info_type",[])
                     content {
                       name    = lookup(info_type.value,"name",null)
                       version = lookup(info_type.value,"version",null)
                      }
                    }
                    dynamic "sensitivity_score"{
                      for_each = lookup(max_findings_per_info_type.value,"sensitivity_score",[])
                      content{
                        score = lookup(sensitivity_score.value,"score",null)
                      } 
                    }
                  }
                }
              }
            }
            dynamic"info_types" {
              for_each   = lookup(inspect_config.value,"info_types",[])
              content {
                name     = lookup(info_type.value,"name",null)
                version  = lookup(info_type.value,"version",null)
                dynamic "sensitivity_score" {
                  for_each = lookup(info_types.value,"sensitivity_score",[])
                  content{
                    score = lookup(sensitivity_score.value,"score",null)
                  }
                }
              }
            }
            dynamic"rule_set" {
              for_each   = lookup(inspect_config.value,"rule_set",[])
              content {
               dynamic"info_types" {
                 for_each = lookup(rule_set.value,"info_types",[])
                 content {
                   name     = lookup(info_type.value,"name",null)
                   version  = lookup(info_type.value,"version",null)
                   dynamic "sensitivity_score" {
                     for_each = lookup(info_types.value,"sensitivity_score",[])
                     content{
                       score = lookup(sensitivity_score.value,"score",null)
                      }
                    }
                  }
                }
              dynamic"rules"{
                for_each = lookup(rule_set.value,"rules",[])
                content{
                  dynamic "hotword_rule"{
                     for_each = lookup(rules.value,"hotword_rule",[])
                      content {
                        dynamic "hotword_regex" {
                         for_each = lookup(rules.value,"hotword_regex",[])
                          content {
                            pattern = lookup(hotword_regex.value,"pattern",null)
                            group_indexes =lookup(hotword_regex.value,"group_indexes",null)
                          } 
                        }  
                        dynamic"proximity"{
                          for_each = lookup(rules.value,"proximity",[])
                          content{
                            window_before= lookup(proximity.value,"window_before",null)
                            window_after = lookup(proximity.value,"window_after",null)
                          }
                        }
                        dynamic"likelihood_adjustment"{
                         for_each = lookup(rules.value,"likelihood_adjustment",[])
                         content{
                           fixed_likelihood    =  lookup(likelihood_adjustment.value,"fixed_likelihood",null)
                           relative_likelihood = lookup(likelihood_adjustment.value,"relative_likelihood",null)
                          }
                        }
                      }
                   }
                  dynamic "exclusion_rule" {
                    for_each = lookup(rules.value,"hotword_rule",[])
                    content {
                     matching_type= lookup(exclusion_rule.value," matching_type",null)
                     dynamic"dictionary"{
                       for_each = lookup(exclusion_rule.value,"dictionary",[])
                        content {
                         dynamic"word_list"{
                           for_each = lookup(dictionary.value,"word_list",[])
                           content {
                             words = lookup(word_list.value,"  words",null)
                            }
                         }
                          dynamic"cloud_storage_path"{
                          for_each = lookup(dictionary.value,"cloud_storage_path",[])
                          content {
                            path=  lookup(cloud_storage_path.value,"path",null)
                          }
                         }
                        }
                      }
                     dynamic"regex"{
                       for_each = lookup(exclusion_rule.value,"regex",[])
                       content{
                         pattern = lookup(regex.value,"pattern",null) 
                         group_indexes= lookup(regex.value,"group_indexes",null)
                        }
                      }
                     dynamic"exclude_info_types"{
                       for_each = lookup(exclusion_rule.value,"exclude_info_types",[])
                       content{
                         dynamic "info_types"{
                          for_each = lookup(exclude_info_types.value,"info_types",[])
                          content{
                            name   = lookup(info_types.value,"name",null)
                            version = lookup(info_types.value,"version",null)
                            dynamic"sensitivity_score"{
                             for_each = lookup(exclude_info_types.value,"sensitivity_score",[])
                              content{
                               score =lookup(sensitivity_score.value,"score",null)
                              }
                            }
                          }
                         }
                        }
                      }
                     dynamic"exclude_by_hotword"{
                       for_each = lookup(exclusion_rule.value,"exclude_by_hotword",[])
                       content{
                         dynamic "hotword_regex"{
                          for_each = lookup(exclude_by_hotword.value,"hotword_regex",[])
                          content{
                           pattern = lookup(hotword_regex.value,"pattern",null)
                           group_indexes =lookup(hotword_regex.value,"group_indexes",null)
                          }
                         }            
                         dynamic"proximity"{
                         for_each = lookup(exclude_by_hotword.value,"proximity",[])
                          content{
                            window_before = lookup(proximity.value,"window_before",null)
                            window_after =  lookup(proximity.value,"window_after",null)
                          }
                         }
                        }
                      }
                    }
                      
          dynamic "custom_info_types"{
                for_each   = lookup(inspect_config.value,"custom_info_types",[])
                content{
                dynamic"info_types"{
                   for_each   = lookup(custom_info_types.value,"info_types",[])
                   content{
                      name = lookup(info_types.value,"name",null)
                      version = lookup(info_types.value,"version",null)
                    }
                 }
                 dynamic"sensitivity_score"{
                   for_each   = lookup(custom_info_types.value,"sensitivity_score",[])
                   content{
                     score = lookup(sensitivity_score.value,"score",null)
                   }
                  }
                likelihood =  lookup(custom_info_types.value,"likelihood",null)
                exclusion_type = lookup(custom_info_types.value,"exclusion_type",null)
               dynamic"sensitivity_score"{
                for_each   = lookup(inspect_config.value,"sensitivity_score",[])
                content{
                  score = lookup(sensitivity_score.value,"score",null)
                }
                dynamic"regex"{
                  for_each   = lookup(inspect_config.value,"regex",[])
                  content{
                  pattern=  lookup(regex.value," pattern",null)
                  group_indexes = lookup(regex.value," group_indexes",null)

                }
                dynamic"dictionary"{
                  for_each   = lookup(inspect_config.value,"dictionary",[])
                  content{
                  dynamic"word_list"{
                   for_each   = lookup(dictionary.value,"word_list",[])
                   content{
                     words = lookup(word_list.value,"words",null)
                    }
                  }
                  dynamic"cloud_storage_path"{
                    for_each   = lookup(dictionary.value,"cloud_storage_path",[])
                    content{
                      path = lookup(cloud_storage_path.value,"path",null)
                    }
                  }
                }
                }
                dynamic"stored_type"{
                   for_each   = lookup(inspect_config.value,"stored_type",[])
                   content{
                   name = lookup(stored_type.value,"name",null)
                   create_time = lookup(stored_type.value,"create_time",null)
                  }
                }
               surrogate_type = lookup(inspect_config.value.value,"surrogate_type",null)
               }
              }
            }
     
    
    storage_config{
      timespan_config={
        start_time
        end_time
        enable_auto_population_of_timespan_config
        timestamp_field={
          name
        }

      }
      datastore_options={
        partition_id={
          project_id=
          namespace_id=
        }
        kind={
          name=
        }
      }
      cloud_storage_options={
        file_set={
          url=
          regex_file_set={
            bucket_name=
            include_regex=
            exclude_regex=
          }
        }
        bytes_limit_per_file=
        bytes_limit_per_file_percent=
        files_limit_percent=
        file_types=
        sample_method=
      }
      big_query_options={
        table_reference={
          project_id=
          dataset_id=
          table_id =
        }
        rows_limit=
        rows_limit_percent=
        sample_method=
        identifying_fields={
          name=
        }
        included_fields={
          name=
        }
        excluded_fields={
          name=
        }
      }
      hybrid_options={
        description=
        required_finding_label_keys=
        table_options={
          identifying_fields={
            name=
          }
        }
        labels=
      }
    }
    actions{
      save_findings={
        output_config={
          table ={
            project_id=
            dataset_id=
            table_id=
          }
          output_schema =
        }
      }
      pub_sub={
        topic=
      }
      publish_summary_to_cscc=
      publish_findings_to_cloud_data_catalog=
      job_notification_emails=
      deidentify ={
        cloud_storage_output=
        file_types_to_transform=
        transformation_config={
          deidentify_template=
          structured_deidentify_template=
          image_redact_template=
        }
        transformation_details_storage_config={
          table ={
            table 
            project_id 
            table_id
          }
        }
      }
      publish_to_stackdriver=
    }
  }