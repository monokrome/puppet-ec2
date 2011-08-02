class ec2 {
	include apt

	apt::add::repository {
		"awstools":
			identifier => "ppa:awstools-dev/awstools"
	}

	package {
		"ec2-api-tools":
			ensure => latest,
			require => [
				Exec["apt::add::repository::awstools"],
				Exec["apt-update"],
			]
	}
}

