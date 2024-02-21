module "Producao" {
    source = "../../infra"

    nome_repositorio = "Producao"
    cargoIAM = "Producao"
    ambiente = "Producao"
}

output "IP_alb" {
  value = module.Producao.IP
}