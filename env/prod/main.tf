module "Producao" {
  source = "../../infra"

  nome = "producao"
  cargoIAM = "producao"
  descricao = "aplicacao-de-producao"
  max = 5
  maquina = "t2.micro"
  ambiente = "ambiente-de-producao"
}

output "ip_alb" {
  value = module.Producao.ip
}