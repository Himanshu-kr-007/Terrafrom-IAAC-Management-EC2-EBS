resource "null_resource" "GetContentFromWeb" {
    triggers = {
        CurrentTime = timestamp()
    }

	# Getting Content From webpage
	provisioner "local-exec" {
        on_failure = continue
	    command =  " curl http://${aws_instance.web.public_ip}/index.html"
	}

    # If webpage is configure then print the output
    depends_on = [null_resource.webpage-Configure]
}