resource "null_resource" "EnvironmentDestroy" {

	# Run the command when the Environment is Destroying
	provisioner "local-exec" {
        when = destroy
	    command =  "echo Destorying Infrastructure"
	}
}