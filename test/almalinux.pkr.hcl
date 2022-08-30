variable "tag" {
  type = string
}
source "docker" "ubuntu" {
  commit = true
  image  = "amq-test"
  pull   = false

}
build {
  sources = ["source.docker.ubuntu"]
  # provisioner "shell" {
  #   script = "install_python.sh"
  # }
  provisioner "ansible" {
    playbook_file = "playbook.yaml"
    user = "amq"
    extra_arguments = [ "-vvv" ]

  }

  post-processor "docker-tag" {
    repository = "my-image"
    tags       = [ var.tag ]
  }
}