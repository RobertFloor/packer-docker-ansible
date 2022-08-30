variable "tag" {
  type = string
}
source "docker" "ubuntu" {
  commit = true
  image  = "amq-base-image"
  pull   = false
  changes = [
    "CMD echo hello world",

  ]

}
build {
  sources = ["source.docker.ubuntu"]
  # provisioner "shell" {
  #   script = "install_python.sh"
  # }
  provisioner "ansible" {
    playbook_file = "playbook.yaml"
    # user = "root"
    # extra_arguments = [ "-vvvv" ]

  }
  post-processor "docker-tag" {
    repository = "my-image"
    tags       = [ var.tag ]
  }
}