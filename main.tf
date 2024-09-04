# File: main.tf

# Configure the AWS provider
provider "aws" {
  region = "us-west-2"
}

# Create an ECS cluster
module "ecs_cluster" {
  source = file("./modules/ecs_cluster")

  cluster_name = "medusa-ecs-cluster"
}

# Create a Fargate service
module "fargate_service" {
  source = file("./modules/fargate_service")

  service_name = "medusa-fargate-service"
  cluster_name = module.ecs_cluster.this.name
  subnets      = ["subnet-12345678"]
  security_groups = ["sg-12345678"]
  desired_count = 1
}

# Create a task definition
module "task_definition" {
  source = file("./modules/task_definition")

  task_definition_name = "medusa-task-definition"
  container_name       = "medusa-container"
  container_image      = "medusa:latest"
  cpu                   = 1024
  memory                = 512
  execution_role_arn   = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
  container_port        = 3000
}

# Create an RDS instance for Medusa database
resource "aws_rds_instance" "this" {
  identifier = "medusa-rds-instance"
  engine     = "postgres"
  instance_class = "db.t2.micro"
  allocated_storage = 20
  db_name  = "medusa"
  username = "medusa"
  password = "medusa_password"
}

# Create an Elastic IP for the RDS instance
resource "aws_eip" "this" {
  instance = aws_rds_instance.this.id
}