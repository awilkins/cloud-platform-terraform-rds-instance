/*
 * When using this module through the cloud-platform-environments, the following
 * two variables are automatically supplied by the pipeline.
 *
 */

variable "cluster_name" {}

variable "cluster_state_bucket" {}

/*
 * Make sure that you use the latest version of the module by changing the
 * `ref=` value in the `source` attribute to the latest version listed on the
 * releases page of this repository.
 *
 */
module "example_team_rds" {
  source                 = "github.com/ministryofjustice/cloud-platform-terraform-rds-instance?ref=4.2"
  cluster_name           = "${var.cluster_name}"
  cluster_state_bucket   = "${var.cluster_state_bucket}"
  team_name              = "example-repo"
  business-unit          = "example-bu"
  application            = "exampleapp"
  is-production          = "false"
  environment-name       = "development"
  infrastructure-support = "example-team@digtal.justice.gov.uk" 

  providers = {
    # Can be either "aws.london" or "aws.ireland"
    aws = "aws.london"
  }
}

resource "kubernetes_secret" "example_team_rds" {
  metadata {
    name      = "example-team-rds-instance-output"
    namespace = "my-namespace"
  }

  data {
    rds_instance_endpoint = "${module.example_team_rds.rds_instance_endpoint}"
    database_name         = "${module.example_team_rds.database_name}"
    database_username     = "${module.example_team_rds.database_username}"
    database_password     = "${module.example_team_rds.database_password}"
    rds_instance_address  = "${module.example_team_rds.rds_instance_address}"

    /* You can replace all of the above with the following, if you prefer to
     * use a single database URL value in your application code:
     *
     * url = "postgres://${module.example_team_rds.database_username}:${module.example_team_rds.database_password}@${module.example_team_rds.rds_instance_endpoint}/${module.example_team_rds.database_name}"
     *
     */
  }
}
