provider "aws" {

         region    = "us-east-1"
         assume_role {
	  role_arn = "arn:aws:iam::636373398710:role/fullperm"
		
	}
}
	
